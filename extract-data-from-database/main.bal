import ballerina/io;
import ballerina/persist;

type CustomerData record {|
    string customerId;
    string name;
    string email;
|};

type OrderWithCustomer record {|
    string orderId;
    decimal price;
    record {|
        string name;
        string email;
    |} customer;
|};

final Client dbClient = check new;

public function main() returns error? {
    check getOrderData();
    check getCustomerData();
    check getOrderWithCustomer("101");
}

function getOrderData() returns error? {
    stream<OrderData, persist:Error?> orders = dbClient->/orderdata();
    check from var orderData in orders
        do {
            io:println(orderData);
        };
}

function getCustomerData() returns error? {
    stream<CustomerData, persist:Error?> customers = dbClient->/customers();
    check from var customerData in customers
        do {
            io:println(customerData);
        };
}

function getOrderWithCustomer(string orderId) returns error? {
    OrderWithCustomer orderwithCustomer = check dbClient->/orderdata/[orderId];
    io:println(orderwithCustomer);
}
