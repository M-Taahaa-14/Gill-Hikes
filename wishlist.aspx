<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="YourNamespace.Wishlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Wishlist</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
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
        }
        h2 {
            margin-top: 0;
        }

        .grid-view {
            margin-top: 20px;
            border-collapse: collapse;
            width: 100%;
        }

        .grid-view th, .grid-view td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .grid-view th {
            background-color: #f2f2f2;
        }

        .message {
            margin-top: 10px;
            color: #666;
        }
    </style>
</head>
<body>
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
    <form id="form1" runat="server">
        <div class="container">
            <h2>Wishlist</h2>
            <asp:Label ID="WishlistMessageLabel" runat="server" CssClass="message" Text=""></asp:Label>
            <asp:GridView ID="WishlistGridView" runat="server" CssClass="grid-view" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Region" HeaderText="Region" />
                    <asp:BoundField DataField="Location" HeaderText="Location" />
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:Button ID="RemoveButton" runat="server" Text="Remove" CommandName="RemoveItem" />
                            <asp:Button ID="BookButton" runat="server" Text="Book" CommandName="BookItem" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>