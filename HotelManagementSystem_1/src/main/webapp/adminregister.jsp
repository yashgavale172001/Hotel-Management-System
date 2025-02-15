<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Registration</title>

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
            flex-direction: column;  /* Arrange elements in column order */
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        /* Error message styling */
        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
            padding: 15px;
            width: 90%;
            text-align: center;
            font-weight: bold;
            margin-bottom: 30px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        }

        h2 {
            color: #333;
            font-weight: bold;
            margin-bottom: 20px;
            font-size: 30px;
        }

        .form-container {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 450px;
        }

        .form-container:hover {
            box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.3);
        }

        .form-control {
            border-radius: 8px;
            padding: 14px;
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
            padding: 14px;
            font-size: 18px;
            border-radius: 8px;
            transition: 0.3s;
            font-weight: bold;
        }

        .btn-primary:hover {
            background: linear-gradient(to right, #ff5e62, #ff758c);
        }

        .input-group-text {
            background: #ff758c;
            color: white;
            border: none;
            border-radius: 8px 0px 0px 8px;
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

    <!-- Error message displayed at the top -->
    <% if ((String)request.getAttribute("errorMessage") != null) { %>
        <div class="error-message">
            <%= (String)request.getAttribute("errorMessage") %>
        </div>
    <% } %>

    <h2><i class="fas fa-user-shield"></i> Admin Registration</h2>

    <!-- Registration Form in a styled container -->
    <div class="form-container">
        <form action="AdminRegister" method="post">
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fas fa-user"></i></span>
                <input type="text" name="name" class="form-control" placeholder="Full Name" required>
            </div>
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                <input type="email" name="email" class="form-control" placeholder="Email Address" required>
            </div>
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                <input type="password" name="password" class="form-control" placeholder="Password" required>
            </div>
            <button type="submit" class="btn btn-primary w-100"><i class="fas fa-user-plus"></i> Register</button>
        </form>

        <!-- Login Redirect -->
        <div class="login-link mt-3">
            <p>Already have an account? <a href="adminlogin.jsp">Login Here</a></p>
        </div>
    </div>

</body>
</html>
