<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>

    <!-- Bootstrap for Styling -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Font Awesome for Icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <style>
        body {
            background: linear-gradient(to right, #ff9a9e, #fad0c4, #fad0c4);
            font-family: 'Poppins', sans-serif;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding-top: 60px; /* Prevent overlap with error message */
        }

        .error-message {
            position: absolute;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            background: #ff4d4d;
            color: white;
            padding: 12px 20px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            animation: fadeIn 0.5s ease-in-out;
            text-align: center;
            min-width: 350px;
            z-index: 1000;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateX(-50%) translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateX(-50%) translateY(0);
            }
        }

        .container {
            max-width: 400px;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
            transition: all 0.3s ease-in-out;
        }

        .container:hover {
            box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.3);
        }

        .container h2 {
            color: #333;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .form-control {
            border-radius: 8px;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ddd;
        }

        .form-control:focus {
            border-color: #ff758c;
            box-shadow: 0 0 5px rgba(255, 117, 140, 0.5);
        }

        .btn-primary {
            background: linear-gradient(to right, #ff758c, #ff7eb3);
            border: none;
            padding: 12px;
            font-size: 18px;
            border-radius: 8px;
            transition: 0.3s;
            font-weight: bold;
        }

        .btn-primary:hover {
            background: linear-gradient(to right, #ff5e62, #ff758c);
        }

        .login-link {
            margin-top: 12px;
            font-size: 14px;
        }

        .login-link a {
            text-decoration: none;
            color: #ff5e62;
            font-weight: bold;
            transition: 0.3s;
        }

        .login-link a:hover {
            text-decoration: underline;
            color: #e6005c;
        }
    </style>
</head>
<body>

    <!-- Display Error Message if Exists -->
    <% if ((String) request.getAttribute("errorMessage") != null) { %>
        <div class="error-message">
            <%= request.getAttribute("errorMessage") %>
        </div>
    <% } %>

    <div class="container">
        <h2><i class="fas fa-sign-in-alt"></i> User Login</h2>

        <!-- Login Form -->
        <form action="userLogin" method="post">
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                <input type="email" name="email" class="form-control" placeholder="Email Address" required>
            </div>
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                <input type="password" name="password" class="form-control" placeholder="Password" required>
            </div>
            <button type="submit" class="btn btn-primary w-100"><i class="fas fa-sign-in-alt"></i> Login</button>
        </form>

        <!-- Register Redirect -->
        <div class="login-link">
            <p>Don't have an account? <a href="register.jsp">Register Here</a></p>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
