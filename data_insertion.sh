#!/bin/bash

# Define the database login credentials
DB_USER="abdelrhman"  
DB_PASS="123"  
DB_NAME="project"

# Define the file paths
CUSTOMER_FILE="customer_info.txt"
PHONE_FILE="phone_info.txt"

#********************************************************************
#This Method assumes that the columns are tab seperated in files like:
#id	 name	 mail
#1       ahmed   ahmed@gmail.com
#2       mohamed mohamed@yahoo.com
#3       ali     ali99@169.com
#********************************************************************

# Loop through the customer_info file and insert data into customer_info_tbl
echo "Inserting data into customer_info_tbl..."

while IFS=$'\t' read -r customer_id customer_name customer_email; do
    # Skip empty lines
    if [[ -z "$customer_id" || -z "$customer_name" || -z "$customer_email" ]]; then
        continue
    fi
    
    # Prepare and execute the MySQL query to insert into customer_info_tbl
    mariadb -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "INSERT INTO customer_info_tbl (customer_id, customer_name, customer_email) VALUES ('$customer_id', '$customer_name', '$customer_email');"
done < "$CUSTOMER_FILE"

# Loop through the phone_info file and insert data into phone_info_tbl
echo "Inserting data into phone_info_tbl..."
while IFS=$'\t' read -r phone_id customer_id phone_number; do
    # Skip empty lines
    if [[ -z "$phone_id" || -z "$customer_id" || -z "$phone_number" ]]; then
        continue
    fi
    
    # Prepare and execute the MySQL query to insert into phone_info_tbl
    mariadb -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "INSERT INTO phone_info_tbl (phone_id, customer_id, phone_number) VALUES ('$phone_id', '$customer_id', '$phone_number');"
done < "$PHONE_FILE"

echo "Data insertion completed successfully."

