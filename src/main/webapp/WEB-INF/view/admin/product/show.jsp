<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="PhanTech - Quản lý sản phẩm" />
                <meta name="author" content="PhanTech" />
                <title>Quản lý sản phẩm - PhanTech</title>
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
                                            <h4 class="mb-0">Danh Sách Sản Phẩm</h4>
                                            <a href="/admin/product/create" class="btn btn-success">
                                                <i class="fas fa-plus me-1"></i> Tạo Sản Phẩm mới
                                            </a>
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table id="productsTable" class="table table-striped table-hover">
                                                    <thead class="table-dark">
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Tên sản phẩm</th>
                                                            <th>Tải trọng</th>
                                                            <th>Tốc độ</th>
                                                            <th>Nhà sản xuất</th>
                                                            <th>Loại thang máy</th>
                                                            <th>Hình ảnh</th>
                                                            <th width="150">Thao Tác</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${products}" var="product">
                                                            <tr>
                                                                <td>${product.id}</td>
                                                                <td>${product.name}</td>
                                                                <td>${product.loadCapacity} kg</td>
                                                                <td>${product.speed} m/s</td>
                                                                <td>${product.manufacturer.name}</td>
                                                                <td>${product.elevatorType.name}</td>
                                                                <td>
                                                                    <c:if test="${not empty product.image1}">
                                                                        <img src="/images/product/${product.image1}"
                                                                            alt="${product.name}" width="50" height="50"
                                                                            class="img-thumbnail">
                                                                    </c:if>
                                                                </td>
                                                                <td>
                                                                    <div class="btn-group" role="group">
                                                                        <button type="button"
                                                                            class="btn btn-sm btn-info"
                                                                            data-bs-toggle="modal"
                                                                            data-bs-target="#viewModal${product.id}"
                                                                            title="Xem chi tiết">
                                                                            <i class="fas fa-eye"></i>
                                                                        </button>
                                                                        <a href="/admin/product/edit/${product.id}"
                                                                            class="btn btn-sm btn-warning"
                                                                            title="Chỉnh sửa">
                                                                            <i class="fas fa-edit"></i>
                                                                        </a>
                                                                        <button type="button"
                                                                            class="btn btn-sm btn-danger"
                                                                            data-bs-toggle="modal"
                                                                            data-bs-target="#deleteModal${product.id}"
                                                                            title="Xóa">
                                                                            <i class="fas fa-trash"></i>
                                                                        </button>
                                                                    </div>

                                                                    <!-- Modal xem chi tiết -->
                                                                    <div class="modal fade" id="viewModal${product.id}"
                                                                        tabindex="-1"
                                                                        aria-labelledby="viewModalLabel${product.id}"
                                                                        aria-hidden="true">
                                                                        <div class="modal-dialog modal-xl">
                                                                            <div class="modal-content">
                                                                                <div
                                                                                    class="modal-header bg-info text-white">
                                                                                    <h5 class="modal-title"
                                                                                        id="viewModalLabel${product.id}">
                                                                                        Chi tiết sản phẩm:
                                                                                        ${product.name}
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
                                                                                                        <td>${product.id}
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <th>Tên sản
                                                                                                            phẩm:</th>
                                                                                                        <td>${product.name}
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <th>Nhà sản
                                                                                                            xuất:</th>
                                                                                                        <td>${product.manufacturer.name}
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <th>Loại thang
                                                                                                            máy:</th>
                                                                                                        <td>${product.elevatorType.name}
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <th>Tải trọng:
                                                                                                        </th>
                                                                                                        <td>${product.loadCapacity}
                                                                                                            kg</td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <th>Tốc độ:</th>
                                                                                                        <td>${product.speed}
                                                                                                            m/s</td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <th>Kích thước
                                                                                                            cabin:</th>
                                                                                                        <td>${product.cabinSize}
                                                                                                            m²</td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <th>Loại cửa:
                                                                                                        </th>
                                                                                                        <td>${product.doorType}
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </div>
                                                                                            <div class="col-md-6">
                                                                                                <h5
                                                                                                    class="border-bottom pb-2">
                                                                                                    Thông số kỹ thuật
                                                                                                </h5>
                                                                                                <table
                                                                                                    class="table table-sm">
                                                                                                    <tr>
                                                                                                        <th width="150">
                                                                                                            Công nghệ
                                                                                                            điều khiển:
                                                                                                        </th>
                                                                                                        <td>${product.controlTechnology}
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <th>Hố pit/Phòng
                                                                                                            máy:</th>
                                                                                                        <td>${product.pitOrMachineRoom}
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <th>Nguồn điện:
                                                                                                        </th>
                                                                                                        <td>${product.powerSupply}
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <th>Bảo hành:
                                                                                                        </th>
                                                                                                        <td>${product.warranty}
                                                                                                            tháng</td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <th>Video:</th>
                                                                                                        <td>
                                                                                                            <c:if
                                                                                                                test="${not empty product.video}">
                                                                                                                <a href="${product.video}"
                                                                                                                    target="_blank">${product.video}</a>
                                                                                                            </c:if>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <th>Tài liệu:
                                                                                                        </th>
                                                                                                        <td>
                                                                                                            <c:if
                                                                                                                test="${not empty product.documentation}">
                                                                                                                <a href="${product.documentation}"
                                                                                                                    target="_blank">Xem
                                                                                                                    tài
                                                                                                                    liệu</a>
                                                                                                            </c:if>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </div>
                                                                                        </div>

                                                                                        <div class="row mb-3">
                                                                                            <div class="col-12">
                                                                                                <h5
                                                                                                    class="border-bottom pb-2">
                                                                                                    Mô tả sản phẩm</h5>
                                                                                                <div>
                                                                                                    ${product.description}
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>

                                                                                        <div class="row">
                                                                                            <div class="col-12">
                                                                                                <h5
                                                                                                    class="border-bottom pb-2">
                                                                                                    Hình ảnh sản phẩm
                                                                                                </h5>
                                                                                                <div class="row">
                                                                                                    <c:if
                                                                                                        test="${not empty product.image1}">
                                                                                                        <div
                                                                                                            class="col-md-4 mb-3">
                                                                                                            <img src="/images/product/${product.image1}"
                                                                                                                alt="${product.name}"
                                                                                                                class="img-fluid img-thumbnail">
                                                                                                        </div>
                                                                                                    </c:if>
                                                                                                    <c:if
                                                                                                        test="${not empty product.image2}">
                                                                                                        <div
                                                                                                            class="col-md-4 mb-3">
                                                                                                            <img src="/images/product/${product.image2}"
                                                                                                                alt="${product.name}"
                                                                                                                class="img-fluid img-thumbnail">
                                                                                                        </div>
                                                                                                    </c:if>
                                                                                                    <c:if
                                                                                                        test="${not empty product.image3}">
                                                                                                        <div
                                                                                                            class="col-md-4 mb-3">
                                                                                                            <img src="/images/product/${product.image3}"
                                                                                                                alt="${product.name}"
                                                                                                                class="img-fluid img-thumbnail">
                                                                                                        </div>
                                                                                                    </c:if>
                                                                                                    <c:if
                                                                                                        test="${not empty product.image4}">
                                                                                                        <div
                                                                                                            class="col-md-4 mb-3">
                                                                                                            <img src="/images/product/${product.image4}"
                                                                                                                alt="${product.name}"
                                                                                                                class="img-fluid img-thumbnail">
                                                                                                        </div>
                                                                                                    </c:if>
                                                                                                    <c:if
                                                                                                        test="${not empty product.image5}">
                                                                                                        <div
                                                                                                            class="col-md-4 mb-3">
                                                                                                            <img src="/images/product/${product.image5}"
                                                                                                                alt="${product.name}"
                                                                                                                class="img-fluid img-thumbnail">
                                                                                                        </div>
                                                                                                    </c:if>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="button"
                                                                                        class="btn btn-secondary"
                                                                                        data-bs-dismiss="modal">Đóng</button>
                                                                                    <a href="/admin/product/edit/${product.id}"
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
                                                                        id="deleteModal${product.id}" tabindex="-1"
                                                                        aria-labelledby="deleteModalLabel${product.id}"
                                                                        aria-hidden="true">
                                                                        <div class="modal-dialog">
                                                                            <div class="modal-content">
                                                                                <div class="modal-header">
                                                                                    <h5 class="modal-title"
                                                                                        id="deleteModalLabel${product.id}">
                                                                                        Xác nhận xóa
                                                                                    </h5>
                                                                                    <button type="button"
                                                                                        class="btn-close"
                                                                                        data-bs-dismiss="modal"
                                                                                        aria-label="Close"></button>
                                                                                </div>
                                                                                <div class="modal-body">
                                                                                    Bạn có chắc muốn xóa sản phẩm
                                                                                    <strong>${product.name}</strong>?
                                                                                    <p class="text-danger mt-2">Lưu ý:
                                                                                        Hành động này không thể hoàn
                                                                                        tác!</p>
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="button"
                                                                                        class="btn btn-secondary"
                                                                                        data-bs-dismiss="modal">Hủy</button>
                                                                                    <a href="/admin/product/delete/${product.id}"
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
                            <nav aria-label="Product pagination" class="mt-4">
                                <ul class="pagination justify-content-center">
                                    <li class="page-item ${currentPage <= 1 ? 'disabled' : ''}">
                                        <a class="page-link" href="/admin/product?page=${currentPage - 1}"
                                            aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <c:forEach begin="1" end="${totalPages}" var="i">
                                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                                            <a class="page-link" href="/admin/product?page=${i}">${i}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item ${currentPage >= totalPages ? 'disabled' : ''}">
                                        <a class="page-link" href="/admin/product?page=${currentPage + 1}"
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
                    document.addEventListener('DOMContentLoaded', function () {
                        const productsTable = document.getElementById('productsTable');
                        if (productsTable) {
                            new simpleDatatables.DataTable(productsTable);
                        }
                    });
                </script>
            </body>

            </html>