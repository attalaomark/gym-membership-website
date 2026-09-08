// Ambil modal
var modal = document.getElementById("registrationModal");

// Ambil semua tombol yang membuka modal
var btns = document.getElementsByClassName("select-button");

// Ambil elemen <span> yang menutup modal
var span = document.getElementsByClassName("close")[0];

// Ketika pengguna mengklik tombol, buka modal 
for (var i = 0; i < btns.length; i++) {
    btns[i].onclick = function() {
        modal.style.display = "block";
    }
}

// Ketika pengguna mengklik <span> (x), tutup modal
span.onclick = function() {
    modal.style.display = "none";
}

// Ketika pengguna mengklik di luar modal, tutup modal
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}