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
                    <meta name="description" content="PhanTech - Quản lý đánh giá" />
                    <meta name="author" content="PhanTech" />
                    <title>Quản lý đánh giá - PhanTech</title>
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
                                    <h1 class="mt-4">Quản lý đánh giá</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                        <li class="breadcrumb-item active">Danh sách đánh giá</li>
                                    </ol>

                                    <div class="card shadow-lg mb-4">
                                        <div
                                            class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                                            <h4 class="mb-0"><i class="fas fa-star me-2"></i>Danh sách đánh giá từ khách
                                                hàng</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table id="reviewTable" class="table table-striped table-hover">
                                                    <thead class="table-dark">
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Người dùng</th>
                                                            <th>Sản phẩm/Dịch vụ</th>
                                                            <th>Đánh giá</th>
                                                            <th>Nội dung</th>
                                                            <th>Ngày tạo</th>
                                                            <th width="180">Thao tác</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${reviews}" var="review">
                                                            <tr>
                                                                <td>${review.id}</td>
                                                                <td>
                                                                    <c:if test="${not empty review.user}">
                                                                        <strong>${review.user.fullName}</strong><br>
                                                                        <small
                                                                            class="text-muted">${review.user.email}</small>
                                                                    </c:if>
                                                                    <c:if test="${empty review.user}">
                                                                        <span class="text-muted">Không có thông
                                                                            tin</span>
                                                                    </c:if>
                                                                </td>
                                                                <td>
                                                                    <c:if test="${not empty review.product}">
                                                                        <span class="badge bg-primary">Sản
                                                                            phẩm</span><br>
                                                                        <strong>${review.product.name}</strong>
                                                                    </c:if>
                                                                    <c:if test="${not empty review.service}">
                                                                        <span class="badge bg-info">Dịch vụ</span><br>
                                                                        <strong>${review.service.name}</strong>
                                                                    </c:if>
                                                                </td>
                                                                <td>
                                                                    <div class="rating-stars">
                                                                        <c:forEach begin="1" end="5" var="i">
                                                                            <i
                                                                                class="${i <= review.rating ? 'fas' : 'far'} fa-star text-warning"></i>
                                                                        </c:forEach>
                                                                        <br>
                                                                        <small
                                                                            class="text-muted">${review.rating}/5</small>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <span class="text-truncate d-inline-block"
                                                                        style="max-width: 150px;">
                                                                        ${review.content}
                                                                    </span>
                                                                </td>
                                                                <td>
                                                                    <fmt:parseDate value="${review.createdAt}"
                                                                        pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" />
                                                                    <fmt:formatDate value="${parsedDate}"
                                                                        pattern="dd/MM/yyyy HH:mm" />
                                                                </td>
                                                                <td>
                                                                    <div class="btn-group" role="group">
                                                                        <a href="/admin/review/${review.id}"
                                                                            class="btn btn-sm btn-info"
                                                                            title="Chi tiết">
                                                                            <i class="fas fa-eye"></i> Chi tiết
                                                                        </a>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>

                                            <!-- Phân trang -->
                                            <c:if test="${totalPages > 1}">
                                                <nav aria-label="Page navigation" class="mt-4">
                                                    <ul class="pagination justify-content-center">
                                                        <li class="page-item ${currentPage <= 1 ? 'disabled' : ''}">
                                                            <a class="page-link"
                                                                href="/admin/review?page=${currentPage - 1}"
                                                                aria-label="Previous">
                                                                <span aria-hidden="true">&laquo;</span>
                                                            </a>
                                                        </li>

                                                        <c:forEach begin="1" end="${totalPages}" var="i">
                                                            <li class="page-item ${currentPage == i ? 'active' : ''}">
                                                                <a class="page-link"
                                                                    href="/admin/review?page=${i}">${i}</a>
                                                            </li>
                                                        </c:forEach>

                                                        <li
                                                            class="page-item ${currentPage >= totalPages ? 'disabled' : ''}">
                                                            <a class="page-link"
                                                                href="/admin/review?page=${currentPage + 1}"
                                                                aria-label="Next">
                                                                <span aria-hidden="true">&raquo;</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </nav>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </main>
                        </div>
                    </div>
                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/js/scripts.js"></script>
                    <script
                        src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>
                    <script>
                        // Initialize DataTable
                        document.addEventListener('DOMContentLoaded', function () {
                            const reviewTable = document.getElementById('reviewTable');
                            if (reviewTable) {
                                new simpleDatatables.DataTable(reviewTable, {
                                    columns: [
                                        // Disable sorting for actions column
                                        { select: 6, sortable: false }
                                    ]
                                });
                            }
                        });
                    </script>
                </body>

                </html>