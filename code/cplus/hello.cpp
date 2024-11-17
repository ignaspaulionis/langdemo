#include <iostream>
#include <mysql_driver.h>
#include <mysql_connection.h>
#include <cppconn/prepared_statement.h>
#include <cppconn/resultset.h>

int main() {
    const char* host = "tcp://mysql:3306";  // MySQL server host and port
    const char* user = "testuser";
    const char* pass = "testpass";
    const char* db = "testdb";
    
    try {
        // Create a driver and establish a connection
        sql::mysql::MySQL_Driver *driver;
        sql::Connection *con;
        
        driver = sql::mysql::get_mysql_driver_instance();
        con = driver->connect(host, user, pass);
        
        // Set the schema to use
        con->setSchema(db);

        // Execute query
        sql::Statement *stmt = con->createStatement();
        sql::ResultSet *res = stmt->executeQuery("SELECT 'Hello from MySQL' AS message");

        // Output the result
        while (res->next()) {
            std::cout << res->getString("message") << std::endl;
        }

        // Clean up
        delete res;   // Delete the result set
        delete stmt;  // Delete the statement
        delete con;   // Delete the connection
    } catch (sql::SQLException &e) {
        std::cerr << "Error: " << e.what() << std::endl;
    }
    return 0;
}
