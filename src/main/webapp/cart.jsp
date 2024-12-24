<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Map, java.util.HashMap" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart</title>
    <%@ include file="includes/head.jsp" %>
    <style type="text/css">
        .table tbody td {
            vertical-align: middle;
        }
        tbody {
            width: 1015.61px;
        }

        .btn-incre, .btn-decre {
            box-shadow: none;
            font-size: 25px;
        }

        .btn-remove, .btn-continue {
            font-size: 14px;
            padding: 0.5rem 1rem;
            margin-right: 5px;
            border-radius: 5px;
        }

        .btn-continue {
            background-color: #28a745;
            color: #fff;
            text-decoration: none;
            border: none;
        }

        .btn-continue:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>

    <div class="container">
        <div class="d-flex py-4">
            <h3>Total Price: ₹<%= session.getAttribute("totalPrice") != null ? session.getAttribute("totalPrice") : "0.00" %></h3>
            <a class="mx-3 btn btn-primary" href="Checkout.jsp">Checkout</a>
        </div>

        <table class="table table-light">
            <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Category</th>
                    <th scope="col">Price</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Total</th>
                    <th scope="col">Actions</th>
                </tr>
            </thead>
            <tbody>
            <% 
            @SuppressWarnings("unchecked")
            Map<String, Map<String, String>> cart = (Map<String, Map<String, String>>) session.getAttribute("cart");

            double totalPrice = 0.00;  

            if (cart != null && !cart.isEmpty()) {
                // loop through the cart to calculate the total price
                for (Map.Entry<String, Map<String, String>> entry : cart.entrySet()) {
                    Map<String, String> item = entry.getValue();
                    String productId = entry.getKey(); 
                    String productName = item.get("productName");
                    String productPrice = item.get("productPrice");
                    String quantity = item.get("quantity");

                    //  if the product information is valid
                    if (productName != null && !productName.isEmpty() && 
                        productPrice != null && !productPrice.isEmpty() && 
                        quantity != null && !quantity.isEmpty()) {
                        
                        try {
                            double price = Double.parseDouble(productPrice);
                            int qty = Integer.parseInt(quantity);
                            double itemTotal = price * qty;
                            totalPrice += itemTotal;  

                            out.println("<tr>");
                            out.println("<td>" + productName + "</td>");
                            out.println("<td>Category</td>");
                            out.println("<td>₹" + productPrice + "</td>");
                            out.println("<td>");
                            out.println("<form action='updateCart' method='post' class='form-inline'>");
                            out.println("<input type='hidden' name='productId' value='" + productId + "'>");
                            out.println("<input type='number' name='quantity' class='form-control' value='" + quantity + "' min='1'>");
                            out.println("<button class='btn btn-primary' type='submit'>Update</button>");
                            out.println("</form>");
                            out.println("</td>");
                            out.println("<td>₹" + itemTotal + "</td>");
                            out.println("<td><a href='removeItem?productId=" + productId + "' class='btn btn-danger btn-remove'>Remove</a></td>");
                            out.println("</tr>");
                        } catch (NumberFormatException e) {
                            out.println("<tr><td colspan='6'>Invalid price or quantity format for product: " + productName + "</td></tr>");
                        }
                    } else {
                        out.println("<tr><td colspan='6'>Missing data for product: " + productName + "</td></tr>");
                    }
                }

                session.setAttribute("totalPrice", totalPrice);  
            } else {
                out.println("<tr><td colspan='6'>Your cart is empty. <a href='index.jsp'>Browse products</a></td></tr>");
            }
            %>

            </tbody>
        </table>
    </div>

    <%@ include file="includes/footer.jsp" %>
</body>
</html>
