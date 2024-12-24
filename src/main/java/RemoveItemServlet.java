import java.io.IOException;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/removeItem")
public class RemoveItemServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        @SuppressWarnings("unchecked")
        Map<String, Map<String, String>> cart = (Map<String, Map<String, String>>) request.getSession().getAttribute("cart");

        String productId = request.getParameter("productId");

        if (cart != null && cart.containsKey(productId)) {
            cart.remove(productId);

            double totalPrice = 0.00;
            for (Map.Entry<String, Map<String, String>> entry : cart.entrySet()) {
                Map<String, String> itemData = entry.getValue();
                String productPrice = itemData.get("productPrice");
                String quantity = itemData.get("quantity");

                if (productPrice != null && !productPrice.isEmpty() && quantity != null && !quantity.isEmpty()) {
                    try {
                        double price = Double.parseDouble(productPrice);
                        int qty = Integer.parseInt(quantity);
                        totalPrice += price * qty;
                    } catch (NumberFormatException e) {
                    }
                }
            }

            request.getSession().setAttribute("totalPrice", totalPrice);

            response.sendRedirect("cart.jsp");
        } else {
            response.sendRedirect("cart.jsp");
        }
    }
}
