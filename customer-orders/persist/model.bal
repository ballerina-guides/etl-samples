import ballerina/persist as _;

public type Customer record {|
    readonly string customerId;
    string name;
    string email;
    string phone;
    OrderData[] orders;
|};

public type OrderData record {|
   readonly string orderId;
   decimal price;
   Customer customer;
|};
