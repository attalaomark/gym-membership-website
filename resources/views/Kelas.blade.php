<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kelas - FitLife Gym</title>
    <!-- FontAwesome for icons -->
    <link rel="stylesheet" href="font-profile.css">
    <link rel="stylesheet" href="font2-profile.css">
    <link rel="stylesheet" href="Kelas.css">
</head>
<body>
  <div class="overlay"></div>
</body>
<body>
    <header>
        <h1>Kelas FitLife Gym</h1>
        <p>Jadwal Kelas yang tersedia di FitLife Gym</p>
    </header>

    <nav>
        <div class="navbar-content">
            <a href="{{ url('/') }}" class="navbar-brand">FitLife Gym</a>
            <ul class="navbar-nav">
                <li class="nav-item"><a href="{{ url('/') }}" class="nav-link">Home</a></li>
                <li class="nav-item"><a href="{{ url('/Kelas') }}" class="nav-link active">Kelas</a></li>
                <li class="nav-item"><a href="{{ url('/Fasilitas') }}" class="nav-link">Fasilitas</a></li>
                <li class="nav-item"><a href="{{ url('/Membership') }}" class="nav-link">Membership</a></li>
                <li class="nav-item"><a href="{{ url('/Profile') }}" class="nav-link">Profile</a></li>
                <li class="nav-item"><a href="{{ url('/Login') }}" class="nav-link">Login/Register</a></li>
            </ul>
        </di>
    </nav>

    <main>
        <section class="classes">
            <h2>Kelas FitLife Gym</h2>
            <p>Kami menawarkan berbagai macam kelas kebugaran untuk memenuhi kebutuhan Anda. Dari yoga yang menenangkan hingga latihan intensif seperti HIIT, semua kelas kami dipandu oleh pelatih profesional.</p>
            
            <div class="class-cards">
                <div class="card">
                    <h3><a href="{{ url('/Jadwal') }}"><strong>Yoga</strong></a></h3>
                    <p>Yoga membantu meningkatkan fleksibilitas, keseimbangan, dan ketenangan pikiran. Cocok untuk semua tingkat keahlian.</p>
                    <p><strong>Instruktor</strong> Alice Lee</p>
                </div>
                
                <div class="card">
                    <h3><a href="{{ url('/Jadwal') }}"><strong>HIIT (High-Intensity Interval Training)</strong></a></h3>
                    <p>Latihan interval intens ini membakar kalori dalam waktu singkat. Sangat cocok bagi yang ingin meningkatkan stamina dan kebugaran.</p>
                    <p><strong>Instruktor</strong> Elizabeth Swan</p>
                </div>
                
                <div class="card">
                    <h3><a href="{{ url('/Jadwal') }}"><strong>Pilates</strong></a></h3>
                    <p>Olahraga atau latihan fisik yang berfokus dalam menciptakan kekuatan fisik melalui keseimbangan otot-otot tubuh dan pola neuromuskular.</p>
                    <p><strong>Instruktor</strong> John Doe</p>
                </div>
                
                <div class="card">
                    <h3><a href="{{ url('/Jadwal') }}"><strong>Cardio</strong></a></h3>
                    <p>Latihan kekuatan menggunakan barbel ringan dengan repetisi tinggi untuk membentuk otot dan meningkatkan ketahanan tubuh.</p>
                    <p><strong>Instruktor</strong> Wayne Johnson</p>
                </div>
            </div>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 FitLife Gym. Hak Cipta Dilindungi.</p>
    </footer>
</body>
</html>
