<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Tourist.AdminDashboard" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .sidebar {
            height: 100vh;
            width: 170px;
            position: fixed;
            background-color: #333;
            padding-top: 20px;
            transition: width 0.3s;
        }
        .sidebar .toggle-btn {
            position: absolute;
            top: 10px;
            right: -30px;
            background-color: #333;
            color: white;
            border: none;
            cursor: pointer;
            padding: 5px;
        }
        .sidebar a {
            padding: 20px 30px;
            text-decoration: none;
            font-size: 18px;
            color: white;
            display: block;
            text-align: center;
        }
        .sidebar a:hover {
            background-color: #575757;
            width:170px;
        }
        .sidebar .logout {
            position: absolute;
            bottom: 20px;
            width: 100%;
            text-align: left
        }
        .content {
            margin-left: 60px;
            padding: 20px;
            transition: margin-left 0.3s;
        }
        .container {
            background: #fff;
            padding: 20px;
            margin-left:140px;
            margin-right:60px;
            margin-top: 100px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .metrics {
            margin-left: 90px;
            margin-right: 40px;
            padding: 70px;
            background-color: #333;
            border-radius: 5px;
        }
        .section-header {
            color: #555;
        }
        .btn {
            background-color: #13b570;
            color: white;
            padding: 10px;
            margin-top: 10px;
            font-size: larger;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            display: block;
            width: 100%;
            text-align: center;
        }
        .btn:hover {
            background-color: #0e8f57;
        }
        .metric-card {
            display: inline-block;
            margin: 10px;
            background-color: #dfe6e9;
            padding: 20px;
            border-radius: 5px;
            text-align: center;
        }
        .metric-card h3 {
            margin: 10px 0;
            color: #333;
        }
        h4 {
            margin: 10px 0;
            color: #fff;
            font-size:24px
        }
        .metric-card p {
            font-size: 24px;
            color: #555;
        }
    </style>
    <script>
        function toggleSidebar() {
            document.getElementById("sidebar").classList.toggle("expanded");
            document.getElementById("content").classList.toggle("expanded");
        }
    </script>
</head>
<body>

<div id="sidebar" class="sidebar">
    <!--<button class="toggle-btn" onclick="toggleSidebar()">☰</button>-->
    <a href="AdminDashboard.aspx" class="active">🏠 Admin Dashboard </a>
    <a href="#">👥 Manage Users</a>
    <a href="ManageDestinations.aspx">🗺️ Manage Destinations</a>
    <a href="ManageTours.aspx">📅 Manage Tours</a>
    <a href="ManageBookings.aspx">📑 Manage Bookings</a>
    <a href="login.aspx" class="logout">🔓 Logout</a>
</div>

<div id="content" class="content">
    <div class="container">
        <h2>Admin Dashboard</h2>

        <div class="metrics">
            <h4> Site Metrics</h4>
            <div class="metric-card">
                <h3>Total Users</h3>
                <p><asp:Label ID="TotalUsers" runat="server"></asp:Label></p>
            </div>
            <div class="metric-card">
                <h3>Total Bookings</h3>
                <p><asp:Label ID="TotalBookings" runat="server"></asp:Label></p>
            </div>
            <div class="metric-card">
                <h3>Total Tours</h3>
                <p><asp:Label ID="TotalTours" runat="server"></asp:Label></p>
            </div>
            <div class="metric-card">
                <h3>Total Destinations</h3>
                <p><asp:Label ID="TotalDestinations" runat="server"></asp:Label></p>
            </div>
                        <div class="metric-card">
                <h3>Total Queries</h3>
                <p><asp:Label ID="TotalQueries" runat="server"></asp:Label></p>
            </div>
                        <div class="metric-card">
                <h3>Total Ratings</h3>
                <p><asp:Label ID="TotalRatings" runat="server"></asp:Label></p>
            </div>
        </div>     
    </div>
</div>

</body>
</html>
