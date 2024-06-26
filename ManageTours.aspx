<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageTours.aspx.cs" Inherits="Tourist.ManageTours" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
       body { 
           font-family: Arial, 
           sans-serif; 
           margin: 0;
           padding: 0; 
           background-color: #f4f4f4; 
       }
       .container { 
           width: 80%; 
           margin-left: 200px; 
           background: #fff;
           padding: 20px; 
           box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); 
       }
       h2 { 
           text-align: center; 
           color: #333; 
       }
       .form-section { 
            margin-top: 30px; 
            padding: 20px; 
            background-color: #e9e9e9;
            border-radius: 5px; 
       }
       .form-section h3 {
           color: #555; 

       }
       .form-section input[type="text"] { 
           width: calc(100% - 20px); 
           padding: 10px;
           margin: 5px 0; 
       }
       .form-section input[type="button"], .form-section input[type="submit"] { 
           background-color: #4CAF50;
           color: white;
           padding: 10px; 
           border: none;
           border-radius: 5px; 
           cursor: pointer; 
       }
       .form-section input[type="button"]:hover, .form-section input[type="submit"]:hover {
           background-color: #45a049; 
       }
       .grid-section { 
           margin-top: 30px;
       }
       .grid-section h3 { 
           color: #555; 
       }
       .grid-section .btn { 
           background-color: #4CAF50; 
           color: white; 
           padding: 5px 10px;
           border: none;
           border-radius: 5px; 
           cursor: pointer; 
       }
       .grid-section .btn.delete { 
           background-color: #f44336; 
       }
       .grid-section .btn:hover { 
           background-color: #45a049; 
       }
       .grid-section .btn.delete:hover { 
           background-color: #e57373; 
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
    <a href="AdminDashboard.aspx" class="active">🏠 Admin Dashboard </a>
    <a href="#">👥 Manage Users</a>
    <a href="ManageDestinations.aspx">🗺️ Manage Destinations</a>
    <a href="ManageTours.aspx">📅 Manage Tours</a>
    <a href="ManageBookings.aspx">📑 Manage Bookings</a>
    <a href="login.aspx" class="logout">🔓 Logout</a>
</div>

    <form id="form1" runat="server">
        <div class="container">
            <h2>Manage Tours</h2>
            <div class="grid-section">
                <h3>Existing Tours</h3>
                <asp:GridView ID="ToursGridView" runat="server" AutoGenerateColumns="False" OnRowCommand="ToursGridView_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="TourId" HeaderText="Tour ID" />
                        <asp:BoundField DataField="TourName" HeaderText="Tour Name" />
                        <asp:BoundField DataField="DestinationName" HeaderText="Destination" />
                        <asp:BoundField DataField="Price" HeaderText="Price" />
                        <asp:BoundField DataField="MaxTravellers" HeaderText="Max Travellers" />
                        <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="Nights" HeaderText="Nights" />
                        <asp:BoundField DataField="Days" HeaderText="Days" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%# Eval("TourId") %>' CssClass="btn" />
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("TourId") %>' CssClass="btn delete" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div class="form-section">
                <h3>Add New Tour</h3>
                <asp:TextBox ID="txtTourName" runat="server" Placeholder="Tour Name"></asp:TextBox>
                <asp:DropDownList ID="ddlDestination" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDestination_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:TextBox ID="txtPrice" runat="server" Placeholder="Price" TextMode="Number"></asp:TextBox>
                <asp:TextBox ID="txtMaxTravellers" runat="server" Placeholder="Max Travellers" TextMode="Number"></asp:TextBox>
                <asp:TextBox ID="txtStartDate" runat="server" Placeholder="Start Date" TextMode="Date"></asp:TextBox>
                <asp:TextBox ID="txtEndDate" runat="server" Placeholder="End Date" TextMode="Date"></asp:TextBox>
                <asp:TextBox ID="txtNights" runat="server" Placeholder="Nights" TextMode="Number"></asp:TextBox>
                <asp:TextBox ID="txtDays" runat="server" Placeholder="Days" TextMode="Number"></asp:TextBox>
                <asp:Button ID="btnAddTour" runat="server" Text="Add Tour" OnClick="AddTour_Click" CssClass="btn" />
            </div>
        </div>
    </form>
</body>
</html>
