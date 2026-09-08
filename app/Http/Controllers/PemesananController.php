<?php

namespace App\Http\Controllers;

use App\Models\Anggota;
use Illuminate\Http\Request;
use App\Models\Pemesanan;

class PemesananController extends Controller
{
    public function store(Request $request)
{
    $id_anggota = Anggota::select('id_anggota')->where('email', '=', \Auth::user()->email)->first();
    // dd($request);
    // dd($id_anggota->id_anggota);
    Pemesanan::create([
        'id_anggota' => $id_anggota->id_anggota,
        'id_kelas' => $request->id_kelas,
        'check_in' => now(),
    ]);

    return redirect()->back()->with('success', 'Pemesanan berhasil dilakukan!');
}

}
