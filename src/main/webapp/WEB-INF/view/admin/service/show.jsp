<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="PhanTech - Quản lý dịch vụ" />
                <meta name="author" content="PhanTech" />
                <title>Quản lý dịch vụ - PhanTech</title>
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
                                            <h4 class="mb-0">Danh Sách Dịch Vụ</h4>
                                            <button class="btn btn-success" data-bs-toggle="modal"
                                                data-bs-target="#createServiceModal">
                                                <i class="fas fa-plus me-1"></i> Tạo Dịch Vụ Mới
                                            </button>
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table id="servicesTable" class="table table-striped table-hover">
                                                    <thead class="table-dark">
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Tên dịch vụ</th>
                                                            <th>Mô tả ngắn</th>
                                                            <th>Hình ảnh</th>
                                                            <th width="150">Thao Tác</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${services}" var="service">
                                                            <tr>
                                                                <td>${service.id}</td>
                                                                <td>${service.name}</td>
                                                                <td>
                                                                    <c:if test="${not empty service.shortDesc}">
                                                                        ${service.shortDesc.length() > 50 ?
                                                                        service.shortDesc.substring(0, 50).concat('...')
                                                                        : service.shortDesc}
                                                                    </c:if>
                                                                </td>
                                                                <td>
                                                                    <c:if test="${not empty service.image}">
                                                                        <img src="/images/public/${service.image}"
                                                                            alt="${service.name}" width="50" height="50"
                                                                            class="img-thumbnail">
                                                                    </c:if>
                                                                </td>
                                                                <td>
                                                                    <div class="btn-group" role="group">
                                                                        <button type="button"
                                                                            class="btn btn-sm btn-info"
                                                                            data-bs-toggle="modal"
                                                                            data-bs-target="#viewModal${service.id}"
                                                                            title="Xem chi tiết">
                                                                            <i class="fas fa-eye"></i>
                                                                        </button>
                                                                        <button type="button"
                                                                            class="btn btn-sm btn-warning"
                                                                            data-bs-toggle="modal"
                                                                            data-bs-target="#editModal${service.id}"
                                                                            title="Chỉnh sửa">
                                                                            <i class="fas fa-edit"></i>
                                                                        </button>
                                                                        <button type="button"
                                                                            class="btn btn-sm btn-danger"
                                                                            data-bs-toggle="modal"
                                                                            data-bs-target="#deleteModal${service.id}"
                                                                            title="Xóa">
                                                                            <i class="fas fa-trash"></i>
                                                                        </button>
                                                                    </div>

                                                                    <!-- View Details Modal -->
                                                                    <div class="modal fade" id="viewModal${service.id}"
                                                                        tabindex="-1"
                                                                        aria-labelledby="viewModalLabel${service.id}"
                                                                        aria-hidden="true">
                                                                        <div class="modal-dialog modal-lg">
                                                                            <div class="modal-content">
                                                                                <div
                                                                                    class="modal-header bg-info text-white">
                                                                                    <h5 class="modal-title"
                                                                                        id="viewModalLabel${service.id}">
                                                                                        Thông tin chi tiết dịch vụ:
                                                                                        ${service.name}
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
                                                                                                ${service.id}</div>
                                                                                        </div>
                                                                                        <div class="row mb-3">
                                                                                            <div
                                                                                                class="col-md-3 fw-bold">
                                                                                                Tên dịch vụ:</div>
                                                                                            <div class="col-md-9">
                                                                                                ${service.name}</div>
                                                                                        </div>
                                                                                        <div class="row mb-3">
                                                                                            <div
                                                                                                class="col-md-3 fw-bold">
                                                                                                Mô tả ngắn:</div>
                                                                                            <div class="col-md-9">
                                                                                                ${service.shortDesc}
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row mb-3">
                                                                                            <div
                                                                                                class="col-md-3 fw-bold">
                                                                                                Đánh giá:</div>
                                                                                            <div class="col-md-9">
                                                                                                ${service.rating}
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row mb-3">
                                                                                            <div
                                                                                                class="col-md-3 fw-bold">
                                                                                                Mô tả chi tiết:</div>
                                                                                            <div class="col-md-9">
                                                                                                ${service.detailDesc}
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row mb-3">
                                                                                            <div
                                                                                                class="col-md-3 fw-bold">
                                                                                                Hình ảnh:</div>
                                                                                            <div class="col-md-9">
                                                                                                <c:if
                                                                                                    test="${not empty service.image}">
                                                                                                    <img src="/images/public/${service.image}"
                                                                                                        alt="${service.name}"
                                                                                                        class="img-fluid"
                                                                                                        style="max-height: 200px;">
                                                                                                </c:if>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row mb-3">
                                                                                            <div
                                                                                                class="col-md-3 fw-bold">
                                                                                                Số dự án liên quan:
                                                                                            </div>
                                                                                            <div class="col-md-9">
                                                                                                ${service.projects.size()}
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row mb-3">
                                                                                            <div
                                                                                                class="col-md-3 fw-bold">
                                                                                                Số đánh giá:</div>
                                                                                            <div class="col-md-9">
                                                                                                ${service.reviews.size()}
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
                                                                                        data-bs-target="#editModal${service.id}"
                                                                                        data-bs-dismiss="modal">
                                                                                        <i
                                                                                            class="fas fa-edit me-1"></i>Chỉnh
                                                                                        sửa
                                                                                    </button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <!-- Edit Modal -->
                                                                    <div class="modal fade" id="editModal${service.id}"
                                                                        tabindex="-1"
                                                                        aria-labelledby="editModalLabel${service.id}"
                                                                        aria-hidden="true">
                                                                        <div class="modal-dialog modal-lg">
                                                                            <div class="modal-content">
                                                                                <div class="modal-header bg-warning">
                                                                                    <h5 class="modal-title"
                                                                                        id="editModalLabel${service.id}">
                                                                                        Chỉnh Sửa Dịch Vụ:
                                                                                        ${service.name}
                                                                                    </h5>
                                                                                    <button type="button"
                                                                                        class="btn-close"
                                                                                        data-bs-dismiss="modal"
                                                                                        aria-label="Close"></button>
                                                                                </div>
                                                                                <div class="modal-body">
                                                                                    <form
                                                                                        action="/admin/service/edit/${service.id}"
                                                                                        method="post"
                                                                                        enctype="multipart/form-data">
                                                                                        <div class="row mb-3">
                                                                                            <div class="col-md-12">
                                                                                                <div
                                                                                                    class="form-floating mb-3">
                                                                                                    <input
                                                                                                        class="form-control"
                                                                                                        id="name${service.id}"
                                                                                                        name="name"
                                                                                                        type="text"
                                                                                                        value="${service.name}"
                                                                                                        placeholder="Tên dịch vụ"
                                                                                                        required="required" />
                                                                                                    <label
                                                                                                        for="name${service.id}">Tên
                                                                                                        dịch vụ</label>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>

                                                                                        <div class="row mb-3">
                                                                                            <div class="col-md-12">
                                                                                                <div
                                                                                                    class="form-floating mb-3">
                                                                                                    <textarea
                                                                                                        class="form-control"
                                                                                                        id="shortDesc${service.id}"
                                                                                                        name="shortDesc"
                                                                                                        style="height: 100px;"
                                                                                                        placeholder="Mô tả ngắn">${service.shortDesc}</textarea>
                                                                                                    <label
                                                                                                        for="shortDesc${service.id}">Mô
                                                                                                        tả ngắn</label>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>

                                                                                        <div class="row mb-3">
                                                                                            <div class="col-md-12">
                                                                                                <div
                                                                                                    class="form-floating mb-3">
                                                                                                    <textarea
                                                                                                        class="form-control"
                                                                                                        id="detailDesc${service.id}"
                                                                                                        name="detailDesc"
                                                                                                        style="height: 150px;"
                                                                                                        placeholder="Mô tả chi tiết">${service.detailDesc}</textarea>
                                                                                                    <label
                                                                                                        for="detailDesc${service.id}">Mô
                                                                                                        tả chi
                                                                                                        tiết</label>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>

                                                                                        <div class="row mb-3">
                                                                                            <div class="col-md-12">
                                                                                                <label
                                                                                                    for="imageFile${service.id}"
                                                                                                    class="form-label">Hình
                                                                                                    ảnh</label>
                                                                                                <input
                                                                                                    class="form-control"
                                                                                                    id="imageFile${service.id}"
                                                                                                    name="imageFile"
                                                                                                    type="file"
                                                                                                    accept="image/*" />
                                                                                                <div class="form-text">
                                                                                                    Chọn hình ảnh mới
                                                                                                    (để trống nếu không
                                                                                                    muốn thay đổi)
                                                                                                </div>

                                                                                                <c:if
                                                                                                    test="${not empty service.image}">
                                                                                                    <div class="mt-3">
                                                                                                        <p>Hình ảnh hiện
                                                                                                            tại:</p>
                                                                                                        <img src="/images/public/${service.image}"
                                                                                                            alt="${service.name}"
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

                                                                    <!-- Delete Confirmation Modal -->
                                                                    <div class="modal fade"
                                                                        id="deleteModal${service.id}" tabindex="-1"
                                                                        aria-labelledby="deleteModalLabel${service.id}"
                                                                        aria-hidden="true">
                                                                        <div class="modal-dialog">
                                                                            <div class="modal-content">
                                                                                <div class="modal-header">
                                                                                    <h5 class="modal-title"
                                                                                        id="deleteModalLabel${service.id}">
                                                                                        Xác nhận xóa
                                                                                    </h5>
                                                                                    <button type="button"
                                                                                        class="btn-close"
                                                                                        data-bs-dismiss="modal"
                                                                                        aria-label="Close"></button>
                                                                                </div>
                                                                                <div class="modal-body">
                                                                                    Bạn có chắc muốn xóa dịch vụ
                                                                                    <strong>${service.name}</strong>?
                                                                                    <p class="text-danger mt-2">Lưu ý:
                                                                                        Việc xóa có thể ảnh hưởng đến
                                                                                        các dự án và đánh giá liên quan.
                                                                                    </p>
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="button"
                                                                                        class="btn btn-secondary"
                                                                                        data-bs-dismiss="modal">Hủy</button>
                                                                                    <a href="/admin/service/delete/${service.id}"
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

                        <!-- Modal Tạo Dịch Vụ Mới -->
                        <div class="modal fade" id="createServiceModal" tabindex="-1"
                            aria-labelledby="createServiceModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header bg-success text-white">
                                        <h5 class="modal-title" id="createServiceModalLabel">
                                            Tạo Dịch Vụ Mới
                                        </h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="/admin/service/create" method="post"
                                            enctype="multipart/form-data">
                                            <div class="row mb-3">
                                                <div class="col-md-12">
                                                    <div class="form-floating mb-3">
                                                        <input class="form-control" id="name" name="name" type="text"
                                                            placeholder="Tên dịch vụ" required="required" />
                                                        <label for="name">Tên dịch vụ</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <div class="col-md-12">
                                                    <div class="form-floating mb-3">
                                                        <textarea class="form-control" id="shortDesc" name="shortDesc"
                                                            style="height: 100px;" placeholder="Mô tả ngắn"></textarea>
                                                        <label for="shortDesc">Mô tả ngắn</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <div class="col-md-12">
                                                    <div class="form-floating mb-3">
                                                        <textarea class="form-control" id="detailDesc" name="detailDesc"
                                                            style="height: 150px;"
                                                            placeholder="Mô tả chi tiết"></textarea>
                                                        <label for="detailDesc">Mô tả chi tiết</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <div class="col-md-12">
                                                    <label for="imageFile" class="form-label">Hình ảnh</label>
                                                    <input class="form-control" id="imageFile" name="imageFile"
                                                        type="file" accept="image/*" />
                                                    <div class="form-text">Chọn hình ảnh cho dịch vụ (định dạng: jpg,
                                                        png, gif)</div>
                                                </div>
                                            </div>

                                            <div class="mt-4 mb-0 text-center">
                                                <button type="button" class="btn btn-secondary me-2"
                                                    data-bs-dismiss="modal">Hủy</button>
                                                <button type="submit" class="btn btn-success">
                                                    <i class="fas fa-plus me-1"></i> Tạo dịch vụ
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
                    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                    crossorigin="anonymous"></script>
                <script>
                    // Initialize DataTable
                    document.addEventListener('DOMContentLoaded', function () {
                        const servicesTable = document.getElementById('servicesTable');
                        if (servicesTable) {
                            new simpleDatatables.DataTable(servicesTable);
                        }

                        // Reset form khi đóng modal tạo mới
                        const createModal = document.getElementById('createServiceModal');
                        if (createModal) {
                            createModal.addEventListener('hidden.bs.modal', function () {
                                const form = createModal.querySelector('form');
                                if (form) {
                                    form.reset();
                                }
                            });
                        }
                    });
                </script>