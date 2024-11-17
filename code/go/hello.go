package main

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/go-sql-driver/mysql"
)

func main() {
	// Connect to the MySQL database
	dsn := "testuser:testpass@tcp(mysql:3306)/testdb"
	db, err := sql.Open("mysql", dsn)
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	// Test the connection
	err = db.Ping()
	if err != nil {
		log.Fatal(err)
	}

	// Query the database
	rows, err := db.Query("SELECT 'Hello from MySQL' AS message")
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	// Output the result
	for rows.Next() {
		var message string
		if err := rows.Scan(&message); err != nil {
			log.Fatal(err)
		}
		fmt.Println("Database Message:", message)
	}

	if err := rows.Err(); err != nil {
		log.Fatal(err)
	}
}
