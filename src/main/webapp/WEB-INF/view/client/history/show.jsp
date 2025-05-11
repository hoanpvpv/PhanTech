<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Lịch sử yêu cầu - PhanTech</title>
                    <!-- Bootstrap CSS -->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <!-- jQuery -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                    <!-- Bootstrap JS -->
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                    <link rel="stylesheet" href="/css/demo.css">
                    <link rel="stylesheet" href="/css/style.css">
                    <!-- Font Awesome -->
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                </head>

                <body>
                    <jsp:include page="../layout/header.jsp" />

                    <!-- Page Header -->
                    <div class="banner">
                        <h1 class="text-center">Lịch sử yêu cầu</h1>
                        <p class="text-center text-muted">Theo dõi và quản lý các yêu cầu của bạn</p>
                    </div>

                    <div class="container my-5">
                        <!-- Thông báo nếu có -->
                        <c:if test="${not empty successMessage}">
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <i class="fas fa-check-circle me-2"></i>${successMessage}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"
                                    aria-label="Close"></button>
                            </div>
                        </c:if>
                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <i class="fas fa-exclamation-circle me-2"></i>${errorMessage}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"
                                    aria-label="Close"></button>
                            </div>
                        </c:if>

                        <!-- Bộ lọc yêu cầu -->
                        <div class="card shadow-sm mb-4">
                            <div class="card-header bg-light">
                                <h5 class="mb-0"><i class="fas fa-filter me-2"></i>Bộ lọc yêu cầu</h5>
                            </div>
                            <div class="card-body">
                                <form action="/history" method="get" class="row g-3 align-items-center">
                                    <div class="col-md-4">
                                        <div class="input-group">
                                            <span class="input-group-text">Từ ngày</span>
                                            <input type="date" class="form-control" id="fromDate" name="fromDate"
                                                value="${fromDate}" />
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="input-group">
                                            <span class="input-group-text">Đến ngày</span>
                                            <input type="date" class="form-control" id="toDate" name="toDate"
                                                value="${toDate}" />
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="input-group">
                                            <span class="input-group-text">Trạng thái</span>
                                            <select class="form-select" id="status" name="status">
                                                <option value="" ${empty status ? 'selected' : '' }>Tất cả trạng thái
                                                </option>
                                                <option value="PENDING" ${status=='PENDING' ? 'selected' : '' }>Chờ xử
                                                    lý</option>
                                                <option value="COMPLETED" ${status=='COMPLETED' ? 'selected' : '' }>Hoàn
                                                    thành</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-12 text-end">
                                        <button type="submit" class="btn btn-primary me-2">
                                            <i class="fas fa-search me-1"></i>Lọc yêu cầu
                                        </button>
                                        <a href="/history" class="btn btn-outline-secondary">
                                            <i class="fas fa-undo-alt me-1"></i>Đặt lại
                                        </a>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <!-- Hiển thị kết quả lọc -->
                        <c:if test="${not empty fromDate || not empty toDate || not empty status}">
                            <div class="alert alert-info mb-3">
                                <i class="fas fa-filter me-2"></i>Kết quả lọc:
                                <c:if test="${not empty fromDate}">
                                    <span class="badge rounded-pill bg-light text-dark me-2">
                                        Từ ngày:
                                        ${fromDate.getDayOfMonth()}/${fromDate.getMonthValue()}/${fromDate.getYear()}
                                    </span>
                                </c:if>
                                <c:if test="${not empty toDate}">
                                    <span class="badge rounded-pill bg-light text-dark me-2">
                                        Đến ngày:
                                        ${toDate.getDayOfMonth()}/${toDate.getMonthValue()}/${toDate.getYear()}
                                    </span>
                                </c:if>
                                <c:if test="${not empty status}">
                                    <span class="badge rounded-pill bg-light text-dark me-2">
                                        Trạng thái:
                                        <c:choose>
                                            <c:when test="${status == 'PENDING'}">Chờ xử lý</c:when>
                                            <c:when test="${status == 'COMPLETED'}">Hoàn thành</c:when>
                                            <c:otherwise>${status}</c:otherwise>
                                        </c:choose>
                                    </span>
                                </c:if>
                            </div>
                        </c:if>

                        <!-- Không có yêu cầu -->
                        <c:if test="${empty requestLists || requestLists.size() == 0}">
                            <div class="text-center py-5">
                                <i class="fas fa-history fa-5x text-muted mb-3"></i>
                                <h3>Bạn chưa có yêu cầu nào</h3>
                                <p class="text-muted">Hãy gửi yêu cầu để nhận hỗ trợ từ đội ngũ của chúng tôi</p>
                                <a href="/product" class="btn btn-primary mt-3">
                                    <i class="fas fa-shopping-cart me-2"></i>Xem sản phẩm
                                </a>
                            </div>
                        </c:if>

                        <!-- Danh sách yêu cầu -->
                        <c:if test="${not empty requestLists && requestLists.size() > 0}">
                            <div class="card shadow-sm">
                                <div class="card-header bg-primary text-white">
                                    <h5 class="mb-0">
                                        <i class="fas fa-history me-2"></i>Lịch sử yêu cầu của bạn
                                        <span class="badge bg-light text-dark ms-2">${totalItems} yêu cầu</span>
                                    </h5>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover align-middle">
                                            <thead>
                                                <tr>
                                                    <th scope="col" width="70">Mã YC</th>
                                                    <th scope="col">Thông tin</th>
                                                    <th scope="col">Ngày tạo</th>
                                                    <th scope="col">Trạng thái</th>
                                                    <th scope="col" width="120">Thao tác</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestLists}" var="request">
                                                    <tr>
                                                        <td>#${request.id}</td>
                                                        <td>
                                                            <div class="d-flex flex-column">
                                                                <span class="fw-bold">${request.fullNameInfo}</span>
                                                                <span class="text-muted small">${request.phoneInfo} |
                                                                    ${request.emailInfo}</span>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            ${request.createdAt.getDayOfMonth()}/${request.createdAt.getMonthValue()}/${request.createdAt.getYear()}
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${request.status == 'PENDING'}">
                                                                    <span class="badge bg-warning text-dark">Chờ xử
                                                                        lý</span>
                                                                </c:when>
                                                                <c:when test="${request.status == 'COMPLETED'}">
                                                                    <span class="badge bg-success">Hoàn thành</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span
                                                                        class="badge bg-secondary">${request.status}</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <a href="/history/${request.id}"
                                                                class="btn btn-sm btn-outline-primary">
                                                                <i class="fas fa-eye me-1"></i>Chi tiết
                                                            </a>
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
                                                <!-- Nút Previous -->
                                                <li class="page-item ${currentPage <= 1 ? 'disabled' : ''}">
                                                    <a class="page-link"
                                                        href="/history?page=${currentPage - 1}${fromDate != null ? '&fromDate='.concat(fromDate) : ''}${toDate != null ? '&toDate='.concat(toDate) : ''}${status != null ? '&status='.concat(status) : ''}"
                                                        aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                    </a>
                                                </li>

                                                <!-- Các số trang -->
                                                <c:forEach begin="1" end="${totalPages}" var="i">
                                                    <c:if test="${i <= currentPage + 2 && i >= currentPage - 2}">
                                                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                                                            <a class="page-link"
                                                                href="/history?page=${i}${fromDate != null ? '&fromDate='.concat(fromDate) : ''}${toDate != null ? '&toDate='.concat(toDate) : ''}${status != null ? '&status='.concat(status) : ''}">${i}</a>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>

                                                <!-- Nút Next -->
                                                <li class="page-item ${currentPage >= totalPages ? 'disabled' : ''}">
                                                    <a class="page-link"
                                                        href="/history?page=${currentPage + 1}${fromDate != null ? '&fromDate='.concat(fromDate) : ''}${toDate != null ? '&toDate='.concat(toDate) : ''}${status != null ? '&status='.concat(status) : ''}"
                                                        aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav>

                                        <!-- Thông tin phân trang -->
                                        <div class="text-center text-muted">
                                            Hiển thị ${(currentPage-1)*10 + 1} đến ${Math.min(currentPage*10,
                                            totalItems)}
                                            trong tổng số ${totalItems} yêu cầu
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </c:if>
                    </div>

                    <jsp:include page="../layout/footer.jsp" />
                </body>
                <script>
                    // Lưu vị trí cuộn khi chuyển trang
                    document.addEventListener('DOMContentLoaded', function () {
                        // Khôi phục vị trí cuộn từ lần truy cập trước
                        if (sessionStorage.getItem('scrollPos')) {
                            window.scrollTo(0, sessionStorage.getItem('scrollPos'));
                        }

                        // Lưu vị trí cuộn hiện tại khi người dùng nhấp vào liên kết phân trang
                        const paginationLinks = document.querySelectorAll('.pagination a.page-link');
                        paginationLinks.forEach(link => {
                            link.addEventListener('click', function () {
                                sessionStorage.setItem('scrollPos', window.pageYOffset);
                            });
                        });

                        // Lưu vị trí cuộn hiện tại khi người dùng gửi form tìm kiếm
                        const searchForm = document.querySelector('form[action="/history"]');
                        if (searchForm) {
                            searchForm.addEventListener('submit', function () {
                                sessionStorage.setItem('scrollPos', window.pageYOffset);
                            });
                        }
                    });

                    // Lưu vị trí cuộn khi người dùng rời khỏi trang
                    window.addEventListener('beforeunload', function () {
                        // Chỉ lưu khi không phải là thông qua nút phân trang 
                        // (vì đã được xử lý ở trên)
                        if (!event.target.activeElement ||
                            !event.target.activeElement.classList.contains('page-link')) {
                            sessionStorage.setItem('scrollPos', window.pageYOffset);
                        }
                    });
                </script>

                </html>