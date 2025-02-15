<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List, com.qsp.Booking,jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details</title>
    
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
            max-width: 1000px;
            margin: 60px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 12px 20px rgba(0, 0, 0, 0.1);
        }

        .order-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .order-header h2 {
            font-size: 36px;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .order-table th, .order-table td {
            text-align: center;
            padding: 15px;
            font-size: 16px;
        }

        .order-table th {
            background-color: #ff7e5f;
            color: #fff;
            font-weight: 600;
        }

        .order-table td {
            background-color: #f4f4f9;
        }

        .order-table tr:nth-child(even) td {
            background-color: #e9ecef;
        }

        .order-table td a {
            color: #ff7e5f;
            text-decoration: none;
            font-weight: bold;
        }

        .order-table td a:hover {
            text-decoration: underline;
        }

        .btn-back {
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
            margin-top: 30px;
        }

        .btn-back:hover {
            background-color: #feb47b;
            transform: scale(1.05);
        }

        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            .order-header h2 {
                font-size: 28px;
            }

            .order-table th, .order-table td {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
<%
HttpSession hs=request.getSession();

    List<Booking> bookings = (List<Booking>)hs.getAttribute("bookings");
%>

    <div class="container">
        <div class="order-header">
            <h2>Order Details</h2>
        </div>

        <table class="table order-table">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Booking ID</th>
                    <th>Check-in Time</th>
                    <th>Check-out Time</th>
                    <th>Price</th>
                    <th>Room No</th>
                    <th>Total Days</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    for (Booking booking : bookings) { 
                %>
                    <tr>
                        <td><%= booking.getName() %></td>
                         <td><%= booking.getC_email() %></td>
                        <td><%= booking.getBooking_id() %></td>
                        <td><%= booking.getBook_from() %></td>
                        <td><%= booking.getBook_upto() %></td>
                        <td><%= booking.getPrice() %></td>
                        <td><%= booking.getRoom_no() %></td>
                        <td><%= booking.getTotal_days() %></td>
                    </tr>
                <% 
                    } 
                %>
            </tbody>
        </table>

        <a href="homepage.jsp" class="btn-back">
            <i class="fas fa-arrow-left"></i> Back
        </a>
    </div>

    <!-- Bootstrap JS for responsiveness -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
