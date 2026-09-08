<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - FitLife Gym</title>
    <!-- FontAwesome for icons -->
    <link rel="stylesheet" href="font1.css">
    <link rel="stylesheet" href="font2.css">

    <link rel="stylesheet" href="Home.css">
</head>
<body>
  <div class="overlay"></div>
</body>
<body>
    <header>
        <h1>FitLife Gym</h1>
        <p>Kembangkan Potensi Anda Bersama Kami</p>
    </header>

    <nav>
        <div class="navbar-content">
            <a href="{{ url('/') }}" class="navbar-brand">FitLife Gym</a>
            <ul class="navbar-nav">
                <li class="nav-item"><a href="{{ url('/') }}" class="nav-link active">Home</a></li>
                <li class="nav-item"><a href="{{ url('/Kelas') }}" class="nav-link">Kelas</a></li>
                <li class="nav-item"><a href="{{ url('/Fasilitas') }}" class="nav-link">Fasilitas</a></li>
                <li class="nav-item"><a href="{{ url('/Membership') }}" class="nav-link">Membership</a></li>
                <li class="nav-item"><a href="{{ url('/Profile') }}" class="nav-link">Profile</a></li>
                <li class="nav-item"><a href="{{ url('/Login') }}" class="nav-link">Login/Register</a></li>
            </ul>
        </di>
    </nav>

    <main>
        <div class="container">
            <h2>Selamat Datang di FitLife Gym</h2>
            <p>FitLife Gym adalah tempat terbaik untuk mencapai tujuan kebugaran Anda. Dengan peralatan modern, kelas-kelas bervariasi, dan pelatih profesional, kami siap membantu Anda menjalani gaya hidup sehat.</p>
            <a href="{{ url('/Login') }}" class="cta-button">Bergabung Sekarang</a>
        </div>

        <section class="membership-options">
            <h2>Available Membership</h2>
            <div class="membership-cards">
                <div class="card">
                    <h3>Pay as You Go</h3>
                    <p class="price">Rp 50.000/Kedatangan</p>
                    <ul>
                        <li>Akses gym sekali kedatangan</li>
                        <li>Konsultasi fitness dengan biaya tambahan</li>
                        <li>Bayar hanya saat datang</li>
                    </ul>
                </div>
                <div class="card">
                    <h3>Monthly</h3>
                    <p class="price">Rp 350.000/Bulan</p>
                    <ul>
                        <li>Akses gym 24/7</li>
                        <li>Konsultasi fitness gratis</li>
                        <li>Loker pribadi</li>
                    </ul>
                </div>
                <div class="card">
                    <h3>Yearly</h3>
                    <p class="price">Rp 1.250.000/Tahun</p>
                    <ul>
                        <li>Semua fitur Monthly</li>
                        <li>Diskon 15% untuk personal trainer</li>
                        <li>Gratis suplemen satu bulan</li>
                    </ul>
                </div>
            </div>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 FitLife Gym. Hak Cipta Dilindungi.</p>
    </footer>
</body>
</html>
