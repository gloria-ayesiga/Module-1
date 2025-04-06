#Title
Python and R code to output Highridge Construction Company Payment Slips 
This code automates the generation of employee pay slips for Highridge

#Outline



-Importing functions
-Generatiton of lists: Roles and Genders
-Creation of payslips folder path
-Salary assignement based on the randonmly assigned Role
-Tax calculation to get Net Salary
-Employee Level assignement
-Generation of employee lists
-Generation of pay slips
-Export employee payslips to excel sheet

Python code
pip install pandas tabulate openpyx


R:

install.packages(dplyr)
install.packages(openxlsx)


#how it works

1. Uses random, os, pandas, tabulate, and datetime
2. Generated lists for roles and genders that are later used in the for-loop
    for random assignment using the random-choice functions
3. Creates a folder for payslips

4. Use the for-loop to loop through 410 employees
 - randomly assigning salaries to each employee between 5000 - 30000
 - randomly assigns genders
 - introduces the conditional statements (if) to assign roles based on salaries
     - assign employee levels (A - A2)

 - Tax and net salary calculation
   - uses conditional statement to calculate salary based on salary bracket
   - net salary calculation

 - Generation of employees lists
 - Generation of pay slips
 - Installs the first exception to catch any errors in the generation of payslips
 - Creates list for headers
 - Prints a tabular output for the first 10  employees to check the format
 - Creates a data frame for the excel output
 - Installs another exception for the excel output export

#######




########
Notes
1. Project path - Change the working directory() in R or folder path in Python to match your system.
2. Stabilising the excel and payslips output: Use set.seed() or random.seed() for consistent outputs.
3. Pay slips folder: Check the payslips folder located in the same folder path for the 409 pay slips.


#######
Author: Gloria Eden Zion Ayesiga
Prepared: For the fulfiment of Module 1 assignment for the BAN6420 course
Date: 4.6.2025