<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreMemberRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'nama_pertama' => 'required|string|max:255',
            'nama_akhir' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:anggota',
            'password' => 'required|string|min:6',
            'id_paket' => 'required|exists:paket,id_paket',
            'tanggal_mulai' => 'required|date',
        ];
    }
}