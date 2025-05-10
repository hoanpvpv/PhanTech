<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="PhanTech - Quản lý kiểu thang máy" />
                    <meta name="author" content="PhanTech" />
                    <title>Quản lý kiểu thang máy - PhanTech</title>
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
                                                <h4 class="mb-0">Danh Sách Kiểu Thang Máy</h4>
                                                <button class="btn btn-success" data-bs-toggle="modal"
                                                    data-bs-target="#createElevatorTypeModal">
                                                    <i class="fas fa-plus me-1"></i> Tạo Kiểu Thang Máy Mới
                                                </button>
                                            </div>

                                            <!-- Phần tìm kiếm -->
                                            <div class="card-header bg-light">
                                                <div class="d-flex align-items-center">
                                                    <div class="input-group me-2">
                                                        <input type="text" class="form-control" id="searchInput"
                                                            value="${name}" placeholder="Tìm kiếm theo tên...">
                                                        <button class="btn btn-outline-primary" type="button"
                                                            id="searchButton">
                                                            <i class="fas fa-search"></i>
                                                        </button>
                                                    </div>
                                                    <button type="button" class="btn btn-outline-secondary"
                                                        id="resetButton">
                                                        <i class="fas fa-sync-alt"></i> Đặt lại
                                                    </button>
                                                </div>
                                            </div>

                                            <div class="card-body">
                                                <div class="table-responsive">
                                                    <table id="elevatorTypesTable" class="table table-hover">
                                                        <thead class="table-dark">
                                                            <tr>
                                                                <th>ID</th>
                                                                <th>Tên</th>
                                                                <th>Mô tả</th>
                                                                <th>Hình ảnh</th>
                                                                <th width="150">Thao Tác</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:choose>
                                                                <c:when test="${empty elevatorTypes.content}">
                                                                    <tr>
                                                                        <td colspan="5" class="text-center">Không tìm
                                                                            thấy kiểu thang máy nào.</td>
                                                                    </tr>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <c:forEach items="${elevatorTypes.content}"
                                                                        var="elevatorType">
                                                                        <tr>
                                                                            <td>${elevatorType.id}</td>
                                                                            <td>${elevatorType.name}</td>
                                                                            <td>
                                                                                <c:if
                                                                                    test="${not empty elevatorType.description}">
                                                                                    ${elevatorType.description.length()
                                                                                    > 50 ?
                                                                                    elevatorType.description.substring(0,
                                                                                    50).concat('...') :
                                                                                    elevatorType.description}
                                                                                </c:if>
                                                                            </td>
                                                                            <td>
                                                                                <c:choose>
                                                                                    <c:when
                                                                                        test="${not empty elevatorType.image}">
                                                                                        <img src="/images/public/${elevatorType.image}"
                                                                                            alt="${elevatorType.name}"
                                                                                            width="50" height="50"
                                                                                            class="img-thumbnail">
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <img src="/images/public/placeholder.png"
                                                                                            alt="No Image" width="50"
                                                                                            height="50"
                                                                                            class="img-thumbnail">
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </td>
                                                                            <td>
                                                                                <div class="btn-group" role="group">

                                                                                    <button type="button"
                                                                                        class="btn btn-sm btn-warning"
                                                                                        data-bs-toggle="modal"
                                                                                        data-bs-target="#editModal${elevatorType.id}"
                                                                                        title="Chỉnh sửa">
                                                                                        <i class="fas fa-edit"></i>
                                                                                    </button>
                                                                                    <button type="button"
                                                                                        class="btn btn-sm btn-danger"
                                                                                        data-bs-toggle="modal"
                                                                                        data-bs-target="#deleteModal${elevatorType.id}"
                                                                                        title="Xóa">
                                                                                        <i class="fas fa-trash"></i>
                                                                                    </button>
                                                                                </div>


                                                                                <!-- Edit Modal -->
                                                                                <div class="modal fade"
                                                                                    id="editModal${elevatorType.id}"
                                                                                    tabindex="-1"
                                                                                    aria-labelledby="editModalLabel${elevatorType.id}"
                                                                                    aria-hidden="true">
                                                                                    <div class="modal-dialog modal-lg">
                                                                                        <div class="modal-content">
                                                                                            <div
                                                                                                class="modal-header bg-warning">
                                                                                                <h5 class="modal-title"
                                                                                                    id="editModalLabel${elevatorType.id}">
                                                                                                    Chỉnh Sửa Kiểu Thang
                                                                                                    Máy:
                                                                                                    ${elevatorType.name}
                                                                                                </h5>
                                                                                                <button type="button"
                                                                                                    class="btn-close"
                                                                                                    data-bs-dismiss="modal"
                                                                                                    aria-label="Close"></button>
                                                                                            </div>
                                                                                            <div class="modal-body">
                                                                                                <form
                                                                                                    action="/admin/elevator-type/edit/${elevatorType.id}"
                                                                                                    method="post"
                                                                                                    enctype="multipart/form-data">
                                                                                                    <input type="hidden"
                                                                                                        name="${_csrf.parameterName}"
                                                                                                        value="${_csrf.token}" />
                                                                                                    <c:if
                                                                                                        test="${not empty error}">
                                                                                                        <div
                                                                                                            class="alert alert-danger">
                                                                                                            ${error}
                                                                                                        </div>
                                                                                                    </c:if>
                                                                                                    <div
                                                                                                        class="row mb-3">
                                                                                                        <div
                                                                                                            class="col-md-12">
                                                                                                            <div
                                                                                                                class="form-floating mb-3">
                                                                                                                <input
                                                                                                                    class="form-control ${not empty errors.name ? 'is-invalid' : ''}"
                                                                                                                    id="name${elevatorType.id}"
                                                                                                                    name="name"
                                                                                                                    type="text"
                                                                                                                    value="${elevatorType.name}"
                                                                                                                    placeholder="Tên kiểu thang máy"
                                                                                                                    required="required" />
                                                                                                                <label
                                                                                                                    for="name${elevatorType.id}">Tên
                                                                                                                    kiểu
                                                                                                                    thang
                                                                                                                    máy</label>
                                                                                                                <c:if
                                                                                                                    test="${not empty errors.name}">
                                                                                                                    <div
                                                                                                                        class="invalid-feedback">
                                                                                                                        ${errors.name}
                                                                                                                    </div>
                                                                                                                </c:if>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>

                                                                                                    <div
                                                                                                        class="row mb-3">
                                                                                                        <div
                                                                                                            class="col-md-12">
                                                                                                            <div
                                                                                                                class="form-floating mb-3">
                                                                                                                <textarea
                                                                                                                    class="form-control"
                                                                                                                    id="description${elevatorType.id}"
                                                                                                                    name="description"
                                                                                                                    style="height: 120px;"
                                                                                                                    placeholder="Mô tả">${elevatorType.description}</textarea>
                                                                                                                <label
                                                                                                                    for="description${elevatorType.id}">Mô
                                                                                                                    tả</label>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>

                                                                                                    <div
                                                                                                        class="row mb-3">
                                                                                                        <div
                                                                                                            class="col-md-12">
                                                                                                            <label
                                                                                                                for="imageFile${elevatorType.id}"
                                                                                                                class="form-label">Hình
                                                                                                                ảnh</label>
                                                                                                            <input
                                                                                                                class="form-control"
                                                                                                                id="imageFile${elevatorType.id}"
                                                                                                                name="imageFile"
                                                                                                                type="file"
                                                                                                                accept="image/*" />
                                                                                                            <div
                                                                                                                class="form-text">
                                                                                                                Chọn
                                                                                                                hình ảnh
                                                                                                                mới (để
                                                                                                                trống
                                                                                                                nếu
                                                                                                                không
                                                                                                                muốn
                                                                                                                thay
                                                                                                                đổi)
                                                                                                            </div>
                                                                                                            <c:if
                                                                                                                test="${not empty elevatorType.image}">
                                                                                                                <div
                                                                                                                    class="mt-3">
                                                                                                                    <p>Hình
                                                                                                                        ảnh
                                                                                                                        hiện
                                                                                                                        tại:
                                                                                                                    </p>
                                                                                                                    <img src="/images/public/${elevatorType.image}"
                                                                                                                        alt="${elevatorType.name}"
                                                                                                                        class="img-thumbnail"
                                                                                                                        style="max-height: 150px;">
                                                                                                                </div>
                                                                                                            </c:if>
                                                                                                        </div>
                                                                                                    </div>

                                                                                                    <div
                                                                                                        class="mt-4 mb-0 text-center">
                                                                                                        <button
                                                                                                            type="button"
                                                                                                            class="btn btn-secondary me-2"
                                                                                                            data-bs-dismiss="modal">Hủy</button>
                                                                                                        <button
                                                                                                            type="submit"
                                                                                                            class="btn btn-warning">
                                                                                                            <i
                                                                                                                class="fas fa-save me-1"></i>
                                                                                                            Cập nhật
                                                                                                        </button>
                                                                                                    </div>
                                                                                                </form>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                                <!-- Delete Confirmation Modal -->
                                                                                <div class="modal fade"
                                                                                    id="deleteModal${elevatorType.id}"
                                                                                    tabindex="-1"
                                                                                    aria-labelledby="deleteModalLabel${elevatorType.id}"
                                                                                    aria-hidden="true">
                                                                                    <div class="modal-dialog">
                                                                                        <div class="modal-content">
                                                                                            <div class="modal-header">
                                                                                                <h5 class="modal-title"
                                                                                                    id="deleteModalLabel${elevatorType.id}">
                                                                                                    Xác nhận xóa</h5>
                                                                                                <button type="button"
                                                                                                    class="btn-close"
                                                                                                    data-bs-dismiss="modal"
                                                                                                    aria-label="Close"></button>
                                                                                            </div>
                                                                                            <div class="modal-body">
                                                                                                Bạn có chắc muốn xóa
                                                                                                kiểu thang máy
                                                                                                <strong>${elevatorType.name}</strong>?
                                                                                                <p
                                                                                                    class="text-danger mt-2">
                                                                                                    Lưu ý: Việc xóa có
                                                                                                    thể ảnh hưởng đến
                                                                                                    các sản phẩm liên
                                                                                                    quan.</p>
                                                                                            </div>
                                                                                            <div class="modal-footer">
                                                                                                <button type="button"
                                                                                                    class="btn btn-secondary"
                                                                                                    data-bs-dismiss="modal">Hủy</button>
                                                                                                <form
                                                                                                    action="/admin/elevator-type/delete/${elevatorType.id}"
                                                                                                    method="post">
                                                                                                    <input type="hidden"
                                                                                                        name="${_csrf.parameterName}"
                                                                                                        value="${_csrf.token}" />
                                                                                                    <button
                                                                                                        type="submit"
                                                                                                        class="btn btn-danger">Xóa</button>
                                                                                                </form>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </tbody>
                                                    </table>
                                                </div>

                                                <!-- Pagination -->
                                                <c:if test="${totalPages > 1}">
                                                    <nav aria-label="Page navigation">
                                                        <ul class="pagination justify-content-center mt-3">
                                                            <!-- Previous Page -->
                                                            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                                                <a class="page-link" href="javascript:void(0);"
                                                                    onclick="navigateToPage(${currentPage - 1})"
                                                                    aria-label="Previous">
                                                                    <i class="fas fa-angle-left"></i>
                                                                </a>
                                                            </li>
                                                            <!-- Page Numbers -->
                                                            <c:forEach begin="1" end="${totalPages}" var="i">
                                                                <li
                                                                    class="page-item ${currentPage == i ? 'active' : ''}">
                                                                    <a class="page-link" href="javascript:void(0);"
                                                                        onclick="navigateToPage(${i})">${i}</a>
                                                                </li>
                                                            </c:forEach>
                                                            <!-- Next Page -->
                                                            <li
                                                                class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                                                <a class="page-link" href="javascript:void(0);"
                                                                    onclick="navigateToPage(${currentPage + 1})"
                                                                    aria-label="Next">
                                                                    <i class="fas fa-angle-right"></i>
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </nav>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Modal Tạo Kiểu Thang Máy Mới -->
                            <div class="modal fade" id="createElevatorTypeModal" tabindex="-1"
                                aria-labelledby="createElevatorTypeModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header bg-success text-white">
                                            <h5 class="modal-title" id="createElevatorTypeModalLabel">Tạo Kiểu Thang Máy
                                                Mới</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="/admin/elevator-type/create" method="post"
                                                enctype="multipart/form-data">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                                <c:if test="${not empty error}">
                                                    <div class="alert alert-danger">${error}</div>
                                                </c:if>
                                                <div class="row mb-3">
                                                    <div class="col-md-12">
                                                        <div class="form-floating mb-3">
                                                            <input
                                                                class="form-control ${not empty errors.name ? 'is-invalid' : ''}"
                                                                id="name" name="name" type="text"
                                                                placeholder="Tên kiểu thang máy" required="required"
                                                                value="${elevatorType.name}" />
                                                            <label for="name">Tên kiểu thang máy</label>
                                                            <c:if test="${not empty errors.name}">
                                                                <div class="invalid-feedback">${errors.name}</div>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row mb-3">
                                                    <div class="col-md-12">
                                                        <div class="form-floating mb-3">
                                                            <textarea class="form-control" id="description"
                                                                name="description" style="height: 120px;"
                                                                placeholder="Mô tả">${elevatorType.description}</textarea>
                                                            <label for="description">Mô tả</label>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row mb-3">
                                                    <div class="col-md-12">
                                                        <label for="imageFile" class="form-label">Hình ảnh</label>
                                                        <input class="form-control" id="imageFile" name="imageFile"
                                                            type="file" accept="image/*" />
                                                        <div class="form-text">Chọn hình ảnh cho kiểu thang máy (định
                                                            dạng: jpg, png, gif)</div>
                                                    </div>
                                                </div>

                                                <div class="mt-4 mb-0 text-center">
                                                    <button type="button" class="btn btn-secondary me-2"
                                                        data-bs-dismiss="modal">Hủy</button>
                                                    <button type="submit" class="btn btn-success">
                                                        <i class="fas fa-plus me-1"></i> Tạo kiểu thang máy
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
                        crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="/js/scripts.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                        crossorigin="anonymous"></script>
                    <script>
                        document.addEventListener('DOMContentLoaded', function () {
                            // Initialize Simple DataTables


                            // Search handling
                            const searchInput = document.getElementById('searchInput');
                            const searchButton = document.getElementById('searchButton');
                            const resetButton = document.getElementById('resetButton');

                            searchButton.addEventListener('click', function () {
                                performSearch();
                            });

                            searchInput.addEventListener('keypress', function (event) {
                                if (event.key === 'Enter') {
                                    performSearch();
                                    event.preventDefault();
                                }
                            });

                            resetButton.addEventListener('click', function () {
                                window.location.href = '/admin/elevator-type';
                            });

                            // Reset forms in modals
                            const createModal = document.getElementById('createElevatorTypeModal');
                            if (createModal) {
                                createModal.addEventListener('hidden.bs.modal', function () {
                                    const form = createModal.querySelector('form');
                                    if (form) {
                                        form.reset();
                                    }
                                });
                            }

                            document.querySelectorAll('.modal[id^="editModal"]').forEach(modal => {
                                modal.addEventListener('hidden.bs.modal', function () {
                                    const form = modal.querySelector('form');
                                    if (form) {
                                        form.reset();
                                    }
                                });
                            });

                            // Handle modal transitions
                            document.querySelectorAll('[data-bs-dismiss="modal"][data-bs-toggle="modal"]').forEach(button => {
                                button.addEventListener('click', function () {
                                    const currentModal = document.querySelector('.modal.show');
                                    if (currentModal) {
                                        currentModal.addEventListener('hidden.bs.modal', function handler() {
                                            this.removeEventListener('hidden.bs.modal', handler);
                                            const targetId = button.getAttribute('data-bs-target');
                                            const targetModal = document.querySelector(targetId);
                                            const bsModal = new bootstrap.Modal(targetModal);
                                            bsModal.show();
                                        }, { once: true });
                                    }
                                });
                            });
                        });

                        function performSearch() {
                            const searchInput = document.getElementById('searchInput');
                            const searchTerm = searchInput.value.trim();

                            if (searchTerm.length === 0) {
                                alert('Vui lòng nhập từ khóa tìm kiếm.');
                                return;
                            }
                            if (searchTerm.length > 100) {
                                alert('Từ khóa tìm kiếm không được vượt quá 100 ký tự.');
                                return;
                            }

                            navigateToPage(1, searchTerm);
                        }

                        function navigateToPage(page, searchTerm = null) {
                            if (searchTerm === null) {
                                searchTerm = document.getElementById('searchInput').value.trim();
                            }

                            let url = '/admin/elevator-type?page=' + page;
                            if (searchTerm) {
                                url += '&name=' + encodeURIComponent(searchTerm);
                            }

                            window.location.href = url;
                        }
                    </script>
                </body>

                </html>