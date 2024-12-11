<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<%@ include file="includes/head.jsp" %>
<title>Register</title>
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
        background-color: #8EB486;
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
            <h3>Register</h3>
        </div>
        <div class="card-body">
            <form action="" method="post">
                <!-- Full Name Input -->
                <div class="form-group mb-4">
                    <label for="full-name">Full Name</label>
                    <input type="text" id="full-name" class="form-control" name="register-name" placeholder="Enter your full name" required>
                </div>

                <!-- Email Input -->
                <div class="form-group mb-4">
                    <label for="email">Email</label>
                    <input type="email" id="email" class="form-control" name="register-email" placeholder="Enter your email" required>
                </div>

                <!-- Password Input -->
                <div class="form-group mb-4">
                    <label for="password">Password</label>
                    <input type="password" id="password" class="form-control" name="register-password" placeholder="Enter your password" required>
                </div>

                <!-- Confirm Password Input -->
                <div class="form-group mb-4">
                    <label for="confirm-password">Confirm Password</label>
                    <input type="password" id="confirm-password" class="form-control" name="register-confirm-password" placeholder="Confirm your password" required>
                </div>

                <!-- Submit Button -->
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Register</button>
                </div>

                <!-- Link to Login Page -->
                <div class="text-center mt-3">
                    <p class="text-muted">Already have an account? <a href="login.jsp">Login here</a></p>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>

</body>
</html>
