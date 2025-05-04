<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <nav id="nav" class="navbar navbar-expand-lg navbar-light bg-light z-index:1010">
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
                                <a class="nav-link" aria-current="page" href="/">Trang chủ</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/about">Giới thiệu</a>
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
                                <a class="nav-link" href="/project">Dự án</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/contact">Liên hệ</a>
                            </li>
                            <!-- Người dùng đăng nhập -->
                            <c:if test="${not empty pageContext.request.userPrincipal}">

                                <li class="nav-item">
                                    <a class="nav-link" href="/request-list">Danh sách yêu cầu của bạn</a>
                                    <span class="badge-count">${requestCount}</span>
                                </li>


                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                                        data-bs-toggle="dropdown" aria-expanded="false"><i
                                            class="fas fa-user fa-fw"></i></a>
                                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                        <a class="nav-link"
                                            href="/profile">${pageContext.request.userPrincipal.name}</a>
                                        <li><a class="dropdown-item" href="/profile">Hồ sơ</a></li>
                                        <li>
                                            <hr class="dropdown-divider" />
                                        </li>
                                        <li><a class="dropdown-item" href="/request-history">Lịch sử yêu cầu</a></li>
                                        <li>
                                            <hr class="dropdown-divider" />
                                        </li>
                                        <li>
                                            <form action="/logout" method="post">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                                <button class="dropdown-item" type="submit">Đăng xuất</button>
                                            </form>
                                        </li>
                                    </ul>
                                </li>
                            </c:if>

                            <!-- Người dùng không đăng nhập -->
                            <c:if test="${empty pageContext.request.userPrincipal}">
                                <li class="nav-item">
                                    <a class="nav-link" href="/login">Đăng nhập</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/register">Đăng ký</a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </nav>