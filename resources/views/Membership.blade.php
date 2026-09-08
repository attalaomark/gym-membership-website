<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Membership - FitLife Gym</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Membership.css">
</head>
<body>
    <div class="overlay"></div>
    <nav>
        <div class="navbar-content">
            <a href="#" class="navbar-brand">FitLife Gym</a>
            <ul class="navbar-nav">
                <li class="nav-item"><a href="{{ url('/') }}" class="nav-link">Home</a></li>
                <li class="nav-item"><a href="{{ url('/Kelas') }}" class="nav-link">Kelas</a></li>
                <li class="nav-item"><a href="{{ url('/Fasilitas') }}" class="nav-link">Fasilitas</a></li>
                <li class="nav-item"><a href="{{ url('/Membership') }}" class="nav-link active">Membership</a></li>
                <li class="nav-item"><a href="{{ url('/Profile') }}" class="nav-link">Profile</a></li>
                <li class="nav-item"><a href="{{ url('/Login') }}" class="nav-link">Login/Register</a></li>
            </ul>
        </div>
    </nav>

    <header>
        <h1>FitLife Gym Membership</h1>
        <p>Pilih Paket yang Sesuai dengan Kebutuhan Anda</p>
    </header>

    <main>
        <div class="container">
            <div class="membership-info">
                <h2>Pilihan Membership FitLife Gym</h2>
                <p>Kami menawarkan berbagai pilihan membership yang fleksibel untuk memenuhi kebutuhan dan gaya hidup Anda. Pilih paket yang paling sesuai dengan tujuan kebugaran Anda.</p>
            </div>

            <div class="membership-cards">
                <div class="card">
                    <h3>Pay as You Go</h3>
                    <p class="price">Rp 50.000/Kedatangan</p>
                    <ul>
                        <li>Akses gym sekali kedatangan</li>
                        <li>Konsultasi fitness dengan biaya tambahan</li>
                        <li>Bayar hanya saat datang</li>
                        <li>Cocok untuk pengunjung sesekali</li>
                    </ul>
                    <button class="select-button">Pilih Paket</button>
                </div>
                <div class="card">
                    <h3>Monthly</h3>
                    <p class="price">Rp 350.000/Bulan</p>
                    <ul>
                        <li>Akses gym 24/7</li>
                        <li>Konsultasi fitness gratis</li>
                        <li>Loker pribadi</li>
                        <li>Akses ke kelas grup terbatas</li>
                    </ul>
                    <button class="select-button">Pilih Paket</button>
                </div>
                <div class="card">
                    <h3>Yearly</h3>
                    <p class="price">Rp 1.250.000/Tahun</p>
                    <ul>
                        <li>Semua fitur Monthly</li>
                        <li>Diskon 15% untuk personal trainer</li>
                        <li>Gratis suplemen satu bulan</li>
                        <li>Akses penuh ke semua kelas grup</li>
                    </ul>
                    <button class="select-button">Pilih Paket</button>
                </div>
            </div>

            <div class="membership-info">
                <h2>Keuntungan Menjadi Anggota FitLife Gym</h2>
                <ul>
                    <li>Akses ke peralatan fitness modern dan berkualitas tinggi</li>
                    <li>Kelas-kelas grup yang bervariasi dan menyenangkan</li>
                    <li>Trainer profesional yang siap membantu Anda</li>
                    <li>Lingkungan yang mendukung dan memotivasi</li>
                    <li>Program nutrisi dan konsultasi gaya hidup sehat</li>
                </ul>
            </div>
        </div>
    </main>

    <div id="registrationModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Form Pendaftaran & Pembayaran</h2>
            <form id="registrationForm">
                <h3>Data Pribadi</h3>
                <div class="form-group">
                    <label for="fullName">Nama Lengkap</label>
                    <input type="text" id="fullName" name="fullName" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="phone">Nomor Telepon</label>
                    <input type="tel" id="phone" name="phone" required>
                </div>

                <h3>Detail Pembayaran</h3>
                <div class="form-group">
                    <label for="cardHolderName">Nama Pemilik Kartu</label>
                    <input type="text" id="cardHolderName" name="cardHolderName" required>
                </div>
                <div class="form-group">
                    <label for="bankName">Nama Bank</label>
                    <input type="text" id="bankName" name="bankName" required>
                </div>
                <div class="form-group">
                    <label for="cardNumber">Nomor Kartu (16 digit)</label>
                    <input type="number" id="cardNumber" name="cardNumber" required minlength="16" maxlength="16">
                </div>

                <div class="form-group checkbox-group">
                    <input type="checkbox" id="terms" name="terms" required>
                    <label for="terms">Saya setuju dengan syarat dan ketentuan</label>
                </div>

                <button type="submit" class="form-submit">Daftar Sekarang</button>
            </form>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 FitLife Gym. Hak Cipta Dilindungi.</p>
    </footer>

    <script src="Membership.js"></script>
</body>
</html>