<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="PhanTech - Quản lý yêu cầu" />
                    <meta name="author" content="PhanTech" />
                    <title>Dashboard - Giải Pháp Thang Máy</title>
                    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
                        rel="stylesheet" />
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />

                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidenav.jsp" />

                        <div id="layoutSidenav_content">
                            <div class="container mt-5 pt-3">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="card shadow-lg">
                                            <div
                                                class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                                                <h4 class="mb-0">Danh Sách Người Dùng</h4>
                                            </div>
                                            <div class="card-body">
                                                <!-- Form tìm kiếm -->
                                                <div class="mb-4">
                                                    <form action="/admin/user" method="get" class="row g-3">
                                                        <div class="col-md-6">
                                                            <div class="input-group">
                                                                <input type="text" class="form-control"
                                                                    id="emailKeyword" name="email"
                                                                    value="${emailKeyword}"
                                                                    placeholder="Tìm kiếm theo email...">
                                                                <button class="btn btn-primary" type="submit">
                                                                    <i class="fas fa-search me-1"></i> Tìm kiếm
                                                                </button>
                                                                <a href="/admin/user" class="btn btn-secondary">
                                                                    <i class="fas fa-undo me-1"></i> Đặt lại
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>


                                                <div class="table-responsive">
                                                    <table id="usersTable" class="table table-striped table-hover">
                                                        <thead class="table-dark">
                                                            <tr>
                                                                <th>ID</th>
                                                                <th>Họ và Tên</th>
                                                                <th>Email</th>
                                                                <th>Số Điện Thoại</th>
                                                                <th>Địa chỉ</th>
                                                                <th>Ngày Đăng Ký</th>
                                                                <th>Vai Trò</th>
                                                                <th width="150">Thao Tác</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${users}" var="user">
                                                                <tr>
                                                                    <td>${user.id}</td>
                                                                    <td>${user.fullName}</td>
                                                                    <td>${user.email}</td>
                                                                    <td>${user.phone}</td>
                                                                    <td>${user.address}</td>
                                                                    <td>${user.createdAt}</td>
                                                                    <td>${user.role.name}</td>
                                                                    <td>
                                                                        <div class="btn-group" role="group">
                                                                            <!-- Changed view button to trigger modal instead of navigating -->
                                                                            <button type="button"
                                                                                class="btn btn-sm btn-info"
                                                                                data-bs-toggle="modal"
                                                                                data-bs-target="#viewModal${user.id}"
                                                                                title="Xem chi tiết">
                                                                                <i class="fas fa-eye"></i>
                                                                            </button>

                                                                            <button type="button"
                                                                                class="btn btn-sm btn-danger"
                                                                                data-bs-toggle="modal"
                                                                                data-bs-target="#deleteModal${user.id}"
                                                                                title="Xóa">
                                                                                <i class="fas fa-trash"></i>
                                                                            </button>
                                                                        </div>

                                                                        <!-- User Details Modal -->
                                                                        <div class="modal fade" id="viewModal${user.id}"
                                                                            tabindex="-1"
                                                                            aria-labelledby="viewModalLabel${user.id}"
                                                                            aria-hidden="true">
                                                                            <div class="modal-dialog modal-lg">
                                                                                <div class="modal-content">
                                                                                    <div
                                                                                        class="modal-header bg-info text-white">
                                                                                        <h5 class="modal-title"
                                                                                            id="viewModalLabel${user.id}">
                                                                                            Thông tin chi tiết:
                                                                                            ${user.fullName}
                                                                                        </h5>
                                                                                        <button type="button"
                                                                                            class="btn-close"
                                                                                            data-bs-dismiss="modal"
                                                                                            aria-label="Close"></button>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        <div class="container-fluid">
                                                                                            <div class="row mb-3">
                                                                                                <div
                                                                                                    class="col-md-3 fw-bold">
                                                                                                    ID:
                                                                                                </div>
                                                                                                <div class="col-md-9">
                                                                                                    ${user.id}
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="row mb-3">
                                                                                                <div
                                                                                                    class="col-md-3 fw-bold">
                                                                                                    Email:
                                                                                                </div>
                                                                                                <div class="col-md-9">
                                                                                                    ${user.email}
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="row mb-3">
                                                                                                <div
                                                                                                    class="col-md-3 fw-bold">
                                                                                                    Họ và
                                                                                                    tên:</div>
                                                                                                <div class="col-md-9">
                                                                                                    ${user.fullName}
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="row mb-3">
                                                                                                <div
                                                                                                    class="col-md-3 fw-bold">
                                                                                                    Số
                                                                                                    điện thoại:</div>
                                                                                                <div class="col-md-9">
                                                                                                    ${user.phone}
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="row mb-3">
                                                                                                <div
                                                                                                    class="col-md-3 fw-bold">
                                                                                                    Địa
                                                                                                    chỉ:</div>
                                                                                                <div class="col-md-9">
                                                                                                    ${user.address}
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="row mb-3">
                                                                                                <div
                                                                                                    class="col-md-3 fw-bold">
                                                                                                    Vai
                                                                                                    trò:</div>
                                                                                                <div class="col-md-9">
                                                                                                    ${user.role.name}
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="row mb-3">
                                                                                                <div
                                                                                                    class="col-md-3 fw-bold">
                                                                                                    Ngày đăng ký:</div>
                                                                                                <div class="col-md-9">
                                                                                                    ${user.createdAt}
                                                                                                </div>
                                                                                            </div>

                                                                                        </div>
                                                                                    </div>
                                                                                    <div
                                                                                        class="modal-footer d-flex justify-content-between">
                                                                                        <div>
                                                                                            <!-- Dòng khoảng 139-155 -->
                                                                                            <form
                                                                                                action="/admin/user/update-role"
                                                                                                method="POST"
                                                                                                class="d-inline-flex align-items-center">
                                                                                                <input type="hidden"
                                                                                                    name="userId"
                                                                                                    value="${user.id}" />
                                                                                                <select name="roleId"
                                                                                                    class="form-select form-select-sm me-2"
                                                                                                    style="width: auto;">
                                                                                                    <c:forEach
                                                                                                        items="${roles}"
                                                                                                        var="role">
                                                                                                        <option
                                                                                                            value="${role.id}"
                                                                                                            ${user.role.id==role.id
                                                                                                            ? 'selected'
                                                                                                            : '' }>
                                                                                                            ${role.name}
                                                                                                        </option>
                                                                                                    </c:forEach>
                                                                                                </select>
                                                                                                <button type="submit"
                                                                                                    class="btn btn-primary btn-sm">
                                                                                                    <i
                                                                                                        class="fas fa-user-tag me-1"></i>Cập
                                                                                                    nhật vai trò
                                                                                                </button>
                                                                                            </form>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <!-- Delete Confirmation Modal -->
                                                                        <div class="modal fade"
                                                                            id="deleteModal${user.id}" tabindex="-1"
                                                                            aria-labelledby="deleteModalLabel"
                                                                            aria-hidden="true">
                                                                            <div class="modal-dialog">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <h5 class="modal-title"
                                                                                            id="deleteModalLabel">Xác
                                                                                            nhận
                                                                                            xóa
                                                                                        </h5>
                                                                                        <button type="button"
                                                                                            class="btn-close"
                                                                                            data-bs-dismiss="modal"
                                                                                            aria-label="Close"></button>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        Bạn có chắc muốn xóa người dùng
                                                                                        <strong>${user.fullName}</strong>?
                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <button type="button"
                                                                                            class="btn btn-secondary"
                                                                                            data-bs-dismiss="modal">Hủy</button>
                                                                                        <a href="/admin/user/delete/${user.id}"
                                                                                            class="btn btn-danger">Xóa</a>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                    <!-- Phân trang -->
                                                    <c:if test="${totalPages > 1}">
                                                        <nav aria-label="Page navigation" class="mt-4">
                                                            <ul class="pagination justify-content-center">
                                                                <!-- Nút Previous -->
                                                                <li
                                                                    class="page-item ${currentPage <= 1 ? 'disabled' : ''}">
                                                                    <a class="page-link"
                                                                        href="/admin/user?page=${currentPage - 1}${not empty email ? '&email='.concat(email) : ''}"
                                                                        aria-label="Previous">
                                                                        <span aria-hidden="true">&laquo;</span>
                                                                    </a>
                                                                </li>

                                                                <!-- Các số trang -->
                                                                <c:forEach begin="1" end="${totalPages}" var="i">
                                                                    <li
                                                                        class="page-item ${currentPage == i ? 'active' : ''}">
                                                                        <a class="page-link"
                                                                            href="/admin/user?page=${i}${not empty email ? '&email='.concat(email) : ''}">${i}</a>
                                                                    </li>
                                                                </c:forEach>

                                                                <!-- Nút Next -->
                                                                <li
                                                                    class="page-item ${currentPage >= totalPages ? 'disabled' : ''}">
                                                                    <a class="page-link"
                                                                        href="/admin/user?page=${currentPage + 1}${not empty email ? '&email='.concat(email) : ''}"
                                                                        aria-label="Next">
                                                                        <span aria-hidden="true">&raquo;</span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </nav>

                                                        <!-- Thông tin phân trang -->
                                                        <div class="text-center text-muted">
                                                            Hiển thị ${(currentPage-1)*10 + 1} đến
                                                            ${Math.min(currentPage*10, totalItems)}
                                                            trong tổng số ${totalItems} người dùng
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="/js/scripts.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                        crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                        crossorigin="anonymous"></script>

                </body>

                </html>