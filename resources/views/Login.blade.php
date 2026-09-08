<!-- <!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - FitLife Gym</title>

    <link rel="stylesheet" href="{{ asset('css/font-profile.css') }}">
    <link rel="stylesheet" href="{{ asset('css/font2-profile.css') }}">
    <link rel="stylesheet" href="{{ asset('css/Home.css') }}">
    <link rel="stylesheet" href="{{ asset('css/Login.css') }}">
</head>
<body>
    <div class="overlay"></div>

    <header>
        <h1>FitLife Gym</h1>
        <p>Login untuk Memulai Perjalanan Kebugaran Anda</p>
    </header>

    <nav>
        <div class="navbar-content">
            <a href="{{ url('/') }}" class="navbar-brand">FitLife Gym</a>
            <ul class="navbar-nav">
                <li class="nav-item"><a href="{{ url('/') }}" class="nav-link">Home</a></li>
                <li class="nav-item"><a href="{{ url('/Kelas') }}" class="nav-link">Kelas</a></li>
                <li class="nav-item"><a href="{{ url('/Fasilitas') }}" class="nav-link">Fasilitas</a></li>
                <li class="nav-item"><a href="{{ url('/Membership') }}" class="nav-link">Membership</a></li>
                <li class="nav-item"><a href="{{ url('/Profile') }}" class="nav-link">Profile</a></li>
                <li class="nav-item"><a href="{{ route('login') }}" class="nav-link active">Login</a></li>
            </ul>
        </div>
    </nav>

    <main>
        <div class="container">
            <div class="login-container">
                <div class="auth-form">
                    <!-- Login Form -->
                    <form id="login-form" action="{{ route('login.post') }}" method="POST">
                        @csrf
                        <div class="form-group">
                            <label for="login-email">Email:</label>
                            <input type="email" id="login-email" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="login-password">Password:</label>
                            <input type="password" id="login-password" name="password" required>
                        </div>
                        <div class="form-group">
                            <label for="login-as">Login sebagai:</label>
                            <select id="login-as" name="login_as" required>
                                <option value="member">Member</option>
                                <option value="trainer">Trainer</option>
                                <option value="staff">Staff</option>
                                <option value="admin">Admin</option>
                            </select>
                        </div>
                        <button type="submit" class="form-submit">Login</button>
                    </form>
                </div>
            </div>
        </div>
    </main>

    <footer>
        <p>&copy; 2024 FitLife Gym. Hak Cipta Dilindungi.</p>
    </footer>

    <script src="{{ asset('js/login.js') }}"></script>
</body>
</html> -->
