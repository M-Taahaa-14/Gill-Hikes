<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Trek.aspx.cs" Inherits="Tourist.WebForm1" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gill Guides and Tours</title>
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

        .heading {
            text-align: center;
            font-size: larger;
        }
        .info {
            text-align: left;
            margin-inline-start: 240px;
            margin-inline-end: 240px;
        }
        .trek-cards {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            padding: 1rem;
        }
        .card {
            position: relative;
            width: 30%;
            margin-bottom: 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            overflow: hidden;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .card img {
            width: 100%;
            height: auto;
        }
        .card-content {
            padding: 1rem;
        }
        .card-content h3 {
            margin: 0.5rem 0;
        }
        .card-content p {
            margin: 0.5rem 0;
        }
        .card:hover .overlay {
            opacity: 0.8;
        }
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        .overlay a {
            color: white;
            background-color: #007bff;
            padding: 0.5rem 1rem;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .overlay a:hover {
            background-color: #13b570;
        }
    </style>
</head>
<body>
        <header>
            <nav>
                <ul>
                    <li><a href="Home.aspx">Home</a></li>
                    <li><a href="tours.aspx">Tours</a></li>
                    <li><a href="Trek.aspx" class="active">Treks</a></li>
                    <li><a href="Faqs.aspx">FAQs</a></li>
                    <li><a href="UserProfile.aspx">Profile</a></li>
                    <li><a href="AboutUs.aspx">About Us</a></li>
                </ul>
            </nav>
        </header>
    <main>
        <section class="heading">
            <h1><br>Gill Tour Guides</h1>
        </section>
        <section class="trek-cards">
            <div class="card">
                <img src="chittalake.jpg" alt="Chitta Katha Lake Trek">
                <div class="card-content">
                    <h3>Chitta Katha Lake Trek (4100 meters)</h3>
                    <p>5 Days, 4 Nights</p>
                    <p>From PKR 35000</p>
                </div>
                <div class="overlay">
                    <a href="booking.aspx">Book Now</a>
                </div>
            </div>
            <div class="card">
                <img src="rakaposhi.jpeg" alt="Rakaposhi Base Camp Trek">
                <div class="card-content">
                    <h3>Rakaposhi Base Camp Trek (3500 Meters)</h3>
                    <p>8 Days, 7 Nights</p>
                    <p>From PKR 80000</p>
                </div>
                <div class="overlay">
                    <a href="booking.aspx">Book Now</a>
                </div>
            </div>
            <div class="card">
                <img src="kutwal.jpg" alt="Harmosh Valley">
                <div class="card-content">
                    <h3>Haramosh Valley (Kutwal Lake) Trek (7409m)</h3>
                    <p>5 Days, 4 Nights</p>
                    <p>From PKR 55000</p>
                </div>
                <div class="overlay">
                    <a href="booking.aspx">Book Now</a>
                </div>
            </div>
            <div class="card">
                <img src="k2.jpeg" alt="K2 Base Camp">
                <div class="card-content">
                    <h3>K2 Base Camp Trek</h3>
                    <p>15 Days, 14 Nights</p>
                    <p>From PKR 80000</p>
                </div>
                <div class="overlay">
                    <a href="booking.aspx">Book Now</a>
                </div>
            </div>
            <div class="card">
                <img src="ratti.jpeg" alt="Ratti Galli">
                <div class="card-content">
                    <h3>Ratti Gali Trek</h3>
                    <p>3 Days, 2 Nights</p>
                    <p>From PKR 20000</p>
                </div>
                <div class="overlay">
                    <a href="booking.aspx">Book Now</a>
                </div>
            </div>
            <div class="card">
                <img src="fairymeadows.jpeg" alt="Fairy Meadows">
                <div class="card-content">
                    <h3>Fairy Meadows</h3>
                    <p>6 Days, 5 Nights</p>
                    <p>From PKR 40000</p>
                </div>
                <div class="overlay">
                    <a href="booking.aspx">Book Now</a>
                </div>
            </div>
            <!-- Add more cards as needed -->
        </section>
    </main>
</body>
</html>
