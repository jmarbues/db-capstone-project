import mysql.connector as connector

try:
    connection = connector.connect(username = "jmarbues", password= "", port = 33061, db = "LittleLemonDB")

except connector.Error as er:
    print("Error code:", er.errno)
    print("Error message:", er.msg)

cursor = connection.cursor() ## Standard cursor

show_tables_query = "SHOW tables" 
cursor.execute(show_tables_query)

# Fetch records 
results = cursor.fetchall()
print(results)


query = """
    SELECT Customers.FullName, Customers.ContactNumber, Customers.Email, Orders.TotalCost
    FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
    WHERE Orders.TotalCost > 60;
"""

cursor.execute(query)

results = cursor.fetchall()
columns = cursor.column_names

# Print column names
print(columns)
# Print query results
for result in results:
    print(result)



# Let's close the cursor and the connection
if connection.is_connected():
    cursor.close()
    print("The cursor is closed.")
    connection.close()
    print("MySQL connection is closed.")
else:
    print("Connection is already closed")