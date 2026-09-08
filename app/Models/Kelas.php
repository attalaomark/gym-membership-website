<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kelas extends Model
{
    use HasFactory;

    protected $table = 'kelas'; // Your table name
    protected $primaryKey = 'id_kelas';
    protected $fillable = [
        'id_admin',
        'id_pelatih',
        'nama_kelas',
        'waktu_mulai',
        'waktu_berakhir',
        'aktivitas',
        'tanggal',
        'slot',
    ];
    public function admin()
    {
        return $this->belongsTo(Admin::class, 'id_admin');
    }

    public function pelatih()
    {
        return $this->belongsTo(Pelatih::class, 'id_pelatih');
    }
    // Define any relationships if necessary
}
