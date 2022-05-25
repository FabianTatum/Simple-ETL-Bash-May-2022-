# this script

# Extract data from /etc/passwd file into a CSV file

# The csv data file contains the user name, user id and 
# home directory of each user account defined in /etc/passwd

# Transforms the text delimiter from ":" to ",".
# Loads the data from the CSV file into a table in PostgreSQL database.

# Extract phase
echo "Extracting data."

# Extract the columns 1 (username), 2 (user id) and 6 (home directory path)
cut -d ":" -f1,3,6 /etc/passwd > extracted-data.txt

# Transform phase
echo "Transforming data."

# Read the extracted data and replace the colons with commas
tr ":" "," < extracted-data.txt > transformed-data.csv

# Load phase
echo "Loading Data"

# Send the instructions to connect to 'template1' and copy the file to the table
# 'users' through command pipeline

#echo "\c template1; \d users; \COPY users FROM '/home/fabiantatum/Projects/etl-bash/transformed-data.csv' DELIMITERS ',' CSV;" | psql -h 127.0.0.1 -p 5432 -U postgres postgres

echo '\c template1; \\SELECT * FROM users;' | psql -h 127.0.0.1 -p 5432 -U postgres postgres
