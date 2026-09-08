@extends('layouts.admin')

@section('content')
<main class="admin-dashboard">
    <div class="container">
        <h2>Edit Trainer: {{ $trainer->nama_pertama }} {{ $trainer->nama_akhir }}</h2>
        <form action="{{ route('admin.trainers.update', $trainer->id_pelatih) }}" method="POST">
            @csrf
            <label for="nama_pertama">Nama Depan:</label>
            <input type="text" name="nama_pertama" id="nama_pertama" value="{{ $trainer->nama_pertama }}" required>
            
            <label for="nama_akhir">Nama Belakang:</label>
            <input type="text" name="nama_akhir" id="nama_akhir" value="{{ $trainer->nama_akhir }}" required>
            
            <label for="email">Email:</label>
            <input type="email" name="email" id="email" value="{{ $trainer->email }}" required>
            
            <label for="password">Password (Opsional):</label>
            <input type="password" name="password" id="password">

            <button type="submit" class="btn btn-primary">Simpan Perubahan</button>
            <a href="{{ route('admin.trainers') }}" class="btn btn-secondary">Batal</a>
        </form>
    </div>
</main>
@endsection
