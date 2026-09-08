@extends('layouts.admin')

@section('content')
<main class="admin-dashboard">
    <div class="container">
        <h2>Edit Kelas: {{ $class->nama_kelas }}</h2>
        <form action="{{ route('admin.classes.update', $class->id_kelas) }}" method="POST">
            @csrf
            <label for="nama_kelas">Nama Kelas:</label>
            <input type="text" name="nama_kelas" id="nama_kelas" value="{{ $class->nama_kelas }}" required>
            
            <label for="id_pelatih">Pelatih:</label>
            <select name="id_pelatih" id="id_pelatih" required>
            <option value="Pilih Pelatih">Pilih Pelatih</option>
                @foreach($trainers as $trainer)
                
                    <option value="{{ $trainer->id_pelatih }}" {{ $trainer->id_pelatih == $class->id_pelatih ? 'selected' : '' }}>
                        {{ $trainer->nama_pertama }} {{ $trainer->nama_akhir }}
                    </option>
                @endforeach
            </select>

            <label for="waktu_mulai">Waktu Mulai:</label>
            <input type="time" name="waktu_mulai" id="waktu_mulai" value="{{ $class->waktu_mulai }}" required>

            <label for="waktu_berakhir">Waktu Berakhir:</label>
            <input type="time" name="waktu_berakhir" id="waktu_berakhir" value="{{ $class->waktu_berakhir }}" required>

            <label for="tanggal">Tanggal:</label>
            <input type="date" name="tanggal" id="tanggal" value="{{ $class->tanggal }}" required>

            <label for="slot">Slot:</label>
            <input type="number" name="slot" id="slot" value="{{ $class->slot }}" required>

            <button type="submit" class="btn btn-primary">Simpan Perubahan</button>
            <a href="{{ route('admin.classes') }}" class="btn btn-secondary">Batal</a>
        </form>
    </div>
</main>
@endsection
