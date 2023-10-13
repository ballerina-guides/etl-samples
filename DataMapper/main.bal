type Contact record {
    string email;
    string phone_number;
};

type OrderData record {
    string order_item_id;
    string product_id;
    int quantity;
    string customer_id;
};

type InventoryData record {
    string product_id;
    string name;
    string description;
    string category;
    decimal price;
    int stock_quantity;
    string manufacturer;
    string release_date;
};

type Customer record {
    string name;
    string email;
    string phone_number;
};

type Shipping_address record {
    string street;
    string city;
    string state;
    string postal_code;
    string country;
};

type ShipmentData record {
    string product_id;
    string product_name;
    int quantity_shipped;
    decimal total_price;
    Customer customer;
    Shipping_address shipping_address;
};

type Address record {
    string street;
    string city;
    string state;
    string postal_code;
    string country;
};

type CustomerData record {
    string customer_id;
    string first_name;
    string last_name;
    Contact contact;
    Address address;
};

function getShipment(CustomerData customerData, OrderData orderData, InventoryData inventoryData)
    returns ShipmentData => {
    customer: {
        name: customerData.first_name + " " + customerData.last_name,
        email: customerData.contact.email,
        phone_number: customerData.contact.phone_number
    },
    shipping_address: customerData.address,
    product_id: orderData.product_id,
    product_name: inventoryData.name,
    quantity_shipped: orderData.quantity,
    total_price: inventoryData.price * orderData.quantity
};
