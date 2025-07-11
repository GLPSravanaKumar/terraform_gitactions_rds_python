import mysql.connector
import csv

# Replace with your RDS endpoint and credentials
conn = mysql.connector.connect(
    host= 'terraform-20250711092750992000000001.cls04s20gw5u.ap-south-1.rds.amazonaws.com',
    user= 'admin',
    password= 'glpsadmin1234',
    database= 'glpsdb',
    port= 3306  # default MySQL port
)

cursor = conn.cursor()

    # Example query
    # Open the CSV and insert each row
with open('users.csv', 'r') as file:
    reader = csv.reader(file)
    
    next(reader)  # Skip header

    for row in reader:
        name, email, age, city = row
        cursor.execute(
            "INSERT INTO users (name, email, age, city) VALUES (%s, %s, %s, %s)",
            (name, email, int(age), city)
        )

conn.commit()
cursor.close()
conn.close()

print("✅ Data inserted into RDS successfully!")
