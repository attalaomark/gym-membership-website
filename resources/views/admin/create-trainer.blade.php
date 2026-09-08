@extends('layouts.admin')

@section('content')
<main class="admin-dashboard">
    <div class="container">
        <h2>Tambah Trainer Baru</h2>
        <form action="{{ route('admin.trainers.store') }}" method="POST">
            @csrf
            <label for="nama_pertama">Nama Depan:</label>
            <input type="text" name="nama_pertama" id="nama_pertama" required>
            
            <label for="nama_akhir">Nama Belakang:</label>
            <input type="text" name="nama_akhir" id="nama_akhir" required>
            
            <label for="email">Email:</label>
            <input type="email" name="email" id="email" required>
            
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required>

            <button type="submit" class="btn btn-primary">Simpan</button>
        </form>
    </div>
</main>
@endsection
