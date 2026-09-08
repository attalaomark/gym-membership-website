<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Anggota;
use App\Models\Paket;
use App\Models\Kelas;
use App\Models\Pelatih;

use App\Models\Pemesanan;
use App\Http\Requests\StoreMemberRequest;
use App\Http\Requests\UpdateMemberRequest;
use App\Models\DimAnggota;
use Illuminate\Support\Facades\Hash;

class AdminController extends Controller
{
    public function dashboard(Request $request)
    {
        $totalMember = Anggota::count();
        $newMembersThisMonth = Anggota::whereMonth('created_at', now()->month)->count();
        $activeClasses = Kelas::count();
        $totalTrainers = Pelatih::count();
        $members = Anggota::with('paket')->get();
        $packages = Paket::all();

        // Pendapatan berdasarkan paket
        $revenueByPackage = Paket::select('deskripsi', \DB::raw('COUNT(anggota.id_paket) AS jumlah_anggota'), \DB::raw('SUM(paket.harga) AS total_pendapatan'))
            ->leftJoin('anggota', 'paket.id_paket', '=', 'anggota.id_paket')
            ->groupBy('paket.deskripsi')
            ->get();

        $chartJumlahAnggota = Pemesanan::with('anggota', 'kelas')->get()->groupBy('kelas.nama_kelas')->map(function ($pemesanan) {
            return $pemesanan->count();
        });


        $now = now();


        if ($request->has('filter_month')) {
        }

        $chartPerBulan = Pemesanan::with('anggota', 'kelas')
            ->get()
            ->groupBy(function ($bulan) {
                return $bulan->created_at->format('M'); // Mengelompokkan berdasarkan bulan (contoh: "Oct", "Dec")
            })
            ->map(function ($kelas) {
                return $kelas->groupBy('kelas.nama_kelas')->map(function ($pemesanan) {
                    return $pemesanan->count(); // Menghitung jumlah pemesanan per kelas
                });
            });

        // Menyiapkan data untuk chart
        $labels = [];
        $dataPerBulan = [];
        foreach ($chartPerBulan as $bulan => $kelas) {
            // Menambahkan bulan sebagai label chart
            $labels[] = $bulan;

            // Menambahkan data jumlah pemesan per kelas per bulan
            foreach ($kelas as $namaKelas => $jumlah) {
                $dataPerBulan[$namaKelas][] = $jumlah;
            }
        }

        // Mengonversi data menjadi format JSON untuk dikirim ke JavaScript
        $chartLabels = json_encode($labels); // Bulan
        $chartData = json_encode($dataPerBulan); // Data jumlah pemesan per kelas

        $optionMonth = Pemesanan::selectRaw('DISTINCT MONTH(created_at) as bulan')->get()->pluck('bulan')->mapWithKeys(function ($bulan) {
            return [$bulan => \Carbon\Carbon::create()->month($bulan)->format('F')];
        });

        // dd($optionMonth);


        $chartPendapatan = DimAnggota::with('paket', 'pemesanan')
            ->get()->groupBy('paket.deskripsi')->map(function ($paket) {
                return $paket->count() * $paket->first()->paket->harga;
            });

        // dd($chartPendapatan);


        // dd($chartJumlahAnggota);
        return view('admin.dashboard', compact(
            'totalMember',
            'newMembersThisMonth',
            'activeClasses',
            'totalTrainers',
            'members',
            'packages',
            'revenueByPackage',
            'chartJumlahAnggota',
            'chartData',
            'chartLabels',
            'chartPendapatan',
            'optionMonth'
        ));
    }


    // Implementasi metode lain akan ditambahkan nanti
    //public function deleteMember($id)
    //{
    //  $anggota = Anggota::findOrFail($id);
    //  $anggota->delete();

    //  return response()->json(null, 204);
    // }

    // public function payments()
    //{
    //  $payments = Pembayaran::with('anggota')->get();
    // return view('admin.payments', compact('payments'));
    // }
    public function booking()
    {
        $booking = Pemesanan::with('anggota')->get();
        return view('admin.booking', compact('booking'));
    }
    public function classes()
    {
        $classes = Kelas::with(['admin', 'pelatih'])->get();
        return view('admin.classes', compact('classes'));
    }
    public function createClass()
    {
        $trainers = Pelatih::all(); // Ambil data pelatih
        return view('admin.create-class', compact('trainers'));
    }

    public function storeClass(Request $request)
    {
        $request->validate([
            'nama_kelas' => 'required|string|max:255',
            'id_pelatih' => 'required|integer',
            'waktu_mulai' => 'required|date_format:H:i',
            'waktu_berakhir' => 'required|date_format:H:i|after:waktu_mulai',
            'tanggal' => 'required|date',
            'slot' => 'required|integer|min:1',
        ]);

        Kelas::create([
            'nama_kelas' => $request->nama_kelas,
            'id_pelatih' => $request->id_pelatih,
            'waktu_mulai' => $request->waktu_mulai,
            'waktu_berakhir' => $request->waktu_berakhir,
            'tanggal' => $request->tanggal,
            'slot' => $request->slot,
        ]);

        return redirect()->route('admin.classes')->with('success', 'Kelas berhasil ditambahkan.');
    }

