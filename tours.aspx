<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tours.aspx.cs" Inherits="Tourist.tours" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tours</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
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
        .board {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }
        .tour {
            width: 300px;
            margin-bottom: 20px;
            background: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .tour img {
            width: 100%;
            height: auto;
        }
        .arrow {
            position: relative;
            bottom: 30px;
            right: 10px;
            color: #fff;
            font-size: 24px;
            cursor: pointer;
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
            position: relative;
            border: 1px solid #ddd;
            border-radius: 5px;
            overflow: hidden;
            width: 30%;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
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
        .featured-liveaboards .card:hover {  
            transform: scale(1.05);
        }
        .featured-liveaboards .card:hover .overlay {
            opacity: 1;
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
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        .overlay .book-now, .overlay .wishlist {
            margin: 5px;
            padding: 0.5rem 1rem;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .overlay .book-now {
            background-color: #fff;
        }
        .overlay .wishlist {
            background-color: #f44336;
        }
        .overlay .book-now:hover {
            background-color: #13b570;
        }
        .overlay .wishlist:hover {
            background-color: #c62828;
        }
        footer {
            background-color: #0d6c34;
            color: white;
            text-align: center;
            padding: 0.5rem;
        }

    </style>
</head>
<body>
        <header>
            <nav>
                <ul>
                    <li><a href="Home.aspx">Home</a></li>
                    <li><a href="tours.aspx" class="active">Tours</a></li>
                    <li><a href="Trek.aspx">Treks</a></li>
                    <li><a href="Faqs.aspx">FAQs</a></li>
                    <li><a href="UserProfile.aspx">Profile</a></li>
                    <li><a href="AboutUs.aspx">About Us</a></li>
                </ul>
            </nav>
        </header>
    <section class="featured-liveaboards">
        <h2>Our Tours</h2>
        <div class="liveaboard-cards">
            <div class="card">
                <img src="skardu.jpeg" alt="Ocean Quest">
                <h3>Shangrilla, Skardu</h3>
                <p>Pakistan</p>
                <p>from 5k / day</p>
                <p>9.0 Superb (413 Reviews)</p>
                <div class="overlay">
                    <a href="booking.aspx" class="book-now">Book Now📅</a>
                    <span class="wishlist" onclick="addToWishlist('Shangrilla, Skardu')">🤍💌</span>
                </div>
            </div>
            <div class="card">
                <img src="khumrat.jpeg" alt="Pearl of Papua">
                <h3>Khumrat Valley</h3>
                <p>Swat, Pakistan</p>
                <p>from 3K / day</p>
                <p>8.5 Fabulous (43 Reviews)</p>
                <div class="overlay">
                    <a href="booking.aspx" class="book-now">Book Now📅</a>
                    <span class="wishlist" onclick="addToWishlist('Khumrat Valley')">🤍💌</span>
                </div>
            </div>
            <div class="card">
                <img src="rattigali.jpeg" alt="Resolute">
                <h3>Ratti Galli</h3>
                <p>Azad Kashmir</p>
                <p>from 6K / day</p>
                <p>8.7 Heaven On Earth (169 Reviews)</p>
                <div class="overlay">
                    <a href="booking.aspx" class="book-now">Book Now📅</a>
                    <span class="wishlist" onclick="addToWishlist('Ratti Gali')">🤍💌</span>
                </div>
            </div>
                        <div class="card">
                <img src="skardu.jpeg" alt="Ocean Quest">
                <h3>Shangrilla, Skardu</h3>
                <p>Pakistan</p>
                <p>from 5k / day</p>
                <p>9.0 Superb (413 Reviews)</p>
                <div class="overlay">
                    <a href="booking.aspx" class="book-now">Book Now📅</a>
                    <span class="wishlist" onclick="addToWishlist('Shangrilla, Skardu')">🤍💌</span>
                </div>
            </div>
            <div class="card">
                <img src="khumrat.jpeg" alt="Pearl of Papua">
                <h3>Khumrat Valley</h3>
                <p>Swat, Pakistan</p>
                <p>from 3K / day</p>
                <p>8.5 Fabulous (43 Reviews)</p>
                <div class="overlay">
                    <a href="booking.aspx" class="book-now">Book Now📅</a>
                    <span class="wishlist" onclick="addToWishlist('Khumrat Valley')">🤍💌</span>
                </div>
            </div>
            <div class="card">
                <img src="rattigali.jpeg" alt="Resolute">
                <h3>Ratti Galli</h3>
                <p>Azad Kashmir</p>
                <p>from 6K / day</p>
                <p>8.7 Heaven On Earth (169 Reviews)</p>
                <div class="overlay">
                    <a href="booking.aspx" class="book-now">Book Now📅</a>
                    <span class="wishlist" onclick="addToWishlist('Ratti Gali')">🤍💌</span>
                </div>
            </div>
                        <div class="card">
                <img src="skardu.jpeg" alt="Ocean Quest">
                <h3>Shangrilla, Skardu</h3>
                <p>Pakistan</p>
                <p>from 5k / day</p>
                <p>9.0 Superb (413 Reviews)</p>
                <div class="overlay">
                    <a href="booking.aspx" class="book-now">Book Now📅</a>
                    <span class="wishlist" onclick="addToWishlist('Shangrilla, Skardu')">🤍💌</span>
                </div>
            </div>
            <div class="card">
                <img src="khumrat.jpeg" alt="Pearl of Papua">
                <h3>Khumrat Valley</h3>
                <p>Swat, Pakistan</p>
                <p>from 3K / day</p>
                <p>8.5 Fabulous (43 Reviews)</p>
                <div class="overlay">
                    <a href="booking.aspx" class="book-now">Book Now📅</a>
                    <span class="wishlist" onclick="addToWishlist('Khumrat Valley')">🤍💌</span>
                </div>
            </div>
            <div class="card">
                <img src="rattigali.jpeg" alt="Resolute">
                <h3>Ratti Galli</h3>
                <p>Azad Kashmir</p>
                <p>from 6K / day</p>
                <p>8.7 Heaven On Earth (169 Reviews)</p>
                <div class="overlay">
                    <a href="booking.aspx" class="book-now">Book Now📅</a>
                    <span class="wishlist" onclick="addToWishlist('Ratti Gali')">🤍💌</span>
                </div>
            </div>
            <!-- Repeat similar structure for other cards -->
        </div>
    </section>
    <footer>
        <p>&copy; 2023 Gill Hikes. All rights reserved.</p>
    </footer>
    <script>
        function addToWishlist(tourName) {
            alert(tourName + " has been added to your wishlist!");
        }
    </script>
</body>
</html>
