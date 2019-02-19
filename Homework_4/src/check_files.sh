#!/bin/bash


# This script checks for the existence of required files for HW4,
# and prints some basic information about each.
# You need to complete the section marked "TODO".


# "-e" means "process escape characters" e.g. render "\n" as a
# newline instead of literal "\n"
echo -e "\nChecking for required files...\n"


# Declare some string variables
# Note the "$" to refer to a variable that has already been declared
# Note how you combine strings into a concatenated string
dir_repo="../.."
dir_proj=".."
dir_data="$dir_proj/data"
dir_output="$dir_proj/output"
dir_src="$dir_proj/src"


# Create an array of names of the required files for the homework
# Note "\" means continue the command onto the next line, so this
# array declaration is a single command written across multiple lines
required_files=\
($dir_data/README.txt \
$dir_repo/.gitignore \
$dir_src/src.Rproj \
$dir_src/workflow.html \
$dir_output/avg_wkday_traffic.png)


# Check if all the files exist
# Use a Bash for loop to loop through the required files
all_ok=true
for file in "${required_files[@]}"
do
  # "-f $file" means file exists and is a regular file
  # "! -f $file" means the negation
  if [ ! -f $file ]; then
    all_ok=false
    echo "Missing required file: $file"
  fi
done


# Print a message about whether all files were found
# If any files are missing, terminate the program here
if [ $all_ok = true ]; then
  echo -e "\nFound all required files."
else
  echo -e "\nSome required files are missing. Exiting.\n"
  exit -1
fi


# TODO: write a for loop that prints one line of information
# for each required file. The line of information should include
# the following fields:
# <file_name> <tab> <number_of_lines> <tab> <human_readable_file_size>
#
# HINT: Copy the structure of the for loop above.
#
# HINT: Use "echo -e" to render tabs
#
# HINT: to create a variable called "numlines" with value equal to the number
# of lines in a file, use the command "numlines=$(wc -l $file | awk '{print $1}')".
# That command runs the wc command to get the number of lines, then pipes the result
# to awk to get the first "word" of the output only. Then we save that result to
# a variable.
# To refer to that variable later, use "$numlines".
#


for file in "${required_files[@]}"
do
  filename=$(basename $file)
  numlines=$(wc -l $file | awk '{print $1}')
  filesize=$(ls -lh $file | awk '{print $5}')
  echo -e "\n$filename\t$numlines\t$filesize"
done


# Print a final message
echo -e "\nAll done!\n"

