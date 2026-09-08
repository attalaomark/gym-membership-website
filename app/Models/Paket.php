<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Paket extends Model
{
    protected $table = 'paket';
    protected $primaryKey = 'id_paket';

    protected $fillable = [
        'harga', 'deskripsi', 'durasi',
    ];

    public function anggota()
    {
        return $this->hasMany(Anggota::class, 'id_paket');
    }
}