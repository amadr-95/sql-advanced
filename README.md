# [ADVANCED DATABASES](https://www.amigoscode.com/courses/advanced-databases)

## JOINS

### - (INNER) JOIN

```
Select records that have matching values in both tables
```

![imagen](inner-join.PNG)

### - (OUTER) LEFT JOIN

```
Select records from the left table with matching right table records
```

![imagen](left-join.PNG)

### - (OUTER) RIGHT JOIN

```
Select records from the right table with matching left table records
```

![imagen](right-join.PNG)

### - FULL JOIN

```
Select all records that match either left or right table records
```

![imagen](full-join.PNG)

## TRANSACTIONS (A.C.I.D. PRINCIPLES)

```
1. ATOMICITY:
   - Atomicity ensures that a transaction is performed completely or not performed at all.
   - If any part of the transaction fails, the entire transaction is rolled back to its previous state.
   - It guarantees that data remains consistent even in cases of failure.

2. CONSISTENCY:
   - Consistency ensures that only changes to data that respect all system integrity constraints are made.
   - Before and after a transaction, data must be in a valid state.

3. ISOLATION:
   - Isolation principle ensures that the effects of a transaction are not visible to other transactions until it is completely finished.
   - Transactions are executed in isolation from one another, preventing operations in one transaction from interfering with concurrent transactions.

4. DURABILITY:
   - Durability guarantees that once a transaction is successfully completed and committed, the changes will persist even in the event of a system failure.
   - Data modified by the transaction is permanently saved and will not be lost, even in system failure situations.

```
### BEGIN, COMMIT, ROLLBACK
- **Begin**: starts a transaction
- **Commit**: commits a transaction
- **Rollback**: reverts the data to its previous state if anything goes wrong

## INDEXES
Using indexes may **increases the performance** when retriving many rows.

- **View indexes**
```sql
SELECT tablename, indexname, indexdef FROM pg_indexes WHERE schemaname = 'public';
```

- **Create indexes**
```sql
CREATE INDEX table_colum_name_idx ON table(column_name);
```

- **Delete indexes**
```sql
DROP INDEX index_name;
```

### Multi-column indexes
Combining two or more columns.

```sql
CREATE INDEX table_column1_column2_idx ON table(column1, column2);
```

```
... WHERE column1 = '' AND column2 = '' ✅
... WHERE column1 = '' ✅
... WHERE column2 = '' ❌ (index does not have any effect)
```
### Unique indexes
```sql
CREATE UNIQUE INDEX table_column_name_unique_idx
ON table(column_name);
```

### Partial indexes
```sql
CREATE UNIQUE INDEX table_column_name_partial_idx
ON table(column_name)
WHERE column_name = condition (boolean for example)
```

## FUNCTIONS

- Create functions
```sql
CREATE OR REPLACE FUNCTION function_name(param1 TYPE, param2 TYPE...)
    RETURNS TYPE
    LANGUAGE plpgsql
AS
$$
DECLARE
--variable declaration
    variable_name TYPE;
BEGIN
--logic
    RETURN variable_name;
END;
$$;
```
- Use functions
```sql
SELECT function_name(param1, param2, ...);
```

- View functions in terminal
```bash
\df
```

- Delete functions
```sql
DROP FUNCTION function_name;
```

## ROLES
- View roles in terminal
```bash
\du
```

- Create role (rol = user)
```sql
CREATE ROLE/USER name; --basic
```

```sql
CREATE ROLE/USER name (WITH) LOGIN PASSWORD 'password';
```
- Modify role
```sql
ALTER ROLE rol_name [options]
```
Options:

    - SUPERUSER | NOSUPERUSER
    - CREATEDB | NOCREATEDB
    - CREATEROLE | NOCREATEROLE
    - INHERIT | NOINHERIT
    - LOGIN | NOLOGIN
    - REPLICATION | NOREPLICATION
    - BYPASSRLS | NOBYPASSRLS
    - CONNECTION LIMIT limit
    - PASSWORD 'password' | PASSWORD NULL
    - VALID UNTIL 'timestamp'

- Delete role
```sql
DROP ROLE name;
```

### Privileges
#### Grant
```sql
GRANT privilege_list | ALL 
ON  table_name | ALL TABLES IN SCHEMA schema_name
TO  role_name;
```

Privileges:

    - SELECT
    - INSERT
    - UPDATE
    - DELETE
    - TRUNCATE
    - ...

#### Revoke
```sql
REVOKE privilege_list | ALL
ON table_name | ALL TABLES IN SCHEMA schema_name
FROM role_name;
```

## SCHEMAS

- View schemas 
```bash
\dn
```
```sql
SELECT current_schema(); --public by default
```
- Create schema
```sql
CREATE SCHEMA schema_name;
```

- Create tables in custom schemas
```sql
CREATE TABLE schema_name.table_name;
```
### Search path
```sql
SHOW search_path;
```
-  Change the default search path
```sql
SET search_path TO new_schema, default_schema (public);
```

## BACKUP AND RESTORE DATABASES

### Backup
```bash
pg_dump --help //see all options
```
- Dump a database
```bash
pg_dump -U username -d db_name -F format_file -f path/file_name.sql 
```

- Dump all databases
```bash
pg_dumpall -U username -f path/file_name.sql 
```

### Restore
```bash
pg_restore --help //see all options
```
- Using psql (.sql files)
```bash
psql -U username -d db_name -f path/backup_file_name.sql
```  
- Using pg_restore (.tar files)
```bash
pg_restore -U username -d db_name path/backup_file_name.tar 
```
