<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Dashboard Admin | FitLife Gym</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- Custom CSS -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

    <link rel="stylesheet" href="{{ asset('Admin.css') }}">



</head>
<body>

    <nav class="navbar">
        <div class="container navbar-content">
            <a href="#" class="navbar-brand">Admin | FitLife Gym</a>
            <ul class="navbar-nav">
                <li class="nav-item"><a href="{{ route('admin.dashboard') }}" class="nav-link {{ Request::is('admin') ? 'active' : '' }}"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                <li class="nav-item"><a href="{{ route('admin.booking') }}" class="nav-link {{ Request::is('admin/booking') ? 'active' : '' }}"><i class="fas fa-users"></i> Pemesanan Kelas</a></li>
                <li class="nav-item"><a href="{{ route('admin.classes') }}" class="nav-link {{ Request::is('admin/classes') ? 'active' : '' }}"><i class="fas fa-dumbbell"></i> Kelas</a></li>
                <li class="nav-item"><a href="{{ route('admin.trainers') }}" class="nav-link {{ Request::is('admin/trainers') ? 'active' : '' }}"><i class="fas fa-user-tie"></i> Trainer</a></li>
                <li class="nav-item">
                    <form action="{{ route('logout') }}" method="POST" style="display:inline;">
                        @csrf
                        <button type="submit" class="nav-link"><i class="fas fa-sign-out-alt"></i> Logout</button>
                    </form>
                </li>
            </ul>
        </div>
    </nav>

    @yield('content')

    <footer>
        <p>&copy; 2024 FitLife Gym. Hak Cipta Dilindungi.</p>
    </footer>

    @yield('modals')

    <!-- Bootstrap JS dan jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="{{ asset('assets/js/admin.js') }}"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

    @yield('scripts')
</body>
</html>
