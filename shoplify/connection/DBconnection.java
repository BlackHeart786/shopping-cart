import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnection {

    private static Connection con= null;

    public static Connection getConnection() throws SQL{
        if (con == null) {
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","8515");
                System.out.println("Database connected successfully.");
            } catch (ClassNotFoundException e) {
                System.err.println("Database Driver not found: " + e.getMessage());
                throw e;
            } catch (SQLException e) {
                System.err.println("SQL Error: " + e.getMessage());
                throw e;
            }
        }
        return con;
    }

    
