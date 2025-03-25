document.addEventListener('click', function (event) {
    // Đóng dropdown khi nhấp ra ngoài (Desktop)
    const dropdowns = document.querySelectorAll('.dropdown-menu');
    dropdowns.forEach(dropdown => {
        const toggleButton = dropdown.previousElementSibling; // Nút kích hoạt dropdown
        if (dropdown.classList.contains('show') &&
            !dropdown.contains(event.target) &&
            !toggleButton.contains(event.target)) {
            dropdown.classList.remove('show');
        }
    });

    // Đóng navbar khi nhấp ra ngoài (Mobile)
    const navbarToggler = document.querySelector('.navbar-toggler');
    const navbarCollapse = document.querySelector('.navbar-collapse');
    if (navbarCollapse.classList.contains('show') &&
        !navbarCollapse.contains(event.target) &&
        !navbarToggler.contains(event.target)) {
        navbarToggler.click(); // Kích hoạt lại nút toggle để đóng navbar
    }
});

// Mở dropdown khi nhấp vào "Sản phẩm" hoặc "Dịch vụ"
document.querySelectorAll('.dropdown-toggle').forEach(toggle => {
    toggle.addEventListener('click', function (event) {
        event.preventDefault(); // Ngăn chặn hành vi mặc định
        const dropdownMenu = this.nextElementSibling;

        // Kiểm tra trạng thái hiện tại của dropdown
        const isOpen = dropdownMenu.classList.contains('show');

        // Đóng tất cả các dropdown khác
        document.querySelectorAll('.dropdown-menu').forEach(menu => {
            menu.classList.remove('show');
        });

        // Nếu dropdown hiện tại chưa mở, mở nó
        if (!isOpen) {
            dropdownMenu.classList.add('show');
        }
    });
});