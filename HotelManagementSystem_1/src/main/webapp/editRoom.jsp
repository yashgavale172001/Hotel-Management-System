<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession, com.qsp.Rooms" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Room</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4"><i class="fas fa-edit"></i> Edit Room</h2>
        
<% 
HttpSession hs=request.getSession();
Rooms room=(Rooms)hs.getAttribute("singleRoom"); 
%>
        
        <% if (room != null) { %>
        <form action="updateRoom" method="post">
            <input type="hidden" name="room_id" value="<%= room.getRoom_id() %>">
            
            <div class="mb-3">
                <label class="form-label">Room Number:</label>
                <input type="text" name="room_no" class="form-control" value="<%= room.getRoom_no() %>" disabled>
            </div>
            
            <div class="mb-3">
                <label class="form-label">Image URL:</label>
                <input type="text" name="img_url" class="form-control" value="<%= room.getImg_url() %>">
            </div>
            
            <div class="mb-3">
                <label class="form-label">Room Type:</label>
                <input type="text" name="type" class="form-control" value="<%= room.getType() %>">
            </div>
            
            <div class="mb-3">
                <label class="form-label">Price:</label>
                <input type="number" name="price" class="form-control" value="<%= room.getPrice() %>" >
            </div>
            
            <div class="mb-3">
                <label class="form-label">Status:</label>
                <select name="status" class="form-control" required>
                    <option value="Available" >Available</option>
                    <option value="Not Available" >Booked</option>
                </select>
            </div>
            
            <button type="submit" class="btn btn-success"><i class="fas fa-save"></i> Update Room</button>
            <a href="RoomsManagement.jsp" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Back</a>
        </form>
        <% } else { %>
            <h3 class="text-center text-danger">Room data not found!</h3>
        <% } %>
    </div>
</body>
</html>
