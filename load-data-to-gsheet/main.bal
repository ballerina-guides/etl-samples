import ballerinax/googleapis.sheets;

configurable string refreshToken = ?;
configurable string clientId = ?;
configurable string clientSecret = ?;

public type SalesSummary record {|
    string product;
    float sales;
|};

final sheets:Client spreadsheetClient = check new ({
    auth: {
        clientId,
        clientSecret,
        refreshUrl: sheets:REFRESH_URL,
        refreshToken
    }
});

function loadToGoogleSheet(string sheetName, string workSheetName, SalesSummary[] salesSummary) returns error? {
    // create a new spread sheet
    sheets:Spreadsheet spreadsheet = check spreadsheetClient->createSpreadsheet(sheetName);
    string spreadSheetId = spreadsheet.spreadsheetId;

    // rename the default work sheet name
    check spreadsheetClient->renameSheet(spreadSheetId, "Sheet1", workSheetName);

    // add legends to the sheet
    _ = check spreadsheetClient->appendValue(spreadSheetId, ["Product", "Sales"], {sheetName: workSheetName});
    foreach var {product, sales} in salesSummary {
        // add sales data to the sheet
        _ = check spreadsheetClient->appendValue(spreadSheetId, [product, sales], {sheetName: workSheetName});
    }
}

public function main() returns error? {
    SalesSummary[] salesSummary = [
        {product: "Coffee Maker", sales: 500.50},
        {product: "Toaster Oven", sales: 320.75},
        {product: "Blender", sales: 180.25},
        {product: "Microwave Oven", sales: 420.00},
        {product: "Refrigerator", sales: 700.30}
    ];
    check loadToGoogleSheet("Sales Data", "Kitchen Appliences summary", salesSummary);
}
