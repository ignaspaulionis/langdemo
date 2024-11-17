import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World! From Java.");
        try {
            Connection connection = DriverManager.getConnection(
                "jdbc:mysql://mysql:3306/testdb", "testuser", "testpass");
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT 'Hello from MySQL' AS message");
            while (rs.next()) {
                System.out.println(rs.getString("message"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
