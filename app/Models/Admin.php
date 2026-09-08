<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class Admin extends Authenticatable
{
    use Notifiable;

    protected $table = 'admin';
    protected $primaryKey = 'id_admin';

    protected $fillable = [
        'nama_pertama', 'nama_akhir', 'password', 'email',
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];

    public function kelas()
    {
        return $this->hasMany(Kelas::class, 'id_admin');
    }
}