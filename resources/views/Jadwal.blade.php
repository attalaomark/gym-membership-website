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
        }

        .section-title h2 {
            color: var(--light-color);
            font-size: 36px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            text-align: center;
            margin-bottom: 30px;
        }

        .timetable-controls {
            text-align: center;
            margin-bottom: 30px;
        }

        .timetable-controls ul {
            display: inline-block;
            padding: 0;
        }

        .timetable-controls ul li {
            list-style: none;
            font-size: 18px;
            font-weight: bold;
            text-transform: uppercase;
            color: var(--highlight-color);
            display: inline-block;
            cursor: pointer;
            position: relative;
            text-decoration: underline;
        }

        .timetable-controls ul li.active {
            color: var(--highlight-color);
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

        /* Hover effect for schedule items */
        .classtime-table table tbody tr td.hover-bg {
            transition: background-color 0.3s ease;
        }

        /* Hover effect: Aktif jika kelas belum dipesan */
        .classtime-table table tbody tr td.hover-bg:hover:not(.booked),
        .classtime-table table tbody tr td.active:not(.booked) {
            background-color: var(--highlight-color); /* Warna highlight */
            cursor: pointer;
        }

        /* Warna untuk kelas yang sudah dipesan (booked) */
        .classtime-table table tbody tr td.booked {
            background-color: green; /* Warna hijau untuk kelas booked */
            color: var(--light-color); /* Teks menjadi putih */
        }

        .classtime-table table tbody tr td.booked h6,
        .classtime-table table tbody tr td.booked span {
            color: var(--light-color); /* Warna teks jadi putih */
        }

        /* Centang untuk kelas yang sudah di-booking */
        .booked::after {
            content: '\f00c'; /* Unicode untuk centang dari Font Awesome */
            font-family: "Font Awesome 5 Free";
            font-weight: 900;
            color: white;
            display: inline-block;
            margin-left: 8px;
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
    <div class="row">
    <div class="classtime-table">
        <table>
            <thead>
                <tr>
                    <th></th>
                    <th>MONDAY</th>
                    <th>TUESDAY</th>
                    <th>WEDNESDAY</th>
                    <th>THURSDAY</th>
                    <th>FRIDAY</th>
                    <th>SATURDAY</th>
                    <th>SUNDAY</th>
                </tr>
            </thead>
            <tbody>
                <!-- Jadwal Pagi -->
                <tr>
                    <td class="workout-time">10.00</td>
                    <td class="hover-bg ts-item" id="cardio-monday" onclick="bookClass('cardio-monday')">
                        <span>10.00 - 14.00</span>
                        <h6>CARDIO</h6>
                    </td>
                    <td></td>
                    <td class="hover-bg ts-item" id="cardio-wednesday" onclick="bookClass('cardio-wednesday')">
                        <span>10.00 - 15.00</span>
                        <h6>CARDIO</h6>
                    </td>
                    <td></td>
                    <td class="hover-bg ts-item" id="pilates-friday" onclick="bookClass('pilates-friday')">
                        <span>10.00 - 13.00</span>
                        <h6>PILATES</h6>
                    </td>
                    <td></td>
                    <td class="hover-bg ts-item" id="pilates-sunday" onclick="bookClass('pilates-sunday')">
                        <span>10.00 - 13.30</span>
                        <h6>PILATES</h6>
                    </td>
                </tr>
                <!-- Jadwal Siang -->
                <tr>
                    <td class="workout-time">14.00</td>
                    <td></td>
                    <td class="hover-bg ts-item" id="pilates-tuesday" onclick="bookClass('pilates-tuesday')">
                        <span>14.00 - 17.00</span>
                        <h6>PILATES</h6>
                    </td>
                    <td></td>
                    <td class="hover-bg ts-item" id="cardio-thursday" onclick="bookClass('cardio-thursday')">
                        <span>14.00 - 17.00</span>
                        <h6>CARDIO</h6>
                    </td>
                    <td></td>
                    <td class="hover-bg ts-item" id="yoga-saturday" onclick="bookClass('yoga-saturday')">
                        <span>14.00 - 15.30</span>
                        <h6>YOGA</h6>
                    </td>
                    <td></td>
                </tr>
                <!-- Jadwal Sore -->
                <tr>
                    <td class="workout-time">16.00</td>
                    <td class="hover-bg ts-item" id="pilates-monday" onclick="bookClass('pilates-monday')">
                        <span>16.00 - 18.00</span>
                        <h6>PILATES</h6>
                    </td>
                    <td></td>
                    <td class="hover-bg ts-item" id="hitt-wednesday" onclick="bookClass('hitt-wednesday')">
                        <span>16.00 - 19.00</span>
                        <h6>HITT</h6>
                    </td>
                    <td></td>
                    <td class="hover-bg ts-item" id="hitt-thursday" onclick="bookClass('hitt-thursday')">
                        <span>16.00 - 19.00</span>
                        <h6>HITT</h6>
                    </td>
                    <td class="hover-bg ts-item" id="yoga-saturday" onclick="bookClass('yoga-saturday')">
                        <span>16.00 - 17.00</span>
                        <h6>YOGA</h6>
                    </td>
                    <td class="hover-bg ts-item" id="cardio-sunday" onclick="bookClass('cardio-sunday')">
                        <span>16.00 - 20.00</span>
                        <h6>CARDIO</h6>
                    </td>
                </tr>
                <!-- Jadwal Malam -->
                <tr>
                    <td class="workout-time">18.00</td>
                    <td class="hover-bg ts-item" id="yoga-monday" onclick="bookClass('yoga-monday')">
                        <span>18.00 - 20.00</span>
                        <h6>YOGA</h6>
                    </td>
                    <td class="hover-bg ts-item" id="yoga-tuesday" onclick="bookClass('yoga-tuesday')">
                        <span>18.00 - 20.00</span>
                        <h6>YOGA</h6>
                    </td>
                    <td></td>
                    <td class="hover-bg ts-item" id="hitt-thursday" onclick="bookClass('hitt-thursday')">
                        <span>18.00 - 22.00</span>
                        <h6>HITT</h6>
                    </td>
                    <td></td>
                    <td class="hover-bg ts-item" id="cardio-saturday" onclick="bookClass('cardio-saturday')">
                        <span>18.00 - 22.00</span>
                        <h6>CARDIO</h6>
                    </td>
                    <td></td>
                </tr>
                <!-- Jadwal Malam Lanjut -->
                <tr>
                    <td class="workout-time">20.00</td>
                    <td class="hover-bg ts-item" id="pilates-monday-night" onclick="bookClass('pilates-monday-night')">
                        <span>21.00 - 23.00</span>
                        <h6>PILATES</h6>
                    </td>
                    <td class="hover-bg ts-item" id="yoga-tuesday-night" onclick="bookClass('yoga-tuesday-night')">
                        <span>20.00 - 22.00</span>
                        <h6>YOGA</h6>
                    </td>
                    <td class="hover-bg ts-item" id="yoga-wednesday-night" onclick="bookClass('yoga-wednesday-night')">
                        <span>20.30 - 23.00</span>
                        <h6>YOGA</h6>
                    </td>
                    <td></td>
                    <td class="hover-bg ts-item" id="cardio-friday-night" onclick="bookClass('cardio-friday-night')">
                        <span>22.00 - 23.00</span>
                        <h6>CARDIO</h6>
                    </td>
                    <td></td>
                    <td class="hover-bg ts-item" id="cardio-sunday-night" onclick="bookClass('cardio-sunday-night')">
                        <span>21.00 - 23.00</span>
                        <h6>CARDIO</h6>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    </main>

    <footer>
        <p>&copy; 2009 FitLife Gym. All rights reserved.</p>
    </footer>

    <script>
        // JavaScript untuk toggle booking (ubah warna ke hijau saat diklik)
        document.addEventListener('DOMContentLoaded', function() {
            const scheduleItems = document.querySelectorAll('.hover-bg');

            scheduleItems.forEach(item => {
                // Hover effect
                item.addEventListener('mouseenter', function() {
                    this.classList.add('active');
                });

                item.addEventListener('mouseleave', function() {
                    this.classList.remove('active');
                });

                // Click event untuk booking
                item.addEventListener('click', function() {
                    this.classList.toggle('booked');  // Tambahkan class 'booked'
                });
            });
        });
    </script>
</body>
</html>
