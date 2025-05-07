<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>${product.name} - PhanTech</title>
                    <!-- Latest compiled and minified CSS -->

                    <!-- Latest compiled JavaScript -->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <!-- Latest compiled JavaScript -->

                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                    <link rel="stylesheet" href="/css/demo.css">
                    <link rel="stylesheet" href="/css/style.css">
                    <!-- Font Awesome for icons -->
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                </head>

                <body>
                    <jsp:include page="../layout/header.jsp" />
                    <div style="margin-top: 76px;">

                        <div class="container mt-5 mb-5">
                            <!-- Breadcrumb -->
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/">Trang chủ</a></li>
                                    <li class="breadcrumb-item"><a href="/products">Sản phẩm</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">${product.name}</li>
                                </ol>
                            </nav>

                            <div class="row">
                                <!-- Phần Gallery -->
                                <!-- Phần Gallery -->
                                <div class="col-lg-6 mb-4">
                                    <div class="product-gallery">
                                        <!-- Ảnh chính dạng vuông -->
                                        <div class="main-image-square position-relative">
                                            <img src="/images/product/${product.image1}" alt="${product.name}"
                                                class="img-fluid w-100 h-100 object-fit-contain" id="mainImage"
                                                data-bs-toggle="modal" data-bs-target="#imageModal">
                                        </div>

                                        <!-- Thumbnails xếp hàng ngang -->
                                        <div class="thumbnail-container mt-3 position-relative">
                                            <div class="thumbnail-slider d-flex">
                                                <div class="thumbnail-item active"
                                                    onclick="changeImage('/images/product/${product.image1}', this)">
                                                    <img src="/images/product/${product.image1}" alt="${product.name}"
                                                        class="img-thumbnail">
                                                    <div class="thumbnail-selected-mask"></div>
                                                </div>
                                                <c:if test="${not empty product.image2}">
                                                    <div class="thumbnail-item"
                                                        onclick="changeImage('/images/product/${product.image2}', this)">
                                                        <img src="/images/product/${product.image2}"
                                                            alt="${product.name}" class="img-thumbnail">
                                                        <div class="thumbnail-selected-mask"></div>
                                                    </div>
                                                </c:if>
                                                <c:if test="${not empty product.image3}">
                                                    <div class="thumbnail-item"
                                                        onclick="changeImage('/images/product/${product.image3}', this)">
                                                        <img src="/images/product/${product.image3}"
                                                            alt="${product.name}" class="img-thumbnail">
                                                        <div class="thumbnail-selected-mask"></div>
                                                    </div>
                                                </c:if>
                                                <c:if test="${not empty product.image4}">
                                                    <div class="thumbnail-item"
                                                        onclick="changeImage('/images/product/${product.image4}', this)">
                                                        <img src="/images/product/${product.image4}"
                                                            alt="${product.name}" class="img-thumbnail">
                                                        <div class="thumbnail-selected-mask"></div>
                                                    </div>
                                                </c:if>
                                                <c:if test="${not empty product.image5}">
                                                    <div class="thumbnail-item"
                                                        onclick="changeImage('/images/product/${product.image5}', this)">
                                                        <img src="/images/product/${product.image5}"
                                                            alt="${product.name}" class="img-thumbnail">
                                                        <div class="thumbnail-selected-mask"></div>
                                                    </div>
                                                </c:if>
                                            </div>

                                            <!-- Nút điều hướng -->
                                            <button class="thumbnail-nav thumbnail-prev" onclick="scrollThumbnails(-1)">
                                                <i class="fas fa-chevron-left"></i>
                                            </button>
                                            <button class="thumbnail-nav thumbnail-next" onclick="scrollThumbnails(1)">
                                                <i class="fas fa-chevron-right"></i>
                                            </button>
                                        </div>

                                    </div>
                                </div>
                                <!-- Phần thông tin chính -->
                                <div class="col-lg-6">
                                    <h1 class="product-title">${product.name}</h1>

                                    <!-- Đánh giá -->
                                    <div class="product-rating mb-3">
                                        <c:forEach begin="1" end="${product.rating}">
                                            <i class="fas fa-star text-warning"></i>
                                        </c:forEach>
                                        <c:if test="${product.rating % 1 != 0}">
                                            <i class="fas fa-star-half-alt text-warning"></i>
                                        </c:if>
                                        <span class="text-muted ms-2">(${product.reviews.size()} đánh giá)</span>

                                        <!-- Nhà sản xuất -->
                                        <span class="badge bg-primary ms-3">${product.manufacturer.name}</span>
                                        <span class="badge bg-secondary ms-2">${product.elevatorType.name}</span>
                                    </div>

                                    <!-- Mô tả ngắn -->
                                    <div class="product-short-description mb-4">
                                        <p>${product.shortDescription}</p>
                                    </div>

                                    <!-- Giá -->
                                    <div class="product-price mb-4">
                                        <h3 class="text-primary fw-bold">${product.price} VNĐ</h3>
                                        <small class="text-muted">Đã bao gồm thuế & phí vận chuyển</small>
                                    </div>

                                    <!-- Thông số kỹ thuật chính -->
                                    <div class="product-specs mb-4">
                                        <h5>Thông số kỹ thuật chính</h5>
                                        <div class="row g-3">
                                            <div class="col-6">
                                                <div class="spec-item">
                                                    <i class="fas fa-tachometer-alt text-primary me-2"></i>
                                                    <span class="spec-label">Tốc độ:</span>
                                                    <span class="spec-value">${product.speed} m/s</span>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="spec-item">
                                                    <i class="fas fa-weight text-primary me-2"></i>
                                                    <span class="spec-label">Tải trọng:</span>
                                                    <span class="spec-value">${product.loadCapacity} kg</span>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="spec-item">
                                                    <i class="fas fa-door-open text-primary me-2"></i>
                                                    <span class="spec-label">Loại cửa:</span>
                                                    <span class="spec-value">${product.doorType}</span>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="spec-item">
                                                    <i class="fas fa-ruler-combined text-primary me-2"></i>
                                                    <span class="spec-label">Kích thước cabin:</span>
                                                    <span class="spec-value">${product.cabinSize} m²</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- CTA Buttons -->
                                    <div class="product-actions d-flex gap-2 flex-wrap mb-4">
                                        <button class="btn btn-primary btn-lg flex-fill">
                                            <i class="fas fa-phone-alt me-2"></i>Liên hệ tư vấn
                                        </button>
                                        <button class="btn btn-outline-primary btn-lg flex-fill">
                                            <i class="fas fa-clipboard-list me-2"></i>Thêm vào yêu cầu báo giá
                                        </button>
                                        <button class="btn btn-outline-secondary btn-lg flex-fill">
                                            <i class="fas fa-file-download me-2"></i>Tải catalog
                                        </button>
                                    </div>

                                    <!-- Bảo hành -->
                                    <div class="product-warranty p-3 bg-light rounded mb-4">
                                        <div class="d-flex align-items-center">
                                            <i class="fas fa-shield-alt fs-1 text-success me-3"></i>
                                            <div>
                                                <h5 class="mb-1">Bảo hành chính hãng</h5>
                                                <p class="mb-0">Thời gian bảo hành: ${product.warranty} tháng</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Tabs thông tin chi tiết -->
                            <div class="product-tabs mt-5">
                                <ul class="nav nav-tabs" id="productTabs" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link active" id="specs-tab" data-bs-toggle="tab"
                                            data-bs-target="#specs" type="button" role="tab">Thông số kỹ thuật</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="description-tab" data-bs-toggle="tab"
                                            data-bs-target="#description" type="button" role="tab">Mô tả chi
                                            tiết</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="video-tab" data-bs-toggle="tab"
                                            data-bs-target="#video" type="button" role="tab">Video</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="documents-tab" data-bs-toggle="tab"
                                            data-bs-target="#documents" type="button" role="tab">Tài liệu kỹ
                                            thuật</button>
                                    </li>
                                </ul>

                                <div class="tab-content p-4 border border-top-0 rounded-bottom" id="productTabContent">
                                    <!-- Tab Thông số kỹ thuật -->
                                    <div class="tab-pane fade show active" id="specs" role="tabpanel"
                                        aria-labelledby="specs-tab">
                                        <h4>Thông số kỹ thuật đầy đủ</h4>
                                        <div class="table-responsive">
                                            <table class="table table-striped">
                                                <tbody>
                                                    <tr>
                                                        <th scope="row" width="30%">Tên sản phẩm</th>
                                                        <td>${product.name}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Loại thang máy</th>
                                                        <td>${product.elevatorType.name}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Nhà sản xuất</th>
                                                        <td>${product.manufacturer.name}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Tốc độ</th>
                                                        <td>${product.speed} m/s</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Tải trọng</th>
                                                        <td>${product.loadCapacity} kg</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Loại cửa</th>
                                                        <td>${product.doorType}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Công nghệ điều khiển</th>
                                                        <td>${product.controlTechnology}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Hố pit/Phòng máy</th>
                                                        <td>${product.pitOrMachineRoom}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Nguồn điện</th>
                                                        <td>${product.powerSupply}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Kích thước cabin</th>
                                                        <td>${product.cabinSize} m²</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Thời gian bảo hành</th>
                                                        <td>${product.warranty} tháng</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <!-- Tab Mô tả chi tiết -->
                                    <div class="tab-pane fade" id="description" role="tabpanel"
                                        aria-labelledby="description-tab">
                                        <div class="product-description">
                                            ${product.description}
                                        </div>
                                    </div>

                                    <!-- Tab Video -->
                                    <div class="tab-pane fade" id="video" role="tabpanel" aria-labelledby="video-tab">
                                        <c:choose>
                                            <c:when test="${not empty product.video}">
                                                <div class="ratio ratio-16x9">
                                                    <iframe src="${product.video}" title="${product.name}"
                                                        allowfullscreen></iframe>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="alert alert-info">
                                                    <i class="fas fa-info-circle me-2"></i>Chưa có video cho sản phẩm
                                                    này
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>

                                    <!-- Tab Tài liệu kỹ thuật -->
                                    <div class="tab-pane fade" id="documents" role="tabpanel"
                                        aria-labelledby="documents-tab">
                                        <c:choose>
                                            <c:when test="${not empty product.documentation}">
                                                <div class="document-download p-3 border rounded mb-3">
                                                    <div class="d-flex align-items-center">
                                                        <i class="fas fa-file-pdf fs-1 text-danger me-3"></i>
                                                        <div class="flex-grow-1">
                                                            <h5 class="mb-1">Tài liệu kỹ thuật ${product.name}</h5>
                                                            <p class="mb-0 text-muted">PDF, 2.3MB</p>
                                                        </div>
                                                        <a href="${product.documentation}"
                                                            class="btn btn-outline-primary">
                                                            <i class="fas fa-download me-2"></i>Tải xuống
                                                        </a>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="alert alert-info">
                                                    <i class="fas fa-info-circle me-2"></i>Chưa có tài liệu kỹ thuật cho
                                                    sản
                                                    phẩm này
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="container my-5">
                            <h2 class="text-center text-primary mb-4">Các đánh giá mới nhất</h2>
                            <!-- Danh sách đánh giá -->
                            <div class="row justify-content-center">
                                <div class="col-lg-8 col-md-10 col-sm-12">
                                    <c:if test="${not empty reviews}">
                                        <div class="review-list">
                                            <c:forEach items="${reviews}" var="review">
                                                <div class="card mb-3 shadow-sm border-0">
                                                    <div class="card-body">
                                                        <div class="d-flex align-items-center mb-3">
                                                            <!-- Avatar người dùng (bên trái) -->
                                                            <div class="avatar bg-primary text-white rounded-circle d-flex align-items-center justify-content-center me-3"
                                                                style="width:45px; height:45px; font-size: 1.2rem;">
                                                                ${review.user.fullName.substring(0,1).toUpperCase()}
                                                            </div>

                                                            <!-- Tên người dùng -->
                                                            <div>
                                                                <h5 class="mb-0 fs-6">${review.user.fullName}</h5>
                                                            </div>

                                                            <!-- Ngày tháng (chuyển sang bên phải) -->
                                                            <div class="text-muted small ms-auto me-3">
                                                                <fmt:parseDate value="${review.createdAt}"
                                                                    pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" />
                                                                <fmt:formatDate value="${parsedDate}"
                                                                    pattern="dd/MM/yyyy HH:mm" />
                                                            </div>

                                                            <!-- Đánh giá sao (ngoài cùng bên phải) -->
                                                            <div>
                                                                <div class="rating-stars">
                                                                    <c:forEach begin="1" end="5" var="i">
                                                                        <i
                                                                            class="${i <= review.rating ? 'fas' : 'far'} fa-star ${i <= review.rating ? 'text-warning' : 'text-muted'} fa-sm"></i>
                                                                    </c:forEach>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <p class="review-content mb-3 small">${review.content}</p>

                                                        <!-- Hình ảnh đính kèm -->
                                                        <c:if
                                                            test="${not empty review.image1 || not empty review.image2 || not empty review.image3}">
                                                            <div class="review-images d-flex flex-wrap gap-2 mt-2">
                                                                <c:if test="${not empty review.image1}">
                                                                    <a href="/images/public/${review.image1}"
                                                                        data-bs-toggle="lightbox"
                                                                        class="review-image-thumb">
                                                                        <img src="/images/public/${review.image1}"
                                                                            alt="Hình ảnh đánh giá"
                                                                            class="img-thumbnail"
                                                                            style="width: 60px; height: 60px; object-fit: cover;">
                                                                    </a>
                                                                </c:if>
                                                                <c:if test="${not empty review.image2}">
                                                                    <a href="/images/public/${review.image2}"
                                                                        data-bs-toggle="lightbox"
                                                                        class="review-image-thumb">
                                                                        <img src="/images/public/${review.image2}"
                                                                            alt="Hình ảnh đánh giá"
                                                                            class="img-thumbnail"
                                                                            style="width: 60px; height: 60px; object-fit: cover;">
                                                                    </a>
                                                                </c:if>
                                                                <c:if test="${not empty review.image3}">
                                                                    <a href="/images/public/${review.image3}"
                                                                        data-bs-toggle="lightbox"
                                                                        class="review-image-thumb">
                                                                        <img src="/images/public/${review.image3}"
                                                                            alt="Hình ảnh đánh giá"
                                                                            class="img-thumbnail"
                                                                            style="width: 60px; height: 60px; object-fit: cover;">
                                                                    </a>
                                                                </c:if>
                                                            </div>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </c:if>
                                    <c:if test="${empty reviews}">
                                        <div class="alert alert-info text-center">
                                            <i class="fas fa-info-circle me-2"></i>Chưa có đánh giá nào cho sản phẩm này
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <h2 class="text-center text-primary mb-4">Các dự án sử dụng sản phẩm này:</h2>
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
                        <script>
                            function changeImage(src) {
                                document.getElementById('mainImage').src = src;
                            }
                        </script>
                    </div>
                    <jsp:include page="../layout/footer.jsp" />

                </body>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script>
                    // Thêm vào trong đoạn script hiện tại
                    function changeImage(src, thumbElement) {
                        // Cập nhật ảnh chính
                        document.getElementById('mainImage').src = src;

                        // Cập nhật trạng thái active cho thumbnails
                        document.querySelectorAll('.thumbnail-item').forEach(thumb => {
                            thumb.classList.remove('active');
                        });

                        if (thumbElement) {
                            thumbElement.classList.add('active');
                        }
                    }

                    function scrollThumbnails(direction) {
                        const slider = document.querySelector('.thumbnail-slider');
                        const scrollAmount = direction * 100; // 100px mỗi lần
                        slider.scrollLeft += scrollAmount;
                    }

                    // Toggle trạng thái yêu thích
                    document.addEventListener('DOMContentLoaded', function () {
                        const likeBtn = document.querySelector('.like-btn');
                        if (likeBtn) {
                            likeBtn.addEventListener('click', function () {
                                const heartIcon = this.querySelector('i');
                                if (heartIcon.classList.contains('far')) {
                                    heartIcon.classList.replace('far', 'fas');
                                    heartIcon.classList.add('text-danger');
                                } else {
                                    heartIcon.classList.replace('fas', 'far');
                                    heartIcon.classList.remove('text-danger');
                                }
                            });
                        }
                    });
                </script>

                </html>