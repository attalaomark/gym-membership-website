document.addEventListener('DOMContentLoaded', function() {
    const scheduleItems = document.querySelectorAll('.classtime-table table tbody tr td.hover-bg');

    // Tambah hover effect (sudah ada di kode asli)
    scheduleItems.forEach(item => {
        item.addEventListener('mouseenter', function() {
            this.classList.add('active');
        });

        item.addEventListener('mouseleave', function() {
            this.classList.remove('active');
        });

        // Tambahkan event listener untuk click
        item.addEventListener('click', function() {
            // Toggle class 'booked' untuk mengubah warna jadi hijau
            this.classList.toggle('booked');
        });
    });
});
