<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fasilitas - FitLife Fitness</title>
    <!-- FontAwesome for icons -->
    <link rel="stylesheet" href="font-profile.css">
    <link rel="stylesheet" href="font2-profile.css">
    
    <link rel="stylesheet" href="Home.css">
    <link rel="stylesheet" href="fasilitas.css">
</head>
<body>
  <div class="overlay"></div>
</body>
<body>
    <header>
        <h1>Fasilitas Fitlife Gym</h1>
        <p>Fasilitas Kami Siap Membantu Anda Dalam Meraih Potensi Yang Tinggi</p>
    </header>

    <nav>
        <div class="navbar-content">
            <a href="{{ url('/') }}" class="navbar-brand">Fitlife Gym</a>
            <ul class="navbar-nav">
                <li class="nav-item"><a href="{{ url('/') }}" class="nav-link">Home</a></li>
                <li class="nav-item"><a href="{{ url('/Kelas') }}" class="nav-link">Kelas</a></li>
                <li class="nav-item"><a href="{{ url('/Fasilitas') }}" class="nav-link active">Fasilitas</a></li>
                <li class="nav-item"><a href="{{ url('/Membership') }}" class="nav-link">Membership</a></li>
                <li class="nav-item"><a href="{{ url('/Profile') }}" class="nav-link">Profile</a></li>
                <li class="nav-item"><a href="{{ url('/Login') }}" class="nav-link">Login/Register</a></li>
            </ul>
        </di>
    </nav>

    <main>
        <div class="container">
            <h2>Fasilitas FitLife Gym</h2>
            <p>Kami menyediakan berbagai fasilitas modern untuk mendukung perjalanan kebugaran Anda.</p>

            <div class="facilities">
                <div class="facility-card">
                    <img src="Cardio.jpg" alt="Area Kardio" class="facility-image">
                    <div class="facility-info">
                        <h3>Area Kardio</h3>
                        <p>Dilengkapi dengan treadmill, sepeda statis, dan elliptical machines terbaru.</p>
                    </div>
                </div>

                <div class="facility-card">
                    <img src="Weight.jpg" alt="Area Angkat Beban" class="facility-image">
                    <div class="facility-info">
                        <h3>Area Angkat Beban</h3>
                        <p>Berbagai peralatan angkat beban free weights dan mesin untuk latihan kekuatan.</p>
                    </div>
                </div>

                <div class="facility-card">
                    <img src="Yoga.jpg" alt="Studio Yoga" class="facility-image">
                    <div class="facility-info">
                        <h3>Studio Yoga</h3>
                        <p>Ruangan yang tenang dan nyaman untuk kelas yoga dan meditasi.</p>
                    </div>
                </div>

                <div class="facility-card">
                    <img src="shower-room.jpg" alt="Kamar Mandir" class="facility-image">
                    <div class="facility-info">
                        <h3>Kamar Mandi</h3>
                        <p>Kamar mandi yang sudah berfasilitas shower dengan air panas dan dingin untuk menyegarkan anda setelah berolahraga.</p>
                    </div>
                </div>

                <div class="facility-card">
                    <img src="Sauna.jpg" alt="Sauna" class="facility-image">
                    <div class="facility-info">
                        <h3>Sauna</h3>
                        <p>Fasilitas sauna untuk membantu relaksasi dan detoksifikasi setelah berolahraga.</p>
                    </div>
                </div>

                <div class="facility-card">
                    <img src="Locker-room.jpg" alt="Ruang Ganti" class="facility-image">
                    <div class="facility-info">
                        <h3>Ruang Ganti</h3>
                        <p>Ruang ganti dan loker yang bersih dan aman untuk kenyamanan Anda.</p>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <footer>
        <p>© 2024 FitLife Fitness. Hak Cipta Dilindungi.</p>
    </footer>
</body>
</html>