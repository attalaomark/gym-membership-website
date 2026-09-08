@extends('layouts.admin')

@section('content')
<style>
    .trainer-list {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    .trainer-list th, .trainer-list td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }
    .trainer-list th {
        background-color: #f2f2f2;
        font-weight: bold;
    }
    .trainer-list tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    .trainer-list tr:hover {
        background-color: #f5f5f5;
    }
</style>

<main class="admin-dashboard">
    <div class="container">
        <div class="dashboard-card">
            <div class="dashboard-header">
                <h2>Daftar Trainer</h2>
                <a href="{{ route('admin.trainers.create') }}" class="btn btn-primary">Tambah Trainer</a>
            </div>
            <table class="trainer-list">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nama</th>
                        <th>Email</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($trainers as $trainer)
                    <tr>
                        <td>{{ $trainer->id_pelatih }}</td>
                        <td>{{ $trainer->nama_pertama }} {{ $trainer->nama_akhir }}</td>
                        <td>{{ $trainer->email }}</td>
                        <td>
                            <a href="{{ route('admin.trainers.edit', $trainer->id_pelatih) }}" class="btn btn-warning">Edit</a>
                            <form action="{{ route('admin.trainers.delete', $trainer->id_pelatih) }}" method="POST" style="display:inline-block;">
                                @csrf
                                <button type="submit" class="btn btn-danger" onclick="return confirm('Yakin ingin menghapus trainer ini?')">Hapus</button>
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

