@extends('layouts.admin')

@section('content')
<main class="admin-dashboard">
    <div class="container">
        <div class="dashboard-card">
            <div class="dashboard-header">
                <h2>Tambah Anggota</h2>
            </div>
            <form action="{{ route('admin.storeMember') }}" method="POST">
                @csrf
                
                <div class="form-group">
                    <label for="nama_pertama">Nama Pertama:</label>
                    <input type="text" class="form-control" id="nama_pertama" name="nama_pertama" required>
                </div>

                <div class="form-group">
                    <label for="nama_akhir">Nama Akhir:</label>
                    <input type="text" class="form-control" id="nama_akhir" name="nama_akhir" required>
                </div>

                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>

                <div class="form-group">
                    <label for="membershipType">Tipe Membership:</label>
                    <select id="membershipType" name="id_paket" required>
                        <option value="">Pilih Tipe Membership</option>
                        @foreach($packages as $package)
                            <option value="{{ $package->id_paket }}">{{ $package->deskripsi }}</option>
                        @endforeach
                    </select>
                </div>

                <div class="form-group">
                    <label for="joinDate">Tanggal Bergabung:</label>
                    <input type="date" id="joinDate" name="tanggal_mulai" required>
                </div>

                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>

                <button type="submit" class="btn btn-primary">Tambah Anggota</button>
                <a href="{{ route('admin.dashboard') }}" class="btn btn-secondary">Batal</a>
            </form>
        </div>
    </div>
</main>
@endsection
