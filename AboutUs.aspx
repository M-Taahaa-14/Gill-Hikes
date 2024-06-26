<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="Tourist.AboutUs" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The Travelers</title>
    <link href="https://cdn.usebootstrap.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css?family=Nunito');
        *{
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        body{
            background-size: 100% auto;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center; 
            padding-bottom: 80px;
            background-color: #FAF3EE;
        }
        .Chefs{
            background-color: #1d7b57;
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
        .heading {
            color: #ffffff;
            margin-left: 100px;
            text-transform: uppercase;
            height:100px;
            width: 100px;
            background-image: url(tt.jpeg);
            background-size: cover;
        }

        .Chefs h1{
            text-align: center;
            font-weight: bold ;
            color:  #ffffff;
            padding-top: 0%;
            padding-bottom: 10px;
            text-transform: uppercase;
            margin-top: 0px;
            padding-top: 50px;
        }
        .Chefs p{
            text-align: center;
            color:  #ffffff;
            font-weight: bold ;
            padding-bottom: 10px;
            text-transform: uppercase;
            left: 20px;
            right: 20px;
        }
        .Chefs h1::after{
            content: '';
            background:#ffffff;
            display: block;
            height :3px;
            width: 170px; 
            margin: 20px auto 5px; 
        }
        .Chefs .row{
            margin-top: 30px;
        }
        .col-md-4{
            margin: 40px auto;
        }
        .profile{
            padding: 70px 10px 10px;
            border-radius: 10px;
            background: -webkit-linear-gradient(left, #fffffd, #ffffff);
            backface-visibility: hidden;
        }
        .profile img{
            top: -60px;
            position: absolute;
            background-color: #FAF3EE;
            border: 3px solid  #598b92;
            shape-image-threshold:inherit;
        }
        .user{
            width: 120px;
            height: 120px;
            border-radius: 50%;
        }
        .profile h3{
            font-size: 10px;
            margin-top: 15px;
            color:#ffffff;
        }
        blockquote{
            font-size:16px;
            line-height: 30px;
        }
        blockquote::before{
            content: '\201C';
            font-size: 50px;
            position: relative;
            color: #13764e;
            line-height: 20px;
            bottom: -15px;
            right: 5px;
        }
        blockquote::after{
            content: '\201C';
            font-size: 50px;
            position: relative;
            color: #13764e;
            line-height: 10px;
            bottom: -15px;
            left: 5px;
        }
        .footer{
            color: #000;
        }
    </style>
</head>
<body>
    <form runat="server">
        <header>
            <nav>
                <ul>
                    <li><a href="Home.aspx">Home</a></li>
                    <li><a href="tours.aspx">Tours</a></li>
                    <li><a href="Trek.aspx">Treks</a></li>
                    <li><a href="Faqs.aspx">FAQs</a></li>
                    <li><a href="UserProfile.aspx">Profile</a></li>
                    <li><a href="AboutUs.aspx" class="active">About Us</a></li>
                </ul>
            </nav>
        </header>
        <section class="Chefs">
            <div class="container">
                <h1>Our Team</h1>
            <p class="text-center">Gill Hikes is dedicated to providing the best hiking tours and travel experiences. Our expert guides and 24/7 customer support ensure your adventure is safe, enjoyable, and unforgettable.<br></p>
       
                <p class="text-center">"Discover the world's beauty through our eyes."<br><br></p>
                <div class="row">
                    <div class="col-md-4 text-center">
                        <div class="profile">        
                            <img src="f5.jpeg" class="user">
                            <h2> Subhan Gill</h2>
                            <blockquote>"Exploring the world, one adventure at a time. With a keen eye for hidden 
                                gems and a passion for authentic experiences, Subhan is dedicated to making every 
                                journey unforgettable."</blockquote>
                        </div>
                    </div>
                    <div class="col-md-4 text-center">
                        <div class="profile">        
                            <img src="f3.jpeg" class="user">
                            <h2>Muhammad Taahaa</h2>
                            <blockquote>"Your guide to unforgettable journeys. Muhammad blends cultural insights 
                                with travel expertise, ensuring every traveler enjoys a rich, immersive experience."</blockquote>
                        </div>
                    </div>
                    <div class="col-md-4 text-center">
                        <div class="profile">        
                            <img src="f1.jpeg" class="user">
                            <h2> Fahad Jamil</h2>
                            <blockquote>"Crafting memories, creating experiences. 
                                Fahad's meticulous planning and attention to detail guarantee 
                                that each trip is a seamless and enjoyable adventure."</blockquote>
                        </div>
                    </div>
                    <div class="col-md-4 text-center">
                        <div class="profile">        
                            <img src="chef4.jpg" class="user">
                            <h2> Haris Usman</h2>
                            <blockquote>"Navigating the globe with passion. 
                                Haris combines his love for travel with extensive knowledge,
                                offering unique and personalized itineraries for every explorer."</blockquote>
                        </div>
                    </div>
                    <div class="col-md-4 text-center">
                        <div class="profile">        
                            <img src="f4.jpeg" class="user">
                            <h2> Muhammad Arshad</h2>
                            <blockquote>"Bringing dreams to destinations. With a knack for turning travel dreams into reality, 
                                Muhammad focuses on creating bespoke experiences tailored to individual preferences."</blockquote>
                        </div>
                    </div>
                    <div class="col-md-4 text-center">
                        <div class="profile">        
                            <img src="f6.jpeg" class="user">
                            <h2> Sahal Sohail</h2>
                            <blockquote>"Discovering wonders, sharing smiles. Sahal's enthusiasm for uncovering new places 
                                and cultures makes every tour exciting and filled with joy."</blockquote>
                        </div>
                    </div>
                </div>
            </div>
        </section>
                <footer>
             <p>&copy; 2023 Gill Hikes. All rights reserved.</p>
        </footer>
    </form>
</body>
</html>
