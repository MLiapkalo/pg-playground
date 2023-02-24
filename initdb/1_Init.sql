-- Use consistent casing and specify data types
CREATE TABLE customer (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    sex VARCHAR(6) NOT NULL CHECK (sex IN ('male', 'female')),
    email VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE account (
    id SERIAL PRIMARY KEY,
    date_opened DATE NOT NULL,
    owner_id INT NOT NULL,
    balance NUMERIC(10, 2) NOT NULL
);

-- Add foreign key constraint after both tables are created
ALTER TABLE account ADD CONSTRAINT fk_owner_id FOREIGN KEY (owner_id) REFERENCES customer(id);

-- Use transactions to ensure atomicity
BEGIN;
-- Insert customers
INSERT INTO customer (first_name, last_name, birth_date, sex, email)
VALUES
    ('John', 'Doe', '1985-04-15', 'male', 'john.doe@example.com'),
    ('Jane', 'Doe', '1990-02-20', 'female', 'jane.doe@example.com'),
    ('Bob', 'Smith', '1995-01-01', 'male', 'bob.smith@example.com'),
    ('Alice', 'Johnson', '1988-11-11', 'female', 'alice.johnson@example.com'),
    ('Sam', 'Lee', '2002-06-30', 'male', 'sam.lee@example.com'),
    ('Emily', 'Kim', '2001-09-03', 'female', 'emily.kim@example.com'),
    ('Tom', 'Park', '1998-12-31', 'male', 'tom.park@example.com'),
    ('Sarah', 'Brown', '1983-07-22', 'female', 'sarah.brown@example.com'),
    ('Mike', 'Taylor', '1992-03-18', 'male', 'mike.taylor@example.com'),
    ('Lisa', 'Anderson', '1999-05-10', 'female', 'lisa.anderson@example.com'),
    ('David', 'Lee', '1995-06-20', 'male', 'david.lee@example.com'),
    ('Karen', 'Smith', '1998-08-11', 'female', 'karen.smith@example.com'),
    ('Jessica', 'Kim', '1994-03-29', 'female', 'jessica.kim@example.com'),
    ('Andrew', 'Johnson', '1980-11-22', 'male', 'andrew.johnson@example.com'),
    ('Hannah', 'Park', '2000-02-05', 'female', 'hannah.park@example.com'),
    ('Steven', 'Chang', '1991-07-14', 'male', 'steven.chang@example.com'),
    ('Melissa', 'Nguyen', '1997-10-30', 'female', 'melissa.nguyen@example.com'),
    ('Brandon', 'Brown', '1999-09-12', 'male', 'brandon.brown@example.com'),
    ('Olivia', 'Davis', '2005-05-18', 'female', 'olivia.davis@example.com'),
    ('Lauren', 'Wilson', '1993-04-01', 'female', 'lauren.wilson@example.com');

-- Insert accounts
INSERT INTO account (date_opened, owner_id, balance)
VALUES
    ('2022-01-01', 1, 500.25),
    ('2022-01-22', 2, 1024.99),
    ('2022-09-13', 3, 245.50),
    ('2021-10-04', 4, 3000.00),
    ('2022-01-05', 5, 1700.75),
    ('2022-01-06', 6, 735.15),
    ('2022-01-07', 7, 100.00),
    ('2017-03-08', 8, 5000.00),
    ('2022-04-09', 9, 75.50),
    ('2022-01-10', 10, 999.99),
    ('2020-05-12', 11, 2500.00),
    ('2019-09-30', 12, 3500.00),
    ('2018-08-01', 13, 750.50),
    ('2017-06-15', 14, 10000.00),
    ('2018-02-28', 15, 2000.75),
    ('2018-03-01', 16, 1500.25),
    ('2019-12-10', 17, 500.50),
    ('2020-01-15', 18, 10000.00),
    ('2021-11-11', 19, 500.99),
    ('2017-10-20', 20, 750.00);
COMMIT;

-- Use indexes to speed up queries
CREATE INDEX idx_account_date_opened ON account(date_opened);
