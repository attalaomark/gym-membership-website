<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trainer - FitLife Gym</title>
    <!-- FontAwesome for icons -->
    <link rel="stylesheet" href="font-profile.css">
    <link rel="stylesheet" href="font2-profile.css">
    <link rel="stylesheet" href="Trainer.css">
</head>
<body>
  <div class="overlay"></div>
</body>
<body>
    <header>
        <h1>Trainer FitLife Gym</h1>
        <h2>Tim Trainer Kami Siap Membantu Anda Mencapai Tujuan Kebugaran</h2>
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
                <li class="nav-item"><a href="{{ url('/Trainer') }}" class="nav-link active">Trainer</a></li>
            </ul>
        </di>
    </nav>

    <main>
        <h2>Trainer FitLife Gym</h2>
        <p>Kami memiliki tim trainer berpengalaman dan bersertifikasi untuk membantu Anda mencapai tujuan kebugaran.</p>
        
        <section class="trainer">
            <img src="john-doe.jpg" alt="John Doe" class="trainer-photo">
            <div class="trainer-info">
                <h3>John Doe</h3>
                <p>Spesialis dalam latihan kekuatan dan HIIT. Berpengalaman lebih dari 10 tahun dalam industri kebugaran.</p>
            </div>
        </section>

        <section class="trainer">
            <img src="jane-smith.jpg" alt="Jane Smith" class="trainer-photo">
            <div class="trainer-info">
                <h3>Jane Smith</h3>
                <p>Instruktur yoga dan pilates bersertifikasi. Ahli dalam meningkatkan fleksibilitas dan kekuatan inti.</p>
            </div>
        </section>

        <section class="trainer">
            <img src="mike-johnson.jpg" alt="Mike Johnson" class="trainer-photo">
            <div class="trainer-info">
                <h3>Mike Johnson</h3>
                <p>Spesialis dalam program penurunan berat badan dan latihan kardio. Telah membantu ratusan klien mencapai berat badan ideal.</p>
            </div>
        </section>

        <section class="trainer">
            <img src="sarah-lee.jpg" alt="Sarah Lee" class="trainer-photo">
            <div class="trainer-info">
                <h3>Sarah Lee</h3>
                <p>Instruktur Zumba bersertifikasi dan ahli dalam dance fitness. Kelas yang energik dan menyenangkan.</p>
            </div>
        </section>
    </main>

    <footer>
        <p>© 2024 Gymso Fitness. Hak Cipta Dilindungi.</p>
    </footer>
</body>
</html>