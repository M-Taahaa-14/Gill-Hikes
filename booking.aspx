<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="booking.aspx.cs" Inherits="Tourist.Booking" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
        body {
            background-image: url('t4.jpg');
            background-size: cover;
            background-position: left;
            font-family: Arial, sans-serif;
            margin: 0;
        }
        .container {
            width: 40%;
            margin: auto;
            padding: 10px 10px;
            background: #fff;
            text-align:center;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-top: 10px;
        }
        input, select {
            padding: 10px;
            margin: auto;
            border: 1px solid #ccc;
            border-radius: 5px;
            text-align:center;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            margin-top:20px;
            margin-left: 20px;
            margin-right:20px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: auto;
            font-size: 14px
        }
        .btn:hover {
            background-color: #45a049;
        }
        .summary {
            background-color: #e9e9e9;
            border-radius: 5px;
            color: red;
            font-size: smaller;
        }
        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
            text-align: center;
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
        .btns {
            background-color: #fff;
            color: white;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            display: block;
            text-align: center;
            text-decoration: auto
        }
        .btns-container {
            text-align: center;
            margin-top: 30px;
        }
        .btns:hover {
            background-color: #fff;
        }
        header {
            background-color: #13b570;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        nav ul {
            list-style: none;
            display: flex;
            justify-content: flex-end;
            padding: 1rem;
            margin: 0;
        }

        nav ul li {
            margin-left: 2rem;
        }

        nav ul li a {
            text-decoration: none;
            color: #000;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
                <header>
            <nav>
                <ul>
                    <li><a href="Home.aspx">Home</a></li>
                    <li><a href="tours.aspx">Tours</a></li>
                    <li><a href="Trek.aspx">Treks</a></li>
                    <li><a href="Faqs.aspx">FAQs</a></li>
                    <li><a href="UserProfile.aspx">Profile</a></li>
                    <li><a href="AboutUs.aspx">About Us</a></li>
                </ul>
            </nav>
        </header>
        <div class="container">
            <h2>Booking Form</h2>
            <div class="form-group">
                <label for="ddlTour">Select Tour:</label>
                <asp:DropDownList ID="ddlTour" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlTour_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="ddlDateRange">Dates:</label>
                <asp:DropDownList ID="ddlDateRange" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDateRange_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="txtPrice">Price:</label>
                <asp:TextBox ID="txtPrice" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="ddlPayment">Payment Method:</label>
                <asp:DropDownList ID="ddlPayment" runat="server">
                    <asp:ListItem Value="creditCard">Credit Card</asp:ListItem>
                    <asp:ListItem Value="paypal">PayPal</asp:ListItem>
                    <asp:ListItem Value="bankTransfer">Bank Transfer</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="ddlDepartureCity">Departure City:</label>
                <asp:DropDownList ID="ddlDepartureCity" runat="server">
                </asp:DropDownList>
            </div>
                <asp:Button ID="Booknow" runat="server" Text="Proceed to Payment" CssClass="btn" OnClick="Booknow_Click" />
                <asp:Label ID="lblMessage" runat="server" Visible="false" CssClass="summary"></asp:Label>
                        <a href="#" class="btns"></a>
            <a href="#" class="btns"></a>
            <a href="home.aspx" class="btn">Back To Home</a>
                                    <a href="#" class="btns"></a>
            <a href="#" class="btns"></a>
    </form>
</body>
</html>