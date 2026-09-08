<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profil Pengguna - FitLife Gym</title>

    <!-- Pastikan link CSS di-load dari folder public -->
    <link rel="stylesheet" href="{{ asset('font-profile.css') }}">
    <link rel="stylesheet" href="{{ asset('font2-profile.css') }}">
    <link rel="stylesheet" href="{{ asset('Home.css') }}">
    <link rel="stylesheet" href="{{ asset('Profile.css') }}">

  
</head>
<body>
    <div class="overlay"></div>
    <!-- Navbar -->
    <nav>
        <div class="navbar-content">
            <a href="{{ url('/') }}" class="navbar-brand">FitLife Gym</a>
            <ul class="navbar-nav">
                <li class="nav-item"><a href="{{ url('/') }}" class="nav-link">Home</a></li>
                <li class="nav-item"><a href="{{ url('/Kelas') }}" class="nav-link">Kelas</a></li>
                <li class="nav-item"><a href="{{ url('/Fasilitas') }}" class="nav-link">Fasilitas</a></li>
                <li class="nav-item"><a href="{{ url('/Trainer') }}" class="nav-link">Trainer</a></li>
                <li class="nav-item"><a href="{{ url('/Profile') }}" class="nav-link active">Profile</a></li>
            </ul>
        </div>
    </nav>

    <!-- USER PROFILE -->
    <main>
        <section class="user-profile">
            <div class="container">
                <div class="profile-card">
                    <img src="{{ asset('profile.jpg') }}" class="profile-img" alt="User Picture">
                    <div class="profile-info">
                        <h2>Halo, {{ Auth::user()->name }}</h2>
                       <!-- <span>{{ Auth::user()->membership_type ?? 'Belum ada Membership' }}</span> -->
                        <p>ID Anggota: {{ Auth::user()->id }}</p>
                    </div>
                </div>

                <!-- Membership Details -->
                <div class="membership-details">
                    <h4>Membership Termasuk:</h4>
                    <ul class="membership-features">
                        <li>Akses Gym 24 Jam</li>
                        <li>Gratis Konsultasi</li>
                        <li>Loker Pribadi</li>
                    </ul>
                </div>

                <!-- Account Settings -->
                <div class="account-settings">
                    <h4>Pengaturan Akun</h4>
                    <ul class="settings-options">
                        <li><a href="{{ url('/Absensi') }}">Absensi</a></li>
                        <li>
                            <form action="{{ route('logout') }}" method="POST">
                                @csrf
                                <button type="submit" class="logout-button">Logout</button>
                            </form>
                        </li>
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