    public function editClass($id)
    {
        $class = Kelas::findOrFail($id);
        $trainers = Pelatih::all();
        return view('admin.edit-class', compact('class', 'trainers'));
    }

    public function updateClass(Request $request, $id)
    {
        // dd($request);
        // $request->validate([
        //     'nama_kelas' => 'required|string|max:255',
        //     'id_pelatih' => 'required|string',
        //     'waktu_mulai' => 'required|date_format:H:i',
        //     'waktu_berakhir' => 'required|date_format:H:i|after:waktu_mulai',
        //     'tanggal' => 'required',
        //     'slot' => 'required|string|min:1',
        // ]);

        $class = Kelas::findOrFail($id);
        $class->update([
            'nama_kelas' => $request->nama_kelas,
            'id_pelatih' => $request->id_pelatih,
            'waktu_mulai' => $request->waktu_mulai,
            'waktu_berakhir' => $request->waktu_berakhir,
            'tanggal' => $request->tanggal,
            'slot' => $request->slot,
        ]);

        return redirect()->route('admin.classes')->with('success', 'Kelas berhasil diperbarui.');
    }

    public function deleteClass($id)
    {
        $class = Kelas::findOrFail($id);
        $class->delete();

        return redirect()->route('admin.classes')->with('success', 'Kelas berhasil dihapus.');
    }
    public function createTrainer()
    {
        return view('admin.create-trainer');
    }

    public function storeTrainer(Request $request)
    {
        $request->validate([
            'nama_pertama' => 'required|string|max:255',
            'nama_akhir' => 'required|string|max:255',
            'email' => 'required|email|max:255|unique:pelatih,email', // Email unik
            'password' => 'required|string|min:8', // Password minimal 8 karakter
        ]);

        Pelatih::create([
            'nama_pertama' => $request->nama_pertama,
            'nama_akhir' => $request->nama_akhir,
            'email' => $request->email,
            'password' => bcrypt($request->password), // Hash password
        ]);

        return redirect()->route('admin.trainers')->with('success', 'Trainer berhasil ditambahkan.');
    }

    public function editTrainer($id)
    {
        $trainer = Pelatih::findOrFail($id);
        return view('admin.edit-trainer', compact('trainer'));
    }

    public function updateTrainer(Request $request, $id)
    {
        $request->validate([
            'nama_pertama' => 'required|string|max:255',
            'nama_akhir' => 'required|string|max:255'
        ]);

        $trainer = Pelatih::findOrFail($id);
        $trainer->nama_pertama = $request->nama_pertama;
        $trainer->nama_akhir = $request->nama_akhir;
        $trainer->email = $request->email;

        // Jika password diisi, hash dan simpan
        if ($request->password) {
            $trainer->password = bcrypt($request->password);
        }

        $trainer->save();

        return redirect()->route('admin.trainers')->with('success', 'Data trainer berhasil diperbarui.');
    }
    public function deleteTrainer($id)
    {
        $trainer = Pelatih::find($id);

        if (!$trainer) {
            return redirect()->route('admin.trainers')->with('error', 'Trainer tidak ditemukan.');
        }

        $trainer->delete();

        return redirect()->route('admin.trainers')->with('success', 'Trainer berhasil dihapus.');
    }



    public function trainers()
    {
        $trainers = Pelatih::all();
        return view('admin.trainers', compact('trainers'));
    }

    public function getMember($id)
    {
        $member = Anggota::findOrFail($id);
        return response()->json($member);
    }

    // public function addMember(StoreMemberRequest $request)
    // {
    //     $validatedData = $request->validated();
    //     $validatedData['password'] = Hash::make($validatedData['password']);
    //     $anggota = Anggota::create($validatedData);

    //     // Muat relasi paket
    //     $anggota->load('paket');

    //     return response()->json($anggota, 201);
    // }
    public function create()
    {
        $packages = Paket::all();
        return view('admin.create', compact('packages'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama_pertama' => 'required|string|max:255',
            'nama_akhir' => 'required|string|max:255',
            'email' => 'required|email|max:255|unique:anggota,email', // Pastikan email unik
            'password' => 'required|string|min:8', // Pastikan password minimal 8 karakter
            'id_paket' => 'required|integer',
            'tanggal_mulai' => 'required|date'
        ]);
        dd($request->all());
        $anggota = new Anggota();
        $anggota->nama_pertama = $request->nama_pertama;
        $anggota->nama_akhir = $request->nama_akhir;
        $anggota->email = $request->email;
        $anggota->password = bcrypt($request->password); // Hash password
        $anggota->id_paket = $request->id_paket;
        $anggota->tanggal_mulai = $request->tanggal_mulai;

        $anggota->save();

        return redirect()->route('admin.dashboard')->with('success', 'Anggota berhasil ditambahkan');
    }





