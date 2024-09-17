#!/bin/bash

csv_file="./arrays_table.csv"

#Create columns into 3 arrays.
column_0=($(cut -d "," -f 1 $csv_file))
column_1=($(cut -d "," -f 2 $csv_file))
column_2=($(cut -d "," -f 3 $csv_file))

#Print the array

echo "Display the first column"
echo "${column_0[@]}"
echo "${column_1[@]}"
echo "${column_2[@]}"

# Create a new array for the difference of column 1 and 2.
#Initialize array with a header 

column_3=("column_3")

#Number of lines in each column 
nlines=$(cat $csv_file | wc -1)
