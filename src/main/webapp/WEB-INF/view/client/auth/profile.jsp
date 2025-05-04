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
                                        <h2>Thông tin người dùng</h2>
                                        <div class="underline-effect"></div>
                                    </div>





                                    <c:if test="${param.edit != null|| param.success != null}">
                                        <div class="alert alert-success mb-3">
                                            <i class="fas fa-check-circle me-2"></i>
                                            <span>Cập nhật thông tin thành công</span>
                                        </div>
                                    </c:if>

                                    <form:form id="profileForm" method="post" action="/profile" modelAttribute="user">
                                        <!-- Email -->
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                        <div class="mb-3">
                                            <label class="form-label">
                                                <i class="fas fa-envelope me-2"></i>Địa Chỉ Email
                                            </label>
                                            <div class="form-control-plaintext border rounded bg-light px-3 py-2">
                                                ${user.email}</div>
                                            <small class="text-muted">Email không thể thay đổi</small>
                                        </div>
                                        <div class="mb-3">
                                            <label for="floor" class="form-label">Họ và tên<span
                                                    class="text-danger">*</span></label>
                                            <form:input path="fullName" id="fullName" class="form-control"
                                                required="true" />
                                            <div class="invalid-feedback">Họ và tên không được để trống</div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="floor" class="form-label">Số điện thoại<span
                                                    class="text-danger">*</span></label>
                                            <form:input path="phone" id="phone" class="form-control" required="true" />
                                            <div class="invalid-feedback">Số điện thoại không được để trống</div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="floor" class="form-label">Địa chỉ<span
                                                    class="text-danger">*</span></label>
                                            <form:input path="address" id="address" class="form-control"
                                                required="true" />
                                            <div class="invalid-feedback">Địa chỉ không được để trống</div>
                                        </div>
                                        <div class="d-grid gap-2 mt-4">
                                            <button type="submit" class="btn btn-primary btn-lg">Xác nhận cập nhật thông
                                                tin</button>
                                        </div>
                                    </form:form>
                                </div>



                                <div class="text-center mt-3">
                                    <p> <a href="/edit-password">Đổi mật khẩu</a></p>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                </div>

                <jsp:include page="../layout/footer.jsp" />
            </body>

            </html>