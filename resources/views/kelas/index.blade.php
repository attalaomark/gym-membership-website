<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jadwal Kelas - FitLife Gym</title>

    <!-- Include Poppins Font and Font Awesome for icons -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <!-- Include Custom CSS for Schedule -->
    <link rel="stylesheet" href="assets/css/jadwal.css">

    <style>
        /* Root Variables */
        :root {
            --primary-color: #e74c3c;
            --secondary-color: #444444;
            --light-color: #ffffff;
            --dark-color: #333333;
            --gray-color: rgba(0, 0, 0, 0.1);
            --highlight-color: #ff0000;
            --table-bg-color: #222222;
            --table-border-color: #333333;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #1a1a1a;
            color: var(--light-color);
            line-height: 1.6;
            min-height: 100vh;
        }

        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7); /* Dark overlay */
            z-index: -1;
        }

        /* Navbar */
        .navbar {
            background-color: rgba(68, 68, 68, 0.8);
            padding: 1rem 0;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }

        .navbar-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 1rem;
        }

        .navbar-brand {
            color: #fff;
            font-size: 1.5rem;
            font-weight: 700;
            text-decoration: none;
        }

        .navbar ul {
            display: flex;
            list-style: none;
            margin: 0;
        }

        .navbar ul li {
            margin-left: 1.5rem;
        }

        .navbar ul li a {
            color: #fff;
            text-decoration: none;
            padding: 5px 10px;
            transition: background-color 0.3s;
        }

        .navbar ul li a:hover,
        .navbar ul li a.active {
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 3px;
        }

        /* Main Content Padding for Navbar */
        main {
            padding-top: 120px; /* Tambahkan padding agar konten tidak tertutup navbar */
        }

        .classtime-section {
            background: #1a1a1a;
            text-align: center;
        }

        .section-title h1 {
            color: var(--light-color);
            font-size: 36px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            text-align: center;
            margin-bottom: 30px;
        }

        .classtime-table table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 1px;
            background: var(--table-bg-color);
        }

        .classtime-table table thead tr th {
            font-size: 16px;
            color: #ffffff;
            font-weight: bold;
            text-transform: uppercase;
            padding: 15px 10px;
            background-color: var(--table-bg-color);
            border-bottom: 1px solid var(--table-border-color);
        }

        .classtime-table table tbody tr td {
            text-align: center;
            padding: 15px 10px;
            background-color: var(--table-bg-color);
            border-bottom: 1px solid var(--table-border-color);
            border-right: 1px solid var(--table-border-color);
        }

        .classtime-table table tbody tr td:first-child {
            font-weight: bold;
            color: #ffffff;
        }

        .classtime-table table tbody tr td span {
            font-size: 14px;
            color: #ffffff;
            display: block;
            margin-bottom: 5px;
        }

        .classtime-table table tbody tr td h6 {
            color: var(--highlight-color);
            font-size: 14px;
            font-weight: 500;
            text-transform: uppercase;
            margin: 0;
        }

        footer {
            background-color: rgba(51, 51, 51, 0.9);
            color: #fff;
            text-align: center;
            padding: 1rem;
            margin-top: auto;
        }
    </style>
</head>
<body>
    <div class="overlay"></div>

    <!-- Navbar -->
    <nav class="navbar">
        <div class="navbar-content">
            <a href="#" class="navbar-brand">FitLife Gym</a>
            <ul>
                <li class="nav-item"><a href="{{ url('/') }}" class="nav-link">Home</a></li>
                <li class="nav-item"><a href="{{ url('/Kelas') }}" class="nav-link active">Kelas</a></li>
                <li class="nav-item"><a href="{{ url('/Fasilitas') }}" class="nav-link">Fasilitas</a></li>
                <li class="nav-item"><a href="{{ url('/Membership') }}" class="nav-link">Membership</a></li>
                <li class="nav-item"><a href="{{ url('/Login') }}" class="nav-link">Login/Sign Up</a></li>
            </ul>
        </div>
    </nav>

    <main>
        <div class="classtime-section">
            <h1 class="section-title">Jadwal Kelas Gym</h1>

            <div class="classtime-table">
                <table>
                    <thead>
                        <tr>
                            <th>Waktu</th>
                            <th>Senin</th>
                            <th>Selasa</th>
                            <th>Rabu</th>
                            <th>Kamis</th>
                            <th>Jumat</th>
                            <th>Sabtu</th>
                            <th>Minggu</th>
                        </tr>
                    </thead>
                    <tbody>
                    @for ($hour = 10; $hour <= 20; $hour += 2)
                    <tr>
    <td>{{ $hour }}:00</td>
    @foreach (['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'] as $day)
        <td>
            @foreach ($kelas as $k)
                @if (date('l', strtotime($k->tanggal)) == $day && date('H', strtotime($k->waktu_mulai)) == $hour)
                    <h6>{{ $k->nama_kelas }}</h6>
                    <span>{{ $k->aktivitas }}</span>
                    <span>{{ $k->waktu_mulai }} - {{ $k->waktu_berakhir }}</span>
                    
                    <!-- Booking Form -->
                    <form action="{{ route('pemesanan.store') }}" method="POST">
                        @csrf
                        <!--<input type="text" name="nama_anggota" placeholder="Nama" required>
                        <input type="email" name="email_anggota" placeholder="Email" required>
                        -->
                        <input type="hidden" name="check_in" value="{{ now() }}"> 
                        <input type="hidden" name="id_kelas" value="{{ $k->id_kelas }}">
                        <input type="hidden" name="id_anggota" placeholder="ID" value="{{Auth::user()->id}}" required>
                        <button type="submit" class="btn btn-primary">Book</button>
                    </form>
                @endif
            @endforeach
        </td>
    @endforeach
</tr>

@endfor

                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <footer>
        <p>&copy; 2009 FitLife Gym. All rights reserved.</p>
    </footer>
</body>
</html>
