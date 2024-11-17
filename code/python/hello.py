import mysql.connector

def main():
    print("Hello, World! From Python.")
    try:
        connection = mysql.connector.connect(
            host="mysql",
            port=3306,
            database="testdb",
            user="testuser",
            password="testpass"
        )
        cursor = connection.cursor()
        cursor.execute("SELECT 'Hello from MySQL' AS message")
        for (message,) in cursor:
            print(message)
    except Exception as e:
        print("Error:", e)
    finally:
        if connection.is_connected():
            connection.close()

if __name__ == "__main__":
    main()
