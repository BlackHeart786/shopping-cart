import java.sql.*;
import java.util.Map;

public class DatabaseUtil {
    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String DB_USER = "system";
    private static final String DB_PASSWORD = "8515";
    
    static {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("Oracle JDBC Driver not found.", e);
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    //  close the connection 
    public static void close(Connection con, PreparedStatement ps, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static boolean checkUserCredentials(String email, String password) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean isValidUser = false;

        try {
            con = getConnection();
            String query = "SELECT * FROM USERS WHERE EMAIL = ? AND PASSWORD = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);

            rs = ps.executeQuery();

            if (rs.next()) {
                isValidUser = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(con, ps, rs); 
        }
        
        return isValidUser;
    }

    public static boolean insertOrder(String userEmail, Map<String, Map<String, String>> cart) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean isOrderInserted = false;

        try {
            con = getConnection();

            // Debugging: Check the connection
            if (con == null) {
                System.out.println("Connection to database failed.");
                return false;
            }

            String userQuery = "SELECT U_ID FROM USERS WHERE EMAIL = ?";
            ps = con.prepareStatement(userQuery);
            ps.setString(1, userEmail);
            rs = ps.executeQuery();

            int userId = -1;
            if (rs.next()) {
                userId = rs.getInt("U_ID");
                System.out.println(" user with ID: " + userId);
            } else {
                System.out.println("User not found for email: " + userEmail);
                return false;
            }

            if (userId != -1) {
                String orderQuery = "INSERT INTO ORDERS (P_ID, U_ID, O_QUANTITY, O_DATE) VALUES (?, ?, ?, SYSDATE)";
                ps = con.prepareStatement(orderQuery);

                for (Map.Entry<String, Map<String, String>> entry : cart.entrySet()) {
                    Map<String, String> item = entry.getValue();
                    String productId = entry.getKey();  
                    String quantity = item.get("quantity");

                    // Debugging: 
                    System.out.println("Processing Product ID: " + productId + ", Quantity: " + quantity);

                   
                    if (quantity != null && !quantity.isEmpty()) {
                        try {
                            int qty = Integer.parseInt(quantity);

                            ps.setInt(1, Integer.parseInt(productId)); 
                            ps.setInt(2, userId); 
                            ps.setInt(3, qty);  

                            int rowsAffected = ps.executeUpdate();
                            if (rowsAffected > 0) {
                                isOrderInserted = true;  
                                System.out.println("Order inserted for Product ID: " + productId);
                            } else {
                                System.out.println("No rows found for Product ID: " + productId);
                            }
                        } catch (NumberFormatException e) {
                            System.out.println("Invalid quantity format: " + quantity);
                            e.printStackTrace();
                        }
                    } else {
                        System.out.println("Quantity is missing or invalid for Product ID: " + productId);
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(con, ps, rs); 
        }

        return isOrderInserted;
    }

}
