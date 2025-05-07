<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Liên hệ</title>
                    <!-- Latest compiled and minified CSS -->

                    <!-- Latest compiled JavaScript -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link rel="stylesheet" href="/css/demo.css">
                    <link rel="stylesheet" href="/css/style.css">
                    <!-- Font Awesome for icons -->
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                </head>

                <body>
                    <!-- Header -->
                    <jsp:include page="../layout/header.jsp" />

                    <!-- Banner -->
                    <div class="banner">
                        <h1>Liên hệ với chúng tôi</h1>
                        <p>Chúng tôi luôn sẵn sàng hỗ trợ bạn</p>
                    </div>

                    <!-- Liên hệ nhanh -->
                    <div class="container-fluid bg-primary text-white py-5">
                        <div class="container">
                            <div class="row align-items-center">
                                <div class="col-lg-6 mb-4 mb-lg-0">
                                    <h2>Bạn cần tư vấn?</h2>
                                    <div class="contact-info mt-4">
                                        <div class="d-flex mb-3">
                                            <i class="fas fa-map-marker-alt me-3 fa-fw"></i>
                                            <span>123 Đường ABC, Quận XYZ, TP.HCM</span>
                                        </div>
                                        <div class="d-flex mb-3">
                                            <i class="fas fa-phone-alt me-3 fa-fw"></i>
                                            <span>0123 456 789</span>
                                        </div>
                                        <div class="d-flex">
                                            <i class="fas fa-envelope me-3 fa-fw"></i>
                                            <span>info@phantech.com</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="card border-0 shadow">
                                        <div class="card-body p-4">
                                            <h4 class="text-primary mb-4">Gửi yêu cầu tư vấn</h4>
                                            <!-- Thêm sau thẻ mở của div.card-body và trước h4 -->
                                            <c:if test="${param.success eq 'send-message'}">
                                                <div class="alert alert-success alert-dismissible fade show mb-4"
                                                    role="alert">
                                                    <i class="fas fa-check-circle me-2"></i> Yêu cầu của bạn đã được gửi
                                                    thành công! Chúng tôi sẽ liên hệ lại sớm nhất!
                                                    <button type="button" class="btn-close" data-bs-dismiss="alert"
                                                        aria-label="Close"></button>
                                                </div>
                                            </c:if>
                                            <form action="/submit-form-contact" method="post">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}">
                                                <div class="row g-3">
                                                    <div class="col-md-6">
                                                        <input type="text" class="form-control" name="name"
                                                            placeholder="Họ và tên" required>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <input type="tel" class="form-control" name="phone"
                                                            placeholder="Số điện thoại" required>
                                                    </div>
                                                    <div class="col-12">
                                                        <input type="email" class="form-control" name="email"
                                                            placeholder="Email" required>
                                                    </div>
                                                    <div class="col-12">
                                                        <input type="text" class="form-control" name="address"
                                                            placeholder="Địa chỉ">
                                                    </div>
                                                    <div class="col-12">
                                                        <textarea class="form-control" name="message" rows="4"
                                                            placeholder="Nội dung tin nhắn" required></textarea>
                                                    </div>
                                                    <div class="col-12">
                                                        <button type="submit" class="btn btn-primary w-100 py-3">Gửi yêu
                                                            cầu</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Bản đồ -->
                    <div class="container my-5">
                        <h2 class="text-center text-primary mb-4">Bản đồ</h2>
                        <div class="map-responsive">
                            <iframe
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.682574420091!2d106.6800683153344!3d10.76262299232744!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f3f1c6f6e5b%3A0x2b1b1b1b1b1b1b1b!2zQ8O0bmcgdHkgUGjDoXQgdHLhuqVuaCBDw7RuZyBuZ2jhu4cgduG7iyBQaGFuVGVjaA!5e0!3m2!1sen!2s!4v1681234567890!5m2!1sen!2s"
                                width="100%" height="400" style="border:0;" allowfullscreen="" loading="lazy"
                                referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                    </div>

                    <!-- Footer -->
                    <jsp:include page="../layout/footer.jsp" />
                </body>

                </html>