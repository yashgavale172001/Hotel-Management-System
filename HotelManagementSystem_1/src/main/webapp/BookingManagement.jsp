
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, jakarta.servlet.http.HttpSession, com.qsp.Booking" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Rooms</title>

    <!-- Bootstrap for Styling -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Font Awesome for Icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <style>
        body {
            background: #f4f4f4;
            font-family: 'Poppins', sans-serif;
        }

        .container {
            margin-top: 30px;
            max-width: 900px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .table {
            margin-top: 20px;
        }

        .btn-edit {
            background: #ffc107;
            border: none;
            color: black;
        }

        .btn-edit:hover {
            background: #e0a800;
        }

        .btn-danger {
            background: #dc3545;
            border: none;
        }

        .btn-danger:hover {
            background: #c82333;
        }

        .btn-primary {
            background: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background: #0056b3;
        }

        .room-img {
            width: 80px;
            height: 50px;
            border-radius: 5px;
            object-fit: cover;
        }
    </style>
</head>
<body>

<%
    HttpSession hs = request.getSession();
    List<Booking> bookings = (List<Booking>) hs.getAttribute("bookings"); 
%>

<div class="container">
    <h2 class="text-center mb-4"><i class="fas fa-hotel"></i> View Rooms</h2>

    <% if (bookings == null || bookings.isEmpty()) { %>
        <h2 class="text-center text-danger">No Rooms Available</h2>
    <% } else { %>

        <!-- Table to Display Rooms -->
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th>Booking ID</th>
                    <th>Customer ID</th>
                    <th>Customer Name</th>
                    <th>ID Proof</th>
                    <th>ID Proof Number</th>
                    <th>Room ID</th>
                    <th>Check In Time</th>
                    <th>Check Out Time</th>
                    <th>Price</th>
                    
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% for (Booking booking : bookings) { %>
                    <tr>
                        <td><%= booking.getBooking_id() %></td>
                        <td><%= booking.getC_id() %></td>
                        <td><%= booking.getName() %></td>
                        <td><%= booking.getId_proof() %></td>
                        <td><%= booking.getId_number() %></td>
                        <td><%= booking.getRoom_no() %></td>
                        <td><%= booking.getBook_from() %></td>
                        <td><%= booking.getBook_upto() %></td>
                        <td>₹<%=booking.getPrice() %></td>
                        
                        <td>
                            <!-- Edit Room Button -->
                            <form action="updateBooking" method="post">
                                <input type="hidden" name="bookingId" value="<%= booking.getBooking_id() %>">
                                <button type="submit" class="btn btn-edit btn-sm">
                                    <i class="fas fa-edit"></i> Update
                                </button>
                            </form>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>

    <% } %>

    <!-- Back to Dashboard Button -->
    <div class="text-center mt-4">
        <a href="admindashboard.jsp" class="btn btn-primary"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
    </div>
</div>

</body>
</html>
