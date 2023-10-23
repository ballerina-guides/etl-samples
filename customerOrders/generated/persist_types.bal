// AUTO-GENERATED FILE. DO NOT MODIFY.

// This file is an auto-generated file by Ballerina persistence layer for model.
// It should not be modified by hand.

public type Customer record {|
    readonly string customerId;
    string name;
    string email;
    string phone;
|};

public type CustomerOptionalized record {|
    string customerId?;
    string name?;
    string email?;
    string phone?;
|};

public type CustomerWithRelations record {|
    *CustomerOptionalized;
    OrderDataOptionalized[] orders?;
|};

public type CustomerTargetType typedesc<CustomerWithRelations>;

public type CustomerInsert Customer;

public type CustomerUpdate record {|
    string name?;
    string email?;
    string phone?;
|};

public type OrderData record {|
    readonly string orderId;
    decimal price;
    string customerCustomerId;
|};

public type OrderDataOptionalized record {|
    string orderId?;
    decimal price?;
    string customerCustomerId?;
|};

public type OrderDataWithRelations record {|
    *OrderDataOptionalized;
    CustomerOptionalized customer?;
|};

public type OrderDataTargetType typedesc<OrderDataWithRelations>;

public type OrderDataInsert OrderData;

public type OrderDataUpdate record {|
    decimal price?;
    string customerCustomerId?;
|};

