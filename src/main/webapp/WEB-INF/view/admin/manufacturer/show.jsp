<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="PhanTech - Quản lý nhà sản xuất" />
                <meta name="author" content="PhanTech" />
                <title>Quản lý nhà sản xuất - PhanTech</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
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
                                            <h4 class="mb-0">Danh Sách Nhà Sản Xuất</h4>
                                            <a href="#" class="btn btn-success" data-bs-toggle="modal"
                                                data-bs-target="#createManufacturerModal">
                                                <i class="fas fa-plus me-1"></i> Tạo Nhà Sản Xuất mới
                                            </a>
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table id="manufacturersTable" class="table table-striped table-hover">
                                                    <thead class="table-dark">
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Tên</th>
                                                            <th>Xuất xứ</th>
                                                            <th>Logo</th>
                                                            <th width="150">Thao Tác</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${manufacturers}" var="manufacturer">
                                                            <tr>
                                                                <td>${manufacturer.id}</td>
                                                                <td>${manufacturer.name}</td>
                                                                <td>${manufacturer.origin}</td>
                                                                <td>
                                                                    <c:if test="${not empty manufacturer.logo}">
                                                                        <img src="/images/public/${manufacturer.logo}"
                                                                            alt="${manufacturer.name}" width="50"
                                                                            height="50" class="img-thumbnail">
                                                                    </c:if>
                                                                </td>
                                                                <td>
                                                                    <div class="btn-group" role="group">
                                                                        <button type="button"
                                                                            class="btn btn-sm btn-info"
                                                                            data-bs-toggle="modal"
                                                                            data-bs-target="#viewModal${manufacturer.id}"
                                                                            title="Xem chi tiết">
                                                                            <i class="fas fa-eye"></i>
                                                                        </button>
                                                                        <button type="button"
                                                                            class="btn btn-sm btn-warning"
                                                                            data-bs-toggle="modal"
                                                                            data-bs-target="#editModal${manufacturer.id}"
                                                                            title="Chỉnh sửa">
                                                                            <i class="fas fa-edit"></i>
                                                                        </button>
                                                                        <button type="button"
                                                                            class="btn btn-sm btn-danger"
                                                                            data-bs-toggle="modal"
                                                                            data-bs-target="#deleteModal${manufacturer.id}"
                                                                            title="Xóa">
                                                                            <i class="fas fa-trash"></i>
                                                                        </button>
                                                                    </div>

                                                                    <!-- Manufacturer Details Modal -->
                                                                    <div class="modal fade"
                                                                        id="viewModal${manufacturer.id}" tabindex="-1"
                                                                        aria-labelledby="viewModalLabel${manufacturer.id}"
                                                                        aria-hidden="true">
                                                                        <div class="modal-dialog modal-lg">
                                                                            <div class="modal-content">
                                                                                <div
                                                                                    class="modal-header bg-info text-white">
                                                                                    <h5 class="modal-title"
                                                                                        id="viewModalLabel${manufacturer.id}">
                                                                                        Thông tin chi tiết nhà sản xuất:
                                                                                        ${manufacturer.name}
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
                                                                                                ID:</div>
                                                                                            <div class="col-md-9">
                                                                                                ${manufacturer.id}</div>
                                                                                        </div>
                                                                                        <div class="row mb-3">
                                                                                            <div
                                                                                                class="col-md-3 fw-bold">
                                                                                                Tên nhà sản xuất:</div>
                                                                                            <div class="col-md-9">
                                                                                                ${manufacturer.name}
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row mb-3">
                                                                                            <div
                                                                                                class="col-md-3 fw-bold">
                                                                                                Xuất xứ:</div>
                                                                                            <div class="col-md-9">
                                                                                                ${manufacturer.origin}
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row mb-3">
                                                                                            <div
                                                                                                class="col-md-3 fw-bold">
                                                                                                Logo:</div>
                                                                                            <div class="col-md-9">
                                                                                                <c:if
                                                                                                    test="${not empty manufacturer.logo}">

                                                                                                    <img src="/images/public/${manufacturer.logo}"
                                                                                                        alt="${manufacturer.name}"
                                                                                                        class="img-fluid"
                                                                                                        style="max-height: 200px;">
                                                                                                </c:if>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row mb-3">
                                                                                            <div
                                                                                                class="col-md-3 fw-bold">
                                                                                                Số sản phẩm:</div>
                                                                                            <div class="col-md-9">
                                                                                                ${manufacturer.products.size()}
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="button"
                                                                                        class="btn btn-secondary"
                                                                                        data-bs-dismiss="modal">Đóng</button>
                                                                                    <button type="button"
                                                                                        class="btn btn-warning"
                                                                                        data-bs-toggle="modal"
                                                                                        data-bs-target="#editModal${manufacturer.id}"
                                                                                        data-bs-dismiss="modal">
                                                                                        <i
                                                                                            class="fas fa-edit me-1"></i>Chỉnh
                                                                                        sửa
                                                                                    </button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <!-- Modal Chỉnh Sửa Nhà Sản Xuất -->
                                                                    <c:forEach items="${manufacturers}"
                                                                        var="manufacturer">
                                                                        <div class="modal fade"
                                                                            id="editModal${manufacturer.id}"
                                                                            tabindex="-1"
                                                                            aria-labelledby="editModalLabel${manufacturer.id}"
                                                                            aria-hidden="true">
                                                                            <div class="modal-dialog modal-lg">
                                                                                <div class="modal-content">
                                                                                    <div
                                                                                        class="modal-header bg-warning">
                                                                                        <h5 class="modal-title"
                                                                                            id="editModalLabel${manufacturer.id}">
                                                                                            Chỉnh Sửa Nhà Sản Xuất:
                                                                                            ${manufacturer.name}
                                                                                        </h5>
                                                                                        <button type="button"
                                                                                            class="btn-close"
                                                                                            data-bs-dismiss="modal"
                                                                                            aria-label="Close"></button>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        <form
                                                                                            action="/admin/manufacturer/edit/${manufacturer.id}"
                                                                                            method="post"
                                                                                            enctype="multipart/form-data">
                                                                                            <div class="row mb-3">
                                                                                                <div class="col-md-12">
                                                                                                    <div
                                                                                                        class="form-floating mb-3">
                                                                                                        <input
                                                                                                            class="form-control"
                                                                                                            id="name${manufacturer.id}"
                                                                                                            name="name"
                                                                                                            type="text"
                                                                                                            value="${manufacturer.name}"
                                                                                                            placeholder="Tên nhà sản xuất"
                                                                                                            required="required" />
                                                                                                        <label
                                                                                                            for="name${manufacturer.id}">Tên
                                                                                                            nhà sản
                                                                                                            xuất</label>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="row mb-3">
                                                                                                <div class="col-md-12">
                                                                                                    <div
                                                                                                        class="form-floating mb-3">
                                                                                                        <input
                                                                                                            class="form-control"
                                                                                                            id="origin${manufacturer.id}"
                                                                                                            name="origin"
                                                                                                            type="text"
                                                                                                            value="${manufacturer.origin}"
                                                                                                            placeholder="Xuất xứ"
                                                                                                            required="required" />
                                                                                                        <label
                                                                                                            for="origin${manufacturer.id}">Xuất
                                                                                                            xứ</label>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="row mb-3">
                                                                                                <div class="col-md-12">
                                                                                                    <label
                                                                                                        for="logoFile${manufacturer.id}"
                                                                                                        class="form-label">Logo</label>
                                                                                                    <input
                                                                                                        class="form-control"
                                                                                                        id="logoFile${manufacturer.id}"
                                                                                                        name="logoFile"
                                                                                                        type="file"
                                                                                                        accept="image/*" />
                                                                                                    <div
                                                                                                        class="form-text">
                                                                                                        Chọn hình ảnh
                                                                                                        logo mới (để
                                                                                                        trống nếu không
                                                                                                        muốn thay đổi)
                                                                                                    </div>

                                                                                                    <c:if
                                                                                                        test="${not empty manufacturer.logo}">
                                                                                                        <div
                                                                                                            class="mt-3">
                                                                                                            <p>Logo hiện
                                                                                                                tại:</p>
                                                                                                            <img src="/images/public/${manufacturer.logo}"
                                                                                                                alt="${manufacturer.name}"
                                                                                                                class="img-thumbnail"
                                                                                                                style="max-height: 150px;">
                                                                                                        </div>
                                                                                                    </c:if>
                                                                                                </div>
                                                                                            </div>

                                                                                            <div
                                                                                                class="mt-4 mb-0 text-center">
                                                                                                <button type="button"
                                                                                                    class="btn btn-secondary me-2"
                                                                                                    data-bs-dismiss="modal">Hủy</button>
                                                                                                <button type="submit"
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
                                                                    </c:forEach>
                                                                    <!-- Delete Confirmation Modal -->
                                                                    <div class="modal fade"
                                                                        id="deleteModal${manufacturer.id}" tabindex="-1"
                                                                        aria-labelledby="deleteModalLabel"
                                                                        aria-hidden="true">
                                                                        <div class="modal-dialog">
                                                                            <div class="modal-content">
                                                                                <div class="modal-header">
                                                                                    <h5 class="modal-title"
                                                                                        id="deleteModalLabel">Xác nhận
                                                                                        xóa</h5>
                                                                                    <button type="button"
                                                                                        class="btn-close"
                                                                                        data-bs-dismiss="modal"
                                                                                        aria-label="Close"></button>
                                                                                </div>
                                                                                <div class="modal-body">
                                                                                    Bạn có chắc muốn xóa nhà sản xuất
                                                                                    <strong>${manufacturer.name}</strong>?
                                                                                    <p class="text-danger mt-2">Lưu ý:
                                                                                        Việc xóa có thể ảnh hưởng đến
                                                                                        các sản phẩm liên quan.</p>
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="button"
                                                                                        class="btn btn-secondary"
                                                                                        data-bs-dismiss="modal">Hủy</button>
                                                                                    <a href="/admin/manufacturer/delete/${manufacturer.id}"
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
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal Tạo Nhà Sản Xuất Mới -->
                    <div class="modal fade" id="createManufacturerModal" tabindex="-1"
                        aria-labelledby="createManufacturerModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header bg-success text-white">
                                    <h5 class="modal-title" id="createManufacturerModalLabel">
                                        Tạo Nhà Sản Xuất Mới
                                    </h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="/admin/manufacturer/create" method="post"
                                        enctype="multipart/form-data">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <div class="row mb-3">
                                            <div class="col-md-12">
                                                <div class="form-floating mb-3">
                                                    <input class="form-control" id="name" name="name" type="text"
                                                        placeholder="Tên nhà sản xuất" required="required" />
                                                    <label for="name">Tên nhà sản xuất</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-md-12">
                                                <div class="form-floating mb-3">
                                                    <input class="form-control" id="origin" name="origin" type="text"
                                                        placeholder="Xuất xứ" required="required" />
                                                    <label for="origin">Xuất xứ</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-md-12">
                                                <label for="logoFile" class="form-label">Logo</label>
                                                <input class="form-control" id="logoFile" name="logoFile" type="file"
                                                    accept="image/*" />
                                                <div class="form-text">Chọn hình ảnh logo cho nhà sản xuất (định dạng:
                                                    jpg, png, gif)</div>
                                            </div>
                                        </div>

                                        <div class="mt-4 mb-0 text-center">
                                            <button type="button" class="btn btn-secondary me-2"
                                                data-bs-dismiss="modal">Hủy</button>
                                            <button type="submit" class="btn btn-success">
                                                <i class="fas fa-plus me-1"></i> Tạo nhà sản xuất
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                    crossorigin></script>
                <script>
                    // Initialize DataTable
                    document.addEventListener('DOMContentLoaded', function () {


                        // Reset form khi đóng modal tạo mới
                        const createModal = document.getElementById('createManufacturerModal');
                        if (createModal) {
                            createModal.addEventListener('hidden.bs.modal', function () {
                                const form = createModal.querySelector('form');
                                if (form) {
                                    form.reset();
                                }
                            });
                        }

                        // Xử lý các nút chỉnh sửa trong modal xem chi tiết
                        document.querySelectorAll('[data-bs-dismiss="modal"][data-bs-toggle="modal"]').forEach(button => {
                            button.addEventListener('click', function () {
                                // Đợi modal hiện tại đóng hoàn toàn rồi mới mở modal mới
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
                </script>