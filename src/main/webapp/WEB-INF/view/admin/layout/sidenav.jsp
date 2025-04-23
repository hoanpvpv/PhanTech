<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <div id="layoutSidenav">
                <div id="layoutSidenav_nav">
                    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                        <div class="sb-sidenav-menu">
                            <div class="nav">
                                <a class="nav-link ${currentTab == 'dashboard' ? 'active' : ''}"
                                    href="/admin/dashboard">
                                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                    Dashboard
                                </a>
                                <div class="sb-sidenav-menu-heading">Quản lý</div>
                                <a class="nav-link ${currentTab == 'user' ? 'active' : ''}" href="/admin/user">
                                    <div class="sb-nav-link-icon"><i class="fas fa-users"></i></div>
                                    Người dùng
                                </a>
                                <a class="nav-link ${currentTab == 'product' ? 'active' : ''}" href="/admin/product">
                                    <div class="sb-nav-link-icon"><i class="fas fa-laptop"></i></div>
                                    Sản phẩm
                                </a>
                                <a class="nav-link ${currentTab == 'project' ? 'active' : ''}" href="/admin/project">
                                    <div class="sb-nav-link-icon"><i class="fas fa-project-diagram"></i></div>
                                    Dự án
                                </a>
                                <a class="nav-link ${currentTab == 'requestList' ? 'active' : ''}"
                                    href="/admin/requestList">
                                    <div class="sb-nav-link-icon"><i class="fas fa-clipboard-list"></i></div>
                                    Danh sách yêu cầu
                                </a>
                                <a class="nav-link ${currentTab == 'review' ? 'active' : ''}" href="/admin/review">
                                    <div class="sb-nav-link-icon"><i class="fas fa-star"></i></div>
                                    Đánh giá
                                </a>
                                <a class="nav-link ${currentTab == 'service' ? 'active' : ''}" href="/admin/service">
                                    <div class="sb-nav-link-icon"><i class="fas fa-cogs"></i></div>
                                    Dịch vụ
                                </a>
                                <a class="nav-link ${currentTab == 'form' ? 'active' : ''}" href="/admin/form">
                                    <div class="sb-nav-link-icon"><i class="fas fa-file-alt"></i></div>
                                    Form
                                </a>
                                <a class="nav-link ${currentTab == 'elevator-type' ? 'active' : ''}"
                                    href="/admin/elevator-type">
                                    <div class="sb-nav-link-icon"><i class="fas fa-elevator"></i></div>
                                    Loại thang máy
                                </a>
                                <a class="nav-link ${currentTab == 'manufacturer' ? 'active' : ''}"
                                    href="/admin/manufacturer">
                                    <div class="sb-nav-link-icon"><i class="fas fa-industry"></i></div>
                                    Nhà sản xuất
                                </a>
                            </div>
                        </div>
                        <div class="sb-sidenav-footer">
                            <div class="small">Đăng nhập với:</div>
                            Admin
                        </div>
                    </nav>
                </div>
            </div>