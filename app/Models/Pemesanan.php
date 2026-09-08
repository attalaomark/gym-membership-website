<?php

// app/Models/Pemesanan.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pemesanan extends Model
{
    protected $table = 'pemesanan';
    protected $fillable = [
        'id_pemesanan',
        'id_anggota',
        'id_kelas',
        'check_in',
        'absensi',
    ];

    // Relasi ke tabel 'Anggota' (Many-to-One)
    public function anggota()
    {
        return $this->belongsTo(Anggota::class, 'id_anggota');
    }

    // Relasi ke tabel 'Kelas' (Many-to-One)
    public function kelas()
    {
        return $this->belongsTo(Kelas::class, 'id_kelas');
    }
}
