<?php
// app/Models/Anggota.php
namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class Anggota extends Authenticatable
{
    use Notifiable;

    protected $table = 'anggota';
    protected $primaryKey = 'id_anggota';
    protected $fillable = [
        'nama_pertama', 'nama_akhir', 'email', 'password', 'id_paket'
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
