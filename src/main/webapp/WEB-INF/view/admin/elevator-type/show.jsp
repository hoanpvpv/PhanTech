<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="PhanTech - Quản lý kiểu thang máy" />
                <meta name="author" content="PhanTech" />
                <title>Quản lý kiểu thang máy - PhanTech</title>
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
                                            <h4 class="mb-0">Danh Sách Kiểu Thang Máy</h4>
                                            <button class="btn btn-success" data-bs-toggle="modal"
                                                data-bs-target="#createElevatorTypeModal">
                                                <i class="fas fa-plus me-1"></i> Tạo Kiểu Thang Máy Mới
                                            </button>
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table id="elevatorTypesTable" class="table table-striped table-hover">
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
                                                        <c:forEach items="${elevatorTypes}" var="elevatorType">
                                                            <tr>
                                                                <td>${elevatorType.id}</td>
                                                                <td>${elevatorType.name}</td>
                                                                <td>
                                                                    <c:if test="${not empty elevatorType.description}">
                                                                        ${elevatorType.description.length() > 50 ?
                                                                        elevatorType.description.substring(0,
                                                                        50).concat('...') : elevatorType.description}
                                                                    </c:if>
                                                                </td>
                                                                <td>
                                                                    <c:if test="${not empty elevatorType.image}">
                                                                        <img src="/images/public/${elevatorType.image}"
                                                                            alt="${elevatorType.name}" width="50"
                                                                            height="50" class="img-thumbnail">
                                                                    </c:if>
                                                                </td>
                                                                <td>
                                                                    <div class="btn-group" role="group">
                                                                        <button type="button"
                                                                            class="btn btn-sm btn-info"
                                                                            data-bs-toggle="modal"
                                                                            data-bs-target="#viewModal${elevatorType.id}"
                                                                            title="Xem chi tiết">
                                                                            <i class="fas fa-eye"></i>
                                                                        </button>
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

                                                                    <!-- View Details Modal -->
                                                                    <div class="modal fade"
                                                                        id="viewModal${elevatorType.id}" tabindex="-1"
                                                                        aria-labelledby="viewModalLabel${elevatorType.id}"
                                                                        aria-hidden="true">
                                                                        <div class="modal-dialog modal-lg">
                                                                            <div class="modal-content">
                                                                                <div
                                                                                    class="modal-header bg-info text-white">
                                                                                    <h5 class="modal-title"
                                                                                        id="viewModalLabel${elevatorType.id}">
                                                                                        Thông tin chi tiết kiểu thang
                                                                                        máy:
                                                                                        ${elevatorType.name}
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
                                                                                                ${elevatorType.id}</div>
                                                                                        </div>
                                                                                        <div class="row mb-3">
                                                                                            <div
                                                                                                class="col-md-3 fw-bold">
                                                                                                Tên kiểu thang máy:
                                                                                            </div>
                                                                                            <div class="col-md-9">
                                                                                                ${elevatorType.name}
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row mb-3">
                                                                                            <div
                                                                                                class="col-md-3 fw-bold">
                                                                                                Mô tả:</div>
                                                                                            <div class="col-md-9">
                                                                                                ${elevatorType.description}
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row mb-3">
                                                                                            <div
                                                                                                class="col-md-3 fw-bold">
                                                                                                Hình ảnh:</div>
                                                                                            <div class="col-md-9">
                                                                                                <c:if
                                                                                                    test="${not empty elevatorType.image}">
                                                                                                    <img src="/images/public/${elevatorType.image}"
                                                                                                        alt="${elevatorType.name}"
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
                                                                                                ${elevatorType.products.size()}
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
                                                                                        data-bs-target="#editModal${elevatorType.id}"
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
                                                                    <div class="modal fade"
                                                                        id="editModal${elevatorType.id}" tabindex="-1"
                                                                        aria-labelledby="editModalLabel${elevatorType.id}"
                                                                        aria-hidden="true">
                                                                        <div class="modal-dialog modal-lg">
                                                                            <div class="modal-content">
                                                                                <div class="modal-header bg-warning">
                                                                                    <h5 class="modal-title"
                                                                                        id="editModalLabel${elevatorType.id}">
                                                                                        Chỉnh Sửa Kiểu Thang Máy:
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
                                                                                        <div class="row mb-3">
                                                                                            <div class="col-md-12">
                                                                                                <div
                                                                                                    class="form-floating mb-3">
                                                                                                    <input
                                                                                                        class="form-control"
                                                                                                        id="name${elevatorType.id}"
                                                                                                        name="name"
                                                                                                        type="text"
                                                                                                        value="${elevatorType.name}"
                                                                                                        placeholder="Tên kiểu thang máy"
                                                                                                        required="required" />
                                                                                                    <label
                                                                                                        for="name${elevatorType.id}">Tên
                                                                                                        kiểu thang
                                                                                                        máy</label>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>

                                                                                        <div class="row mb-3">
                                                                                            <div class="col-md-12">
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

                                                                                        <div class="row mb-3">
                                                                                            <div class="col-md-12">
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
                                                                                                <div class="form-text">
                                                                                                    Chọn hình ảnh mới
                                                                                                    (để trống nếu không
                                                                                                    muốn thay đổi)
                                                                                                </div>

                                                                                                <c:if
                                                                                                    test="${not empty elevatorType.image}">
                                                                                                    <div class="mt-3">
                                                                                                        <p>Hình ảnh hiện
                                                                                                            tại:</p>
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
                                                                        id="deleteModal${elevatorType.id}" tabindex="-1"
                                                                        aria-labelledby="deleteModalLabel${elevatorType.id}"
                                                                        aria-hidden="true">
                                                                        <div class="modal-dialog">
                                                                            <div class="modal-content">
                                                                                <div class="modal-header">
                                                                                    <h5 class="modal-title"
                                                                                        id="deleteModalLabel${elevatorType.id}">
                                                                                        Xác nhận xóa
                                                                                    </h5>
                                                                                    <button type="button"
                                                                                        class="btn-close"
                                                                                        data-bs-dismiss="modal"
                                                                                        aria-label="Close"></button>
                                                                                </div>
                                                                                <div class="modal-body">
                                                                                    Bạn có chắc muốn xóa kiểu thang máy
                                                                                    <strong>${elevatorType.name}</strong>?
                                                                                    <p class="text-danger mt-2">Lưu ý:
                                                                                        Việc xóa có thể ảnh hưởng đến
                                                                                        các sản phẩm liên quan.</p>
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="button"
                                                                                        class="btn btn-secondary"
                                                                                        data-bs-dismiss="modal">Hủy</button>
                                                                                    <a href="/admin/elevator-type/delete/${elevatorType.id}"
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

                        <!-- Modal Tạo Kiểu Thang Máy Mới -->
                        <div class="modal fade" id="createElevatorTypeModal" tabindex="-1"
                            aria-labelledby="createElevatorTypeModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header bg-success text-white">
                                        <h5 class="modal-title" id="createElevatorTypeModalLabel">
                                            Tạo Kiểu Thang Máy Mới
                                        </h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="/admin/elevator-type/create" method="post"
                                            enctype="multipart/form-data">
                                            <div class="row mb-3">
                                                <div class="col-md-12">
                                                    <div class="form-floating mb-3">
                                                        <input class="form-control" id="name" name="name" type="text"
                                                            placeholder="Tên kiểu thang máy" required="required" />
                                                        <label for="name">Tên kiểu thang máy</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <div class="col-md-12">
                                                    <div class="form-floating mb-3">
                                                        <textarea class="form-control" id="description"
                                                            name="description" style="height: 120px;"
                                                            placeholder="Mô tả"></textarea>
                                                        <label for="description">Mô tả</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <div class="col-md-12">
                                                    <label for="imageFile" class="form-label">Hình ảnh</label>
                                                    <input class="form-control" id="imageFile" name="imageFile"
                                                        type="file" accept="image/*" />
                                                    <div class="form-text">Chọn hình ảnh cho kiểu thang máy (định dạng:
                                                        jpg, png, gif)</div>
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
                    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                    crossorigin="anonymous"></script>
                <script>
                    // Initialize DataTable
                    document.addEventListener('DOMContentLoaded', function () {
                        const elevatorTypesTable = document.getElementById('elevatorTypesTable');
                        if (elevatorTypesTable) {
                            new simpleDatatables.DataTable(elevatorTypesTable);
                        }

                        // Reset form khi đóng modal tạo mới
                        const createModal = document.getElementById('createElevatorTypeModal');
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
            </body>

            </html>