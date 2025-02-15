<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Booking</title>
    
    <!-- Bootstrap for Styling -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body {
            background: linear-gradient(to right, #4facfe, #00f2fe);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .booking-container {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            max-width: 450px;
            width: 100%;
        }

        .booking-container h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-control {
            border-radius: 8px;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ddd;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        .btn-custom {
            background: #007bff;
            color: white;
            padding: 12px;
            border-radius: 8px;
            font-size: 18px;
            font-weight: bold;
            width: 100%;
            border: none;
        }

        .btn-custom:hover {
            background: #0056b3;
        }

        .btn-back {
            display: block;
            width: 100%;
            background: #6c757d;
            color: white;
            padding: 12px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            margin-top: 10px;
        }

        .btn-back:hover {
            background: #5a6268;
        }

        .radio-group {
            display: flex;
            justify-content: space-between;
        }

        .radio-group label {
            font-size: 16px;
            font-weight: bold;
            margin-left: 5px;
        }

        .radio-group input {
            accent-color: #007bff;
            transform: scale(1.2);
        }
    </style>
</head>
<body>

    <div class="booking-container">
        <h2><i class="fas fa-bed"></i> Update Booking</h2>

        <form action="updateSingleBooking" method="post">
            
            <!-- Check-in Confirmation -->
            <div class="form-group">
                <label><i class="fas fa-calendar-check"></i> Check-in Confirmed?</label>
                <div class="radio-group">
                    <input type="radio" id="checkinYes" name="checkin" value="Yes" required>
                    <label for="checkinYes">Yes</label>
                    <input type="radio" id="checkinNo" name="checkin" value="No" required>
                    <label for="checkinNo">No</label>
                </div>
            </div>

            <!-- Check-out Confirmation -->
            <div class="form-group">
                <label><i class="fas fa-calendar-alt"></i> Check-out Confirmed?</label>
                <div class="radio-group">
                    <input type="radio" id="checkoutYes" name="checkout" value="Yes" required>
                    <label for="checkoutYes">Yes</label>
                    <input type="radio" id="checkoutNo" name="checkout" value="No" required>
                    <label for="checkoutNo">No</label>
                </div>
            </div>

            <!-- ID Proof Type -->
            <div class="form-group">
                <label for="idProof"><i class="fas fa-id-card"></i> ID Proof Type</label>
                <select id="idProof" name="idProof" class="form-control">
                    <option value="" disabled selected>Select ID Proof</option>
                    <option value="Aadhar Card">Aadhar Card</option>
                    <option value="Driving License">Driving License</option>
                    <option value="Voter ID">Voter ID</option>
                </select>
            </div>

            <!-- ID Number -->
            <div class="form-group">
                <label for="idNumber"><i class="fas fa-hashtag"></i> ID Number</label>
                <input type="text" id="idNumber" name="idNumber" class="form-control" placeholder="Enter ID Number" >
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn btn-custom"><i class="fas fa-check"></i> Submit</button>

        </form>

        <!-- Back Button -->
        <a href="BookingManagement.jsp" class="btn-back"><i class="fas fa-arrow-left"></i> Back</a>
    </div>

</body>
</html>
