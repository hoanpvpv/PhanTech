<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="PhanTech - Chi tiết đánh giá" />
                    <meta name="author" content="PhanTech" />
                    <title>Chi tiết đánh giá #${review.id} - PhanTech</title>
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
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Chi tiết đánh giá #${review.id}</h1>


                                    <div class="row">
                                        <div class="col-md-8 mb-4">
                                            <div class="card shadow-lg">
                                                <div class="card-header bg-primary text-white">
                                                    <h5 class="mb-0">
                                                        <i class="fas fa-star me-2"></i>Thông tin đánh giá
                                                        <div class="float-end">
                                                            <c:forEach begin="1" end="5" var="i">
                                                                <i
                                                                    class="${i <= review.rating ? 'fas' : 'far'} fa-star text-warning"></i>
                                                            </c:forEach>
                                                        </div>
                                                    </h5>
                                                </div>

                                                <div class="card-body">
                                                    <div class="row mb-4">
                                                        <div class="col-md-6">
                                                            <h5>Thông tin chung</h5>
                                                            <div class="table-responsive">
                                                                <table class="table table-borderless">
                                                                    <tr>
                                                                        <th width="140">ID:</th>
                                                                        <td>#${review.id}</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>Đánh giá:</th>
                                                                        <td>${review.rating}/5 <i
                                                                                class="fas fa-star text-warning ms-1"></i>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>Ngày đánh giá:</th>
                                                                        <td>
                                                                            <c:catch var="dateError">
                                                                                <fmt:parseDate
                                                                                    value="${review.createdAt}"
                                                                                    pattern="yyyy-MM-dd'T'HH:mm:ss"
                                                                                    var="parsedDate" />
                                                                                <fmt:formatDate value="${parsedDate}"
                                                                                    pattern="dd/MM/yyyy HH:mm" />
                                                                            </c:catch>
                                                                            <c:if test="${not empty dateError}">
                                                                                ${review.createdAt}</c:if>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>Loại:</th>
                                                                        <td>
                                                                            <c:if test="${not empty review.product}">
                                                                                <span class="badge bg-primary">Sản
                                                                                    phẩm</span>
                                                                            </c:if>
                                                                            <c:if test="${not empty review.service}">
                                                                                <span class="badge bg-info">Dịch
                                                                                    vụ</span>
                                                                            </c:if>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <h5>Thông tin khách hàng</h5>
                                                            <c:if test="${not empty review.user}">
                                                                <div class="table-responsive">
                                                                    <table class="table table-borderless">
                                                                        <tr>
                                                                            <th width="140">Tên:</th>
                                                                            <td>${review.user.fullName}</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>Email:</th>
                                                                            <td>${review.user.email}</td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${empty review.user}">
                                                                <p class="text-muted">Không có thông tin người dùng.</p>
                                                            </c:if>
                                                        </div>
                                                    </div>

                                                    <hr>

                                                    <!-- Thông tin sản phẩm/dịch vụ -->
                                                    <div class="row mb-4">
                                                        <div class="col-12">
                                                            <h5>
                                                                <c:if test="${not empty review.product}">Thông tin sản
                                                                    phẩm</c:if>
                                                                <c:if test="${not empty review.service}">Thông tin dịch
                                                                    vụ</c:if>
                                                            </h5>

                                                            <c:if test="${not empty review.product}">
                                                                <div class="d-flex align-items-center">

                                                                    <div>
                                                                        <h5 class="mb-1">${review.product.name}</h5>
                                                                        <p class="mb-0">
                                                                            <a href="/product/${review.product.id}"
                                                                                class="btn btn-sm btn-outline-primary">
                                                                                <i
                                                                                    class="fas fa-external-link-alt me-1"></i>Xem
                                                                                sản phẩm
                                                                            </a>
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </c:if>

                                                            <c:if test="${not empty review.service}">
                                                                <div class="d-flex align-items-center">

                                                                    <div>
                                                                        <h5 class="mb-1">${review.service.name}</h5>
                                                                        <p class="mb-0">
                                                                            <a href="/admin/service/${review.service.id}"
                                                                                class="btn btn-sm btn-outline-primary">
                                                                                <i
                                                                                    class="fas fa-external-link-alt me-1"></i>Xem
                                                                                dịch vụ
                                                                            </a>
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </c:if>
                                                        </div>
                                                    </div>

                                                    <hr>

                                                    <!-- Nội dung đánh giá -->
                                                    <div class="row mb-4">
                                                        <div class="col-12">
                                                            <h5>Nội dung đánh giá</h5>
                                                            <div class="p-3 bg-light rounded">
                                                                ${review.content}
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- Hình ảnh đính kèm -->
                                                    <c:if
                                                        test="${not empty review.image1 || not empty review.image2 || not empty review.image3}">
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <h5>Hình ảnh đánh giá</h5>
                                                                <div class="row g-2">
                                                                    <c:if test="${not empty review.image1}">
                                                                        <div class="col-md-4">
                                                                            <a href="/images/public/${review.image1}"
                                                                                target="_blank">
                                                                                <img src="/images/public/${review.image1}"
                                                                                    alt="Ảnh đánh giá 1"
                                                                                    class="img-thumbnail"
                                                                                    style="height: 200px; object-fit: cover; width: 100%;">
                                                                            </a>
                                                                        </div>
                                                                    </c:if>

                                                                    <c:if test="${not empty review.image2}">
                                                                        <div class="col-md-4">
                                                                            <a href="/images/public/${review.image2}"
                                                                                target="_blank">
                                                                                <img src="/images/public/${review.image2}"
                                                                                    alt="Ảnh đánh giá 2"
                                                                                    class="img-thumbnail"
                                                                                    style="height: 200px; object-fit: cover; width: 100%;">
                                                                            </a>
                                                                        </div>
                                                                    </c:if>

                                                                    <c:if test="${not empty review.image3}">
                                                                        <div class="col-md-4">
                                                                            <a href="/images/public/${review.image3}"
                                                                                target="_blank">
                                                                                <img src="/images/public/${review.image3}"
                                                                                    alt="Ảnh đánh giá 3"
                                                                                    class="img-thumbnail"
                                                                                    style="height: 200px; object-fit: cover; width: 100%;">
                                                                            </a>
                                                                        </div>
                                                                    </c:if>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:if>

                                                    <hr>

                                                    <!-- Nút thao tác -->
                                                    <div class="row">
                                                        <div class="col-12 d-flex justify-content-between">
                                                            <a href="/admin/review" class="btn btn-secondary">
                                                                <i class="fas fa-arrow-left me-1"></i> Quay lại
                                                            </a>
                                                            <button class="btn btn-danger"
                                                                onclick="confirmDelete(${review.id})">
                                                                <i class="fas fa-trash-alt me-1"></i> Xóa đánh giá
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                            </main>
                        </div>
                    </div>

                    <!-- Modal Xác nhận xóa -->
                    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header bg-danger text-white">
                                    <h5 class="modal-title" id="deleteModalLabel">Xác nhận xóa đánh giá</h5>
                                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <p>Bạn có chắc chắn muốn xóa đánh giá này?</p>
                                    <p class="text-danger"><i class="fas fa-exclamation-triangle me-2"></i>Hành động này
                                        không thể hoàn tác.</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                    <form action="/admin/review/delete" method="post">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <input type="hidden" name="id" value="${review.id}">
                                        <button type="submit" class="btn btn-danger">Xóa</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/js/scripts.js"></script>
                    <script>
                        function confirmDelete(id) {
                            var deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
                            deleteModal.show();
                        }
                    </script>
                </body>

                </html>