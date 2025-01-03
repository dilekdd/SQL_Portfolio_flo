-- 1) Create a database named <customers> and a table named <flo> to contain the variables in the given data set.

-- CREATE DATABASE customers;

CREATE TABLE public.flo (
    master_id character varying(50) NOT NULL,
    order_channel character varying(20),
    last_order_channel character varying(20),
    first_order_date date,
    last_order_date date,
    last_order_date_online date,
    last_order_date_offline date,
    order_num_total_ever_online numeric(5,2),
    order_num_total_ever_offline numeric(5,2),
    customer_value_total_ever_offline numeric(15,2),
    customer_value_total_ever_online numeric(15,2),
    interested_in_categories_12 character varying(200),
    store_type character varying(10)
);

ALTER TABLE public.flo OWNER TO postgres;

ALTER TABLE public.flo ADD PRIMARY KEY (master_id);


COPY public.flo
FROM '/Users/dilekdemir/Documents/datasets/flo_data_20K 2.csv'
DELIMITER ','
CSV HEADER;

select * from flo;