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
                    <meta name="description" content="PhanTech - " />
                    <meta name="author" content="PhanTech" />
                    <title> - PhanTech</title>
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
                                            <div class="card shadow-lg">
                                                <div
                                                    class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                                                    <h4 class="mb-0"><i class="fas fa-envelope me-2"></i>Danh sách form
                                                        liên
                                                        hệ
                                                        từ khách hàng</h4>
                                                </div>
                                                <div class="card-header bg-light">
                                                    <form action="/admin/form" method="get"
                                                        class="row g-3 align-items-center">
                                                        <div class="col-md-4">
                                                            <div class="input-group">
                                                                <span class="input-group-text">Từ ngày</span>
                                                                <input type="date" class="form-control" name="fromDate"
                                                                    value="${fromDate}" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="input-group">
                                                                <span class="input-group-text">Đến ngày</span>
                                                                <input type="date" class="form-control" name="toDate"
                                                                    value="${toDate}" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <button type="submit" class="btn btn-primary">
                                                                <i class="fas fa-filter me-1"></i> Lọc
                                                            </button>
                                                            <a href="/admin/form"
                                                                class="btn btn-outline-secondary ms-1">
                                                                <i class="fas fa-sync-alt me-1"></i> Đặt lại
                                                            </a>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="card-body">
                                                    <div class="table-responsive">
                                                        <table id="formTable" class="table table-striped table-hover">
                                                            <thead class="table-dark">
                                                                <tr>
                                                                    <th>ID</th>
                                                                    <th>Họ tên</th>
                                                                    <th>Thông tin liên hệ</th>
                                                                    <th>Tin nhắn</th>
                                                                    <th>Ngày gửi</th>
                                                                    <th>Trạng thái</th>
                                                                    <th width="120">Thao tác</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach items="${formPage}" var="form">
                                                                    <tr class="${form.read ? '' : 'table-warning'}">
                                                                        <td>${form.id}</td>
                                                                        <td>
                                                                            <strong>${form.name}</strong>
                                                                        </td>
                                                                        <td>
                                                                            <i
                                                                                class="fas fa-envelope me-1 text-primary"></i>
                                                                            ${form.email}<br>
                                                                            <i
                                                                                class="fas fa-phone me-1 text-success"></i>
                                                                            ${form.phone}<br>
                                                                            <c:if test="${not empty form.address}">
                                                                                <i
                                                                                    class="fas fa-map-marker-alt me-1 text-danger"></i>
                                                                                ${form.address}
                                                                            </c:if>
                                                                        </td>
                                                                        <td>
                                                                            <span class="text-truncate d-inline-block"
                                                                                style="max-width: 150px;">
                                                                                ${form.message}
                                                                            </span>
                                                                        </td>
                                                                        <td>
                                                                            ${form.createdAt}
                                                                        </td>
                                                                        <td>
                                                                            <c:choose>
                                                                                <c:when test="${form.read}">
                                                                                    <span class="badge bg-success">Đã
                                                                                        đọc</span>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <span
                                                                                        class="badge bg-warning text-dark">Chưa
                                                                                        đọc</span>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </td>
                                                                        <td>
                                                                            <div class="btn-group" role="group">
                                                                                <a href="/admin/form/${form.id}"
                                                                                    class="btn btn-sm btn-info"
                                                                                    title="Chi tiết">
                                                                                    <i class="fas fa-eye"></i> Xem
                                                                                </a>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <!-- Phân trang -->
                                                    <!-- Cập nhật phân trang để lọc theo khoảng ngày -->
                                                    <c:if test="${totalPages > 1}">
                                                        <nav aria-label="Page navigation" class="mt-4">
                                                            <ul class="pagination justify-content-center">
                                                                <!-- Nút Previous -->
                                                                <li
                                                                    class="page-item ${currentPage <= 1 ? 'disabled' : ''}">
                                                                    <a class="page-link"
                                                                        href="/admin/form?page=${currentPage - 1}${fromDate != null ? '&fromDate='.concat(fromDate) : ''}${toDate != null ? '&toDate='.concat(toDate) : ''}"
                                                                        aria-label="Previous">
                                                                        <span aria-hidden="true">&laquo;</span>
                                                                    </a>
                                                                </li>

                                                                <!-- Các số trang -->
                                                                <c:forEach begin="1" end="${totalPages}" var="i">
                                                                    <li
                                                                        class="page-item ${currentPage == i ? 'active' : ''}">
                                                                        <a class="page-link"
                                                                            href="/admin/form?page=${i}${fromDate != null ? '&fromDate='.concat(fromDate) : ''}${toDate != null ? '&toDate='.concat(toDate) : ''}">${i}</a>
                                                                    </li>
                                                                </c:forEach>

                                                                <!-- Nút Next -->
                                                                <li
                                                                    class="page-item ${currentPage >= totalPages ? 'disabled' : ''}">
                                                                    <a class="page-link"
                                                                        href="/admin/form?page=${currentPage + 1}${fromDate != null ? '&fromDate='.concat(fromDate) : ''}${toDate != null ? '&toDate='.concat(toDate) : ''}"
                                                                        aria-label="Next">
                                                                        <span aria-hidden="true">&raquo;</span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </nav>
                                                    </c:if>
                                                    <div class="d-flex justify-content-center text-muted">
                                                        <small>Hiển thị ${(currentPage-1)*10 + 1} đến
                                                            ${Math.min(currentPage*10, totalItems)} trong tổng số
                                                            ${totalItems}
                                                            form</small>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <!-- Modal Xác nhận xóa -->
                    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header bg-danger text-white">
                                    <h5 class="modal-title" id="deleteModalLabel">Xác nhận xóa form liên hệ</h5>
                                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <p>Bạn có chắc chắn muốn xóa form liên hệ của <strong
                                            id="formNameToDelete"></strong>?</p>
                                    <p class="text-danger"><i class="fas fa-exclamation-triangle me-2"></i>Hành động này
                                        không thể hoàn tác.</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                    <form action="/admin/form/delete" method="post" id="deleteForm">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <input type="hidden" name="id" id="formIdToDelete" value="">
                                        <button type="submit" class="btn btn-danger">Xóa</button>
                                    </form>
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