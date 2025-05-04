<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Đăng Nhập - PhanTech</title>
                <!-- Latest compiled and minified CSS -->

                <!-- Latest compiled JavaScript -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="/css/demo.css">
                <!-- Font Awesome for icons -->
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
            </head>

            <body>
                <!-- Navigation Bar -->
                <jsp:include page="../layout/header.jsp" />

                <!-- Main Content -->
                <div class="container mt-5 pt-5">
                    <div class="row justify-content-center">
                        <div class="col-lg-5 col-md-7">
                            <div class="card shadow-lg">
                                <div class="card-body p-4">
                                    <div class="text-center mb-4">
                                        <h2>Đăng Nhập</h2>
                                        <div class="underline-effect"></div>
                                        <p class="text-muted mt-2">Đăng nhập để truy cập tài khoản của bạn</p>
                                    </div>

                                    <!-- Hiển thị thông báo lỗi nếu có -->
                                    <c:if test="${param.error != null}">
                                        <div class="alert alert-danger mb-3">
                                            <i class="fas fa-exclamation-circle me-2"></i>
                                            <span>Email hoặc mật khẩu không chính xác</span>
                                        </div>
                                    </c:if>

                                    <!-- Hiển thị thông báo đăng xuất thành công -->
                                    <c:if test="${param.logout != null}">
                                        <div class="alert alert-success mb-3">
                                            <i class="fas fa-check-circle me-2"></i>
                                            <span>Bạn đã đăng xuất thành công</span>
                                        </div>
                                    </c:if>

                                    <!-- Hiển thị thông báo đăng ký thành công -->
                                    <c:if test="${param.registered != null}">
                                        <div class="alert alert-success mb-3">
                                            <i class="fas fa-check-circle me-2"></i>
                                            <span>Đăng ký thành công! Vui lòng đăng nhập</span>
                                        </div>
                                    </c:if>

                                    <form id="loginForm" method="post" action="/login">
                                        <!-- Email -->
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <div class="mb-3">
                                            <label for="username" class="form-label">
                                                <i class="fas fa-envelope me-2"></i>Địa Chỉ Email
                                            </label>
                                            <input type="email" name="username" class="form-control" id="username"
                                                placeholder="example@example.com" required>
                                        </div>

                                        <!-- Password with show/hide toggle -->
                                        <div class="mb-3">
                                            <label for="password" class="form-label">
                                                <i class="fas fa-lock me-2"></i>Mật Khẩu
                                            </label>
                                            <div class="input-group">
                                                <input type="password" name="password" class="form-control"
                                                    id="password" required>
                                                <button class="btn btn-outline-secondary" type="button"
                                                    id="togglePassword">
                                                    <i class="far fa-eye"></i>
                                                </button>
                                            </div>
                                        </div>

                                        <!-- Remember me & Forgot password -->
                                        <div class="row mb-3">
                                            <div class="col-6">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" name="remember-me"
                                                        id="rememberMe">
                                                    <label class="form-check-label" for="rememberMe">
                                                        Nhớ đăng nhập
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-6 text-end">
                                                <a href="/forgot-password" class="text-decoration-none">Quên mật
                                                    khẩu?</a>
                                            </div>
                                        </div>

                                        <!-- Submit Button -->
                                        <div class="d-grid gap-2 mt-4">
                                            <button type="submit" class="btn btn-primary btn-lg">Đăng Nhập</button>
                                        </div>

                                        <div class="text-center mt-3">
                                            <p>Chưa có tài khoản? <a href="/register">Đăng ký tại đây</a></p>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <script>
                    $(document).ready(function () {
                        // Toggle password visibility
                        $('#togglePassword').click(function () {
                            const passwordInput = $('#password');
                            const icon = $(this).find('i');

                            if (passwordInput.attr('type') === 'password') {
                                passwordInput.attr('type', 'text');
                                icon.removeClass('fa-eye').addClass('fa-eye-slash');
                            } else {
                                passwordInput.attr('type', 'password');
                                icon.removeClass('fa-eye-slash').addClass('fa-eye');
                            }
                        });
                    });
                </script>

            </body>

            </html>