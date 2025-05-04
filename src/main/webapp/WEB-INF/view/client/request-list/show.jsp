<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Danh sách yêu cầu - PhanTech</title>
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
                    <div class="container-fluid bg-light py-5">
                        <div class="container">
                            <h1 class="text-center">Danh Sách Yêu Cầu</h1>
                            <p class="text-center text-muted">Quản lý sản phẩm và dịch vụ của bạn</p>
                        </div>
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

                        <!-- Trống giỏ hàng -->
                        <c:if test="${empty Items || Items.size() == 0}">
                            <div class="text-center py-5">
                                <i class="fas fa-clipboard-list fa-5x text-muted mb-3"></i>
                                <h3>Danh sách yêu cầu của bạn đang trống</h3>
                                <p class="text-muted">Hãy thêm sản phẩm hoặc dịch vụ bạn quan tâm</p>
                                <a href="/product" class="btn btn-primary mt-3">
                                    <i class="fas fa-arrow-left me-2"></i>Xem sản phẩm
                                </a>
                            </div>
                        </c:if>

                        <c:if test="${not empty Items && Items.size() > 0}">
                            <div class="row">
                                <!-- Danh sách sản phẩm -->
                                <div class="col-lg-8">
                                    <div class="card mb-4">
                                        <div class="card-header bg-primary text-white">
                                            <h5 class="mb-0">
                                                <i class="fas fa-list me-2"></i>Sản phẩm & Dịch vụ
                                            </h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table class="table table-hover align-middle">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col" width="60">STT</th>
                                                            <th scope="col">Sản phẩm/Dịch vụ</th>
                                                            <th scope="col" width="80">Thao tác</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${Items}" var="item" varStatus="status">
                                                            <tr>
                                                                <td>${status.index + 1}</td>
                                                                <td>
                                                                    <div class="d-flex align-items-center">
                                                                        <c:if test="${not empty item.product}">
                                                                            <img src="/images/product/${item.product.image1}"
                                                                                class="rounded me-3" width="50"
                                                                                height="50" alt="${item.product.name}">
                                                                            <div>
                                                                                <h6 class="mb-0">${item.product.name}
                                                                                </h6>
                                                                                <small class="text-muted">Sản
                                                                                    phẩm</small>
                                                                            </div>
                                                                        </c:if>
                                                                        <c:if test="${not empty item.service}">
                                                                            <img src="/images/public/${item.service.image}"
                                                                                class="rounded me-3" width="50"
                                                                                height="50" alt="${item.service.name}">
                                                                            <div>
                                                                                <h6 class="mb-0">${item.service.name}
                                                                                </h6>
                                                                                <small class="text-muted">Dịch
                                                                                    vụ</small>
                                                                            </div>
                                                                        </c:if>
                                                                    </div>
                                                                </td>
                                                                <td class="text-center">
                                                                    <form action="/remove-request-item" method="post">
                                                                        <input type="hidden"
                                                                            name="${_csrf.parameterName}"
                                                                            value="${_csrf.token}">
                                                                        <input type="hidden" name="itemId"
                                                                            value="${item.id}">

                                                                        <button type="submit"
                                                                            class="btn btn-sm btn-outline-danger"
                                                                            title="Xóa khỏi danh sách">
                                                                            <i class="fas fa-trash"></i>
                                                                        </button>
                                                                    </form>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Form thông tin -->
                                <div class="col-lg-4">
                                    <div class="card">
                                        <div class="card-header bg-primary text-white">
                                            <h5 class="mb-0">
                                                <i class="fas fa-user me-2"></i>Thông tin của bạn
                                            </h5>
                                        </div>
                                        <div class="card-body">
                                            <form action="/submit-request-list" method="post">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}">
                                                <div class="mb-3">
                                                    <label for="fullNameInfo" class="form-label">Họ và tên <span
                                                            class="text-danger">*</span></label>
                                                    <input name="fullNameInfo" class="form-control" id="fullNameInfo"
                                                        required="true" value="${user.fullName}" />
                                                </div>

                                                <div class="mb-3">
                                                    <label for="emailInfo" class="form-label">Email <span
                                                            class="text-danger">*</span></label>
                                                    <input name="emailInfo" type="email" class="form-control"
                                                        id="emailInfo" required="true" value="${user.email}" />
                                                </div>

                                                <div class="mb-3">
                                                    <label for="phoneInfo" class="form-label">Số điện thoại <span
                                                            class="text-danger">*</span></label>
                                                    <input name="phoneInfo" class="form-control" id="phoneInfo"
                                                        required="true" value="${user.phone}" />
                                                </div>

                                                <div class="mb-3">
                                                    <label for="addressInfo" class="form-label">Địa chỉ <span
                                                            class="text-danger">*</span></label>
                                                    <textarea name="addressInfo" class="form-control" id="addressInfo"
                                                        rows="2" required="true">${user.address}</textarea>
                                                </div>

                                                <div class="mb-3">
                                                    <label for="noteInfo" class="form-label">Ghi chú</label>
                                                    <textarea name="noteInfo" class="form-control" id="noteInfo"
                                                        rows="3"
                                                        placeholder="Thông tin thêm về yêu cầu của bạn..."></textarea>
                                                </div>

                                                <div class="d-grid gap-2">
                                                    <button type="submit" class="btn btn-primary btn-lg">
                                                        <i class="fas fa-paper-plane me-2"></i>Gửi yêu cầu
                                                    </button>
                                                    <a href="/product" class="btn btn-outline-secondary">
                                                        <i class="fas fa-shopping-cart me-2"></i>Tiếp tục xem sản phẩm
                                                    </a>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </div>

                    <jsp:include page="../layout/footer.jsp" />
                </body>

                </html>