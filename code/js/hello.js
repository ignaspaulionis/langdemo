const mysql = require('mysql2');

console.log("Hello, World! From JavaScript.");

const connection = mysql.createConnection({
    host: "mysql",
    port: 3306,
    user: "testuser",
    password: "testpass",
    database: "testdb"
});

connection.connect(err => {
    if (err) {
        console.error("Error connecting to MySQL:", err);
        return;
    }
    connection.query("SELECT 'Hello from MySQL' AS message", (error, results) => {
        if (error) throw error;
        results.forEach(row => console.log(row.message));
        connection.end();
    });
});
