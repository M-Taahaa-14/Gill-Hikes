<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="Tourist.User" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
        body {
            background-image: url('t1.jpg');
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fff;
        }
        .container {
            width: 60%;
            margin: auto;
            background: #ffff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
            padding: 0.5rem;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }
        nav ul li a:hover {
            background-color: #0b7c48;
            color: #fff;
        }
        nav ul li a.active {
            background-color: #0d6c34;
            color: #fff;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .profile, .bookings, .wishlist {
            margin: 20px;
            padding: 20px;
            border-radius: 5px;
            max-width: 100%;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .section-header {
            color: #555;
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
        .btn:hover {
            background-color: #45a049;
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
                    <li><a href="UserProfile.aspx" class="active">Profile</a></li>
                    <li><a href="AboutUs.aspx">About Us</a></li>
                </ul>
            </nav>
        </header>
<div class="container">
    <h2>User Dashboard</h2>

    <div class="profile">
        <h3 class="section-header">Profile</h3>
        <p>Full Name: <asp:Label ID="lblFullName" runat="server" /></p>
        <p>Email: <asp:Label ID="lblEmail" runat="server" /></p>
        <p>Date of Birth: <asp:Label ID="lblDOB" runat="server" /></p>
        <p>Age: <asp:Label ID="lblAge" runat="server" /></p>
        <p>Phone Number: <asp:Label ID="lblPhoneNumber" runat="server" /></p>
        <p>Gender: <asp:Label ID="lblGender" runat="server" /></p>
        <asp:Button ID="btnEdit" runat="server" Text="Edit Profile" OnClick="btnEdit_Click" CssClass="btn" />
    </div>

<div class="bookings">
    <h3 class="section-header">Bookings</h3>
    <asp:Label ID="BookingsMessageLabel" runat="server" CssClass="message" Text=""></asp:Label>
    <asp:GridView ID="BookingsGridView" runat="server" CssClass="grid-view" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="TourName" HeaderText="Tour Name" />
            <asp:BoundField DataField="DepartureCity" HeaderText="Departure City" />
            <asp:BoundField DataField="BookingDate" HeaderText="Booking Date" DataFormatString="{0:yyyy-MM-dd}" />
            <asp:BoundField DataField="BookingStatus" HeaderText="Booking Status" />
            <asp:BoundField DataField="TravelDate" HeaderText="Travel Date" DataFormatString="{0:yyyy-MM-dd}" />
            <asp:TemplateField HeaderText="Actions">
                <ItemTemplate>
                    <asp:Button ID="ReviewButton" runat="server" Text="Give Review" CommandName="GiveReview" CommandArgument='<%# Container.DataItemIndex %>' OnClick="ReviewButton_Click" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>


    <div class="wishlist">
                <h3 class="section-header">Wishlist</h3>
                <asp:Label ID="WishlistMessageLabel" runat="server" CssClass="message" Text=""></asp:Label>
<asp:GridView ID="WishlistGridView" runat="server" CssClass="grid-view" AutoGenerateColumns="False" DataKeyNames="TourId" OnRowCommand="WishlistGridView_RowCommand">
    <Columns>
        <asp:BoundField DataField="Name" HeaderText="Name" />
        <asp:BoundField DataField="Region" HeaderText="Region" />
        <asp:BoundField DataField="Location" HeaderText="Location" />
        <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                <asp:HiddenField ID="HiddenTravelDate" runat="server" Value='<%# Eval("TravelDate") %>' />
                <asp:HiddenField ID="HiddenNumberOfPersons" runat="server" Value='<%# Eval("NumberOfPersons") %>' />
                <asp:Button ID="RemoveButton" runat="server" Text="Remove" CommandName="RemoveItem" />
                <asp:Button ID="BookButton" runat="server" Text="Book" CommandName="BookItem" CommandArgument='<%# Container.DataItemIndex %>' />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

            </div>
</div>
    </form>
</body>
</html>


