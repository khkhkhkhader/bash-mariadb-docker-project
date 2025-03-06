# MariaDB Docker Project

This project inserts data from files into database tables using a bash script. The database name is `project`, and it runs over a MariaDB container using a Docker Compose YAML file. Refering to init.sql file in the path "/docker-entrypoint-initdb.d/" in the container which will excuted when the container starts for the first time
## Project Structure

- **docker-compose.yml**: Defines the services to be used, which includes MariaDB and the initialization script.
- **init.sql**: SQL script to create the `project` database and define the structure of `customer_info_tbl` and `phone_info_tbl`.
- **data_insertion.sh**: A bash script that inserts data into the tables from text files (`customer_info.txt` and `phone_info.txt`).
- **customer_info.txt**: Contains sample customer information seperated with tab.
- **phone_info.txt**: Contains sample phone information seperated with tab.

## Prerequisites

- Docker
- Docker Compose

## Installation

1. **Clone the Repository**

   Clone this repository to your local machine:

   ```bash
   git clone https://github.com/khkhkhkhader/bash-mariadb-docker-project.git
   cd bash-mariadb-docker-project
2. **run the compose file**
   docker compose up -d
   docker exec -it mariadb_container bash

3. **run bash script for data insertion**
   bash data_insertion.sh
