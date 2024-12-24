import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public loginServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("login-email");
        String password = request.getParameter("login-password");

        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        HttpSession session = request.getSession(true);
        RequestDispatcher rd = null;

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DatabaseUtil.getConnection();

            if (con != null) {
                String query = "SELECT * FROM USERS WHERE EMAIL = ? AND PASSWORD = ?";
                ps = con.prepareStatement(query);
                ps.setString(1, email);
                ps.setString(2, password);
                
                rs = ps.executeQuery();

                if (rs.next()) {
                    // Successful login, set's email in session
                    session.setAttribute("email", email);

                    request.setAttribute("message", "Login successful! Welcome, " + email);

                    rd = request.getRequestDispatcher("index.jsp");
                } else {
                    request.setAttribute("error", "Invalid email or password.");
                    rd = request.getRequestDispatcher("login.jsp");
                }
                
                rd.forward(request, response); 
            } else {
                out.println("<h1>Connection to the database failed. Please try again later.</h1>");
            }
        } catch (Exception e) {
            out.println("<h1>Error: " + e.getMessage() + "</h1>");
        } finally {
            DatabaseUtil.close(con, ps, rs); 
        }
    }
}
