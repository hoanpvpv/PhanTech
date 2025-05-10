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
                    <meta name="description" content="PhanTech - Quản lý yêu cầu" />
                    <meta name="author" content="PhanTech" />
                    <title>Quản lý yêu cầu - PhanTech</title>
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
                                        <div class="card shadow-lg mb-4">
                                            <div
                                                class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                                                <h4 class="mb-0"><i class="fas fa-list me-2"></i>Danh sách yêu cầu từ
                                                    khách
                                                    hàng</h4>
                                            </div>
                                            <div class="card-body">
                                                <!-- Thêm vào dưới phần card-header, ngay trước card-body -->
                                                <div class="card-header bg-light">
                                                    <form method="get" action="/admin/request-list" id="filterForm"
                                                        class="mb-0">
                                                        <div class="row g-2">
                                                            <div class="col-md-3">
                                                                <div class="input-group">
                                                                    <span class="input-group-text">Từ ngày</span>
                                                                    <input type="datetime-local" class="form-control"
                                                                        name="fromDate" value="${fromDate}" />
                                                                </div>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <div class="input-group">
                                                                    <span class="input-group-text">Đến ngày</span>
                                                                    <input type="datetime-local" class="form-control"
                                                                        name="toDate" value="${toDate}" />
                                                                </div>
                                                            </div>
                                                            <div class="col-md-2">
                                                                <select class="form-select" name="status">
                                                                    <option value="">-- Trạng thái --</option>
                                                                    <option value="PENDING" ${status=='PENDING'
                                                                        ? 'selected' : '' }>Chờ xử lý</option>
                                                                    <option value="COMPLETED" ${status=='COMPLETED'
                                                                        ? 'selected' : '' }>Hoàn thành</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <div class="input-group">
                                                                    <span class="input-group-text">Email</span>
                                                                    <input type="text" class="form-control"
                                                                        name="userEmail" placeholder="Email người dùng"
                                                                        value="${userEmail}" />
                                                                </div>
                                                            </div>
                                                            <div class="col-md-1">
                                                                <div class="d-flex">
                                                                    <button type="submit" class="btn btn-primary me-1">
                                                                        <i class="fas fa-search"></i>
                                                                    </button>
                                                                    <button type="button"
                                                                        class="btn btn-outline-secondary"
                                                                        onclick="resetForm()">
                                                                        <i class="fas fa-sync-alt"></i>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="table-responsive">
                                                    <table id="requestListTable"
                                                        class="table table-striped table-hover">
                                                        <thead class="table-dark">
                                                            <tr>
                                                                <th>ID</th>
                                                                <th>Khách hàng</th>
                                                                <th>Thông tin liên hệ</th>
                                                                <th>Ngày tạo</th>
                                                                <th>Trạng thái</th>
                                                                <th>Cập nhật gần nhất</th>
                                                                <th width="180">Thao tác</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${requests}" var="request">
                                                                <tr>
                                                                    <td>${request.id}</td>
                                                                    <td>
                                                                        <strong>${request.fullNameInfo}</strong>
                                                                        <c:if test="${not empty request.user}">
                                                                            <br>
                                                                            <small class="text-muted">Tài khoản:
                                                                                ${request.user.email}</small>
                                                                        </c:if>
                                                                    </td>
                                                                    <td>
                                                                        <i
                                                                            class="fas fa-envelope me-1 text-primary"></i>
                                                                        ${request.emailInfo}<br>
                                                                        <i class="fas fa-phone me-1 text-success"></i>
                                                                        ${request.phoneInfo}<br>
                                                                        <i
                                                                            class="fas fa-map-marker-alt me-1 text-danger"></i>
                                                                        ${request.addressInfo}
                                                                    </td>
                                                                    <td>
                                                                        <fmt:parseDate value="${request.createdAt}"
                                                                            pattern="yyyy-MM-dd'T'HH:mm:ss"
                                                                            var="parsedDate" type="both" />
                                                                        <fmt:formatDate value="${parsedDate}"
                                                                            pattern="dd/MM/yyyy HH:mm" />
                                                                    </td>
                                                                    <td>
                                                                        <c:choose>
                                                                            <c:when
                                                                                test="${request.status == 'PENDING'}">
                                                                                <span
                                                                                    class="badge bg-warning text-dark">Chờ
                                                                                    xử lý</span>
                                                                            </c:when>

                                                                            <c:when
                                                                                test="${request.status == 'COMPLETED'}">
                                                                                <span class="badge bg-success">Hoàn
                                                                                    thành</span>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <span
                                                                                    class="badge bg-secondary">${request.status}</span>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </td>



                                                                    <td>
                                                                        <c:if
                                                                            test="${not empty request.updateStatusdAt}">
                                                                            <fmt:parseDate
                                                                                value="${request.updateStatusdAt}"
                                                                                pattern="yyyy-MM-dd'T'HH:mm:ss"
                                                                                var="parsedUpdateDate" type="both" />
                                                                            <fmt:formatDate value="${parsedUpdateDate}"
                                                                                pattern="dd/MM/yyyy HH:mm" />
                                                                        </c:if>
                                                                        <c:if test="${empty request.updateStatusdAt}">
                                                                            <span class="text-muted">Chưa cập
                                                                                nhật</span>
                                                                        </c:if>
                                                                    </td>
                                                                    <td>
                                                                        <div class="btn-group" role="group">
                                                                            <a href="/admin/request-list/${request.id}"
                                                                                class="btn btn-sm btn-info"
                                                                                title="Chi tiết">
                                                                                <i class="fas fa-eye"></i> Chi tiết
                                                                            </a>

                                                                        </div>


                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                            <c:if test="${totalElements == 0}">
                                                                <tr>
                                                                    <td colspan="7" class="text-center">Không tìm thấy
                                                                        yêu cầu nào</td>
                                                                </tr>
                                                            </c:if>
                                                        </tbody>
                                                    </table>
                                                </div>

                                                <!-- Cập nhật phân trang để giữ các tham số tìm kiếm -->
                                                <c:if test="${totalPages > 1}">
                                                    <nav aria-label="Page navigation" class="mt-4">
                                                        <ul class="pagination justify-content-center">
                                                            <li class="page-item ${currentPage <= 1 ? 'disabled' : ''}">
                                                                <a class="page-link"
                                                                    href="/admin/request-list?page=${currentPage - 1}${fromDate != null ? '&fromDate='.concat(fromDate) : ''}${toDate != null ? '&toDate='.concat(toDate) : ''}${status != null && !status.isEmpty() ? '&status='.concat(status) : ''}${userEmail != null && !userEmail.isEmpty() ? '&userEmail='.concat(userEmail) : ''}"
                                                                    aria-label="Previous">
                                                                    <span aria-hidden="true">&laquo;</span>
                                                                </a>
                                                            </li>

                                                            <c:forEach begin="1" end="${totalPages}" var="i">
                                                                <li
                                                                    class="page-item ${currentPage == i ? 'active' : ''}">
                                                                    <a class="page-link"
                                                                        href="/admin/request-list?page=${i}${fromDate != null ? '&fromDate='.concat(fromDate) : ''}${toDate != null ? '&toDate='.concat(toDate) : ''}${status != null && !status.isEmpty() ? '&status='.concat(status) : ''}${userEmail != null && !userEmail.isEmpty() ? '&userEmail='.concat(userEmail) : ''}">${i}</a>
                                                                </li>
                                                            </c:forEach>

                                                            <li
                                                                class="page-item ${currentPage >= totalPages ? 'disabled' : ''}">
                                                                <a class="page-link"
                                                                    href="/admin/request-list?page=${currentPage + 1}${fromDate != null ? '&fromDate='.concat(fromDate) : ''}${toDate != null ? '&toDate='.concat(toDate) : ''}${status != null && !status.isEmpty() ? '&status='.concat(status) : ''}${userEmail != null && !userEmail.isEmpty() ? '&userEmail='.concat(userEmail) : ''}"
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

                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/js/scripts.js"></script>
                    <script
                        src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>

                </body>

                </html>
                <!-- Thêm script xử lý form lọc vào cuối trang -->
                <script>
                    function resetForm() {
                        document.getElementById('filterForm').reset();
                        window.location.href = "/admin/request-list";
                    }

                    // Format hiển thị ngày giờ
                    document.addEventListener('DOMContentLoaded', function () {
                        // Nếu có giá trị ngày giờ từ controller
                        const fromDateInput = document.querySelector('input[name="fromDate"]');
                        const toDateInput = document.querySelector('input[name="toDate"]');

                        // Xử lý format datetime từ LocalDateTime thành định dạng HTML datetime-local
                        if (fromDateInput.value) {
                            try {
                                const date = new Date(fromDateInput.value);
                                fromDateInput.value = date.toISOString().slice(0, 16);
                            } catch (e) {
                                console.error("Lỗi chuyển đổi fromDate:", e);
                            }
                        }

                        if (toDateInput.value) {
                            try {
                                const date = new Date(toDateInput.value);
                                toDateInput.value = date.toISOString().slice(0, 16);
                            } catch (e) {
                                console.error("Lỗi chuyển đổi toDate:", e);
                            }
                        }
                    });
                </script>