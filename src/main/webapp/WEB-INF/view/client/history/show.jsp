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
                                                        <td>${request.createdAt}</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${request.status == 'PENDING'}">
                                                                    <span class="badge bg-warning text-dark">Chờ xử
                                                                        lý</span>
                                                                </c:when>
                                                                <c:when test="${request.status == 'PROCESSING'}">
                                                                    <span class="badge bg-primary">Đang xử lý</span>
                                                                </c:when>
                                                                <c:when test="${request.status == 'COMPLETED'}">
                                                                    <span class="badge bg-success">Hoàn thành</span>
                                                                </c:when>
                                                                <c:when test="${request.status == 'CANCELED'}">
                                                                    <span class="badge bg-danger">Đã hủy</span>
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
                                </div>
                            </div>
                        </c:if>
                    </div>

                    <jsp:include page="../layout/footer.jsp" />
                </body>

                </html>