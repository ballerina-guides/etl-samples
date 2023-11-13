import ballerina/io;

type SalesOrder record {|
    string itemId;
    string customerId;
    string itemName;
    int quantity;
    int date;
|};

function removeDuplicates(SalesOrder[] orders) returns SalesOrder[] {
    return from var {itemId, customerId, itemName, quantity, date} in orders
        group by itemId, customerId, itemName
        select {
            itemId,
            customerId,
            itemName,
            quantity: [quantity][0],
            date: [date][0]
        };
}

public function main() returns error? {
    SalesOrder[] orders = check io:fileReadCsv("./resources/orders.csv");
    io:println(removeDuplicates(orders));
}
