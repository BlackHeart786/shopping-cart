<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<%@ include file="includes/head.jsp" %>
<title>Login</title>
<style>
    .container {
    	height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .card {
    
        border-radius: 15px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        overflow: hidden;
    }
    .card-header {
        background-color: #6c757d;
        color: white;
        font-size: 1.5rem;
        font-weight: 600;
    }
    .form-group label {
        font-weight: 500;
    }
    .btn-primary {
        background-color: #007bff;
        border: none;
        padding: 10px 20px;
        border-radius: 25px;
        width: 100%;
    }
    .btn-primary:hover {
        background-color: #0056b3;
    }
    .form-control:focus {
        border-color: #007bff;
        box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
    }
</style>
</head>
<body>

<div class="container">
    <div class="card w-50">
        <div class="card-header text-center">
            <h3>Login</h3>
        </div>
        <div class="card-body">
            <form action="" method="post">
                <div class="form-group mb-4">
                    <label for="email">Email</label>
                    <input type="email" id="email" class="form-control" name="login-email" placeholder="Enter your email" required>
                </div>
                <div class="form-group mb-4">
                    <label for="password">Password</label>
                    <input type="password" id="password" class="form-control" name="login-password" placeholder="Enter your password" required>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Login</button>
                </div>
                <div class="text-center mt-3">
                    <a href="#" class="text-muted">Forgot password?</a>
                </div>
                <div class="text-center mt-2">
                    <p class="text-muted">Don't have an account? <a href="#">Sign up here</a></p>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>

</body>
</html>
