using System;
using MySql.Data.MySqlClient;

class Program
{
    static void Main(string[] args)
    {
        string connectionString = "Server=localhost;Database=testdb;User=testuser;Password=testpass;";
        
        using (var connection = new MySqlConnection(connectionString))
        {
            try
            {
                connection.Open();
                Console.WriteLine("Connected to the database!");
                var command = new MySqlCommand("SELECT 'Hello from MySQL' AS message", connection);
                var reader = command.ExecuteReader();
                
                while (reader.Read())
                {
                    Console.WriteLine(reader.GetString(0)); // Assuming "message" is the column name
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred: {ex.Message}");
            }
        }
    }
}