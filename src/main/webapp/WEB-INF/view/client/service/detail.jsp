<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>PhanTech - Thang máy chất lượng cao</title>
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
                    <jsp:include page="../layout/header.jsp" />

                    <!-- Banner Section -->
                    <div class="banner">
                        <h1>${service.name}</h1>
                        <p>${service.shortDesc}</p>
                        <div class="rating mt-2">
                            <c:forEach begin="1" end="5" var="i">
                                <i
                                    class="${i <= service.rating ? 'fas' : 'far'} fa-star ${i <= service.rating ? 'text-warning' : 'text-light'}"></i>
                            </c:forEach>
                            <span class="ms-2">${service.rating}/5.0</span>
                            <span class="text-muted ms-2" style="color: white;">(${service.reviewCount} đánh
                                giá)</span>
                        </div>
                        <form action="/add-service-to-request-list/${service.id}" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <button type="submit" class="btn btn-primary rounded-pill">Thêm vào danh
                                sách yêu cầu</button>
                        </form>

                    </div>




                    <!-- Service Description Section -->
                    <section class="container my-5">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card border-0 shadow-sm">
                                    <div class="card-body">
                                        <h2 class="card-title border-bottom pb-3">Thông tin dịch vụ</h2>
                                        <div class="service-description my-4">
                                            ${service.detailDesc}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!-- Projects Section -->
                    <section class="bg-light py-5">

                        <h2 class="text-center text-primary mb-4">Một số dự án sử dụng dịch vụ</h2>
                        <div class="row g-4 justify-content-center">
                            <c:if test="${empty projects}">
                                <div class="col-12 text-center">
                                    <p class="text-muted">Chưa có dự án nào sử dụng dịch vụ này</p>
                                </div>
                            </c:if>
                            <c:forEach items="${projects}" var="project">
                                <div class="col-lg-2 col-md-4 col-sm-6 mb-4">
                                    <div class="project-card-vertical h-100">
                                        <div class="pcv-image">
                                            <img src="/images/project/${project.image}" alt="${project.name}"
                                                class="img-fluid">
                                        </div>
                                        <div class="pcv-content">
                                            <h5 class="pcv-title">${project.name}</h5>
                                            <div class="pcv-info">
                                                <div class="pcv-location"><i class="fas fa-map-marker-alt"></i>
                                                    ${project.address}</div>
                                                <div class="pcv-date"><i class="far fa-calendar-alt"></i>
                                                    ${project.date}</div>
                                            </div>
                                            <div class="pcv-stats">
                                                <div class="pcv-stat">
                                                    <div class="pcv-stat-value">${project.service.name}</div>
                                                    <div class="pcv-stat-label">Dịch vụ</div>
                                                </div>
                                                <div class="pcv-stat">
                                                    <div class="pcv-stat-value">${project.floor}</div>
                                                    <div class="pcv-stat-label">Tầng</div>
                                                </div>
                                                <div class="pcv-stat">
                                                    <div class="pcv-stat-value">${project.product.speed}</div>
                                                    <div class="pcv-stat-label">Tốc độ</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="pcv-footer">
                                            <a href="/projects/${project.id}" class="pcv-btn">Xem chi tiết <i
                                                    class="fas fa-arrow-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                    </section>

                    <!-- Reviews Section -->
                    <section class="container my-5">
                        <h2 class="text-center text-primary mb-4">Đánh giá từ khách hàng</h2>
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <c:if test="${empty reviews}">
                                    <div class="text-center py-4">
                                        <p class="text-muted">Chưa có đánh giá nào cho dịch vụ này</p>
                                    </div>
                                </c:if>
                                <c:forEach items="${reviews}" var="review">
                                    <div class="card mb-3 shadow-sm border-0">
                                        <div class="card-body">
                                            <div class="d-flex align-items-center mb-3">
                                                <!-- Avatar người dùng -->
                                                <div class="avatar bg-primary text-white rounded-circle d-flex align-items-center justify-content-center me-3"
                                                    style="width:45px; height:45px; font-size: 1.2rem;">
                                                    ${review.user.fullName.substring(0,1).toUpperCase()}
                                                </div>

                                                <!-- Tên người dùng -->
                                                <div>
                                                    <h5 class="mb-0 fs-6 fw-bold">${review.user.fullName}</h5>
                                                    <div class="rating">
                                                        <c:forEach begin="1" end="5" var="i">
                                                            <i
                                                                class="${i <= review.rating ? 'fas' : 'far'} fa-star ${i <= review.rating ? 'text-warning' : 'text-muted'} fa-sm"></i>
                                                        </c:forEach>
                                                    </div>
                                                </div>

                                                <!-- Ngày tháng (bên phải) -->
                                                <div class="text-muted small ms-auto">
                                                    <fmt:parseDate value="${review.createdAt}"
                                                        pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" />
                                                    <fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy" />
                                                </div>
                                            </div>

                                            <!-- Nội dung đánh giá -->
                                            <p class="mb-0">${review.content}</p>

                                            <!-- Hình ảnh đánh giá -->
                                            <div class="review-images mt-2">
                                                <div class="row g-2">
                                                    <c:if test="${not empty review.image1}">
                                                        <div class="col-auto">
                                                            <a href="/images/public/${review.image1}"
                                                                data-lightbox="review-${review.id}"
                                                                data-title="${review.user.fullName} - Hình ảnh 1">
                                                                <img src="/images/public/${review.image1}"
                                                                    alt="Ảnh đánh giá" class="img-thumbnail"
                                                                    style="height:60px; width:auto;">
                                                            </a>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${not empty review.image2}">
                                                        <div class="col-auto">
                                                            <a href="/images/public/${review.image2}"
                                                                data-lightbox="review-${review.id}"
                                                                data-title="${review.user.fullName} - Hình ảnh 2">
                                                                <img src="/images/public/${review.image2}"
                                                                    alt="Ảnh đánh giá" class="img-thumbnail"
                                                                    style="height:60px; width:auto;">
                                                            </a>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${not empty review.image3}">
                                                        <div class="col-auto">
                                                            <a href="/images/public/${review.image3}"
                                                                data-lightbox="review-${review.id}"
                                                                data-title="${review.user.fullName} - Hình ảnh 3">
                                                                <img src="/images/public/${review.image3}"
                                                                    alt="Ảnh đánh giá" class="img-thumbnail"
                                                                    style="height:60px; width:auto;">
                                                            </a>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>


                    </section>
                    <jsp:include page="../layout/footer.jsp" />

                    <!-- JavaScript để responsive các hình ảnh trong nội dung chi tiết dịch vụ -->
                    <script>
                        document.addEventListener('DOMContentLoaded', function () {
                            const serviceDescription = document.querySelector('.service-description');
                            if (serviceDescription) {
                                const images = serviceDescription.querySelectorAll('img');
                                images.forEach(img => {
                                    img.classList.add('img-fluid');
                                    img.style.maxWidth = '100%';
                                    img.style.height = 'auto';
                                });
                            }
                        });
                    </script>
                </body>

                </html>