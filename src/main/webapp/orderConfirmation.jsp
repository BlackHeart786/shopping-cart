<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation</title>
    <%@ include file="includes/head.jsp" %>

<style>
.order-confirm-container {
    max-width: 800px;
    margin: 50px auto;
    background-color: #ffffff;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.order-confirm-container h3 {
    font-size: 24px;
    color: #28a745;
    text-align: center;
}

.order-confirm-container p {
    font-size: 18px;
    color: #333;
    line-height: 1.6;
    text-align: center;
}

.order-confirm-container .order-id {
    font-size: 20px;
    color: #007bff;
    font-weight: bold;
    margin-top: 20px;
    text-align: center;
}

.order-confirm-container .btn {
    display: inline-block;
    background-color: #007bff;
    color: #fff;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    border-radius: 4px;
    font-size: 16px;
    margin-top: 20px;
    transition: background-color 0.3s ease;
}

.order-confirm-container .btn:hover {
    background-color: #0056b3;
}

footer {
    background-color: #f1f1f1;
    padding: 20px;
    text-align: center;
    margin-top: 30px;
    font-size: 14px;
    color: #777;
}


</style>
</head>
<body>

    <%@ include file="includes/navbar.jsp" %>

    <div class="order-confirm-container">
        <h3>Your order has been placed successfully!</h3>
        <p>Your order is being processed. You will receive an email confirmation shortly.</p>

        <p class="order-id">Your Order ID is: <strong>${requestScope.orderId}</strong></p>

        <a href="index.jsp" class="btn">Go back to homepage</a>
    </div>

    <%@ include file="includes/footer.jsp" %>
</body>
</html>