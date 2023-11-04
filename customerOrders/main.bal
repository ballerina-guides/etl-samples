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

public function getOrderData() returns error? {
    // Retrive data on all orders.
    stream<OrderData, persist:Error?> orders = dbClient->/orderdata();
    check from var orderData in orders
        do {
            io:println(orderData);
        };
}

public function getCustomerData() returns error? {
    //  Retrieve data on all customers.
    stream<CustomerData, persist:Error?> customers = dbClient->/customers();
    check from var customerData in customers
        do {
            io:println(customerData);
        };
}

public function getOrderWithCustomer(string orderId) returns error? {
    // Retrive order data with customer data for given order id.
    OrderWithCustomer orderwithCustomer = check dbClient->/orderdata/[orderId];
    io:println(orderwithCustomer);
}
