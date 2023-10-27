import ballerina/io;
import ballerina/persist;

type CustomerData record {|
    string name;
    string email;
    string phone;
|};

type OrderWithCustomer record {|
    string orderId;
    decimal price;
    record {|
        string name;
        string email;
    |} customer;
|};

Client sClient = check new ();

public function main() returns error? {
    check getOrderData();
    check getCustomerData();
    check getOrderWithCustomer("101");
}

public function getOrderData() returns error? {
    stream<OrderData, persist:Error?> orders = sClient->/orderdata();
    check from var orderData in orders
        do {
            io:println(orderData);
        };
}

public function getCustomerData() returns error? {
    stream<Customer, persist:Error?> customers = sClient->/customers();

    check from var customerData in customers
        do {
            io:println(customerData);
        };
}

public function getOrderWithCustomer(string orderId) returns error? {
    OrderWithCustomer orderwithCustomer = check sClient->/orderdata/[orderId];

    io:println(orderwithCustomer);
}
