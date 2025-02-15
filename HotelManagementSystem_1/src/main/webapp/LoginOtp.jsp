<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, jakarta.servlet.http.HttpSession, com.qsp.Customer" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>OTP Verification</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <!-- Font Awesome for Icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <style>
        body {
            background: linear-gradient(to right, #ff9966, #ff5e62);
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            justify-content: flex-start;
            padding-top: 20px;
        }

        /* Error message styling */
        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
            padding: 15px;
            width: 90%;
            max-width: 500px;
            text-align: center;
            font-weight: bold;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            display: block; /* Ensures visibility */
        }

        .otp-container {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 100%;
            max-width: 400px;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .otp-input {
            width: 100%;
            padding: 12px;
            font-size: 18px;
            text-align: center;
            letter-spacing: 10px;
            border: 2px solid #ccc;
            border-radius: 5px;
            outline: none;
        }

        .btn-custom {
            width: 100%;
            padding: 12px;
            font-size: 18px;
            border-radius: 8px;
            font-weight: bold;
            transition: 0.3s;
            border: none;
        }

        .btn-submit {
            background-color: #28a745;
            color: white;
        }

        .btn-submit:hover {
            background-color: #218838;
        }

        .btn-back {
            background-color: #007bff;
            color: white;
            margin-top: 10px;
        }

        .btn-back:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<% 
    HttpSession hs = request.getSession();
    if ((String) request.getAttribute("errorMessage") != null) { 
%>
    <!-- Display error message -->
    <div class="error-message">
        <%= (String) request.getAttribute("errorMessage") %>
    </div>
<% } %>

    <div class="otp-container">
        <h2><i class="fas fa-key"></i> OTP Verification</h2>
        <p>Enter the OTP sent to your registered email</p>
        
        <form action="verifyOtp" method="post">
            <input type="text" name="userOtp" class="otp-input" maxlength="6" required placeholder="______">
            <input type="hidden" name="Otp" value="<%= (String) hs.getAttribute("otp") %>">
            <button type="submit" class="btn btn-custom btn-submit mt-3">Submit</button>
        </form>
        
        <a href="Login.jsp" class="btn btn-custom btn-back">Back</a>
    </div>

    <!-- Bootstrap JS (for responsiveness) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
