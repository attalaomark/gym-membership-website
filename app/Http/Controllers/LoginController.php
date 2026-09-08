<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function showLoginForm()
    {
        return view('auth.login'); // Menampilkan halaman login
    }

    public function login(Request $request)
    {
        // Validasi input form login, termasuk role (login_as)
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required',
            'login_as' => 'required', // Validasi pilihan role
        ]);

    
        $credentials['role'] = $request->login_as;

        // Coba login dengan kredensial yang diberikan, termasuk role
        if (Auth::attempt(['email' => $request->email, 'password' => $request->password, 'role' => $request->login_as])) {
            $request->session()->regenerate();
            if(\Auth::user()){
                // dd(\Auth::user()->role);
                if(\Auth::user()->role == 'admin'){
                    return redirect()->route('admin.dashboard');
                }
            }
            return redirect()->intended('/Profile');  // Pastikan halaman Profile ada
        }

        return back()->withErrors([
            'email' => 'Kredensial yang dimasukkan tidak sesuai.',
        ]);
    }

    public function logout(Request $request)
    {
        Auth::logout();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect('/Login'); // Redirect ke halaman login setelah logout
    }
}
