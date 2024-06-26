<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bcnfrm.aspx.cs" Inherits="Tourist.bcnfrm" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmation</title>
    <style>
        body {
            background-image: url('t4.jpg');
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 60px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        p {
            margin-top: 20px;
            color: #555;
            font-size: 18px;
        }
        .details {
            margin-top: 30px;
            border-top: 1px solid #ccc;
            padding-top: 20px;
        }
        .details h3 {
            color: #333;
        }
        .details p {
            margin: 10px 0;
            color: #555;
        }
        .btn-container {
            text-align: center;
            margin-top: 30px;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #45a049;
        }
    </style>
    <script>
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            const tour = urlParams.get('tour');
            const startDate = urlParams.get('start');
            const endDate = urlParams.get('end');
            pricePerTicket = parseFloat(urlParams.get('price'));
            const city = urlParams.get('city');
            const paymentMethod = urlParams.get('payment');

            document.getElementById('tour-name').innerText = tour;
            document.getElementById('start-date').innerText = startDate;
            document.getElementById('end-date').innerText = endDate;
            document.getElementById('payment-method').innerText = paymentMethod;
            document.getElementById('total-price').innerText = pricePerTicket;
            document.getElementById('city-name').innerText = city;

            updateSummary();
        }
    </script>

</head>
<body>

<div class="container">
    <h2>Booking Confirmed!</h2>
    <p>Your booking has been successfully confirmed.</p>
    <div class="details">
        <h3>Booking Details</h3>
        <p>Tour: <span id="tour-name"></span></p>
        <p>Start Date: <span id="start-date"></span></p>
        <p>End Date: <span id="end-date"></span></p>
        <p>Payment Method: <span id="payment-method"></span></p>
        <p>Total Price:<span id="total-price"></span></p>
        <p>Departure City:<span id="city-name"></span></p>
    </div>
    <div class="btn-container">
        <a href="Home.aspx" class="btn">Back to Home</a>
    </div>
</div>

</body>
</html>