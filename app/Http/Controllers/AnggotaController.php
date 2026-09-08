<?php

// app/Http/Controllers/AnggotaController.php

namespace App\Http\Controllers;

use App\Models\Anggota;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AnggotaController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'nama_pertama' => 'required|string|max:255',
            'email' => 'required|email|unique:anggota',
            'password' => 'required|string|min:8|confirmed',
        ]);

        $anggota = new Anggota();
        $anggota->nama_pertama = $request->input('nama_pertama');
        $anggota->nama_akhir = $request->input('nama_akhir');
        $anggota->email = $request->input('email');
        $anggota->password = Hash::make($request->input('password')); // Enkripsi password
        $anggota->save();

        return redirect('/login')->with('success', 'Registrasi berhasil. Silakan login.');
    }
}
