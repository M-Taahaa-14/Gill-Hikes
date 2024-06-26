<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Review.aspx.cs" Inherits="Tourist.Feedback" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Feedback</title>
    <style>
        body {
            background-image: url('t3.jpg');
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 50%;
            margin-bottom: 40px;
            margin-top: 100px;
            margin-left: 440px;
            padding: 20px;
            background: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="email"], textarea {
            width: 80%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .rating {
            display: flex;
            flex-direction: row-reverse;
            justify-content: center;
            gap: 5px;
        }
        .rating input {
            display: none;
        }
        .rating label {
            font-size: 2em;
            color: #ccc;
            cursor: pointer;
        }
        .rating input:checked ~ label {
            color: #f0ad4e;
        }
        .rating input:hover ~ label {
            color: #f0ad4e;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            margin-top: 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            text-align: center;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .reviews {
            margin-top: 30px;
        }
        .review {
            background: #e9e9e9;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        .review h4 {
            margin: 0;
        }
        .review small {
            color: #777;
        }
        .hero {
           text-align: center;
           color: rgb(255, 255, 255);
       }

       .hero-content {
           position: absolute;
           bottom: 6rem; 
           left: 50%;
           transform: translateX(-50%);
           text-align: center;
       }

       .hero h1 {
           font-size: 3rem;
           margin-bottom: 1rem;
       }

       .hero p {
           font-size: 1.5rem;
           margin-bottom: 2rem;
       }

       .hero form {
           display: flex;
           justify-content: center;
           gap: 1rem;
       }

       .hero select {
            text-align: center;
            font-size: 1rem;
            height: 3rem; 
            width: 35rem; 
            box-sizing: border-box; 
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
    <script>
        function validateForm() {
            var name = document.getElementById("name").value;
            var email = document.getElementById("email").value;
            var message = document.getElementById("message").value;
            var rating = document.querySelector('input[name="rating"]:checked');

            if (!name || !email || !message || !rating) {
                alert("Please fill out all fields and select a rating.");
                return false;
            }
            return true;
        }
    </script>
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
    <div class="container">
        <h2>Feedback Form</h2>
        <form runat="server" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="name">Full Name</label>
                <asp:TextBox ID="name" runat="server" />
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <asp:TextBox ID="email" runat="server" TextMode="Email" />
            </div>
            
                <label for="ddlTour">Select Tour:</label>
            <div class="hero">
                        <div class="form-group">
                <asp:DropDownList ID="ddlTour" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlTour_SelectedIndexChanged">
                </asp:DropDownList>
                            </div>
            </div>
            <div class="form-group">
                <label for="message">Message</label>
                <asp:TextBox ID="message" runat="server" TextMode="MultiLine" Rows="5" />
            </div>
            <div class="form-group">
                <label>Rating</label>
                <div class="rating">
                    <input type="radio" id="star5" name="rating" value="5" runat="server" /><label for="star5">&#9733;</label>
                    <input type="radio" id="star4" name="rating" value="4" runat="server" /><label for="star4">&#9733;</label>
                    <input type="radio" id="star3" name="rating" value="3" runat="server" /><label for="star3">&#9733;</label>
                    <input type="radio" id="star2" name="rating" value="2" runat="server" /><label for="star2">&#9733;</label>
                    <input type="radio" id="star1" name="rating" value="1" runat="server" /><label for="star1">&#9733;</label>
                </div>
            </div>
            <asp:Button ID="SubmitButton" runat="server" Text="Send Feedback" CssClass="btn" OnClick="SendFeedback_Click" />
        </form>
        <div class="reviews" id="reviews" runat="server"></div>
    </div>
</body>
</html>
