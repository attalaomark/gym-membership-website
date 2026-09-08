<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateMemberRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'nama_pertama' => 'sometimes|required|string|max:255',
            'nama_akhir' => 'sometimes|required|string|max:255',
            'email' => 'sometimes|required|email|unique:anggota,email,'.$this->route('id').',id_anggota',
            'password' => 'sometimes|nullable|string|min:6',
            'id_paket' => 'sometimes|required|exists:paket,id_paket',
            'tanggal_mulai' => 'sometimes|required|date',
        ];
    }
}