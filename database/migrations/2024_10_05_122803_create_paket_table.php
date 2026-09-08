<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePaketTable extends Migration
{
    public function up()
    {
        Schema::create('paket', function (Blueprint $table) {
            $table->id('id_paket');
            $table->decimal('harga', 10, 2);
            $table->string('deskripsi');
            $table->integer('durasi'); // durasi dalam bulan
            $table->timestamps();
        });
        
    }

    public function down()
    {
        Schema::dropIfExists('paket');
    }
}
