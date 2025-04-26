<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>PhanTech - Thang máy chất lượng cao</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
                        <div class="col-lg-2 col-md-4 col-sm-6 text-center product-item flex-shrink-0">
                            <a href="products.html"><img src="/images/public/homelift.png" alt="Image 1"
                                    class="img-fluid"></a>
                            <p>Thang Máy Gia Đình</p>
                        </div>
                        <!-- Cột 2 -->
                        <div class="col-lg-2 col-md-4 col-sm-6 text-center product-item">
                            <a href="products.html"><img src="/images/public/epassenger.png" alt="Image 2"
                                    class="img-fluid"></a>
                            <p>Thang Máy Chở Khách</p>
                        </div>
                        <!-- Cột 3 -->
                        <div class="col-lg-2 col-md-4 col-sm-6 text-center product-item">
                            <a href="products.html"><img src="/images/public/Eglass.png" alt="Image 3"
                                    class="img-fluid"></a>
                            <p>Thang Máy Kính</p>
                        </div>
                        <!-- Cột 4 -->
                        <div class="col-lg-2 col-md-4 col-sm-6 text-center product-item">
                            <a href="products.html"><img src="/images/public/freight.png" alt="Image 4"
                                    class="img-fluid"></a>
                            <p>Thang Máy Thủy Lực</p>
                        </div>
                        <!-- Cột 5 -->
                        <div class="col-lg-2 col-md-4 col-sm-6 text-center product-item">
                            <a href="products.html"><img src="/images/public/homelift.png" alt="Image 5"
                                    class="img-fluid"></a>
                            <p>Thang Máy Vận Chuyển Hàng Hóa</p>
                        </div>
                        <!-- Cột 6 -->
                        <div class="col-lg-2 col-md-4 col-sm-6 text-center product-item">
                            <a href="products.html"><img src="/images/public/Ehospital.png" alt="Image 6"
                                    class="img-fluid"></a>
                            <p>Thang Máy Bệnh Viện</p>
                        </div>
                    </div>
                </div>

                <!-- Top 8 sản phẩm thang máy được yêu cầu tư vấn nhiều nhất -->
                <h2 class="text-center text-primary mb-4">Top 8 Sản Phẩm Được Yêu Cầu Tư Vấn Nhiều Nhất</h2>

                <div class="container">
                    <div id="top-products" class="my-5"></div>
                    <div class="row d-flex flex-wrap g-3 justify-content-center">
                        <c:forEach items="${products}" var="product" begin="0" end="7">
                            <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                                <div class="ecommerce-card h-100">
                                    <div class="ec-image">
                                        <img src="/images/product/${product.image1}" alt="${product.name}"
                                            class="img-fluid">
                                        <div class="hover-overlay">
                                            <button class="quick-view-btn" data-product-id="${product.id}"><i
                                                    class="fas fa-eye"></i> Xem chi tiết</button>
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
                                            <!-- <span>(${product.reviews.size()})</span> -->
                                        </div>
                                        <h5 class="ec-title">${product.name}</h5>
                                        <div class="ec-category">${product.elevatorType.name}</div>
                                        <div class="ec-price">
                                            <span class="current-price">${product.price}₫</span>
                                        </div>
                                        <div class="spec-label me-1">
                                            <i class="fas fa-tachometer-alt me-1"></i>${product.shortDescription}
                                        </div>
                                        <div class="spec-label me-1">
                                            <i class="fas fa-tachometer-alt me-1"></i>Tốc độ: ${product.speed} m/s
                                        </div>
                                        <div class="spec-label me-1">
                                            <i class="fas fa-weight me-1"></i>Tải trọng: ${product.loadCapacity}
                                            kg
                                        </div>
                                        <div class="spec-label me-1">
                                            <i class="fas fa-door-open me-1"></i>Loại cửa: ${product.doorType}
                                        </div>
                                    </div>
                                    <div class="ec-footer">
                                        <div class="ec-footer-row">
                                            <button class="request-list-btn" data-product-id="${product.id}"><i
                                                    class="fas fa-clipboard-list"></i>Thêm vào danh sách yêu
                                                cầu</button>
                                            <button class="request-list-btn" data-product-id="${product.id}"><i
                                                    class="fas fa-clipboard-list"></i>Tư vấn ngay</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                </div>
                <!-- 8 dự án đã làm -->
                <h2 class="text-center text-primary mb-4">Dự Án Tiêu Biểu Đã Thực Hiện</h2>
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
                                        <a href="/projects/${project.id}" class="pcv-btn">Xem chi tiết <i
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
                        <!-- Cột 1 -->
                        <div class="col-lg-2 col-md-4 col-sm-6 text-center service-item">
                            <div class="service-card">
                                <div class="service-img-wrapper">
                                    <img src="/images/public/installation.png" alt="Lắp đặt" class="img-fluid">
                                </div>
                                <button class="btn service-btn"><a class="dropdown-item" href="installation.html">Lắp
                                        đặt</a></button>
                            </div>
                        </div>
                        <!-- Cột 2 -->
                        <div class="col-lg-2 col-md-4 col-sm-6 text-center service-item">
                            <div class="service-card">
                                <div class="service-img-wrapper">
                                    <img src="/images/public/maintenance.png" alt="Bảo trì" class="img-fluid">
                                </div>
                                <button class="btn service-btn"><a class="dropdown-item" href="maintenance.html">Bảo
                                        trì</a></button>
                            </div>
                        </div>
                        <!-- Cột 3 -->
                        <div class="col-lg-2 col-md-4 col-sm-6 text-center service-item">
                            <div class="service-card">
                                <div class="service-img-wrapper">
                                    <img src="/images/public/upgrade.png" alt="Nâng cấp" class="img-fluid">
                                </div>
                                <button class="btn service-btn"><a class="dropdown-item" href="upgrade.html">Nâng
                                        cấp</a></button>
                            </div>
                        </div>
                        <!-- Cột 4 -->
                        <div class="col-lg-2 col-md-4 col-sm-6 text-center service-item">
                            <div class="service-card">
                                <div class="service-img-wrapper">
                                    <img src="/images/public/repair.png" alt="Sửa chữa" class="img-fluid">
                                </div>
                                <button class="btn service-btn"><a class="dropdown-item" href="repair.html">Sửa
                                        chữa</a></button>
                            </div>
                        </div>
                        <!-- Cột 5 -->
                        <div class="col-lg-2 col-md-4 col-sm-6 text-center service-item">
                            <div class="service-card">
                                <div class="service-img-wrapper">
                                    <img src="/images/public/consulting.png" alt="Tư vấn kỹ thuật" class="img-fluid">
                                </div>
                                <button class="btn service-btn"><a class="dropdown-item" href="advisory.html">Tư vấn
                                        kỹ
                                        thuật</a></button>
                            </div>
                        </div>
                        <!-- Cột 6 -->
                        <div class="col-lg-2 col-md-4 col-sm-6 text-center service-item">
                            <div class="service-card">
                                <div class="service-img-wrapper">
                                    <img src="/images/public/maintenance.png" alt="Dịch vụ khác" class="img-fluid">
                                </div>
                                <button class="btn service-btn">Dịch Vụ Khác</button>
                            </div>
                        </div>
                    </div>
                </div>
                <jsp:include page="../layout/footer.jsp" />
            </body>

            </html>