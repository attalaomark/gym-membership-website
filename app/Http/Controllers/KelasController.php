<?php

namespace App\Http\Controllers;

use App\Models\Kelas;
use Illuminate\Http\Request;

class KelasController extends Controller
{
    public function index()
    {
        // Fetch all classes from the database
        $kelas = Kelas::all();

        return view('kelas.index', compact('kelas')); // Pass the data to the view
    }
    public function showJadwal($id_anggota)
    {
        // Ambil semua kelas
        $kelas = Kelas::all();
    
        // Ambil kelas yang sudah dipesan oleh anggota
        $pemesanan = Pemesanan::where('id_anggota', $id_anggota)->pluck('id_kelas')->toArray();
    
        // Kirim data ke view
        return view('jadwal', compact('kelas', 'pemesanan'));
    }



}
