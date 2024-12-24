import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;
import java.util.Random;

import java.sql.DriverManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String DB_USER = "system";
    private static final String DB_PASSWORD = "8515";

    private Connection connection;
    private PreparedStatement preparedStatement;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            throw new ServletException("Database connection failed: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("email");

        if (userEmail == null) {
            response.getWriter().write("You must be logged in to place an order.");
            return;
        }

        @SuppressWarnings("unchecked")
        Map<String, Map<String, String>> cart = (Map<String, Map<String, String>>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            response.getWriter().write("Your cart is empty. Please add products to your cart before placing an order.");
            return;
        }

        int randomOrderId = generateRandomOrderId();

        String sql = "INSERT INTO orders (O_ID, P_ID, U_EMAIL, O_QUANTITY, O_DATE) VALUES (?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'))";

        try {
            for (Map.Entry<String, Map<String, String>> entry : cart.entrySet()) {
                Map<String, String> product = entry.getValue();

                String productId = entry.getKey();  
                String productName = product.get("productName");
                product.get("productPrice"); 
                String quantity = product.get("quantity");

                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setInt(1, randomOrderId);  
                preparedStatement.setString(2, productId);  
                preparedStatement.setString(3, userEmail);  
                preparedStatement.setInt(4, Integer.parseInt(quantity));  
                preparedStatement.setString(5, java.time.LocalDate.now().toString()); 

                //  query for each product in the cart
                int rowsAffected = preparedStatement.executeUpdate();

                if (rowsAffected <= 0) {
                    response.getWriter().write("Failed to place the order for product: " + productName);
                    return;
                }
            }
            request.setAttribute("orderId", randomOrderId);

            request.getRequestDispatcher("orderConfirmation.jsp").forward(request, response);

            session.removeAttribute("cart");

        } catch (SQLException e) {
            response.getWriter().write("Database error: " + e.getMessage());
        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private int generateRandomOrderId() {
        Random random = new Random();
        return 1000 + random.nextInt(9000); 
    }

    @Override
    public void destroy() {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }	
    }
}
