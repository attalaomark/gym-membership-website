@extends('layouts.admin')

@section('content')
<main class="admin-dashboard">
    <div class="container">
        <h2>Tambah Kelas Baru</h2>
        <form action="{{ route('admin.classes.store') }}" method="POST">
            @csrf
            <label for="nama_kelas">Nama Kelas:</label>
            <input type="text" name="nama_kelas" id="nama_kelas" required>
            
            <label for="id_pelatih">Pelatih:</label>
            <select name="id_pelatih" id="id_pelatih" required>
                <option value="Pilih Pelatih">Pilih Pelatih</option>
                @foreach($trainers as $trainer)
                    <option value="{{ $trainer->id_pelatih}}">{{ $trainer->nama_pertama }} {{ $trainer->nama_akhir }}</option>
                @endforeach
            </select>

            <label for="waktu_mulai">Waktu Mulai:</label>
            <input type="time" name="waktu_mulai" id="waktu_mulai" required>

            <label for="waktu_berakhir">Waktu Berakhir:</label>
            <input type="time" name="waktu_berakhir" id="waktu_berakhir" required>

            <label for="tanggal">Tanggal:</label>
            <input type="date" name="tanggal" id="tanggal" required>

            <label for="slot">Slot:</label>
            <input type="number" name="slot" id="slot" required>

            <button type="submit" class="btn btn-primary">Simpan</button>
        </form>
    </div>
</main>
@endsection
