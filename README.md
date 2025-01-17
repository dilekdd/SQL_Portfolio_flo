## SQL Portfolio - Flo

FLO, an online shoe store, wants to segment its customers and develop marketing strategies based on these segments. Customer behaviors will be analyzed, and groups will be formed according to clusters identified in these behaviors.

The dataset consists of information derived from the past shopping behaviors of FLO customers who made their last purchases through OmniChannel (both online and offline) in the years 2020-2021.

FLO wants to establish a roadmap for its sales and marketing activities. In order for the company to make medium to long-term plans, it is necessary to estimate the potential value that existing customers will provide to the company in the future.

---

### **Requirements**
- **PostgreSQL**:
  - This project uses PostgreSQL for data storage and analysis.
  - Version: The dump file was created using PostgreSQL version 17. It is recommended to use the same or a compatible version.
  - PostgreSQL is free and open-source. Download it [here](https://www.postgresql.org/download/).

---

### **Data Dictionary**
| Variable                            | Description                                    |
|-------------------------------------|------------------------------------------------|
| master_id                           | Unique customer number                        |
| order_channel                       | The platform channel used for shopping (Android, iOS, Desktop, Mobile) |
| last_order_channel                  | The channel used for the last purchase        |
| first_order_date                    | The date of the customer's first purchase     |
| last_order_date                     | The date of the customer's most recent purchase |
| last_order_date_online              | The date of the customer's most recent online purchase |
| last_order_date_offline             | The date of the customer's most recent offline purchase |
| order_num_total_ever_online         | Total number of purchases made by the customer on online platforms |
| order_num_total_ever_offline        | Total number of purchases made by the customer on offline platforms |
| customer_value_total_ever_offline   | The total amount spent by the customer on offline purchases |
| customer_value_total_ever_online    | The total amount spent by the customer on online purchases |
| interested_in_categories_12         | List of categories the customer has shopped in the last 12 months |

- **Variables**: 12  
- **Observations**: 19,945  

---
### **Contents**
- **Queries**: Contains the SQL scripts for data analysis.
- **Outputs**: Contains the results of the SQL queries in CSV format.


### **Database Setup**
To replicate the analysis or run the queries, set up the database using the `customers_dump.sql` file:

1. Restore the database using the `customers_dump.sql` file:
   ```bash
   psql -U your_username -d your_database_name -f customers_dump.sql


### **How to Run**
Use the following command to execute a query:
```bash
psql -U your_username -d your_database -f path_to_query.sql



**Disclaimer**
*This project uses PostgreSQL to store and query the dataset. Ensure you have PostgreSQL installed to replicate the analysis.*

