import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();

    String productId = request.getParameter("productId");
    String productName = request.getParameter("productName");
    String productPrice = request.getParameter("productPrice");
    String quantity = request.getParameter("quantity");

    @SuppressWarnings("unchecked")
    Map<String, Map<String, String>> cart = (Map<String, Map<String, String>>) session.getAttribute("cart");
    if (cart == null) {
        cart = new HashMap<>();
    }

    Map<String, String> item = new HashMap<>();
    item.put("productName", productName);
    item.put("productPrice", productPrice);
    item.put("quantity", quantity);

    if (cart.containsKey(productId)) {
        //   already in the cart, update the quantity
        int currentQuantity = Integer.parseInt(cart.get(productId).get("quantity"));
        int newQuantity = Integer.parseInt(quantity);
        cart.get(productId).put("quantity", String.valueOf(currentQuantity + newQuantity));
    } else {
        cart.put(productId, item);
    }

    session.setAttribute("cart", cart);

    double totalPrice = 0;
    for (Map<String, String> product : cart.values()) {
        try {
            double price = Double.parseDouble(product.get("productPrice"));
            int qty = Integer.parseInt(product.get("quantity"));
            totalPrice += price * qty;
        } catch (NumberFormatException e) {
            e.printStackTrace();  
        }
    }

    request.setAttribute("totalPrice", totalPrice);
    response.sendRedirect("cart.jsp");
}
}
