<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="b2.aspx.cs" Inherits="Tourist.Booking2" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
        body {
            background-image: url('t4.jpg');
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 100px;
        }
        .container {
            width: 80%;
            margin: auto;
            text-align: center;
            background: #a0b6cd;
            padding: 20px;
            box-shadow: 11px -8px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .summary {
            margin-top: 20px;
            padding: 20px;
            background-color: #e9e9e9;
            border-radius: 5px;
        }
        .summary h3 {
            color: #555;
        }
        .summary p {
            color: #777;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            margin-top: 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            display: block;
            width: 100%;
            text-align: center;
        }
        .btn-container {
            text-align: center;
            margin-top: 30px;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .ticket-controls {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }
        .ticket-controls button {
            padding: 10px;
            margin: 0 10px;
            border: none;
            background-color: #4CAF50;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }
        .ticket-controls button:hover {
            background-color: #45a049;
        }
        .ticket-controls span {
            font-size: 1.5em;
            margin: 0 10px;
        }
    </style>
    <script>
        let pricePerTicket = 0;
        let numberOfTickets = 1;

        function incrementTickets() {
            numberOfTickets++;
            updateSummary();
        }

        function decrementTickets() {
            if (numberOfTickets > 1) {
                numberOfTickets--;
                updateSummary();
            }
        }

        function updateSummary() {
            const totalPrice = numberOfTickets * pricePerTicket;
            document.getElementById('ticket-count').innerText = numberOfTickets;
            document.getElementById('total-price').innerText = totalPrice;
        }

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
        <h2>Booking Summary</h2>
        <div class="summary">
            <h3>Tour: <span id="tour-name"></span></h3>
            <p>Start Date: <span id="start-date"></span></p>
            <p>End Date: <span id="end-date"></span></p>
            <p>Departure City: <span id="city-name"></span></p>
            <p>Payment Method: <span id="payment-method"></span></p>
            <div class="ticket-controls">
                <button onclick="decrementTickets()">-</button>
                <span id="ticket-count">1</span>
                <button onclick="incrementTickets()">+</button>
            </div>
            <p>Total Price: <span id="total-price"></span></p>
        </div>
            <form id="form1" runat="server">
     <div class="btn-container">
                <asp:Button ID="ConfirmBookingButton" runat="server" Text="Confirm Booking" CssClass="btn" OnClick="AddBooking_Click" />
            </div>
            </form>
    </div>

</body>
</html>
