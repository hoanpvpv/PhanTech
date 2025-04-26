<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Đăng Ký Tài Khoản</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Latest compiled JavaScript -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

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
                        <div class="col-lg-6 col-md-8">
                            <div class="card shadow-lg">
                                <div class="card-body p-4">
                                    <div class="text-center mb-4">
                                        <h2>Tạo Tài Khoản Mới</h2>
                                        <div class="underline-effect"></div>
                                        <p class="text-muted mt-2">Điền thông tin của bạn để bắt đầu</p>
                                    </div>

                                    <!-- ...existing code... -->
                                    <!-- Hiển thị các lỗi toàn cục - chỉnh sửa phần này -->
                                    <c:if
                                        test="${!empty requestScope['org.springframework.validation.BindingResult.registerDTO'].allErrors}">
                                        <div class="alert alert-danger mb-3">
                                            <h5 class="text-danger"><i class="fas fa-exclamation-triangle me-2"></i>Đã
                                                xảy ra lỗi:</h5>
                                            <ul class="mb-0">
                                                <c:forEach
                                                    items="${requestScope['org.springframework.validation.BindingResult.registerDTO'].globalErrors}"
                                                    var="error">
                                                    <li>${error.defaultMessage}</li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </c:if>
                                    <!-- ...existing code... -->
                                    <form:form id="registrationForm" method="post" action="/register"
                                        modelAttribute="registerDTO">
                                        <!-- Email -->
                                        <div class="mb-3">
                                            <label for="email" class="form-label">
                                                <i class="fas fa-envelope me-2"></i>Địa Chỉ Email
                                            </label>
                                            <form:input type="email" path="email"
                                                class="form-control ${!empty requestScope['org.springframework.validation.BindingResult.registerDTO'].getFieldError('email') ? 'is-invalid' : ''}"
                                                id="email" placeholder="example@example.com" />
                                            <form:errors path="email" cssClass="invalid-feedback" />
                                            <small class="form-text text-muted">Địa chỉ email hợp lệ (vd:
                                                example@domain.com)</small>
                                        </div>

                                        <!-- Password with strength meter -->
                                        <div class="mb-3">
                                            <label for="password" class="form-label">
                                                <i class="fas fa-lock me-2"></i>Mật Khẩu
                                            </label>
                                            <form:password path="password"
                                                class="form-control ${!empty requestScope['org.springframework.validation.BindingResult.registerDTO'].getFieldError('password') ? 'is-invalid' : ''}"
                                                id="password" />
                                            <div class="progress mt-2" style="height: 5px;">
                                                <div id="password-strength" class="progress-bar" role="progressbar"
                                                    style="width: 0%"></div>
                                            </div>
                                            <small id="passwordHelp" class="form-text text-muted">Sử dụng ít nhất 8 ký
                                                tự, bao gồm chữ và số</small>
                                            <form:errors path="password" cssClass="invalid-feedback" />
                                        </div>

                                        <!-- Confirm Password -->
                                        <div class="mb-3">
                                            <label for="confirmPassword" class="form-label">
                                                <i class="fas fa-lock me-2"></i>Xác Nhận Mật Khẩu
                                            </label>
                                            <form:password path="confirmPassword"
                                                class="form-control ${!empty requestScope['org.springframework.validation.BindingResult.registerDTO'].getFieldError('confirmPassword') ? 'is-invalid' : ''}"
                                                id="confirmPassword" />
                                            <form:errors path="confirmPassword" cssClass="invalid-feedback" />
                                        </div>

                                        <!-- Full Name -->
                                        <div class="mb-3">
                                            <label for="fullName" class="form-label">
                                                <i class="fas fa-user me-2"></i>Họ và Tên
                                            </label>
                                            <form:input type="text" path="fullName"
                                                class="form-control ${!empty requestScope['org.springframework.validation.BindingResult.registerDTO'].getFieldError('fullName') ? 'is-invalid' : ''}"
                                                id="fullName" placeholder="Nguyễn Văn A" />
                                            <form:errors path="fullName" cssClass="invalid-feedback" />
                                            <small class="form-text text-muted">Họ và tên phải có ít nhất 6 ký
                                                tự</small>
                                        </div>

                                        <!-- Phone -->
                                        <div class="mb-3">
                                            <label for="phone" class="form-label">
                                                <i class="fas fa-phone me-2"></i>Số Điện Thoại
                                            </label>
                                            <form:input type="tel" path="phone"
                                                class="form-control ${!empty requestScope['org.springframework.validation.BindingResult.registerDTO'].getFieldError('phone') ? 'is-invalid' : ''}"
                                                id="phone" placeholder="0912345678" />
                                            <form:errors path="phone" cssClass="invalid-feedback" />
                                            <small class="form-text text-muted">Số điện thoại phải có ít nhất 10 chữ số
                                                và chỉ bao gồm các chữ số</small>
                                        </div>

                                        <!-- Address -->
                                        <div class="mb-3">
                                            <label for="address" class="form-label">
                                                <i class="fas fa-map-marker-alt me-2"></i>Địa Chỉ
                                            </label>
                                            <form:textarea path="address"
                                                class="form-control ${!empty requestScope['org.springframework.validation.BindingResult.registerDTO'].getFieldError('address') ? 'is-invalid' : ''}"
                                                id="address" rows="2" placeholder="Địa chỉ đầy đủ của bạn" />
                                            <form:errors path="address" cssClass="invalid-feedback" />
                                        </div>
                                        <!-- Submit Button -->
                                        <div class="d-grid gap-2 mt-4">
                                            <button type="submit" class="btn btn-primary btn-lg">Đăng Ký</button>
                                        </div>

                                        <div class="text-center mt-3">
                                            <p>Đã có tài khoản? <a href="/login">Đăng nhập tại đây</a></p>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                // ...existing code...
                <script>
                    $(document).ready(function () {
                        // Password strength meter
                        $('#password').on('input', function () {
                            const password = $(this).val();
                            let strength = 0;

                            if (password.length >= 8) strength += 25;
                            if (password.match(/[a-z]+/)) strength += 25;
                            if (password.match(/[A-Z]+/)) strength += 25;
                            if (password.match(/[0-9]+/)) strength += 25;

                            $('#password-strength').css('width', strength + '%');

                            if (strength < 50) {
                                $('#password-strength').removeClass().addClass('progress-bar bg-danger');
                            } else if (strength < 75) {
                                $('#password-strength').removeClass().addClass('progress-bar bg-warning');
                            } else {
                                $('#password-strength').removeClass().addClass('progress-bar bg-success');
                            }
                        });

                        // Kiểm tra password và confirmPassword khớp nhau
                        $('#confirmPassword').on('input', function () {
                            const password = $('#password').val();
                            const confirmPassword = $(this).val();

                            if (password !== confirmPassword) {
                                $(this).addClass('is-invalid');
                                if ($('#confirm-password-feedback').length === 0) {
                                    $(this).after('<div id="confirm-password-feedback" class="invalid-feedback">Mật khẩu xác nhận không khớp</div>');
                                }
                            } else {
                                $(this).removeClass('is-invalid');
                                $('#confirm-password-feedback').remove();
                            }
                        });

                        // Kiểm tra số điện thoại
                        $('#phone').on('input', function () {
                            const phone = $(this).val();
                            const phoneRegex = /^[0-9]+$/;

                            if (!phoneRegex.test(phone)) {
                                $(this).addClass('is-invalid');
                                if ($('#phone-feedback').length === 0) {
                                    $(this).after('<div id="phone-feedback" class="invalid-feedback">Số điện thoại chỉ được chứa các chữ số!</div>');
                                }
                            } else if (phone.length < 10) {
                                $(this).addClass('is-invalid');
                                if ($('#phone-feedback').length === 0) {
                                    $(this).after('<div id="phone-feedback" class="invalid-feedback">Số điện thoại phải có ít nhất 10 chữ số!</div>');
                                } else {
                                    $('#phone-feedback').text('Số điện thoại phải có ít nhất 10 chữ số!');
                                }
                            } else {
                                $(this).removeClass('is-invalid');
                                $('#phone-feedback').remove();
                            }
                        });

                        // Kiểm tra form trước khi submit
                        $('#registrationForm').on('submit', function (e) {
                            const password = $('#password').val();
                            const confirmPassword = $('#confirmPassword').val();

                            if (password !== confirmPassword) {
                                e.preventDefault();
                                $('#confirmPassword').addClass('is-invalid');
                                if ($('#confirm-password-feedback').length === 0) {
                                    $('#confirmPassword').after('<div id="confirm-password-feedback" class="invalid-feedback">Mật khẩu xác nhận không khớp</div>');
                                }
                            }

                            const phone = $('#phone').val();
                            const phoneRegex = /^[0-9]+$/;

                            if (phone && (!phoneRegex.test(phone) || phone.length < 10)) {
                                e.preventDefault();
                                $('#phone').addClass('is-invalid');
                            }
                        });
                    });
                </script>
            </body>

            </html>