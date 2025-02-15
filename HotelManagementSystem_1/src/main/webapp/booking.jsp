<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, jakarta.servlet.http.HttpSession, com.qsp.Rooms" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rooms</title>
    <!-- Font Awesome for Icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        /* Overall page styling */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
            color: #343a40;
        }
        /* Header styling */
        h1 {
            text-align: center;
            margin-top: 20px;
            font-size: 2.5em;
            color: #2c3e50;
        }
        /* Back button styling */
        .back-button {
            display: inline-block;
            margin: 20px;
            padding: 10px 20px;
            background-color: #2980b9;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .back-button:hover {
            background-color: #1c5980;
        }
        /* Sort form container */
        .sort-container {
            background-color: #ffffffcc;
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        .sort-container h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 20px;
        }
        /* Sort form styling */
        .sort-form {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
        }
        .sort-form select,
        .sort-form button {
            padding: 10px;
            font-size: 1em;
            border: 1px solid #ccc;
            border-radius: 5px;
            min-width: 180px;
        }
        .sort-form button {
            background-color: #27ae60;
            color: #fff;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .sort-form button:hover {
            background-color: #1e8449;
        }
        /* Container for the grid of room cards */
        .room-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            padding: 20px;
            max-width: 1200px;
            margin: 20px auto;
        }
        /* Each room card style */
        .room-card {
            border: 1px solid #ccc;
            border-radius: 8px;
            overflow: hidden;
            background: #fff;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .room-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }
        /* Room image styling */
        .room-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        /* Container for room details inside the card */
        .room-details {
            padding: 15px;
            text-align: center;
        }
        .room-details h3 {
            margin: 10px 0;
            color: #2980b9;
        }
        .room-details p {
            margin: 5px 0;
            font-size: 1.1em;
            color: #555;
        }
        /* Book Now button */
        .book-btn {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 15px;
            background-color: #e74c3c;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 1em;
            transition: background 0.3s ease;
        }
        .book-btn:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>

    <a href="homepage.jsp" class="back-button">
        <i class="fas fa-arrow-left"></i> Back
    </a>

    <!-- Sort Form Container -->
    <div class="sort-container">
        <h2>Sort Rooms</h2>
        <form action="sortRoomsB" method="post" class="sort-form">
            <!-- Price Range Dropdown -->
            <select name="priceRange">
                <option value="">Price Range</option>
                <option value="0-2000">Range 0 to 2000</option>
                <option value="2001-4000">Range 2001 to 4000</option>
                <option value="4001-6000">Range 4001 to 6000</option>
            </select>
            <!-- Room Type Dropdown -->
            <select name="roomType">
                <option value="">Room Type</option>
                <option value="Deluxe Room">Deluxe Room</option>
                <option value="Executive Room">Executive Room</option>
                <option value="Suite Room">Suite Room</option>
            </select>
            <!-- Submit Button -->
            <button type="submit">
                <i class="fas fa-sort"></i> Sort
            </button>
        </form>
    </div>
    
    <h1>Available Rooms</h1>
    <%
        HttpSession hs = request.getSession();
       // hs.setAttribute("page","booking");
       // List<Rooms> rooms1 = (List<Rooms>) hs.getAttribute("rooms");
        List<Rooms> sortRooms = (List<Rooms>) hs.getAttribute("sortRooms");

        if (sortRooms == null || sortRooms.isEmpty()) {
    %>
        <p style="text-align: center;">No rooms available.</p>
    <%
        }
    %>
    <div class="room-container">
        <% if (sortRooms != null) { 
               for (Rooms room : sortRooms) { %>
                <div class="room-card">
                    <img src="<%= room.getImg_url() %>" alt="<%= room.getType() %>">
                    <div class="room-details">
                        <h3><%= room.getType() %></h3>
                        <p>Price per Night: ₹<%= room.getPrice() %></p>
                        <h3>Status: <%= room.getStatus() %></h3>
                        <a href="bookRoom.jsp?roomNumber=<%=room.getRoom_no()%>" class="book-btn">Book Now</a>
                    </div>
                </div>
        <%     }
           } %>
    </div>
</body>
</html>
