<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Tourist.Login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login - Tourism Site</title>
    <style>
        body {
            background-image: url('t1.jpg');
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }
        .container h2 {
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: center;
        }
        .e1{
            text-align: left;
            margin-inline-start: 24px
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            margin-left: 5px;
            margin-right: 5px
        }
        .form-group input {
            width: 80%; 
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;

        }
        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #0056b3;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>
    <form runat="server">



        <div class="container">
            <h2>Login</h2>
            <div class="form-group">
                <div class="e1">
                <label for="loginEmail">Email</label>
                </div>
                <asp:TextBox ID="loginEmail" runat="server" type="email" required="true" placeholder="Enter your email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="loginEmailValidator" runat="server" ControlToValidate="loginEmail" ErrorMessage="Email is required" CssClass="error"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <div class="e1">
                <label for="loginPassword">Password</label>
                </div>
                <asp:TextBox ID="loginPassword" runat="server" type="password" required="true" placeholder="Enter your password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="loginPasswordValidator" runat="server" ControlToValidate="loginPassword" ErrorMessage="Password is required" CssClass="error"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:Button ID="loginButton" runat="server" Text="Login" OnClick="LoginButton_Click"></asp:Button>
            </div>
            <asp:Label ID="LoginErrorMessage" runat="server" CssClass="error"></asp:Label>
            <p>Don't have an account? <a href="Signup.aspx">Signup</a></p>
        </div>
    </form>
</body>
</html>
