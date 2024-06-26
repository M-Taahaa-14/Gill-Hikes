<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="Tourist.Signup" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Signup - Tourism Site</title>
    <style>
        body {
            background-image: url('t6.jpg');
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }
        .container {
            background-color: #fff;
            padding: 60px;
            margin: 100px 100px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }
        .container h2 {
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input,.form-group select {
            width: 100%;
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
            margin-top: 5px
        }
    </style>
    <script type="text/javascript">
        function validateDOB(sender, args) {
            var dob = new Date(document.getElementById('<%= DOB.ClientID %>').value);
            var today = new Date();
            var age = today.getFullYear() - dob.getFullYear();
            var m = today.getMonth() - dob.getMonth();
            if (m < 0 || (m === 0 && today.getDate() < dob.getDate())) {
                age--;
            }
            args.IsValid = age >= 18;
        }
    </script>
</head>
<body>
    <form runat="server">
        <div class="container">
            <h2>Signup</h2>
            <div class="form-group">
                <label for="signupFullName">Name</label>
                <asp:TextBox ID="signupFullName" runat="server" required="true" placeholder="Enter your name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="signupFullNameValidator" runat="server" ControlToValidate="signupFullName" ErrorMessage="Full Name is required" CssClass="error"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="signupUsername">Username</label>
                <asp:TextBox ID="signupUsername" runat="server" required="true" placeholder="Enter your Username"></asp:TextBox>
                <asp:RequiredFieldValidator ID="signupUsernameValidator" runat="server" ControlToValidate="signupUsername" ErrorMessage="Username is required" CssClass="error"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="GenderDropDown">Gender</label>
                <asp:DropDownList ID="GenderDropDown" runat="server">
                    <asp:ListItem Text="Select your Gender" Value="" Disabled="True" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Male" Value="M"></asp:ListItem>
                    <asp:ListItem Text="Female" Value="F"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="PhoneNum">Phone Number</label>
                <asp:TextBox ID="signupPhoneNum" runat="server" required="true" placeholder="Enter your Phone Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PhoneNumValidator" runat="server" ControlToValidate="signupPhoneNum" ErrorMessage="Phone Number is required" CssClass="error"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="DOB">Date of Birth</label>
                <asp:TextBox ID="DOB" runat="server" required="true" TextMode="Date" placeholder="Enter your Date of Birth"></asp:TextBox>
                <asp:RequiredFieldValidator ID="DOBValidate" runat="server" ControlToValidate="DOB" ErrorMessage="Date of Birth is required" CssClass="error"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="DOBCustomValidator" runat="server" ControlToValidate="DOB" ErrorMessage="You must be at least 18 years old to register" CssClass="error" ClientValidationFunction="validateDOB"></asp:CustomValidator>
            </div>
            <div class="form-group">
                <label for="signupEmail">Email</label>
                <asp:TextBox ID="signupEmail" runat="server" type="email" required="true" placeholder="Enter your email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="signupEmailValidator" runat="server" ControlToValidate="signupEmail" ErrorMessage="Email is required" CssClass="error"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="signupPassword">Password</label>
                <asp:TextBox ID="signupPassword" runat="server" type="password" required="true" placeholder="Enter your password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="signupPasswordValidator" runat="server" ControlToValidate="signupPassword" ErrorMessage="Password is required" CssClass="error"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="PasswordStrengthValidator" runat="server" ControlToValidate="signupPassword" ErrorMessage="Password must be at least 8 characters long and contain uppercase, lowercase, and a number" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$" CssClass="error"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <label for="signupConfirmPassword">Confirm Password</label>
                <asp:TextBox ID="signupConfirmPassword" runat="server" type="password" required="true" placeholder="Confirm your password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="signupConfirmPasswordValidator" runat="server" ControlToValidate="signupConfirmPassword" ErrorMessage="Confirm password is required" CssClass="error"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="comparePasswordsValidator" runat="server" ControlToCompare="signupPassword" ControlToValidate="signupConfirmPassword" ErrorMessage="Passwords do not match" CssClass="error"></asp:CompareValidator>
            </div>
            <div class="form-group">
                <asp:Button ID="signupButton" runat="server" Text="Signup" OnClick="SignupButton_Click"></asp:Button>
            </div>
            <asp:Label ID="SignupErrorMessage" runat="server" CssClass="error"></asp:Label>
            <p>Already have an account? <a href="Login.aspx">Login</a></p>
        </div>
    </form>
</body>
</html>
