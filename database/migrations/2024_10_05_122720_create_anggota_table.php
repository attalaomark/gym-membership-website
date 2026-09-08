<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAnggotaTable extends Migration
{
    public function up()
    {
        Schema::create('anggota', function (Blueprint $table) {
            $table->id('id_anggota');
            $table->string('nama_pertama');
            $table->string('nama_akhir');
            $table->string('password');
            $table->foreignId('id_paket')->constrained('paket')->onDelete('cascade'); // foreign key
            $table->date('tanggal_mulai')->nullable();
            $table->date('tanggal_berhenti')->nullable();
            $table->string('email');
            $table->timestamps();
        });
        
    }

    public function down()
    {
        Schema::dropIfExists('anggota');
    }
}
