<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateKelasTable extends Migration
{
    public function up()
    {
        Schema::create('kelas', function (Blueprint $table) {
            $table->id('id_kelas'); // Primary key
            $table->unsignedBigInteger('id_admin'); // Foreign key ke tabel admin
            $table->unsignedBigInteger('id_pelatih'); // Foreign key ke tabel pelatih
            $table->string('nama_kelas');
            $table->time('waktu_mulai');
            $table->time('waktu_berakhir');
            $table->string('aktivitas');
            $table->date('tanggal');
            $table->integer('slot');
            $table->timestamps();

            // Foreign key constraint
            $table->foreign('id_admin')->references('id_admin')->on('admin')->onDelete('cascade');
            $table->foreign('id_pelatih')->references('id_pelatih')->on('pelatih')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('kelas');
    }
}
