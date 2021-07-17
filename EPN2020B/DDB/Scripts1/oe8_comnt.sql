rem
rem Header: oe_comnt.sql 09-jan-01
rem
rem Copyright (c) 2001 Oracle Corporation.  All rights reserved.
rem
rem Owner  : ahunold
rem
rem NAME
rem   oe_comnt.sql - create comments for OE Common Schema
rem
rem DESCRIPTON
rem   
rem
rem MODIFIED   (MM/DD/YY)
rem   ahunold   01/30/01 - OE script headers
rem   ahunold   01/24/01 - Eliminate extra lines from last merge
rem   ahunold   01/09/01 - checkin ADE

COMMENT ON TABLE customers IS
'Contains customers data either entered by an employee or by the customer
him/herself over the Web.';

COMMENT ON COLUMN customers.cust_address IS
'Object column of type address_typ.';

COMMENT ON COLUMN customers.cust_first_name IS
'NOT NULL constraint.';

COMMENT ON COLUMN customers.cust_last_name IS
'NOT NULL constraint.';

COMMENT ON COLUMN customers.credit_limit IS
'Check constraint.';

COMMENT ON COLUMN customers.customer_id IS
'Primary key column.';

COMMENT ON COLUMN customers.account_mgr_id IS
'References employees.employee_id.';

REM ===========================================================================

COMMENT ON TABLE warehouses IS
'Warehouse data unspecific to any industry.';

COMMENT ON COLUMN warehouses.warehouse_id IS
'Primary key column.';

COMMENT ON COLUMN warehouses.location_id IS
'Primary key column, references locations.location_id.';

REM ===========================================================================

COMMENT ON TABLE order_items IS
'Example of many-to-many resolution.';

COMMENT ON COLUMN order_items.order_id IS
'Part of concatenated primary key, references orders.order_id.';

COMMENT ON COLUMN order_items.product_id IS
'References product_information.product_id.';

COMMENT ON COLUMN order_items.line_item_id IS
'Part of concatenated primary key.';

COMMENT ON COLUMN orders.order_status IS
'0: Not fully entered, 1: Entered, 2: Canceled - bad credit, -
3: Canceled - by customer, 4: Shipped - whole order, -
5: Shipped - replacement items, 6: Shipped - backlog on items, -
7: Shipped - special delivery, 8: Shipped - billed, 9: Shipped - payment plan,-
10: Shipped - paid';

REM ===========================================================================

COMMENT ON TABLE orders IS
'Contains orders entered by a salesperson as well as over the Web.';

COMMENT ON COLUMN orders.order_date IS
'TIMESTAMP WITH LOCAL TIME ZONE column, NOT NULL constraint.';

COMMENT ON COLUMN orders.order_id IS
'PRIMARY KEY column.';

COMMENT ON COLUMN orders.sales_rep_id IS
'References employees.employee_id.';

COMMENT ON COLUMN orders.promotion_id IS
'Sales promotion ID. Used in SH schema';

COMMENT ON COLUMN orders.order_mode IS
'CHECK constraint.';

COMMENT ON COLUMN orders.order_total IS
'CHECK constraint.';

REM ===========================================================================

COMMENT ON TABLE inventories IS
'Tracks availability of products by product_it and warehouse_id.';

COMMENT ON COLUMN inventories.product_id IS
'Part of concatenated primary key, references product_information.product_id.';

COMMENT ON COLUMN inventories.warehouse_id IS
'Part of concatenated primary key, references warehouses.warehouse_id.';

REM ===========================================================================

COMMENT ON TABLE product_information IS
'Non-industry-specific data in various categories.';

COMMENT ON COLUMN product_information.product_id IS
'Primary key column.';

COMMENT ON COLUMN product_information.product_description IS
'Primary language description corresponding to translated_description in
product_descriptions, added to provide non-NLS text columns for OC views
to accss.';

COMMENT ON COLUMN product_information.category_id IS
'Low cardinality column, can be used for bitmap index. 
Schema SH uses it as foreign key';

COMMENT ON COLUMN product_information.weight_class IS
'Low cardinality column, can be used for bitmap index.';

COMMENT ON COLUMN product_information.warranty_period IS
'INTERVAL YEAER TO MONTH column, low cardinality, can be used for bitmap 
index.';

COMMENT ON COLUMN product_information.supplier_id IS
'Offers possibility of extensions outside Common Schema.';

COMMENT ON COLUMN product_information.product_status IS
'Check constraint. Appropriate for complex rules, such as "All products in 
status PRODUCTION must have at least one inventory entry." Also appropriate 
for a trigger auditing status change.';

REM ===========================================================================

COMMENT ON TABLE product_descriptions IS
'Non-industry-specific design, allows selection of NLS-setting-specific data
derived at runtime, for example using the products view.';


COMMENT ON COLUMN product_descriptions.product_id IS
'Primary key column.';

COMMENT ON COLUMN product_descriptions.language_id IS
'Primary key column.';

REM Description of OE views ===================================================

COMMENT ON TABLE products IS
'This view joins product_information and product_descriptions, using NLS
settings to pick the appropriate language-specific product description.';

COMMENT ON TABLE bombay_inventory IS
'This view shows inventories at the Bombay warehouse.';

COMMENT ON TABLE sydney_inventory IS
'This view shows inventories at the Sydney warehouse.';

COMMENT ON TABLE toronto_inventory IS
'This view shows inventories at the Toronto warehouse.';
