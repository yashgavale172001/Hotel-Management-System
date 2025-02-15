<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Available Rooms</title>
    <style>
        .room-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            gap: 20px;
        }
        .room {
            width: 300px;
            text-align: center;
            border: 1px solid #ccc;
            padding: 10px;
            box-sizing: border-box;
        }
        .room img {
            width: 100%;
            height: auto;
        }
        @media (max-width: 768px) {
            .room {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <h1>Available Rooms</h1>
    <div class="room-container">
        <c:forEach var="room" items="${rooms}">
            <div class="room">
                <img src="${room.imageUrl}" alt="Room Image">
                <p>Price: ₹${room.price}</p>
            </div>
        </c:forEach>
    </div>
</body>
</html>
