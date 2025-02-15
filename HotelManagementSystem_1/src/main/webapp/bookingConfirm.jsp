<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, jakarta.servlet.http.HttpSession, com.qsp.Customer" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Booking Confirmation</title>

    <!-- Font Awesome for Icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            padding: 20px;
        }

        .container {
            max-width: 600px;
            width: 100%;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
            text-align: center;
            animation: fadeIn 0.8s ease-in-out;
        }

        h2 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #333;
        }

        .details {
            font-size: 20px;
            margin: 15px 0;
            color: #555;
            font-weight: bold;
            display: flex;
            justify-content: space-between;
            background: #f8f9fa;
            padding: 12px;
            border-radius: 8px;
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .details i {
            color: #007BFF;
            margin-right: 10px;
        }

        .btn-container {
            display: flex;
            justify-content: space-between;
            margin-top: 25px;
        }

        .btn {
            padding: 12px 20px;
            font-size: 18px;
            border: none;
            cursor: pointer;
            border-radius: 6px;
            font-weight: bold;
            width: 48%;
            transition: all 0.3s ease-in-out;
        }

        .confirm-btn {
            background: #28a745;
            color: white;
        }

        .confirm-btn:hover {
            background: #218838;
            transform: scale(1.05);
        }

        .back-btn {
            background: #007BFF;
            color: white;
            text-decoration: none;
            text-align: center;
            display: inline-block;
            line-height: 46px;
        }

        .back-btn:hover {
            background: #0056b3;
            transform: scale(1.05);
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                max-width: 90%;
                padding: 25px;
            }
            h2 {
                font-size: 24px;
            }
            .btn {
                font-size: 16px;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
<%
HttpSession hs=request.getSession();
hs.setAttribute("currentRoomNo",hs.getAttribute("currentRoomNo"));
%>

    <div class="container">
        <h2><i class="fas fa-bed"></i> Booking Confirmation</h2>

        <!-- Form to Send Data to Controller -->
        <form action="finalConfirm" method="post">
            <div class="details">
                <span><i class="fas fa-door-closed"></i> Room Number</span>
                <span><%= request.getAttribute("room_no") %></span>
                <input type="hidden" name="room_no" value="<%= request.getAttribute("room_no") %>">
            </div>

            <div class="details">
                <span><i class="fas fa-calendar-alt"></i> Total Days</span>
                <span><%= request.getAttribute("total_days") %> days</span>
                <input type="hidden" name="total_days" value="<%= request.getAttribute("total_days") %>">
            </div>

            <div class="details">
                <span><i class="fas fa-dollar-sign"></i> Total Price</span>
                <span>₹ <%= request.getAttribute("total_price") %></span>
                <input type="hidden" name="total_price" value="<%= request.getAttribute("total_price") %>">
            </div>

            <div class="btn-container">
                <button type="submit" class="btn confirm-btn">
                    <i class="fas fa-check-circle"></i> Confirm Booking
                </button>
                <a href="bookRoom.jsp" class="btn back-btn">
                    <i class="fas fa-arrow-left"></i> Back
                </a>
            </div>
        </form>
    </div>
</body>
</html>
