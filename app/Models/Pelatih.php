<?php
// app/Models/Pelatih.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pelatih extends Model
{
    protected $table = 'pelatih';
    protected $primaryKey = 'id_pelatih';

    protected $fillable = [
        'nama_pertama', 'nama_akhir', 'password', 'email'
    ];

    public function kelas()
    {
        return $this->hasMany(Kelas::class, 'id_pelatih');
    }
}