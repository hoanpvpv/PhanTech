<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <nav id="nav" class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <!-- Nút toggle cho mobile (bên trái) -->
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <!-- Logo -->
                    <a class="navbar-brand" href="index.html">
                        <img src="/images/public/Logo.png" alt="Logo" class="logo">
                    </a>
                    <!-- Các mục nav -->
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="index.html">Trang chủ</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="about.html">Giới thiệu</a>
                            </li>
                            <!-- Dropdown Sản phẩm -->
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="productsDropdown" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    Sản phẩm
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="productsDropdown">
                                    <li><a class="dropdown-item" href="products.html">Thang máy gia đình</a></li>
                                    <li><a class="dropdown-item" href="products.html">Thang máy chở khách</a>
                                    </li>
                                    <li><a class="dropdown-item" href="products.html">Thang máy kính</a></li>
                                    <li><a class="dropdown-item" href="products.html">Thang máy thủy lực</a></li>
                                    <li><a class="dropdown-item" href="products.html">Thang máy thủy lực</a></li>
                                    <li><a class="dropdown-item" href="products.html">Thang máy vận
                                            chuyển hàng hóa</a></li>
                                </ul>
                            </li>

                            <!-- Dropdown Dịch vụ -->
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="servicesDropdown" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    Dịch vụ
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="servicesDropdown">
                                    <li><a class="dropdown-item" href="installation.html">Lắp đặt</a></li>
                                    <li><a class="dropdown-item" href="maintenance.html">Bảo trì</a></li>
                                    <li><a class="dropdown-item" href="repair.html">Sửa chữa</a></li>
                                    <li><a class="dropdown-item" href="upgrade.html">Nâng cấp</a></li>
                                    <li><a class="dropdown-item" href="advisory.html">Tư vấn kỹ thuật</a></li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="projects-homelift.html">Dự án</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contact.html">Liên hệ</a>
                            </li>
                            <!-- Thêm phần đăng nhập/đăng ký với link đến trang riêng -->
                            <li class="nav-item">
                                <a class="nav-link" href="login.html">Đăng nhập</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="register.html">Đăng ký</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <script>
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
            </script>