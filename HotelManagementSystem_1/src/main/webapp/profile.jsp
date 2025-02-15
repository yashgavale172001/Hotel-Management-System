<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, jakarta.servlet.http.HttpSession, com.qsp.Customer" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <!-- Bootstrap CSS for responsiveness -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #ff7e5f, #feb47b);
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 60px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 12px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .profile-img {
            border-radius: 50%;
            width: 120px;
            height: 120px;
            object-fit: cover;
            margin-bottom: 20px;
        }

        .profile-header h2 {
            color: #333;
            font-size: 36px;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .profile-info {
            margin-bottom: 20px;
            text-align: left;
        }

        .profile-info h5 {
            color: #ff7e5f;
            font-size: 20px;
            font-weight: 500;
        }

        .profile-info p {
            color: #555;
            font-size: 18px;
        }

        .back-btn {
            display: inline-block;
            background-color: #ff7e5f;
            color: #fff;
            padding: 12px 30px;
            font-size: 18px;
            border: none;
            border-radius: 30px;
            text-transform: uppercase;
            cursor: pointer;
            transition: 0.3s ease;
            text-decoration: none;
        }

        .back-btn:hover {
            background-color: #feb47b;
            transform: scale(1.05);
        }

        .profile-info .info-item {
            padding: 10px 0;
        }

        .fa-arrow-left {
            color: #fff;
            font-size: 22px;
            margin-right: 10px;
        }

        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            .profile-header h2 {
                font-size: 28px;
            }

            .back-btn {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
<%
HttpSession hs=request.getSession();
Customer customer=(Customer)hs.getAttribute("customer");
%>
    <div class="container">
        <div class="profile-header">
            <h2><%=customer.getFirst_name()+" "+customer.getLast_name() %></h2>
        </div>

        <div class="profile-info">
            <div class="info-item">
                <h5>First Name</h5>
                <p><%=customer.getFirst_name()%></p>
            </div>
            <div class="info-item">
                <h5>Last Name</h5>
                <p><%=customer.getLast_name()%></p>
            </div>
            <div class="info-item">
                <h5>Age</h5>
                <p><%=customer.getAge() %></p>
            </div>
            <div class="info-item">
                <h5>Address</h5>
                <p><%=customer.getAddress() %></p>
            </div>
            <div class="info-item">
                <h5>Email</h5>
                <p><%=customer.getEmail() %></p>
            </div>
        </div>

        <!-- Back button -->
        <a href="homepage.jsp" class="back-btn">
            <i class="fas fa-arrow-left"></i> Back
        </a>
    </div>

    <!-- Bootstrap JS for responsiveness -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
