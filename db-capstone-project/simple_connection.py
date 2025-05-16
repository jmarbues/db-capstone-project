import mysql.connector as connector

try:
    connection = connector.connect(username = "jmarbues", password= "", port = 33061)

except connector.Error as er:
    print("Error code:", er.errno)
    print("Error message:", er.msg)