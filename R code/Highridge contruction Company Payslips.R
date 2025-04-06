set.seed(100)

#installing the necessary libraries
library(openxlsx)
library(readxl)


#initialize empty data set

data <- list()

#define roles and genders
roles <- c("project manager", "safety manager", "foreman", "plumber", "construction manager", "surveyor", "civil engineer")
genders <- c("male", "female")

#creating folder path for payslips
folder_path <- "payslips"
if (!dir.exists(folder_path)) {
dir.create(folder_path)
}



#defining the employees function in a for loop
employees <- list()

for (a in 1:409) {
salary <- sample(5000:30000, 1)  # Random salary between 5000 and 30000
gender <- sample(genders, 1)     # Random gender selection

# Assign role and employee level based on salary

if (salary > 20000) {
role <- sample(c("project manager", "construction manager"), 1)
employee_level <- "A2"
} else if (salary >= 10000 & salary <= 20000) {
role <- sample(c("civil engineer", "surveyor", "safety manager"), 1)
employee_level <- "A1"
} else {
role <- sample(c("foreman", "plumber"), 1)
employee_level <- "A"
}
if (salary > 7500 & salary < 30000 & gender == "female") {
employee_level <- "A5-F"
}

# Calculate tax and net salary
if (salary > 20000) {
tax <- salary * 0.10
} else {
tax <- salary * 0.05
}
net_salary <- salary - tax

# Add employee data to the list
employees[[a]] <- c(a, paste("employee_", a, sep=""), role, salary, net_salary, gender, employee_level)
# Generate payslip content
payslip_content <- paste0(
"======================\n",
"        PAY SLIP\n",
"=======================\n",
"Employee ID: ", a, "\n",
"Employee Name: ", paste("employee_", a, sep=""), "\n",
"Role: ", role, "\n",
"Salary: $", format(salary, big.mark = ","), "\n",
"Tax deduction: ", tax, "\n",
"Net Salary: ", net_salary, "\n",
"Payslip Date: ", Sys.Date(), "\n",
"=========================\n"
)
# Save payslip
payslip_filename <- paste0(folder_path, "/payslips_employee_", a, ".txt")
writeLines(payslip_content, payslip_filename)
}

# Convert employee list to data frame
df <- data.frame(
ID = sapply(employees, `[[`, 1),
Name = sapply(employees, `[[`, 2),
Role = sapply(employees, `[[`, 3),
Salary = sapply(employees, `[[`, 4),
Net_Salary = sapply(employees, `[[`, 5),
Gender = sapply(employees, `[[`, 6),
Employee_Level = sapply(employees, `[[`, 7)
)

# checking out the data frame first using 10 employees
print(head(df, 10))

# exporting to Excel
write.xlsx(df, "employee_data.xlsx", rowNames = FALSE)





