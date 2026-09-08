@extends('layouts.admin')

@section('content')
<style>
    .payment-list {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    .payment-list th, .payment-list td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }
    .payment-list th {
        background-color: #f2f2f2;
        font-weight: bold;
    }
    .payment-list tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    .payment-list tr:hover {
        background-color: #f5f5f5;
    }
</style>

<main class="admin-dashboard">
    <div class="container">
        <div class="dashboard-card">
            <div class="dashboard-header">
                <h2>History Pemesanan</h2>
            </div>
            <table class="payment-list">
                <thead>
                    <tr>
                        <th>ID Pemesanan</th>
                        <th>ID Anggota</th>
                        <th>ID Kelas</th>
                        <th>Created at</th>
                       
                    </tr>
                </thead>
                <tbody>
                    @foreach($booking as $bookings)
                    <tr>
                        <td>{{ $bookings->id_pemesanan }}</td>
                        <td>{{ $bookings->id_anggota }}</td>
                        <td>{{ $bookings->id_kelas }}</td>
                        <td>{{ $bookings->created_at }}</td>
                       
                        
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</main>
@endsection