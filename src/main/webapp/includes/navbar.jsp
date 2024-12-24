<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navbar</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        .navbar {
            font-size: 1rem; 
            padding: 0.8rem 1.5rem; 
            border-bottom: 1px solid #ddd; 
            position: sticky;
            top: 0;
            z-index: 1000;
            background-color: #343a40; 
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            font-size: 1.5rem; 
            font-weight: 500;
            color: #f8f9fa; 
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: color 0.3s ease;
        }

        .navbar-brand:hover {
            color: #f1f1f1; 
        }

        .navbar-nav .nav-link {
            margin-right: 1rem; 
            padding: 0.4rem 1rem;
            color: #f8f9fa;
            text-transform: uppercase;
            font-weight: 400;
            transition: color 0.3s ease, background-color 0.3s ease; 
        }

        /* Specific hover colors */
        .home-link:hover {
            color: #ff6347; /* Tomato Red */
        }

        .cart-link:hover {
            color: #28a745; /* Green */
        }

        .orders-link:hover {
            color: #ffc107; /* Amber */
        }

        .user-email-link:hover {
            color: #007bff; /* Blue */
        }

        .navbar-nav .nav-link.active {
            color: #007bff;
            font-weight: bold;
        }

        .badge-danger {
            background-color: #dc3545; 
            font-size: 0.9rem; 
            vertical-align: middle;
        }

        .navbar-toggler {
            border: none; 
            font-size: 1.2rem; 
            color: #f8f9fa;
        }

        .navbar-toggler-icon {
            background-color: #f8f9fa;
        }

        .container {
            max-width: 1200px; 
        }

        .user-email {
            color: #28a745; /* Color for the user's email, set to green */
            font-weight: 500;
        }

        @media (max-width: 768px) {
            .navbar-nav {
                text-align: center;
            }
            .navbar-nav .nav-link {
                margin-right: 0;
                padding: 0.8rem;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">E-Commerce Cart</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link home-link" href="index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link cart-link" href="cart.jsp">Cart</a></li>
                    <li class="nav-item"><a class="nav-link orders-link" href="orders.jsp">Orders</a></li>

                    <%
                        String email = (String) session.getAttribute("email");
                        if (email != null) {
                    %>
                        <li class="nav-item"><a class="nav-link user-email-link" href="profile.jsp">Welcome, <%= email %></a></li>
                        <li class="nav-item"><a class="nav-link" href="logoutServlet">Logout</a></li>
                    <% 
                        } else {
                    %>
                        <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                    <% 
                        }
                    %>
                </ul>
            </div>
        </div>
    </nav>
</body>
</html>
