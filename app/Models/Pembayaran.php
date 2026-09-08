<?php

// app/Models/Pembayaran.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pembayaran extends Model
{
    protected $table = 'pembayaran';

    // Relasi ke tabel 'Anggota' (Many-to-One)
    public function anggota()
    {
        return $this->belongsTo(Anggota::class, 'id_anggota');
    }
}
