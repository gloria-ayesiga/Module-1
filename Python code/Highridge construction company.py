

from tabulate import tabulate
import random
import os
import pandas as pd
from datetime import datetime
random.seed(100)
data = []


#generating lists
roles = ["project manager", "safety manager", "foreman", "plumber", "construction manager", "surveyor", "civil engineer"]
genders = ["male", "female"]

folder_path = "payslips" #create folder for payslips
if not os.path.exists(folder_path):
   os.makedirs(folder_path)

employees =  []
for a in range (1,410):
    salary = random.randint (5000, 30000)
    gender = random.choice(genders)

    employee_level = None
     #assign roles based on salary
    if salary > 20000:
     role = random.choice(["project manager", "construction manager"]) 
     employee_level = "A2"  # assignment for levels
    elif 10000 <= salary <= 20000:
     role = random.choice(["civil engineer", "surveyor", "safety manager"])
     employee_level = "A1"  # assignment for levels
    else:
     role = random.choice(["foreman", "plumber"])
     employee_level = "A"  # assignment for levels
    
    if salary > 7500 and salary < 30000 and gender == "female": #adding another condition for female employees
      employee_level = "A5-F" 
   

# Calculate tax and net salary
    if salary > 20000:
        tax = salary * 0.10
    else:
        tax = salary * 0.05
    net_salary = salary - tax

   
      

#add employee data to the employee list
    employees.append([a, f"employee_{a}", role, salary, net_salary, gender, employee_level])

#payslips
    payslip_content = f"""
    ======================
            PAY SLIP
    ========================
    Employee ID: {a}
    Employee Name: {f"employee_{a}"}
    Role: {role}
    Salary: ${salary:,}
    Tax deduction: {tax}
    Net Salary: {net_salary}
    Payslip Date: {datetime.now().strftime("%Y-%m-%d")}
    ==========================
    """
try:
    #generate payslips
    payslip_filename = os.path.join(folder_path, f"payslips_employee_{a}.txt")
    with open(payslip_filename,"w") as file:
     file.write(payslip_content)
except Exception as e:
   print (f'error generating payslip for employee {a}: {e}')

#preparing tabular output
headers = ["ID", "Name", "Role", "Salary", "Net Salary", "Gender", "Employee_level"]
print(tabulate(employees[:10], headers=headers, tablefmt="grid"))

#preparing excel output
df = pd.DataFrame(employees, columns = ["ID", "Name", "Role", "Salary", "Net_Salary", "Gender", "Employee_level"])
print(df.head())

try:
 df.to_excel("employee_data.xlsx", index=False)
 print(f'excel file printed succesfully')
except Exception as e:
  print(f'error saving excel file:{e}')





