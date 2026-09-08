<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePelatihTable extends Migration
{
    public function up()
    {
        Schema::create('pelatih', function (Blueprint $table) {
            $table->id('id_pelatih'); // Primary key
            $table->string('nama_pertama');
            $table->string('nama_akhir');
            $table->string('password');
            $table->string('email')->unique();
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('pelatih');
    }
}