    public function destroy($id)
    {
        $anggota = Anggota::find($id);
        if (!$anggota) {
            return response()->json(['message' => 'Anggota tidak ditemukan'], 404);
        }

        $anggota->delete();
        return redirect()->route('admin.dashboard')->with('success', 'data member berhasil dihapus');
    }
    public function edit($id)
    {
        $anggota = Anggota::find($id);

        if (!$anggota) {
            return response()->json(['message' => 'Anggota tidak ditemukan'], 404);
        }

        // Ambil semua paket untuk dropdown
        $packages = Paket::all(); // Ganti dengan model yang sesuai
        return view('admin.edit', compact('anggota', 'packages'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'nama_pertama' => 'required|string|max:255',
            'nama_akhir' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'id_paket' => 'required|integer', // Validasi untuk tipe membership
            'tanggal_mulai' => 'required|date',
            'password' => 'nullable|string|min:8' // Validasi password, bisa kosong
        ]);

        $anggota = Anggota::find($id);

        if (!$anggota) {
            return response()->json(['message' => 'Anggota tidak ditemukan'], 404);
        }

        // Update data anggota
        $anggota->nama_pertama = $request->nama_pertama;
        $anggota->nama_akhir = $request->nama_akhir;
        $anggota->email = $request->email;
        $anggota->id_paket = $request->id_paket;
        $anggota->tanggal_mulai = $request->tanggal_mulai;

        // Jika password diisi, hash dan simpan
        if ($request->password) {
            $anggota->password = bcrypt($request->password);
        }

        $anggota->save();

        return redirect()->route('admin.dashboard')->with('success', 'Data member berhasil diperbarui');
    }


    // public function editMember(UpdateMemberRequest $request, $id)
    // {
    //     \Log::info('Received edit member request', ['id' => $id, 'data' => $request->all()]);

    //     $anggota = Anggota::findOrFail($id);
    //     $validatedData = $request->validated();

    //     \Log::info('Validated data', ['data' => $validatedData]);

    //     if (isset($validatedData['password']) && !empty($validatedData['password'])) {
    //         $validatedData['password'] = Hash::make($validatedData['password']);
    //     } else {
    //         unset($validatedData['password']);
    //     }

    //     try {
    //         $anggota->update($validatedData);
    //         $anggota->load('paket');
    //         \Log::info('Member updated successfully', ['member' => $anggota->toArray()]);
    //         return response()->json($anggota, 200);
    //     } catch (\Exception $e) {
    //         \Log::error('Error updating member', ['error' => $e->getMessage()]);
    //         return response()->json(['error' => 'Failed to update member: ' . $e->getMessage()], 500);
    //     }
    // }




    public function filterBulanan(Request $request)
    {

        // dd($request->all());

        if ($request->has('bulan')) {
            $chartPerBulan = Pemesanan::whereMonth('created_at', $request->bulan)->with('anggota', 'kelas')
                ->get()
                ->groupBy(function ($bulan) {
                    return $bulan->created_at->format('M'); // Mengelompokkan berdasarkan bulan (contoh: "Oct", "Dec")
                })
                ->map(function ($kelas) {
                    return $kelas->groupBy('kelas.nama_kelas')->map(function ($pemesanan) {
                        return $pemesanan->count(); // Menghitung jumlah pemesanan per kelas
                    });
                });

            // Menyiapkan data untuk chart
            $labels = [];
            $dataPerBulan = [];
            foreach ($chartPerBulan as $bulan => $kelas) {
                // Menambahkan bulan sebagai label chart
                $labels[] = $bulan;

                // Menambahkan data jumlah pemesan per kelas per bulan
                foreach ($kelas as $namaKelas => $jumlah) {
                    $dataPerBulan[$namaKelas][] = $jumlah;
                }
            }

            // Mengonversi data menjadi format JSON untuk dikirim ke JavaScript
            $chartLabels = $labels; // Bulan
            $chartData = $dataPerBulan; // Data jumlah pemesan per kelas

            $data = [
                'chartLabels' => $chartLabels,
                'chartData' => $chartData
            ];

            return response()->json($data);
        } else {
            $chartPerBulan = Pemesanan::with('anggota', 'kelas')
                ->get()
                ->groupBy(function ($bulan) {
                    return $bulan->created_at->format('M'); // Mengelompokkan berdasarkan bulan (contoh: "Oct", "Dec")
                })
                ->map(function ($kelas) {
                    return $kelas->groupBy('kelas.nama_kelas')->map(function ($pemesanan) {
                        return $pemesanan->count(); // Menghitung jumlah pemesanan per kelas
                    });
                });

            // Menyiapkan data untuk chart
            $labels = [];
            $dataPerBulan = [];
            foreach ($chartPerBulan as $bulan => $kelas) {
                // Menambahkan bulan sebagai label chart
                $labels[] = $bulan;

                // Menambahkan data jumlah pemesan per kelas per bulan
                foreach ($kelas as $namaKelas => $jumlah) {
                    $dataPerBulan[$namaKelas][] = $jumlah;
                }
            }

            // Mengonversi data menjadi format JSON untuk dikirim ke JavaScript
            $chartLabels = $labels; // Bulan
            $chartData = $dataPerBulan; // Data jumlah pemesan per kelas
            $data = [
                'chartLabels' => $chartLabels,
                'chartData' => $chartData
            ];
            return response()->json($data);
        }
    }
}
