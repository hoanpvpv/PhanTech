<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="PhanTech - Quản lý dự án" />
                <meta name="author" content="PhanTech" />
                <title>Quản lý dự án - PhanTech</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

            </head>
            <style>
                /* Đảm bảo hình ảnh trong nội dung từ TinyMCE hiển thị responsive */
                .modal-body img {
                    max-width: 100%;
                    height: auto;
                    display: block;
                }

                /* Đảm bảo các bảng trong nội dung TinyMCE không bị tràn */
                .modal-body table {
                    max-width: 100%;
                    width: 100%;
                    overflow-x: auto;
                    display: block;
                }
            </style>

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
                                            <h4 class="mb-0">Danh Sách Dự Án</h4>
                                            <a href="/admin/project/create" class="btn btn-success">
                                                <i class="fas fa-plus me-1"></i> Tạo Dự Án mới
                                            </a>
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table id="projectsTable" class="table table-striped table-hover">
                                                    <thead class="table-dark">
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Tên dự án</th>
                                                            <th>Địa chỉ</th>
                                                            <th>Sản phẩm</th>
                                                            <th>Dịch vụ</th>
                                                            <th>Hình ảnh</th>
                                                            <th width="150">Thao Tác</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${projects}" var="project">
                                                            <tr>
                                                                <td>${project.id}</td>
                                                                <td>${project.name}</td>
                                                                <td>${project.address}</td>
                                                                <td>${project.product != null ? project.product.name :
                                                                    'N/A'}</td>
                                                                <td>${project.service != null ? project.service.name :
                                                                    'N/A'}</td>
                                                                <td>
                                                                    <c:if test="${not empty project.image}">
                                                                        <img src="/images/project/${project.image}"
                                                                            alt="${project.name}" width="50" height="50"
                                                                            class="img-thumbnail">
                                                                    </c:if>
                                                                </td>
                                                                <td>
                                                                    <div class="btn-group" role="group">
                                                                        <button type="button"
                                                                            class="btn btn-sm btn-info"
                                                                            data-bs-toggle="modal"
                                                                            data-bs-target="#viewModal${project.id}"
                                                                            title="Xem chi tiết">
                                                                            <i class="fas fa-eye"></i>
                                                                        </button>
                                                                        <a href="/admin/project/edit/${project.id}"
                                                                            class="btn btn-sm btn-warning"
                                                                            title="Chỉnh sửa">
                                                                            <i class="fas fa-edit"></i>
                                                                        </a>
                                                                        <button type="button"
                                                                            class="btn btn-sm btn-danger"
                                                                            data-bs-toggle="modal"
                                                                            data-bs-target="#deleteModal${project.id}"
                                                                            title="Xóa">
                                                                            <i class="fas fa-trash"></i>
                                                                        </button>
                                                                    </div>

                                                                    <!-- Modal xem chi tiết -->
                                                                    <div class="modal fade" id="viewModal${project.id}"
                                                                        tabindex="-1"
                                                                        aria-labelledby="viewModalLabel${project.id}"
                                                                        aria-hidden="true">
                                                                        <div class="modal-dialog modal-lg">
                                                                            <div class="modal-content">
                                                                                <div
                                                                                    class="modal-header bg-info text-white">
                                                                                    <h5 class="modal-title"
                                                                                        id="viewModalLabel${project.id}">
                                                                                        Chi tiết dự án: ${project.name}
                                                                                    </h5>
                                                                                    <button type="button"
                                                                                        class="btn-close"
                                                                                        data-bs-dismiss="modal"
                                                                                        aria-label="Close"></button>
                                                                                </div>
                                                                                <div class="modal-body">
                                                                                    <div class="container-fluid">
                                                                                        <div class="row mb-3">
                                                                                            <div class="col-md-6">
                                                                                                <h5
                                                                                                    class="border-bottom pb-2">
                                                                                                    Thông tin cơ bản
                                                                                                </h5>
                                                                                                <table
                                                                                                    class="table table-sm">
                                                                                                    <tr>
                                                                                                        <th width="150">
                                                                                                            ID:</th>
                                                                                                        <td>${project.id}
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <th>Ngày hoàn
                                                                                                            thành:
                                                                                                        </th>
                                                                                                        <td>${project.date}
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <th>Tên dự án:
                                                                                                        </th>
                                                                                                        <td>${project.name}
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <th>Số tầng:
                                                                                                        </th>
                                                                                                        <td>${project.floor}
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <th>Địa chỉ:
                                                                                                        </th>
                                                                                                        <td>${project.address}
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <th>Sản phẩm:
                                                                                                        </th>
                                                                                                        <td>
                                                                                                            <c:if
                                                                                                                test="${project.product != null}">
                                                                                                                <a
                                                                                                                    href="/admin/product/edit/${project.product.id}">
                                                                                                                    ${project.product.name}
                                                                                                                </a>
                                                                                                            </c:if>
                                                                                                            <c:if
                                                                                                                test="${project.product == null}">
                                                                                                                N/A
                                                                                                            </c:if>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <th>Dịch vụ:
                                                                                                        </th>
                                                                                                        <td>
                                                                                                            <c:if
                                                                                                                test="${project.service != null}">
                                                                                                                <a
                                                                                                                    href="/admin/service/edit/${project.service.id}">
                                                                                                                    ${project.service.name}
                                                                                                                </a>
                                                                                                            </c:if>
                                                                                                            <c:if
                                                                                                                test="${project.service == null}">
                                                                                                                N/A
                                                                                                            </c:if>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </div>
                                                                                            <div class="col-md-6">
                                                                                                <h5
                                                                                                    class="border-bottom pb-2">
                                                                                                    Hình ảnh dự án</h5>
                                                                                                <c:if
                                                                                                    test="${not empty project.image}">
                                                                                                    <img src="/images/project/${project.image}"
                                                                                                        alt="${project.name}"
                                                                                                        class="img-fluid img-thumbnail">
                                                                                                </c:if>
                                                                                            </div>
                                                                                        </div>

                                                                                        <div class="row mb-3">
                                                                                            <div class="col-12">
                                                                                                <h5
                                                                                                    class="border-bottom pb-2">
                                                                                                    Mô tả dự án</h5>
                                                                                                <div>
                                                                                                    ${project.description}
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="button"
                                                                                        class="btn btn-secondary"
                                                                                        data-bs-dismiss="modal">Đóng</button>
                                                                                    <a href="/admin/project/edit/${project.id}"
                                                                                        class="btn btn-warning">
                                                                                        <i
                                                                                            class="fas fa-edit me-1"></i>Chỉnh
                                                                                        sửa
                                                                                    </a>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <!-- Modal xác nhận xóa -->
                                                                    <div class="modal fade"
                                                                        id="deleteModal${project.id}" tabindex="-1"
                                                                        aria-labelledby="deleteModalLabel${project.id}"
                                                                        aria-hidden="true">
                                                                        <div class="modal-dialog">
                                                                            <div class="modal-content">
                                                                                <div class="modal-header">
                                                                                    <h5 class="modal-title"
                                                                                        id="deleteModalLabel${project.id}">
                                                                                        Xác nhận xóa
                                                                                    </h5>
                                                                                    <button type="button"
                                                                                        class="btn-close"
                                                                                        data-bs-dismiss="modal"
                                                                                        aria-label="Close"></button>
                                                                                </div>
                                                                                <div class="modal-body">
                                                                                    Bạn có chắc muốn xóa dự án
                                                                                    <strong>${project.name}</strong>?
                                                                                    <p class="text-danger mt-2">Lưu ý:
                                                                                        Hành động này không thể hoàn
                                                                                        tác!</p>
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="button"
                                                                                        class="btn btn-secondary"
                                                                                        data-bs-dismiss="modal">Hủy</button>
                                                                                    <a href="/admin/project/delete/${project.id}"
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

                        <!-- Phân trang -->
                        <c:if test="${totalPages > 1}">
                            <nav aria-label="Project pagination" class="mt-4">
                                <ul class="pagination justify-content-center">
                                    <li class="page-item ${currentPage <= 1 ? 'disabled' : ''}">
                                        <a class="page-link" href="/admin/project?page=${currentPage - 1}"
                                            aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <c:forEach begin="1" end="${totalPages}" var="i">
                                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                                            <a class="page-link" href="/admin/project?page=${i}">${i}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item ${currentPage >= totalPages ? 'disabled' : ''}">
                                        <a class="page-link" href="/admin/project?page=${currentPage + 1}"
                                            aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </c:if>
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


                    // Xử lý hình ảnh trong nội dung TinyMCE để đảm bảo responsive
                    document.querySelectorAll('.modal-body div img').forEach(function (img) {
                        img.classList.add('img-fluid');
                        img.removeAttribute('width');
                        img.removeAttribute('height');
                    });

                    // Xử lý khi modal mở
                    const viewModals = document.querySelectorAll('[id^="viewModal"]');
                    viewModals.forEach(function (modal) {
                        modal.addEventListener('shown.bs.modal', function () {
                            const images = this.querySelectorAll('.modal-body div img');
                            images.forEach(function (img) {
                                img.classList.add('img-fluid');
                                img.removeAttribute('width');
                                img.removeAttribute('height');
                            });
                        });
                    });
                    });
                </script>
            </body>

            </html>