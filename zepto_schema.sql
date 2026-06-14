DROP TABLE IF EXISTS zepto;

CREATE TABLE zepto(
    sku_id SERIAL PRIMARY KEY,
    category VARCHAR(120),
    Name VARCHAR(150) NOT NULL,
    mrp NUMERIC(8,2),
    discountPercent Numeric(5,2),
    availableQuantity Integer,
    DiscountedSellingPrice Numeric(8,2),
    weightInGms Integer,
    OutofStock BOOLEAN,
    quantity Integer
);
