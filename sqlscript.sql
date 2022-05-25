USE template1;

LOAD DATA INFILE '/home/transformed-data2.csv'
INTO TABLE users
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';