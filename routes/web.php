<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\PemesananController;
use App\Http\Controllers\KelasController;
use App\Http\Controllers\AdminController;

Route::get('/', function () {
    if(\Auth::user()){
        if(\Auth::user()->role == 'admin'){
            return redirect()->route('admin.dashboard');
        }
    }
    return view('home');
})->name('home');

Route::get('/Kelas', function () {
    return view('Kelas');
})->name('kelas');

Route::get('/Fasilitas', function () {
    return view('Fasilitas');
})->name('fasilitas');

Route::get('/Membership', function () {
    return view('Membership');
})->name('membership');

Route::get('/Trainer', function () {
    return view('Trainer');
})->name('trainer');

Route::get('/Absensi', function () {
    return view('Absensi');
})->name('absensi');

// Route::get('/Admin', function () {
//     return view('Admin');
// })->name('admin');

//Route::get('/Jadwal', function () {
   // return view('Jadwal');
// })->name('jadwal');

// Routes untuk autentikasi (login, register, logout)
Auth::routes();

// Rute untuk halaman login (huruf "L" besar sesuai URL yang kamu gunakan)
Route::get('/Login', [LoginController::class, 'showLoginForm'])->name('login');
Route::post('/Login', [LoginController::class, 'login'])->name('login.post');

// Rute untuk logout (dengan huruf "L" besar pada Logout)
Route::post('/Logout', [LoginController::class, 'logout'])->name('logout');
Route::get('/Logout', [LoginController::class, 'logout'])->name('logout');

// Rute halaman profil (hanya bisa diakses setelah login)
Route::get('/Profile', function () {
    return view('Profile');
})->middleware('auth')->name('profile');


Route::get('/Jadwal', [KelasController::class, 'index']);
Route::post('/Pemesanan', [PemesananController::class, 'store'])->name('pemesanan.store');

Route::post('filter-bulanan', [AdminController::class, 'filterBulanan'])->name('filter-bulanan');

// Punya Omar
// Admin routes
Route::prefix('admin')->group(function () {
    Route::get('/', [AdminController::class, 'dashboard'])->name('admin.dashboard');
    Route::get('/members/create', [AdminController::class, 'create'])->name('admin.createMember');
    // Route::post('/members', [AdminController::class, 'store'])->name('admin.storeMember');
    // Route::get('/', [AdminController::class, 'dashboard'])->name('admin.dashboard');
    Route::post('/members', [AdminController::class, 'addMember'])->name('admin.addMember');
    Route::get('/members/{id}', [AdminController::class, 'getMember'])->name('admin.getMember');
    Route::get('/members/{id}/edit', [AdminController::class, 'edit'])->name('admin.editMember'); // Rute edit
    Route::put('/members/{id}', [AdminController::class, 'update'])->name('anggota.updateMember'); // Rute update
    Route::delete('/members/{id}', [AdminController::class, 'destroy'])->name('admin.destroyMember');
    Route::get('/booking', [AdminController::class, 'booking'])->name('admin.booking');
    Route::get('/classes', [AdminController::class, 'classes'])->name('admin.classes');
    Route::get('/admin/classes/create', [AdminController::class, 'createClass'])->name('admin.classes.create');
    Route::post('/admin/classes/store', [AdminController::class, 'storeClass'])->name('admin.classes.store');
    Route::get('/admin/classes/{id}/edit', [AdminController::class, 'editClass'])->name('admin.classes.edit');
    Route::post('/admin/classes/{id}/update', [AdminController::class, 'updateClass'])->name('admin.classes.update');
    Route::post('/admin/classes/{id}/delete', [AdminController::class, 'deleteClass'])->name('admin.classes.delete');
    Route::get('/trainers', [AdminController::class, 'trainers'])->name('admin.trainers');
    Route::get('/admin/trainers', [AdminController::class, 'trainers'])->name('admin.trainers');
Route::get('/admin/trainers/create', [AdminController::class, 'createTrainer'])->name('admin.trainers.create');
Route::post('/admin/trainers/store', [AdminController::class, 'storeTrainer'])->name('admin.trainers.store');
Route::get('/admin/trainers/{id}/edit', [AdminController::class, 'editTrainer'])->name('admin.trainers.edit');
Route::post('/admin/trainers/{id}/update', [AdminController::class, 'updateTrainer'])->name('admin.trainers.update');
Route::post('/admin/trainers/{id}/delete', [AdminController::class, 'deleteTrainer'])->name('admin.trainers.delete');

});
