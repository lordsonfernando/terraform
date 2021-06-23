#gcp-dataflow

wolverine is for low cost airlines

single tenant design pattern
we are building it for low cost airlines


single tenant design pattern : one project per airline

Let us say they want to deploy wolverine for airlines 1

project for airlline 1 - pubsub, data flow, big query will reside here - order dataset


airlines 2

project for airline 2 - pubsub, data flow, bigquery - order dataset 



reference datasets

geographic_code country_name
IN               India



project => shared_project

wolverine => folder => sabre analyst

project1 => airlines 1

project2 => airlines 2

project3 => airlines 3


orders

order_id geographic_id transaction_id amount no_of_items partner_id

1234      IN          123435    245  2  AB001



common dataset

geographic_id country_name
IN             India


parter_dataset

partner_id partner_name country
AB001  Associates business India




airlines1_analyst => airlines 1 project along with reference data
airlines2_analyst => airlines 2 project along with reference data
airlines3_analyst => airlines 3 project along with reference data
sabre_analysst => will have access to all projects


insert into  `shared-sabre-wolverine.common.geographic_table` (geographic_id ,country_name)
VALUES  ('IN', 'India'),
        ('US', 'United States Of America'),
        ('UK', 'United Kingdom')


insert into  `shared-sabre-wolverine.common.partner_table` (partner_id ,partner_name,country)
VALUES  ('6E001', 'Indigo','IN'),
         ('SP001', 'Spicejet','IN'),
          ('VI001', 'Vistara','IN')


insert into `airline1-sabre-wolverine.orders.order_table` (order_id ,geographic_id ,transaction_id ,amount ,no_of_items, partner_id)
VALUES  (1001,'IN',1000001,245.50,2,'6E001'),
        (1002,'IN',1000002,845.50,4,'6E001')

SELECT
  t1.amount AS amount,
  t1.no_of_items AS item_count,
  t2.country_name AS country,
  t3.partner_name AS partner,
FROM `airline1-sabre-wolverine.orders.order_table` t1
JOIN `shared-sabre-wolverine.common.geographic_table` t2 ON t1.geographic_id = t2.geographic_id
JOIN `shared-sabre-wolverine.common.partner_table` t3 ON t1.partner_id = t3.partner_id

