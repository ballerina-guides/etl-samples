type CustomerData record {
    string customerId;
    string firstName;
    string lastName;
    record {
        string email;
        string phoneNumber;
    } contact;
    record {
        string street;
        string city;
        string state;
        string postalCode;
        string country;
    } address;
};

type OrderData record {
    string orderItemId;
    string productId;
    int quantity;
    string customerId;
};

type InventoryData record {
    string productId;
    string name;
    string description;
    string category;
    decimal price;
    int stockQuantity;
    string manufacturer;
    string releaseDate;
};

type ShipmentData record {
    string productId;
    string productName;
    int quantityShipped;
    decimal totalPrice;
    record {
        string name;
        string email;
        string phoneNumber;
    } customer;
    record {
        string street;
        string city;
        string state;
        string postalCode;
        string country;
    } shippingAddress;
};

// Data mapping from customer, order and inventory data to shipment data.
function getShipment(CustomerData customerData, OrderData orderData, InventoryData inventoryData)
    returns ShipmentData => {
    productId: orderData.productId,
    productName: inventoryData.name,
    quantityShipped: orderData.quantity,
    totalPrice: inventoryData.price * orderData.quantity,
    customer: {
        name: customerData.firstName + " " + customerData.lastName,
        email: customerData.contact.email,
        phoneNumber: customerData.contact.phoneNumber

    },
    shippingAddress: {
        street: customerData.address.street,
        city: customerData.address.city,
        state: customerData.address.state,
        postalCode: customerData.address.postalCode,
        country: customerData.address.country
    }
};
