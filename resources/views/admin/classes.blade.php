@extends('layouts.admin')

@section('content')
<style>
    .class-list {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    .class-list th, .class-list td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }
    .class-list th {
        background-color: #f2f2f2;
        font-weight: bold;
    }
    .class-list tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    .class-list tr:hover {
        background-color: #f5f5f5;
    }
</style>

<main class="admin-dashboard">
    <div class="container">
        <div class="dashboard-card">
            <div class="dashboard-header">
                <h2>Jadwal Kelas</h2>
                <a href="{{ route('admin.classes.create') }}" class="btn btn-primary">Tambah Kelas</a>
            </div>
            <table class="class-list">
                <thead>
                    <tr>
                        <th>Nama Kelas</th>
                        <th>Pelatih</th>
                        <th>Waktu Mulai</th>
                        <th>Waktu Berakhir</th>
                        <th>Tanggal</th>
                        <th>Slot</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($classes as $class)
                    <tr>
                        <td>{{ $class->nama_kelas }}</td>
                        <td>{{ $class->pelatih->nama_pertama }} {{ $class->pelatih->nama_akhir }}</td>
                        <td>{{ $class->waktu_mulai }}</td>
                        <td>{{ $class->waktu_berakhir }}</td>
                        <td>{{ $class->tanggal }}</td>
                        <td>{{ $class->slot }}</td>
                        <td>
                            <a href="{{ route('admin.classes.edit', $class->id_kelas) }}">Edit</a>
                            <form action="{{ route('admin.classes.delete', $class->id_kelas) }}" method="POST" style="display:inline-block;">
                                @csrf
                                <button type="submit" class="btn btn-danger" onclick="return confirm('Yakin ingin menghapus kelas ini?')">Hapus</button>
                            </form>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</main>
@endsection
