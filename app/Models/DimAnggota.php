<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DimAnggota extends Model
{
    use HasFactory;

    protected $table = 'anggota';
    protected $fillable = [
        'nama_anggota', 'email', 'tanggal_mulai', 'tanggal_berhenti', 'id_paket','id_anggota','sk_anggota'
    ];

    // Relasi ke tabel 'Paket'
    public function paket()
    {
        return $this->belongsTo(Paket::class, 'id_paket');
    }

    // Relasi ke tabel 'Pemesanan'
    public function pemesanan()
    {
        return $this->hasMany(Pemesanan::class, 'id_anggota');
    }

    // Relasi ke tabel 'Pembayaran'
    public function pembayaran()
    {
        return $this->hasMany(Pembayaran::class, 'id_anggota');
    }
}
