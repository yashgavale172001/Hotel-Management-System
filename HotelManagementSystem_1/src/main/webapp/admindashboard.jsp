<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Room</title>

    <!-- Bootstrap for Styling -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Font Awesome for Icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <style>
        body {
            background: #f4f4f4;
            font-family: 'Poppins', sans-serif;
        }

        /* Error Message Styling */
        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
            padding: 15px;
            width: 90%;
            max-width: 600px;
            text-align: center;
            font-weight: bold;
            margin: 20px auto; /* Centers it horizontally */
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(255, 0, 0, 0.2);
        }

        /* Success Message Styling */
        .success-message {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
            padding: 15px;
            width: 90%;
            max-width: 600px;
            text-align: center;
            font-weight: bold;
            margin: 20px auto; /* Centers it horizontally */
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 128, 0, 0.2);
        }

        .container {
            margin-top: 30px;
            max-width: 450px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .btn-success {
            background: #28a745;
            border: none;
        }

        .btn-success:hover {
            background: #218838;
        }

        .btn-primary {
            background: #007bff;
            border: none;
        }

        .btn-warning {
            background: #ffc107;
            border: none;
            color: black;
        }

        .btn-danger {
            background: #dc3545;
            border: none;
        }
    </style>
</head>
<body>

    <!-- Display Error Message (if exists) -->
    <% if((String)request.getAttribute("errorMessage") != null) { %>
        <div class="error-message">
            <%= (String)request.getAttribute("errorMessage") %>
        </div>
    <% } %>

    <!-- Display Success Message (if exists) -->
    <% if((String)request.getAttribute("successMessage") != null) { %>
        <div class="success-message">
            <%= (String)request.getAttribute("successMessage") %>
        </div>
    <% } %>

    <div class="container">
        <h2 class="text-center mb-4"><i class="fas fa-hotel"></i> Add Room</h2>

        <!-- Add Room Form -->
        <form action="addRoom" method="post">
            <div class="mb-3">
                <label>Room Number:</label>
                <input type="text" name="room_no" class="form-control" required>
            </div>
            <div class="mb-3"> 
                <label>Status:</label>
                <select name="status" class="form-control" required>
                    <option value="Available">Available</option>
                    <option value="Not Available">Not Available</option>
                </select>
            </div>
            <div class="mb-3">
                <label>Room Type:</label>
                <input type="text" name="type" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Price(Rs):</label>
                <input type="number" name="price" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Image URL:</label>
                <input type="text" name="img_url" class="form-control">
            </div>
            <button type="submit" class="btn btn-success w-100"><i class="fas fa-save"></i> Add Room</button>
        </form>

        <!-- Navigation Buttons -->
        <div class="text-center mt-4">
            <a href="RoomsManagement.jsp" class="btn btn-primary"><i class="fas fa-bed"></i> Manage Rooms</a>
            <a href="BookingManagement.jsp" class="btn btn-warning"><i class="fas fa-calendar-alt"></i> Manage Bookings</a>
        </div>

        <!-- Logout Button -->
        <div class="text-center mt-4">
            <a href="adminLogout" class="btn btn-danger"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>

</body>
</html>
