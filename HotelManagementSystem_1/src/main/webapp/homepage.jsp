<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Luxury Hotel</title>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> 
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background: #f4f4f4;
            overflow-x: hidden;
        }

        /* Navbar */
        nav {
            position: fixed;
            top: 0;
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: rgba(0, 0, 0, 0.8);
            padding: 15px 20px;
            z-index: 1000;
        }
        nav ul {
            list-style: none;
            display: flex;
            margin: 0;
            padding: 0;
        }
        nav ul li { margin: 0 15px; }
        nav ul li a {
            color: white;
            text-decoration: none;
            font-size: 18px;
        }

        /* Hamburger Menu */
        .hamburger {
            font-size: 32px;
            cursor: pointer;
            color: white;
            display: block;
            position: absolute;
            right: 55px;
            top: 15px;
            z-index: 1001;
        }

        /* Sidebar (Now on the Right Side and Below Navbar) */
        .sidebar {
            position: fixed;
            top: 60px; /* Starts below navbar */
            right: -250px; /* Initially hidden on the right */
            width: 250px;
            height: auto;
            background: #222;
            color: white;
            transition: 0.3s ease-in-out;
            padding-top: 10px;
            box-shadow: -3px 0 5px rgba(0, 0, 0, 0.2);
            border-radius: 0 0 10px 10px;
        }
        .sidebar a {
            display: block;
            padding: 15px;
            color: white;
            text-decoration: none;
            font-size: 18px;
            transition: 0.3s;
        }
        .sidebar a:hover { background: #d4af37; }
        .close-btn {
            position: absolute;
            top: 10px;
            right: 20px;
            font-size: 30px;
            cursor: pointer;
        }

        /* Hero Section */
        .hero {
            background: url(https://www.cvent.com/sites/default/files/image/2018-07/luxury-hotel.jpg) no-repeat center center/cover;
            height: 100vh;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }
        .hero h1 { font-size: 50px; margin: 0; }
        .hero p { font-size: 20px; margin: 10px 0; }
        .btn {
            background: #d4af37;
            color: white;
            padding: 15px 30px;
            text-decoration: none;
            font-size: 18px;
            border-radius: 5px;
            transition: 0.3s;
        }
        .btn:hover { background: #b98b2e; }

        /* Sections */
        .section {
            padding: 50px;
            text-align: center;
            background: white;
            margin: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

<!-- SweetAlert for Booking Confirmation -->
<% if (request.getAttribute("confirmation") == "yes") { %>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        Swal.fire({
            title: "✅ Success! Your Room is Booked. 🏨",
            text: "📌 Your reservation details have been saved. Please visit the reception upon arrival for check-in. \n\n 📧 A confirmation email has been sent to your email.",
            icon: "success",
            confirmButtonText: "OK"
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = "homepage.jsp"; 
            }
        });
    });
</script>
<% } %>

<!-- Navbar -->
<nav>
    <ul>
        <li><a href="rooms.jsp">Rooms</a></li>
        <li><a href="services.jsp">Services</a></li>
        <li><a href="contact.jsp">Contact</a></li>
    </ul>
    <!-- Hamburger Menu on the Right -->
    <span class="hamburger" onclick="toggleMenu()">&#9776;</span>
</nav>

<!-- Sidebar Menu (Now on the Right Side and Below Navbar) -->
<div class="sidebar" id="sidebar">
    <a href="profile.jsp">👤 Profile</a>
    <a href="previousBookings.jsp">📜 Previous Bookings</a>
    <a href="logout" style="background: red;">🚪 Logout</a>
</div>

<!-- Hero Section -->
<section class="hero">
    <h1>Welcome to Our Luxury Hotel</h1>
    <p>Experience Unparalleled Comfort & Elegance</p>
    <a href="booking.jsp" class="btn">Book Now</a>
</section>

<!-- Sections -->
<section class="section" id="rooms">
    <h2>Our Rooms</h2>
    <p>Choose from our deluxe, executive, and suite rooms with world-class amenities.</p>
</section>

<section class="section" id="services">
    <h2>Amenities & Services</h2>
    <p>Enjoy fine dining, spa, swimming pool, and more at our luxury hotel.</p>
</section>

<section class="section" id="contact">
    <h2>Contact Us</h2>
    <p>Reach us for reservations and inquiries.</p>
</section>

<!-- JavaScript for Sidebar -->
<script>
    function toggleMenu() {
        var sidebar = document.getElementById("sidebar");
        if (sidebar.style.right === "0px") {
            sidebar.style.right = "-250px";
        } else {
            sidebar.style.right = "0px";
        }
    }
</script>

</body>
</html>
