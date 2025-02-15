<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, jakarta.servlet.http.HttpSession, com.qsp.Customer" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Book Room</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome for Icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <style>
        body {
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('https://source.unsplash.com/1600x900/?hotel');
            background-size: cover;
            background-position: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #333;
            padding-top: 80px; /* Prevent overlap with error message */
        }

        /* Error message styling */
        .error-message {
            position: absolute;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            background: #ff4d4d;
            color: white;
            padding: 12px 20px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            animation: fadeIn 0.5s ease-in-out;
            text-align: center;
            min-width: 350px;
            z-index: 1000;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateX(-50%) translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateX(-50%) translateY(0);
            }
        }

        .container {
            padding-top: 50px;
            padding-bottom: 50px;
        }

        .booking-card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.25);
            overflow: hidden;
            background-color: #ffffff;
        }

        .card-header {
            background-color: #007bff;
            color: #fff;
            text-align: center;
            padding: 1.5rem;
        }

        .btn-custom {
            background-color: #007bff;
            border: none;
            border-radius: 30px;
            padding: 0.75rem 2rem;
            font-size: 1rem;
            color: #fff;
        }

        .btn-custom:hover {
            background-color: #0056b3;
        }

        .btn-back {
            background-color: #6c757d;
            border: none;
            border-radius: 30px;
            padding: 0.75rem 2rem;
            font-size: 1rem;
            color: #fff;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }

        .btn-back:hover {
            background-color: #5a6268;
        }

        .text-center {
            margin-top: 15px;
        }
    </style>
</head>
<body>

    <%-- Fetch session attributes --%>
    <%
    HttpSession hs = request.getSession();
    if ((String) request.getParameter("roomNumber") == null) {
        hs.setAttribute("currentRoomNo", hs.getAttribute("currentRoomNo"));
    } else {
        hs.setAttribute("currentRoomNo", (String) request.getParameter("roomNumber"));
    }
    Customer customer = (Customer) hs.getAttribute("customer");
    %>

    <!-- Error message displayed at the top -->
    <% if (request.getAttribute("errorMessage") != null) { %>
        <div class="error-message">
            <%= request.getAttribute("errorMessage") %>
        </div>
    <% } %>

    <div class="container">
        <div class="row justify-content-center align-items-center" style="min-height: 100vh;">
            <div class="col-md-8 col-lg-6">
                <div class="card booking-card">
                    <div class="card-header">
                        <h3>
                            <i class="fas fa-bed"></i> Book Room 
                            <small>(<%= hs.getAttribute("currentRoomNo") %>)</small>
                        </h3>
                    </div>
                    <div class="card-body">
                        <form action="confirmBooking" method="post" onsubmit="return validateDates()">
                            <div class="form-group">
                                <label for="customerName">Your Name</label>
                                <input type="text" class="form-control" id="customerName" name="customerName" 
                                       value="<%= customer.getFirst_name() + " " + customer.getLast_name() %>" readonly>
                            </div>

                            <div class="form-group">
                                <label for="customerEmail">Email</label>
                                <input type="email" class="form-control" id="customerEmail" name="customerEmail" 
                                       value="<%= customer.getEmail() %>" readonly>
                            </div>

                            <div class="form-group">
                                <label for="roomNumber">Room Number</label>
                                <input type="text" class="form-control" id="roomNumber" name="roomNumber" 
                                       value="<%= hs.getAttribute("currentRoomNo") %>" readonly>
                            </div>

                            <div class="form-group">
                                <label for="checkinDate">Check-in Date</label>
                                <input type="date" class="form-control" id="checkinDate" name="checkinDate" required>
                            </div>

                            <div class="form-group">
                                <label for="checkoutDate">Check-out Date</label>
                                <input type="date" class="form-control" id="checkoutDate" name="checkoutDate" required>
                            </div>

                            <script>
                                function validateDates() {
                                    let checkin = new Date(document.getElementById("checkinDate").value);
                                    let checkout = new Date(document.getElementById("checkoutDate").value);

                                    if (checkin > checkout) {
                                        alert("Check-in date must be before check-out date!");
                                        return false;
                                    }
                                    return true;
                                }
                            </script>

                            <!-- Submit and Back Buttons -->
                            <div class="text-center">
                                <button type="submit" class="btn btn-custom">
                                    <i class="fas fa-check"></i> Proceed
                                </button>
                            </div>
                        </form>

                        <!-- Back Button -->
                        <div class="text-center">
                            <a href="booking.jsp" class="btn btn-back mt-3">
                                <i class="fas fa-arrow-left"></i> Back
                            </a>
                        </div>

                    </div><!-- /.card-body -->
                </div><!-- /.card -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.container -->

    <!-- jQuery, Popper.js, and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
