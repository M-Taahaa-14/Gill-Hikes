<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Faqs.aspx.cs" Inherits="Tourist.Faqs" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>FAQ</title>
    <style>
        body {
            background-image: url('t1.jpg');
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 80%;
            margin-left: 120px;
            margin-top: 20px;
            padding: 20px;
            background: #fff;
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
            margin-bottom: 20px;
        }
        .accordion {
            width: 100%;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 10px;
            overflow: hidden;
        }
        .accordion-item {
            border-top: 1px solid #ddd;
        }
        .accordion-item:first-child {
            border-top: none;
        }
        .accordion-header {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            padding: 15px;
            text-align: left;
            outline: none;
            font-size: 18px;
            transition: background-color 0.3s;
        }
        .accordion-header:hover,
        .accordion-header.active {
            background-color: #45a049;
        }
        .accordion-body {
            display: none;
            padding: 15px;
            background-color: white;
            border-top: 1px solid #ddd;
        }
        .accordion-header::after {
            content: '\002B';
            font-size: 18px;
            float: right;
            margin-left: 10px;
        }
        .accordion-header.active::after {
            content: '\2212';
        }
        .feedback-form {
            margin-top: 20px;
        }
        .feedback-form h3 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        .feedback-form .form-group {
            margin-bottom: 15px;
        }
        .feedback-form .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        .feedback-form .form-group input,
        .feedback-form .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .feedback-form .form-group textarea {
            resize: vertical;
            height: 150px;
            width:96%
        }
        .feedback-form button {
            display: block;
            width: 100%;
            padding: 10px;
            border: none;
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }
        .feedback-form button:hover {
            background-color: #45a049;
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
        document.addEventListener('DOMContentLoaded', function () {
            const accordionHeaders = document.querySelectorAll('.accordion-header');

            accordionHeaders.forEach(header => {
                header.addEventListener('click', function () {
                    const isActive = this.classList.contains('active');

                    document.querySelectorAll('.accordion-header').forEach(item => {
                        item.classList.remove('active');
                        item.nextElementSibling.style.display = 'none';
                    });

                    if (!isActive) {
                        this.classList.add('active');
                        this.nextElementSibling.style.display = 'block';
                    }
                });
            });
        });
    </script>
</head>
<body>
         <header>
         <nav>
             <ul>
                 <li><a href="Home.aspx">Home</a></li>
                 <li><a href="tours.aspx">Tours</a></li>
                 <li><a href="Trek.aspx">Treks</a></li>
                 <li><a href="Faqs.aspx" class="active">FAQs</a></li>
                 <li><a href="UserProfile.aspx">Profile</a></li>
                 <li><a href="AboutUs.aspx">About Us</a></li>
             </ul>
         </nav>
     </header>
    <div class="container">
        <h2>Frequently Asked Questions</h2>
        <div class="accordion">
            <div class="accordion-item">
                <div class="accordion-header">What is the cancellation policy?</div>
                <div class="accordion-body">
                    <p>You can cancel your booking up to 24 hours before the scheduled time for a full refund. Cancellations made within 24 hours will incur a 50% fee.</p>
                </div>
            </div>
            <div class="accordion-item">
                <div class="accordion-header">How can I make a booking?</div>
                <div class="accordion-body">
                    <p>You can make a booking directly through our website by selecting your desired tour, entering your details, and making a payment.</p>
                </div>
            </div>
            <div class="accordion-item">
                <div class="accordion-header">What payment methods do you accept?</div>
                <div class="accordion-body">
                    <p>We accept various payment methods including credit cards, debit cards, and PayPal.</p>
                </div>
            </div>
            <div class="accordion-item">
                <div class="accordion-header">Are there any group discounts?</div>
                <div class="accordion-body">
                    <p>Yes, we offer group discounts for parties of 10 or more. Please contact our support team for more details.</p>
                </div>
            </div>
            <div class="accordion-item">
                <div class="accordion-header">Can I modify my booking?</div>
                <div class="accordion-body">
                    <p>Yes, you can modify your booking up to 48 hours before the scheduled departure. Please contact our support team for assistance.</p>
                </div>
                <div class="accordion-item">
    <div class="accordion-header">Is travel insurance included in the booking?</div>
    <div class="accordion-body">
        <p>No, travel insurance is not included in the booking. We recommend purchasing travel insurance separately for added protection.</p>
    </div>
</div>

<div class="accordion-item">
    <div class="accordion-header">Can I bring my pet on the tour?</div>
    <div class="accordion-body">
        <p>Pets are generally not allowed on our tours for safety and comfort reasons. However, service animals are permitted. Please contact us for specific inquiries.</p>
    </div>
</div>

<div class="accordion-item">
    <div class="accordion-header">What should I do if I have dietary restrictions?</div>
    <div class="accordion-body">
        <p>If you have dietary restrictions, please inform us at the time of booking. We will do our best to accommodate your needs, but please note that we cannot guarantee special dietary requests.</p>
    </div>
</div>

<div class="accordion-item">
    <div class="accordion-header">Are there age restrictions for your tours?</div>
    <div class="accordion-body">
        <p>Our tours are suitable for all ages, but some activities may have age restrictions. Please check the tour details or contact us for more information.</p>
    </div>
</div>

<div class="accordion-item">
    <div class="accordion-header">What should I bring on the tour?</div>
    <div class="accordion-body">
        <p>We recommend bringing comfortable clothing, sunscreen, water, and any personal items you may need. Specific items required for each tour will be listed in the tour details.</p>
    </div>
</div>
                <div class="feedback-form">
    <h2>Send us your queries</h2>
    <asp:Literal ID="Message" runat="server" EnableViewState="False"></asp:Literal>
    <form id="feedbackForm" runat="server">
        <div class="form-group">
            <label for="message">Message</label>
            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
        </div>
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="SubmitQuery" CssClass="btn" />
    </form>
</div>


            </div>
        </div>
    </div>
</body>
</html>
