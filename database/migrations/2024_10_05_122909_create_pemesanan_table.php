<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePemesananTable extends Migration
{
    public function up()
    {
        Schema::create('pemesanan', function (Blueprint $table) {
            $table->id('id_pemesanan'); // Primary key
            $table->unsignedBigInteger('id_anggota'); // Foreign key ke tabel anggota
            $table->unsignedBigInteger('id_kelas'); // Foreign key ke tabel kelas
            $table->dateTime('check_in')->nullable();
            $table->boolean('absensi')->default(0); // Absensi 0 = belum hadir, 1 = hadir
            $table->timestamps();

            // Foreign key constraint
            $table->foreign('id_anggota')->references('id_anggota')->on('anggota')->onDelete('cascade');
            $table->foreign('id_kelas')->references('id_kelas')->on('kelas')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('pemesanan');
    }
}
