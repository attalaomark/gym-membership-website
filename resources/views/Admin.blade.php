<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Admin | FitLife Gym</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="Admin.css">
</head>
<body>
    <nav class="navbar">
        <div class="container navbar-content">
            <a href="#" class="navbar-brand">Admin | FitLife Gym</a>
            <ul class="navbar-nav">
                <li class="nav-item"><a href="#" class="nav-link active"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                <li class="nav-item"><a href="#" class="nav-link"><i class="fas fa-users"></i> Anggota</a></li>
                <li class="nav-item"><a href="#" class="nav-link"><i class="fas fa-dumbbell"></i> Kelas</a></li>
                <li class="nav-item"><a href="#" class="nav-link"><i class="fas fa-user-tie"></i> Trainer</a></li>
                <li class="nav-item"><a href="#" class="nav-link"><i class="fas fa-cog"></i> Pengaturan</a></li>
                <li class="nav-item"><a href="{{ url('/') }}" class="nav-link"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
            </ul>
        </div>
    </nav>

    <main class="admin-dashboard">
        <div class="container">
            <div class="dashboard-card">
                <div class="dashboard-header">
                    <h2>Dashboard Admin</h2>
                </div>
                <div class="stats-container">
                    <div class="stat-card">
                        <h3>500</h3>
                        <p>Total Member</p>
                    </div>
                    <div class="stat-card">
                        <h3>50</h3>
                        <p>Member Baru Bulan Ini</p>
                    </div>
                    <div class="stat-card">
                        <h3>10</h3>
                        <p>Kelas Aktif</p>
                    </div>
                    <div class="stat-card">
                        <h3>15</h3>
                        <p>Total Trainer</p>
                    </div>
                </div>
                <div class="member-list-container">
                    <h4>Daftar Member</h4>
                    <button id="addMemberBtn" class="action-btn edit-btn">Tambah Member</button>
                    <table class="member-list">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nama</th>
                                <th>Email</th>
                                <th>Tipe Membership</th>
                                <th>Tanggal Bergabung</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody id="memberTableBody">
                            <!-- Member data will be inserted here -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>

    <footer>
        <p>&copy; 2024 FitLife Gym. Hak Cipta Dilindungi.</p>
    </footer>

    <!-- Modal for adding/editing member -->
    <div id="memberModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2 id="modalTitle">Tambah Member Baru</h2>
            <form id="memberForm">
                <input type="hidden" id="memberId">
                <label for="memberName">Nama:</label>
                <input type="text" id="memberName" required>
                <label for="memberEmail">Email:</label>
                <input type="email" id="memberEmail" required>
                <label for="membershipType">Tipe Membership:</label>
                <select id="membershipType" required>
                    <option value="Monthly">Monthly</option>
                    <option value="Yearly">Yearly</option>
                    <option value="Pay As You Go">Pay As You Go</option>
                </select>
                <label for="joinDate">Tanggal Bergabung:</label>
                <input type="date" id="joinDate" required>
                <button type="submit" class="action-btn edit-btn">Simpan</button>
            </form>
        </div>
    </div>

    <script src="admin.js"></script>
</body>
</html>