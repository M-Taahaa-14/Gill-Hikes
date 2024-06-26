<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Tourist.Home" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gill Hikes</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
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

        .hero {
            background-image: url('t3.jpg'); 
            background-size: cover;
            background-position: center;
            text-align: center;
            color: rgb(255, 255, 255);
            padding: 20rem 1rem;
        }

        .hero-content {
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
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
             width: 12rem; 
             box-sizing: border-box; 
        }

        .hero .search-button{
             text-align: center;
             font-size: 1rem;
             height: 3rem; 
             width: 9rem; 
             box-sizing: border-box; 
             color: #13b570
        }

        .features {
            display: flex;
            justify-content: space-around;
            padding: 2rem 1rem;
            background-color: navajowhite;
        }

        .feature {
            text-align: center;
        }

        .help {
            text-align: center;
            padding: 2rem 1rem;
        }

        .help h2 {
            font-size: 2rem;
            margin-bottom: 1rem;
        }

        .help .consultants {
            display: flex;
            justify-content: center;
            gap: 0.2rem;
            margin-bottom: 1rem;
        }

        .help .consultants img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            gap: -0.1rem;
        }

        .help .contact-info {
            display: flex;
            justify-content: center;
            gap: 2rem;
        }

        .help .contact-info div {
            text-align: center;
        }

        .help .contact-info p {
            margin: 0.5rem 0;
        }

        .featured-liveaboards {
            text-align: center;
            padding: 2rem 1rem;
        }

        .featured-liveaboards h2 {
            font-size: 2rem;
            margin-bottom: 1rem;
        }

        .featured-liveaboards .see-more {
            display: block;
            margin-bottom: 1rem;
            color: #007bff;
            text-decoration: none;
        }

        .featured-liveaboards .liveaboard-cards {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .featured-liveaboards .card {
            border: 1px solid #ddd;
            border-radius: 5px;
            overflow: hidden;
            width: 30%;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .featured-liveaboards .card img {
            width: 100%;
            height: auto;
        }

        .featured-liveaboards .card h3 {
            font-size: 1.25rem;
            margin: 1rem 0 0.5rem;
        }

        .featured-liveaboards .card p {
            margin: 0.5rem 1rem;
        }

        .menu {
            position: fixed;
            top: 10px;
            left: 10px;
            cursor: pointer;
            z-index: 1000;
        }

        .menu-bar {
            width: 30px;
            height: 6px;
            background-color: #000;
            margin: 4px;
        }

        .dropdown-menu {
            display: none;
            position: absolute;
            top: 50px;
            left: 10px;
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            z-index: 1001;
        }

        .dropdown-menu a {
            display: block;
            padding: 10px 20px;
            text-decoration: none;
            color: #333;
        }

        .dropdown-menu a:hover {
            background-color: #f1f1f1;
        }
         
        footer {
                background-color: #0d6c34;
                color: white;
                padding: 2rem 1rem;
        }

            .footer-content {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                max-width: 1200px;
                margin: auto;
            }

            .footer-section {
                flex: 1;
                min-width: 250px;
                padding: 1rem;
            }

            .footer-section h2 {
                font-size: 1.5rem;
                margin-bottom: 1rem;
            }

            .footer-section p, .footer-section a {
                margin: 0.5rem 0;
                color: white;
                text-decoration: none;
            }

            .footer-section a:hover {
                text-decoration: underline;
            }

            .footer-section ul {
                list-style: none;
                padding: 0;
            }

            .footer-section ul li {
                margin: 0.5rem 0;
            }

            .social-icon {
                width: 30px;
                height: 30px;
                margin: 0.5rem;
            }


            @media (max-width: 768px) {
                .footer-content {
                    flex-direction: column;
                    align-items: center;
                }

                .footer-section {
                    text-align: center;
                }

                .social-icon {
                    margin: 0.5rem 1rem;
                }
            }
            .footer-bottom{
                text-align:center
            }

        .form-group {
            display: inline-block;
            margin-bottom: 10px;
            text-align: left;
            
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input,.form-group select {
            padding: 15px;
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
    </style>
    <script>
        function toggleMenu() {
            var menu = document.getElementById("dropdownMenu");
            if (menu.style.display === "block") {
                menu.style.display = "none";
            } else {
                menu.style.display = "block";
            }
        }

    </script>
</head>
<body>
    <div class="menu" onclick="toggleMenu()">
        <div class="menu-bar"></div>
        <div class="menu-bar"></div>
        <div class="menu-bar"></div>
    </div>
    <div class="dropdown-menu" id="dropdownMenu">
        <a href="login.aspx">Logout</a>
    </div>
    <form runat="server">
        <header>
            <nav>
                <ul>
                    <li><a href="Home.aspx" class="active">Home</a></li>
                    <li><a href="tours.aspx">Tours</a></li>
                    <li><a href="Trek.aspx">Treks</a></li>
                    <li><a href="Faqs.aspx">FAQs</a></li>
                    <li><a href="UserProfile.aspx">Profile</a></li>
                    <li><a href="AboutUs.aspx">About Us</a></li>
                </ul>
            </nav>
        </header>
        <main>
            <section class="hero">
                <div class="hero-content">
                <h1>Gill Hikes</h1>
                <p>Book a tour now!</p>
                <asp:DropDownList ID="ddlDestination" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDestination_SelectedIndexChanged"></asp:DropDownList>
           
                    <asp:DropDownList ID="departuresDropdown" runat="server">
                        <asp:ListItem Text="Upcoming Departures" Value="" Disabled="True" Selected="True"></asp:ListItem>
                    </asp:DropDownList>

<%--            <div class="form-group">
                <asp:TextBox ID="DOB" runat="server" required="true" TextMode="Date" placeholder="Enter your Date of Birth"></asp:TextBox>
                <asp:RequiredFieldValidator ID="DOBValidate" runat="server" ControlToValidate="DOB" ErrorMessage="Date of Birth is required" CssClass="error"></asp:RequiredFieldValidator>
            </div>--%>
                    <asp:Button ID="searchButton" runat="server" Text="Search" CssClass="search-button" />
                </div>
            </section>
            <section class="features">
                <div class="feature">
                    <p>100% Best Price Guarantee</p>
                </div>
                <div class="feature">
                    <p>24/7 Expert Customer Support</p>
                </div>
                <div class="feature">
                    <p>No credit card or booking fees</p>
                </div>
            </section>
            <section class="help">
                <h2>We're here to help, 24/7.</h2>
                <p>Connect with our expert travel consultants to plan your next trip.</p>
                <div class="consultants">
                    <img src="consultant1.jpg" alt="Consultant">
                    <img src="consultant2.jpg" alt="Consultant">
                    <img src="consultant3.jpg" alt="Consultant">
                    <img src="consultant4.jpg" alt="Consultant">
                    <img src="consultant5.jpg" alt="Consultant">
                    <img src="consultant6.jpg" alt="Consultant">
                    <img src="consultant.jpg" alt="Consultant">
                </div>
                <div class="contact-info">
                    <div>
                        <p>Call us</p>
                        <a href="tel:+3204884375">+3204884375</a>
                    </div>
                    <div>
                        <p>Email Us</p>
                        <a href="mailto:info@gillhikes.com">Send us a message</a>
                    </div>
                    <div>
                        <p>About us</p>
                        <a href="AboutUs.aspx">Read more</a>
                    </div>
                </div>
            </section>
            <section class="featured-liveaboards">
                <h2>Featured Tours</h2>
                <a href="tours.aspx" class="see-more">See more tours</a>
                <div class="liveaboard-cards">
                    <div class="card">
                        <img src="skardu.jpeg" alt="Ocean Quest">
                        <h3>Shangrilla,Skardu</h3>
                        <p>Pakistan</p>
                        <p>from 5k / day</p>
                        <p>9.0 Superb (413 Reviews)</p>
                    </div>
                    <div class="card">
                        <img src="khumrat.jpeg" alt="Pearl of Papua">
                        <h3>Khumrat Valley</h3>
                        <p>Swat,Pakistan</p>
                        <p>from 3K / day</p>
                        <p>8.5 Fabulous (43 Reviews)</p>
                    </div>
                    <div class="card">
                        <img src="rattigali.jpeg" alt="Resolute">
                        <h3>Ratti Galli</h3>
                        <p>Azad Kashmir</p>
                        <p>from 6K / day</p>
                        <p>8.7 Heaven On Earth (169 Reviews)</p>
                    </div>
                </div>
            </section>
        </main>
        <footer>
    <div class="footer-content">
        <div class="footer-section contact">
            <h2>Contact Us</h2>
            <p>Phone: <a href="tel:+3204884375">+3204884375</a></p>
            <p>Email: <a href="mailto:info@gillhikes.com">info@gillhikes.com</a></p>
            <p>Address: 123 Hike St, Adventure City, Country</p>
        </div>
        <div class="footer-section links">
            <h2>Quick Links</h2>
            <ul>
                <li><a href="Faqs.aspx">FAQs</a></li>
                <li><a href="AboutUs.aspx">About Us</a></li>
                <li><a href="ContactUs.aspx">Contact Us</a></li>
                <li><a href="PrivacyPolicy.aspx">Privacy Policy</a></li>
                <li><a href="TermsOfService.aspx">Terms of Service</a></li>
            </ul>
        </div>
        <div class="footer-section social">
            <h2>Follow Us</h2>
            <a href="https://www.facebook.com/gillhikes" target="_blank">
                <img src="t1.jpg" alt="Facebook" class="social-icon">
            </a>
            <a href="https://www.twitter.com/gillhikes" target="_blank">
                <img src="t2.jpg" alt="Twitter" class="social-icon">
            </a>
            <a href="https://www.instagram.com/gillhikes" target="_blank">
                <img src="t3.jpg" alt="Instagram" class="social-icon">
            </a>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2023 Gill Hikes. All rights reserved.</p>
    </div>
</footer>
    </form>
</body>
</html>
