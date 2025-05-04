<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Thông tin cá nhân</title>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="/css/demo.css">
                <link rel="stylesheet" href="/css/style.css">

                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
            </head>

            <body>
                <jsp:include page="../layout/header.jsp" />
                <div class="container mt-5 pt-5">
                    <div class="row justify-content-center">
                        <div class="col-lg-5 col-md-7">
                            <div class="card shadow-lg">
                                <div class="card-body p-4">
                                    <div class="text-center mb-4">
                                        <h2>Đổi mật khẩu</h2>
                                        <div class="underline-effect"></div>
                                    </div>




                                    <!-- Thông báo đổi mật khẩu thành công -->
                                    <c:if test="${param.success eq 'change-password'}">
                                        <div class="alert alert-success alert-dismissible fade show mb-3">
                                            <i class="fas fa-check-circle me-2"></i>
                                            <span>Đổi mật khẩu thành công</span>
                                            <button type="button" class="btn-close" data-bs-dismiss="alert"
                                                aria-label="Close"></button>
                                        </div>
                                    </c:if>

                                    <!-- Thông báo lỗi mật khẩu xác nhận không khớp -->
                                    <c:if test="${param.error eq 'confirm-password'}">
                                        <div class="alert alert-danger alert-dismissible fade show mb-3">
                                            <i class="fas fa-exclamation-circle me-2"></i>
                                            <span>Mật khẩu xác nhận không khớp với mật khẩu mới</span>
                                            <button type="button" class="btn-close" data-bs-dismiss="alert"
                                                aria-label="Close"></button>
                                        </div>
                                    </c:if>

                                    <!-- Thông báo lỗi mật khẩu cũ không đúng -->
                                    <c:if test="${param.error eq 'old-password'}">
                                        <div class="alert alert-danger alert-dismissible fade show mb-3">
                                            <i class="fas fa-exclamation-circle me-2"></i>
                                            <span>Mật khẩu cũ không chính xác</span>
                                            <button type="button" class="btn-close" data-bs-dismiss="alert"
                                                aria-label="Close"></button>
                                        </div>
                                    </c:if>


                                    <form:form id="profileForm" method="post" action="/edit-password"
                                        modelAttribute="email">
                                        <!-- Email -->
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                        <div class="mb-3">
                                            <label class="form-label">
                                                <i class="fas fa-envelope me-2"></i>Địa Chỉ Email
                                            </label>
                                            <div class="form-control-plaintext border rounded bg-light px-3 py-2">
                                                ${email}</div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="password" class="form-label">
                                                <i class="fas fa-lock me-2"></i>Mật Khẩu Cũ
                                            </label>
                                            <div class="input-group">
                                                <input type="password" name="old-password" class="form-control"
                                                    id="old-password" required>
                                                <button class="btn btn-outline-secondary" type="button">
                                                    <i class="far fa-eye"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="password" class="form-label">
                                                <i class="fas fa-lock me-2"></i>Mật Khẩu Mới
                                            </label>
                                            <div class="input-group">
                                                <input type="password" name="new-password" class="form-control"
                                                    id="new-password" required>
                                                <button class="btn btn-outline-secondary" type="button">
                                                    <i class="far fa-eye"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="password" class="form-label">
                                                <i class="fas fa-lock me-2"></i>Nhập lại mật khẩu mới
                                            </label>
                                            <div class="input-group">
                                                <input type="password" name="confirm-password" class="form-control"
                                                    id="confirm-password" required>
                                                <button class="btn btn-outline-secondary" type="button">
                                                    <i class="far fa-eye"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="d-grid gap-2 mt-4">
                                            <button type="submit" class="btn btn-primary btn-lg"> Đổi mật khẩu
                                            </button>
                                        </div>
                                    </form:form>
                                </div>

                                <div class="text-center mt-3">
                                    <p> <a href="/edit-password">Đổi mật khẩu</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>

                <jsp:include page="../layout/footer.jsp" />
            </body>

            </html>