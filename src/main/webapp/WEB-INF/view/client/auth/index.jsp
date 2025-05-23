<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>PhanTech - Thang máy chất lượng cao</title>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="/css/demo.css">
                <link rel="stylesheet" href="/css/style.css">
                <!-- Font Awesome for icons -->
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
            </head>

            <body>
                <jsp:include page="../layout/header.jsp" />
                <div class="banner">
                    <h1>Chào mừng đến với PhanTech</h1>
                    <p>Nơi hội tụ công nghệ và kỹ thuật tiên tiến nhất</p>
                </div>

                <div id="nav-products" class="container-fluid my-4 products">
                    <div class="row d-flex flex-wrap g-3">
                        <!-- Cột 1 -->
                        <c:forEach items="${elevatorTypes}" var="elevatorType">
                            <div class="col-lg-2 col-md-4 col-sm-6 text-center product-item">
                                <a
                                    href="/product?name=&elevatorTypes=${elevatorType.id}&minPrice=&maxPrice=&minSpeed=&maxSpeed=&minLoad=&maxLoad=&sortBy=id&sortDir=desc">
                                    <div class="product-card">
                                        <div class="product-img-wrapper">
                                            <img src="/images/public/${elevatorType.image}" alt="${elevatorType.name}"
                                                class="img-fluid">
                                        </div>
                                        <button class="btn product-btn"><a
                                                class="dropdown-item">${elevatorType.name}</a></button>
                                    </div>
                                </a>

                            </div>
                        </c:forEach>

                    </div>
                </div>

                <!-- Top 8 sản phẩm thang máy được yêu cầu tư vấn nhiều nhất -->
                <h2 class="text-center text-primary mb-4">Một số sản phẩm được đánh giá cao nhất</h2>

                <div class="container">
                    <div id="top-products" class="my-5">
                        <div class="row d-flex flex-wrap g-3 justify-content-center">
                            <c:forEach items="${products}" var="product">
                                <div class="col-lg-3 col-md-4 col-sm-12 mb-4">
                                    <div class="ecommerce-card h-100">
                                        <div class="ec-image">
                                            <img src="/images/product/${product.image1}" alt="${product.name}"
                                                class="img-fluid">
                                            <div class="hover-overlay">
                                                <a href="/product/${product.id}" class="quick-view-btn">
                                                    <i class="fas fa-eye"></i> Xem chi tiết
                                                </a>
                                            </div>
                                        </div>
                                        <div class="ec-content">
                                            <div class="ec-rating">
                                                <c:forEach begin="1" end="${product.rating}">
                                                    <i class="fas fa-star"></i>
                                                </c:forEach>
                                                <c:if test="${product.rating % 1 != 0}">
                                                    <i class="fas fa-star-half-alt"></i>
                                                </c:if>
                                                <c:forEach begin="1" end="${5 - Math.ceil(product.rating)}">
                                                    <i class="far fa-star"></i>
                                                </c:forEach>
                                                <span class="ms-1">(${product.reviews.size()})</span>
                                            </div>
                                            <h5 class="ec-title">${product.name}</h5>
                                            <div class="ec-category">${product.elevatorType.name}</div>
                                            <div class="ec-price">
                                                <c:choose>
                                                    <c:when test="${product.price > 0}">
                                                        <span class="current-price">
                                                            <fmt:formatNumber value="${product.price}" type="currency"
                                                                currencySymbol="₫" maxFractionDigits="0" />
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="current-price">Liên hệ báo giá</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="spec-label">
                                                <i class="fas fa-info-circle"></i> ${product.shortDescription}
                                            </div>
                                            <div class="spec-label">
                                                <i class="fas fa-tachometer-alt"></i> Tốc độ: ${product.speed}
                                                m/s
                                            </div>
                                            <div class="spec-label">
                                                <i class="fas fa-weight-hanging"></i> Tải trọng:
                                                ${product.loadCapacity} kg
                                            </div>
                                            <div class="spec-label">
                                                <i class="fas fa-door-open"></i> Loại cửa: ${product.doorType}
                                            </div>
                                        </div>
                                        <div class="ec-footer">
                                            <div class="ec-footer-row">
                                                <form action="/add-product-to-request-list/${product.id}" method="post"
                                                    class="me-2">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                    <button type="submit" class="btn btn-sm btn-primary">
                                                        <i class="fas fa-shopping-cart"></i> Thêm vào danh sách
                                                        yêu cầu
                                                    </button>
                                                </form>
                                                <a href="/product/${product.id}"
                                                    class="btn btn-sm btn-outline-secondary">
                                                    <i class="fas fa-info-circle"></i> Chi tiết
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                </div>

                </div>
                <!-- 8 dự án đã làm -->
                <h2 class="text-center text-primary mb-4">Các dự án mới nhất của chúng tôi</h2>
                <div id="completed-projects" class="container-fluid my-5 bg-light py-5">

                    <div class="row d-flex flex-wrap g-3 justify-content-center">
                        <!-- Dự án 1 -->
                        <c:forEach items="${projects}" var="project" begin="0" end="7">
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
                                        <a href="/project/${project.id}" class="pcv-btn">Xem chi tiết <i
                                                class="fas fa-arrow-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <div id="service" class="container-fluid my-4 services">
                    <h2 class="text-center text-primary mb-4">Dịch Vụ Của Chúng Tôi</h2>
                    <div class="row d-flex flex-wrap g-3 justify-content-center">

                        <c:forEach items="${services}" var="service">
                            <div class="col-lg-2 col-md-4 col-sm-6 text-center service-item">
                                <a href="/service/${service.id}">

                                    <div class="service-card">
                                        <div class="service-img-wrapper">
                                            <img src="/images/public/${service.image}" alt="${service.name}"
                                                class="img-fluid">
                                        </div>
                                        <button class="btn service-btn"><a
                                                class="dropdown-item">${service.name}</a></button>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <jsp:include page="../layout/footer.jsp" />
            </body>

            </html>