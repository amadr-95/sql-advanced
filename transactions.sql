CREATE TABLE IF NOT EXISTS account
(
    id      BIGSERIAL PRIMARY KEY,
    name    TEXT NOT NULL,
    balance NUMERIC(10, 2)
);

INSERT INTO account(name, balance)
VALUES ('user1', 1000.00),
       ('user2', 1000.00);

-- Transaction (BEGIN, COMMIT, ROLLBACK)
BEGIN; --start transaction

UPDATE account
SET balance = balance - 200
WHERE id = 1;

UPDATE account
SET balance = balance + 200
WHERE id = 2;

--ROLLBACK; --rollback transaction
COMMIT;
-- commit transaction

-- --------------
-- Nested transactions
BEGIN; --start main transaction

BEGIN; --start first nested transaction

UPDATE account
SET balance = balance - 200
WHERE id = 1;
COMMIT; --end first nested transaction

BEGIN; -- start second nested transaction

UPDATE account
SET balance = balance + 200
WHERE id = 2;

COMMIT; --end second nested transaction

--ROLLBACK; --end main transaction
COMMIT; -- end main transaction