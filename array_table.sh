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
nlines=$(cat $csv_file | wc -l)

echo "There are $nlines lines in the file"

#Populate the array 
for ((i=1; i<$nlines; i++))do
    column_3[$i]=$((column_2[$i] - column_1[$i]))
done 
echo "${column_3[@]}"

#Combine new arrya with the csv file. 
#Write the 1st array to a file 
#Initialize the file with a header 
echo "${column_3[0]}" > column_3.txt
for ((i=1; i<nlines;i++)); do
    echo "{$column_3[$i]} >> column_3.txt"
done
paste -d "," $csv_file column_3.txt > report.csv
