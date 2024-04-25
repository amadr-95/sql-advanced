--Customer
CREATE TABLE customer
(
    id         BIGSERIAL PRIMARY KEY,
    first_name TEXT                        NOT NULL,
    last_name  TEXT                        NOT NULL,
    email      TEXT                        NOT NULL,
    address    TEXT,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL
);

-- customer constraints
ALTER TABLE customer
    ADD CONSTRAINT email_unique UNIQUE (email);

--customer values
INSERT INTO customer (first_name, last_name, email, address, created_at)
VALUES ('John', 'Doe', 'john.doe@example.com', '123 Main St', CURRENT_TIMESTAMP),
       ('Jane', 'Smith', 'jane.smith@example.com', '456 Elm St', CURRENT_TIMESTAMP),
       ('Michael', 'Johnson', 'michael.johnson@example.com', '789 Oak St', CURRENT_TIMESTAMP),
       ('Emily', 'Brown', 'emily.brown@example.com', '101 Pine St', CURRENT_TIMESTAMP),
       ('David', 'Lee', 'david.lee@example.com', '202 Cedar St', CURRENT_TIMESTAMP);

-- ---------------------------------------------------
--Customer_order
CREATE TABLE customer_order
(
    id           BIGSERIAL PRIMARY KEY,
    customer_id  BIGINT                      NOT NULL,
    total_amount NUMERIC(10, 2)              NOT NULL,
    created_at   TIMESTAMP WITHOUT TIME ZONE NOT NULL
);

--customer_order constraints
ALTER TABLE customer_order
    ADD CONSTRAINT amount_greater_than_zero CHECK (total_amount > 0);

ALTER TABLE customer_order
    ADD FOREIGN KEY (customer_id) REFERENCES customer (id);

--customer_order values
INSERT INTO customer_order (customer_id, total_amount, created_at)
VALUES (1, 81.97, CURRENT_TIMESTAMP),
       (1, 74.98, CURRENT_TIMESTAMP),
       (3, 141.95, CURRENT_TIMESTAMP),
       (4, 89.98, CURRENT_TIMESTAMP),
       (5, 245.97, CURRENT_TIMESTAMP);

-- ---------------------------------------------------
--product
CREATE TABLE product
(
    id           BIGSERIAL PRIMARY KEY,
    name         TEXT          NOT NULL,
    price        NUMERIC(5, 2) NOT NULL,
    discontinued BOOLEAN       NOT NULL
);

-- product constraints
ALTER TABLE product
    ADD CONSTRAINT price_greater_than_zero CHECK ( price > 0 );

--product values
INSERT INTO product (name, price, discontinued)
VALUES ('T-Shirt', 15.99, FALSE),
       ('Jeans', 39.99, FALSE),
       ('Sneakers', 49.99, FALSE),
       ('Hoodie', 29.99, FALSE),
       ('Backpack', 34.99, FALSE),
       ('Watch', 99.99, FALSE),
       ('Sunglasses', 25.99, FALSE),
       ('Wallet', 19.99, FALSE),
       ('Dress', 45.99, FALSE),
       ('Jacket', 69.99, FALSE);

-- ---------------------------------------------------
-- order_item
CREATE TABLE order_item
(
    id         BIGSERIAL PRIMARY KEY,
    order_id   BIGINT         NOT NULL,
    product_id BIGINT         NOT NULL,
    quantity   INT            NOT NULL,
    price      NUMERIC(10, 2) NOT NULL
);

-- order_item constraints
ALTER TABLE order_item
    ADD CONSTRAINT quantity_greater_than_zero CHECK ( quantity > 0 );

ALTER TABLE order_item
    ADD CONSTRAINT price_greater_than_zero CHECK ( price > 0 );

ALTER TABLE order_item
    ADD FOREIGN KEY (order_id) REFERENCES customer_order (id);

ALTER TABLE order_item
    ADD FOREIGN KEY (product_id) REFERENCES product (id);

-- order_item values
INSERT INTO order_item (order_id, product_id, quantity, price)
VALUES (1, 1, 2, 31.98),
       (1, 3, 1, 49.99),
       (2, 2, 1, 39.99),
       (2, 5, 1, 34.99),
       (3, 4, 3, 89.97),
       (3, 7, 2, 51.98),
       (4, 8, 1, 19.99),
       (4, 10, 1, 69.99),
       (5, 6, 2, 199.98),
       (5, 9, 1, 45.99);
