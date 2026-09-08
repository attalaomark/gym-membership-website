@extends('layouts.admin')

@section('content')
    <main class="admin-dashboard">
        <div class="container">
            <div class="dashboard-card">
                <div class="dashboard-header">
                    <h2>Dashboard Admin</h2>
                </div>
                <div style="margin-bottom: 100px;"><canvas id="revenueChart"></canvas></div>


                <div style="margin: 3rem 0; width:600px; background-color: #f8f8f8; border-radius: 16px; border: 1px solid #ccc; padding: 1.5rem;">
                    <h3>Grafik Jumlah Anggota</h3>
                    <div style="display: flex; justify-content: center;">
                        <canvas id="jumlahAnggotaChart" style="margin: 20px;"></canvas>
                    </div>

                    {{-- <canvas id="jumlahAnggotaChart" style="margin: 20px;"></canvas> --}}
                </div>


                <div
                    style="margin: 3rem 0; width: 1000px; background-color: #f8f8f8; border-radius: 16px; border: 1px solid #ccc; padding: 1.5rem;">
                    <h3>Grafik Per Bulan</h3>
                    <form method="POST" action="{{ route('filter-bulanan') }}">
                        <label for="bulan">Bulan:</label>
                        <select name="bulan" id="bulan">
                            <option value="">Semua</option>
                            @foreach ($optionMonth as $index => $select)
                                <option value="{{ $index }}">{{ $select }}</option>
                            @endforeach
                        </select>
                        <button type="button" id="filterButton">Filter</button>
                    </form>

                    <canvas id="chartPerBulan" style="margin: 20px;"></canvas>
                </div>



                <div
                    style="margin: 5rem 0; width: 1000px; background-color: #f8f8f8; border-radius: 16px; border: 1px solid #ccc; padding: 1.5rem;">
                    <h3>Grafik Pendapatan</h3>
                    <canvas id="chartPendapatan" style="margin: 20px;"></canvas>
                </div>
                <div class="stats-container" style="margin-top: 100px;">
                    <div class="stat-card">
                        <h3>{{ $totalMember }}</h3>
                        <p>Total Member</p>
                    </div>
                    <div class="stat-card">
                        <h3>{{ $newMembersThisMonth }}</h3>
                        <p>Member Baru Bulan Ini</p>
                    </div>
                    <div class="stat-card">
                        <h3>{{ $activeClasses }}</h3>
                        <p>Kelas Aktif</p>
                    </div>
                    <div class="stat-card">
                        <h3>{{ $totalTrainers }}</h3>
                        <p>Total Trainer</p>
                    </div>
                </div>
                <div class="member-list-container">
                    <!-- <h4>Daftar Member</h4>
                    <a href="{{ route('admin.createMember') }}" id="addMemberBtn" class="action-btn edit-btn">Tambah Member</a> -->

                    <table class="member-list">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nama</th>
                                <th>Email</th>
                                <th>Tipe Membership</th>
                                <th>Tanggal Bergabung</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody id="memberTableBody">
                            @foreach ($members as $member)
                                <tr data-id="{{ $member->id_anggota }}">
                                    <td>{{ $member->id_anggota }}</td>
                                    <td>{{ $member->nama_pertama }} {{ $member->nama_akhir }}</td>
                                    <td>{{ $member->email }}</td>
                                    <td>{{ $member->paket->deskripsi ?? 'N/A' }}</td>
                                    <td>{{ $member->tanggal_mulai }}</td>
                                    <td>
                                        <a href="{{ route('admin.editMember', $member->id_anggota) }}"
                                            class="action-btn edit-btn">Edit</a>
                                        <form action="{{ route('admin.destroyMember', $member->id_anggota) }}"
                                            method="POST" style="display:inline;">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="action-btn delete-btn"
                                                onclick="return confirm('Apakah Anda yakin ingin menghapus anggota ini?')">Hapus</button>
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>

    <!-- Modal -->
    <div id="memberModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2 id="modalTitle"></h2>
            <form id="memberForm">
                <input type="hidden" id="memberId" name="id_anggota">
                <input type="text" id="memberName" name="nama_pertama" placeholder="Nama Depan" required>
                <input type="text" id="memberLastName" name="nama_akhir" placeholder="Nama Belakang" required>
                <input type="email" id="memberEmail" name="email" placeholder="Email" required>
                <input type="password" id="memberPassword" name="password" placeholder="Password" required>
                <select id="membershipType" name="id_paket" required>
                    <option value="">Pilih Tipe Membership</option>
                    @foreach ($packages as $package)
                        <option value="{{ $package->id_paket }}">{{ $package->deskripsi }}</option>
                    @endforeach
                </select>
                <input type="date" id="joinDate" name="tanggal_mulai" required>
                <button type="submit">Simpan</button>
            </form>
        </div>
    </div>

    {{-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> --}}
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>

    <script>
        const ctxJumlahAnggota = document.getElementById('jumlahAnggotaChart').getContext('2d');
        const jumlahAnggotaChart = new Chart(ctxJumlahAnggota, {
            type: 'pie',
            data: {
                labels: @json(array_keys($chartJumlahAnggota->toArray())),
                datasets: [{
                    label: 'Jumlah Anggota',
                    data: @json(array_values($chartJumlahAnggota->toArray())),
                    backgroundColor: [
                        'rgb(255, 99, 132)',
                        'rgb(54, 162, 235)',
                        'rgb(255, 205, 86)',
                        'rgb(75, 192, 192)',
                        'rgb(153, 102, 255)'
                    ],
                    hoverOffset: 4
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    tooltip: {
                        callbacks: {
                            label: function(tooltipItem) {
                                const label = tooltipItem.label || '';
                                const value = tooltipItem.raw || 0;
                                return `${label}: ${value} anggota`;
                            }
                        }
                    },
                    legend: {
                        position: 'top',
                        labels: {
                            font: {
                                size: 12
                            }
                        }
                    },
                    datalabels: {
                        formatter: (value, ctx) => {
                            return `${value}`; // Menampilkan jumlah pada setiap slice
                        },
                        color: '#fff',
                        font: {
                            weight: 'bold',
                            size: 14
                        }
                    }
                }
            },
            plugins: [ChartDataLabels] // Pastikan plugin ini diaktifkan
        });



        // Variabel global untuk chart
        let chartPerBulan = null;

        const ctxChartPerBulan = document.getElementById('chartPerBulan').getContext('2d');

        // Membuat chart pertama kali
        chartPerBulan = new Chart(ctxChartPerBulan, {
            type: 'bar',
            data: {
                labels: JSON.parse(@json($chartLabels)), // Bulan sebagai labels
                datasets: Object.keys(JSON.parse(@json($chartData))).map((kelas, index) => {
                    return {
                        label: kelas, // Nama kelas
                        data: JSON.parse(@json($chartData))[kelas], // Jumlah pemesan per kelas
                        backgroundColor: [
                            'rgb(255, 99, 132)',
                            'rgb(54, 162, 235)',
                            'rgb(255, 205, 86)',
                            'rgb(75, 192, 192)',
                            'rgb(153, 102, 255)'
                        ][index % 5], // Memilih warna berbeda untuk setiap kelas
                        borderColor: 'rgb(255, 255, 255)', // Warna border
                        borderWidth: 1
                    };
                })
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                        labels: {
                            font: {
                                size: 12
                            }
                        }
                    }
                },
                scales: {
                    x: {
                        beginAtZero: true
                    },
                    y: {
                        beginAtZero: true,
                        ticks: {
                            stepSize: 1
                        }
                    }
                }
            }
        });

        // Ambil data pemesanan per bulan saat tombol filter diklik
        $('#filterButton').click(function(e) {
            e.preventDefault();

            const bulan = $('#bulan').val(); // Ambil bulan yang dipilih dari dropdown
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr(
                        'content') // Set CSRF token untuk AJAX
                }
            });

            $.ajax({
                url: "{{ route('filter-bulanan') }}", // URL untuk request filter bulanan
                type: "POST",
                data: {
                    bulan: bulan
                }, // Kirim data bulan yang dipilih
                success: function(response) {
                    // Hancurkan chart yang lama jika ada
                    if (chartPerBulan) {
                        chartPerBulan.destroy(); // Hancurkan chart lama
                    }

                    // Membuat chart baru dengan data yang diterima dari server
                    const ctxMonthly = document.getElementById('chartPerBulan').getContext('2d');
                    chartPerBulan = new Chart(ctxMonthly, {
                        type: 'bar',
                        data: {
                            labels: response.chartLabels,
                            datasets: Object.keys(response.chartData).map((kelas, index) => {
                                return {
                                    label: kelas,
                                    data: response.chartData[kelas],
                                    backgroundColor: [
                                        'rgb(255, 99, 132)',
                                        'rgb(54, 162, 235)',
                                        'rgb(255, 205, 86)',
                                        'rgb(75, 192, 192)',
                                        'rgb(153, 102, 255)'
                                    ][index % 5],
                                    borderColor: 'rgb(255, 255, 255)',
                                    borderWidth: 1
                                };
                            })
                        },
                        options: {
                            responsive: true,
                            plugins: {
                                legend: {
                                    position: 'top',
                                    labels: {
                                        font: {
                                            size: 12
                                        }
                                    }
                                }
                            },
                            scales: {
                                y: {
                                    beginAtZero: true,
                                    ticks: {
                                        stepSize: 1
                                    }
                                }
                            }
                        }
                    });
                }
            });
        });


        const ctxMonlthlyYearly = document.getElementById('chartPendapatan').getContext('2d');
        const chartPendapatan = new Chart(ctxMonlthlyYearly, {
            type: 'bar',
            data: {
                labels: ['Bulanan', 'Tahunan'],
                datasets: [{
                    label: 'Pendapatan',
                    data: [{{ $chartPendapatan['monthly'] }}, {{ $chartPendapatan['yearly'] }}],
                    backgroundColor: [
                        'rgb(255, 99, 132)',
                        'rgb(54, 162, 235)'
                    ],
                    borderColor: 'rgb(255, 255, 255)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                        labels: {
                            font: {
                                size: 12
                            }
                        }
                    }
                },
                scales: {
                    x: {
                        beginAtZero: true
                    },
                    y: {
                        beginAtZero: true,
                        ticks: {
                            stepSize: 1
                        }
                    }
                }
            }
        });
    </script>
@endsection
