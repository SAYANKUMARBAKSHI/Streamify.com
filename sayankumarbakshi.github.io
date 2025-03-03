<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Streamify</title>
    <style>
        /* General Styles */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #000; /* Black background */
            color: #fff; /* White text for contrast */
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            background: rgba(0, 0, 0, 0.9); /* Slightly transparent black */
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: red;
            animation: fadeIn 2s ease-in-out;
        }

        .menu a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            transition: color 0.3s ease;
        }

        .menu a:hover {
            color: red;
        }

        .auth-buttons button {
            padding: 8px 15px;
            background: red;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-left: 10px;
            transition: background 0.3s ease;
        }

        .auth-buttons button:hover {
            background: darkred;
        }

        .search-bar {
            display: flex;
            align-items: center;
        }

        .search-bar input {
            padding: 8px;
            border: none;
            border-radius: 5px;
            margin-right: 10px;
            background: #333;
            color: white;
        }

        .search-bar button {
            padding: 8px 15px;
            background: red;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .search-bar button:hover {
            background: darkred;
        }

        /* Hero Section with Background Video */
        .hero {
            position: relative;
            height: 80vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
            overflow: hidden;
        }

        .hero video {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 100%;
            height: 100%;
            object-fit: cover;
            transform: translate(-50%, -50%);
            z-index: -1;
        }

        .hero-content {
            z-index: 1;
            animation: fadeInUp 2s ease-in-out;
        }

        .hero h1 {
            font-size: 3rem;
            margin: 0;
        }

        .hero p {
            font-size: 1.5rem;
            margin: 20px 0;
        }

        button {
            padding: 10px 20px;
            font-size: 1rem;
            color: white;
            background: red;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            transition: background 0.3s ease, transform 0.3s ease;
        }

        button:hover {
            background: darkred;
            transform: scale(1.1);
        }

        /* Movies Section with Grid Layout */
        .movies, .trending {
            padding: 20px;
            background: rgba(0, 0, 0, 0.8); /* Dark background for sections */
            margin: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(255, 255, 255, 0.1); /* Light shadow for contrast */
        }

        .movie-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            justify-content: center;
        }

        .movie-item iframe {
            width: 100%;
            height: 200px;
            border-radius: 10px;
            border: none;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .movie-item iframe:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 16px rgba(255, 255, 255, 0.2); /* Light shadow for contrast */
            cursor: pointer;
        }

        /* Modal for Login and Signup */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            justify-content: center;
            align-items: center;
            z-index: 1001;
        }

        .modal-content {
            background: #333;
            padding: 20px;
            border-radius: 10px;
            width: 300px;
            text-align: center;
        }

        .modal-content h2 {
            margin-bottom: 20px;
        }

        .modal-content input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
        }

        .modal-content button {
            width: 100%;
            padding: 10px;
            background: red;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .modal-content button:hover {
            background: darkred;
        }

        .close {
            color: #fff;
            float: right;
            font-size: 24px;
            cursor: pointer;
        }

        .close:hover {
            color: red;
        }

        /* Footer */
        .footer {
            background: rgba(0, 0, 0, 0.9); /* Slightly transparent black */
            padding: 20px;
            text-align: center;
            margin-top: 40px;
            color: white;
        }

        .footer-links {
            margin-top: 10px;
        }

        .footer-links a {
            color: #ccc;
            text-decoration: none;
            margin: 0 10px;
            transition: color 0.3s ease;
        }

        .footer-links a:hover {
            color: red;
        }

        /* Keyframes for Animations */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                align-items: center;
            }

            .menu {
                margin-top: 10px;
            }

            .hero h1 {
                font-size: 2rem;
            }

            .hero p {
                font-size: 1rem;
            }

            .movie-grid {
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            }
        }
    </style>
</head>
<body>
    <header class="navbar">
        <div class="logo">Streamify</div>
        <div class="menu">
            <a href="#">Home</a>
            <a href="#">TV Shows</a>
            <a href="#">Movies</a>
            <a href="#">Latest</a>
            <a href="#">My List</a>
        </div>
        <div class="auth-buttons">
            <button onclick="openModal('login')">Login</button>
            <button onclick="openModal('signup')">Sign Up</button>
        </div>
    </header>
    
    <section class="hero">
        <video autoplay muted loop>
            <source src="hero-video.mp4" type="video/mp4">
        </video>
        <div class="hero-content">
            <h1>Unlimited movies, TV shows, and more.</h1>
            <p>Watch anywhere. Cancel anytime.</p>
            <button>Join Now</button>
        </div>
    </section>
    
    <section class="movies">
        <h2>Popular on Streamify</h2>
        <div class="movie-grid">
            <div class="movie-item">
                <iframe src="https://www.youtube.com/embed/5PSNL1qE6VY" allowfullscreen></iframe>
            </div>
            <div class="movie-item">
                <iframe src="https://www.youtube.com/embed/6ZfuNTqbHE8" allowfullscreen></iframe>
            </div>
            <div class="movie-item">
                <iframe src="https://www.youtube.com/embed/YdiGEjz5b0Y" allowfullscreen></iframe>
            </div>
            <div class="movie-item">
                <iframe src="https://www.youtube.com/embed/d9MyW72ELq0" allowfullscreen></iframe>
            </div>
        </div>
    </section>
    
    <section class="trending">
        <h2>Trending Now</h2>
        <div class="movie-grid">
            <div class="movie-item">
                <iframe src="https://www.youtube.com/embed/hA6hldpSTF8" allowfullscreen></iframe>
            </div>
            <div class="movie-item">
                <iframe src="https://www.youtube.com/embed/EXeTwQWrcwY" allowfullscreen></iframe>
            </div>
            <div class="movie-item">
                <iframe src="https://www.youtube.com/embed/8ugaeA-nMTc" allowfullscreen></iframe>
            </div>
            <div class="movie-item">
                <iframe src="https://www.youtube.com/embed/6JnN1DmbqoU" allowfullscreen></iframe>
            </div>
        </div>
    </section>
    
    <footer class="footer">
        <p>&copy; 2025 Streamify.Monisha creations.</p>
        <div class="footer-links">
            <a href="#">Privacy</a>
            <a href="#">Terms</a>
            <a href="#">Contact</a>
        </div>
    </footer>

    <!-- Login Modal -->
    <div id="loginModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('login')">&times;</span>
            <h2>Login</h2>
            <input type="text" placeholder="Username">
            <input type="password" placeholder="Password">
            <button>Login</button>
        </div>
    </div>

    <!-- Signup Modal -->
    <div id="signupModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('signup')">&times;</span>
            <h2>Sign Up</h2>
            <input type="text" placeholder="Username">
            <input type="email" placeholder="Email">
            <input type="password" placeholder="Password">
            <button>Sign Up</button>
        </div>
    </div>

    <script>
        // Function to open modal
        function openModal(modalType) {
            document.getElementById(modalType + 'Modal').style.display = 'flex';
        }

        // Function to close modal
        function closeModal(modalType) {
            document.getElementById(modalType + 'Modal').style.display = 'none';
        }
    </script>
</body>
</html>
