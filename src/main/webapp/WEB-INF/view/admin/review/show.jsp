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
                            <div class="container mt-5 pt-3">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="container-fluid px-4">


                                            <div class="card shadow-lg mb-4">
                                                <div
                                                    class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                                                    <h4 class="mb-0"><i class="fas fa-star me-2"></i>Danh sách đánh giá
                                                        từ khách
                                                        hàng</h4>
                                                </div>
                                                <div class="card-body">
                                                    <div class="filter-section mb-4">
                                                        <form method="get" action="/admin/review" class="row g-3">
                                                            <div class="col-md-3">
                                                                <label for="productName" class="form-label">Tên sản
                                                                    phẩm</label>
                                                                <input type="text" class="form-control" id="productName"
                                                                    name="productName" value="${productName}"
                                                                    placeholder="Nhập tên sản phẩm...">
                                                            </div>

                                                            <div class="col-md-3">
                                                                <label for="serviceName" class="form-label">Tên dịch
                                                                    vụ</label>
                                                                <input type="text" class="form-control" id="serviceName"
                                                                    name="serviceName" value="${serviceName}"
                                                                    placeholder="Nhập tên dịch vụ...">
                                                            </div>

                                                            <div class="col-md-2">
                                                                <label for="rating" class="form-label">Số sao</label>
                                                                <select class="form-select" id="rating" name="rating">
                                                                    <option value="" ${empty rating ? 'selected' : '' }>
                                                                        Tất cả</option>
                                                                    <option value="1" ${rating==1 ? 'selected' : '' }>1
                                                                        sao</option>
                                                                    <option value="2" ${rating==2 ? 'selected' : '' }>2
                                                                        sao</option>
                                                                    <option value="3" ${rating==3 ? 'selected' : '' }>3
                                                                        sao</option>
                                                                    <option value="4" ${rating==4 ? 'selected' : '' }>4
                                                                        sao</option>
                                                                    <option value="5" ${rating==5 ? 'selected' : '' }>5
                                                                        sao</option>
                                                                </select>
                                                            </div>

                                                            <div class="col-md-2">
                                                                <label for="fromDate" class="form-label">Từ ngày</label>
                                                                <input type="date" class="form-control" id="fromDate"
                                                                    name="fromDate" value="${fromDate}">
                                                            </div>

                                                            <div class="col-md-2">
                                                                <label for="toDate" class="form-label">Đến ngày</label>
                                                                <input type="date" class="form-control" id="toDate"
                                                                    name="toDate" value="${toDate}">
                                                            </div>

                                                            <div class="col-md-2">
                                                                <label for="sort" class="form-label">Sắp xếp</label>
                                                                <select class="form-select" id="sort" name="sort">
                                                                    <option value="createdAt" ${sort=='createdAt'
                                                                        ? 'selected' : '' }>Ngày tạo</option>
                                                                    <option value="rating" ${sort=='rating' ? 'selected'
                                                                        : '' }>Số sao</option>
                                                                </select>
                                                            </div>

                                                            <div class="col-md-2">
                                                                <label for="direction" class="form-label">Thứ tự</label>
                                                                <select class="form-select" id="direction"
                                                                    name="direction">
                                                                    <option value="desc" ${direction=='desc'
                                                                        ? 'selected' : '' }>Giảm dần</option>
                                                                    <option value="asc" ${direction=='asc' ? 'selected'
                                                                        : '' }>Tăng dần</option>
                                                                </select>
                                                            </div>

                                                            <div class="col-md-2 d-flex align-items-end">
                                                                <button type="submit" class="btn btn-primary w-100">
                                                                    <i class="fas fa-search me-1"></i> Lọc
                                                                </button>
                                                            </div>

                                                            <div class="col-md-2 d-flex align-items-end">
                                                                <a href="/admin/review"
                                                                    class="btn btn-outline-secondary w-100">
                                                                    <i class="fas fa-undo-alt me-1"></i> Đặt lại
                                                                </a>
                                                            </div>
                                                        </form>
                                                    </div>
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
                                                                                <span class="badge bg-info">Dịch
                                                                                    vụ</span><br>
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
                                                                                pattern="yyyy-MM-dd'T'HH:mm"
                                                                                var="parsedDate" />
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
                                                                <li
                                                                    class="page-item ${currentPage <= 1 ? 'disabled' : ''}">
                                                                    <a class="page-link"
                                                                        href="/admin/review?page=${currentPage - 1}${not empty productName ? '&productName='.concat(productName) : ''}${not empty serviceName ? '&serviceName='.concat(serviceName) : ''}${not empty rating ? '&rating='.concat(rating) : ''}${not empty fromDate ? '&fromDate='.concat(fromDate) : ''}${not empty toDate ? '&toDate='.concat(toDate) : ''}${not empty sort ? '&sort='.concat(sort) : ''}${not empty direction ? '&direction='.concat(direction) : ''}"
                                                                        aria-label="Previous">
                                                                        <span aria-hidden="true">&laquo;</span>
                                                                    </a>
                                                                </li>

                                                                <c:forEach begin="1" end="${totalPages}" var="i">
                                                                    <li
                                                                        class="page-item ${currentPage == i ? 'active' : ''}">
                                                                        <a class="page-link"
                                                                            href="/admin/review?page=${i}${not empty productName ? '&productName='.concat(productName) : ''}${not empty serviceName ? '&serviceName='.concat(serviceName) : ''}${not empty rating ? '&rating='.concat(rating) : ''}${not empty fromDate ? '&fromDate='.concat(fromDate) : ''}${not empty toDate ? '&toDate='.concat(toDate) : ''}${not empty sort ? '&sort='.concat(sort) : ''}${not empty direction ? '&direction='.concat(direction) : ''}">${i}</a>
                                                                    </li>
                                                                </c:forEach>

                                                                <li
                                                                    class="page-item ${currentPage >= totalPages ? 'disabled' : ''}">
                                                                    <a class="page-link"
                                                                        href="/admin/review?page=${currentPage + 1}${not empty productName ? '&productName='.concat(productName) : ''}${not empty serviceName ? '&serviceName='.concat(serviceName) : ''}${not empty rating ? '&rating='.concat(rating) : ''}${not empty fromDate ? '&fromDate='.concat(fromDate) : ''}${not empty toDate ? '&toDate='.concat(toDate) : ''}${not empty sort ? '&sort='.concat(sort) : ''}${not empty direction ? '&direction='.concat(direction) : ''}"
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
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/js/scripts.js"></script>
                    <script
                        src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>

                </body>

                </html>