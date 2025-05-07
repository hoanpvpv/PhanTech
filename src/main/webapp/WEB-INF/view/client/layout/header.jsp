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

                            <li class="nav-item">
                                <a class="nav-link" href="/product">Sản phẩm</a>
                            </li>


                            <li class="nav-item">
                                <a class="nav-link" href="/#service">Dịch vụ</a>
                            </li>

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
                                        <li><a class="dropdown-item" href="/history">Lịch sử yêu cầu</a></li>
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
            <!--Start of Fchat.vn-->
            <script type="text/javascript"
                src="https://cdn.fchat.vn/assets/embed/webchat.js?id=681b3dfb3795f4486905baa6" async="async"></script>
            <!--End of Fchat.vn-->