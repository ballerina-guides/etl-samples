import ballerina/persist as _;

type Customer record {|
    readonly string customerId;
    string name;
    string email;
    string phone;
    OrderData[] orders;
|};

type OrderData record {|
   readonly string orderId;
   decimal price;
   Customer customer;
|};
