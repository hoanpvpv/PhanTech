<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charsset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Chi tiết yêu cầu - PhanTech</title>
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
                    <!-- Star Rating CSS -->
                    <style>
                        .star-rating {
                            color: #ffc107;
                            font-size: 24px;
                        }

                        .review-form label.star {
                            cursor: pointer;
                            font-size: 24px;
                        }

                        .review-form input[type="radio"] {
                            display: none;
                        }

                        .preview-image {
                            width: 100px;
                            height: 80px;
                            object-fit: cover;
                            border-radius: 4px;
                            margin-right: 10px;
                            margin-bottom: 10px;
                            border: 1px solid #dee2e6;
                        }
                    </style>
                </head>

                <body>
                    <jsp:include page="../layout/header.jsp" />

                    <!-- Page Header -->


                    <div class="banner">
                        <h1 class="text-center">Chi tiết yêu cầu</h1>
                        <p class="text-center text-muted">
                            <a href="/history" class="text-decoration-none">
                                <i class="fas fa-arrow-left me-1"></i>Trở lại lịch sử yêu cầu
                            </a>
                        </p>
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

                        <!-- Chi tiết yêu cầu -->
                        <c:if test="${not empty Items}">
                            <div class="row">
                                <!-- Thông tin yêu cầu -->
                                <div class="col-lg-4 mb-4">
                                    <div class="card shadow-sm h-100">
                                        <div class="card-header bg-primary text-white">
                                            <h5 class="mb-0">
                                                <i class="fas fa-info-circle me-2"></i>Thông tin yêu cầu
                                                #${Items[0].requestList.id}
                                            </h5>
                                        </div>
                                        <div class="card-body">
                                            <p><strong>Trạng thái:</strong>
                                                <c:choose>
                                                    <c:when test="${Items[0].requestList.status == 'PENDING'}">
                                                        <span class="badge bg-warning text-dark">Chờ xử lý</span>
                                                    </c:when>
                                                    <c:when test="${Items[0].requestList.status == 'PROCESSING'}">
                                                        <span class="badge bg-primary">Đang xử lý</span>
                                                    </c:when>
                                                    <c:when test="${Items[0].requestList.status == 'COMPLETED'}">
                                                        <span class="badge bg-success">Hoàn thành</span>
                                                    </c:when>
                                                    <c:when test="${Items[0].requestList.status == 'CANCELED'}">
                                                        <span class="badge bg-danger">Đã hủy</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span
                                                            class="badge bg-secondary">${Items[0].requestList.status}</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </p>
                                            <p><strong>Ngày tạo:</strong> ${Items[0].requestList.createdAt}</p>
                                            <c:if test="${not empty Items[0].requestList.updateStatusdAt}">
                                                <p><strong>Cập nhật lần cuối:</strong>
                                                    ${Items[0].requestList.updateStatusdAt}</p>
                                            </c:if>
                                            <hr>
                                            <p><strong>Họ và tên:</strong> ${Items[0].requestList.fullNameInfo}</p>
                                            <p><strong>Email:</strong> ${Items[0].requestList.emailInfo}</p>
                                            <p><strong>Số điện thoại:</strong> ${Items[0].requestList.phoneInfo}</p>
                                            <p><strong>Địa chỉ:</strong> ${Items[0].requestList.addressInfo}</p>
                                            <c:if test="${not empty Items[0].requestList.noteInfo}">
                                                <p><strong>Ghi chú:</strong> ${Items[0].requestList.noteInfo}</p>
                                            </c:if>
                                            <hr>
                                            <p><strong>Lời nhắn từ PhanTech:</strong> ${Items[0].requestList.message}
                                            </p>

                                        </div>
                                    </div>
                                </div>

                                <!-- Danh sách sản phẩm/dịch vụ -->
                                <div class="col-lg-8">
                                    <div class="card shadow-sm mb-4">
                                        <div class="card-header bg-primary text-white">
                                            <h5 class="mb-0">
                                                <i class="fas fa-list me-2"></i>Sản phẩm & Dịch vụ đã yêu cầu
                                            </h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table class="table table-hover align-middle">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col" width="60">STT</th>
                                                            <th scope="col">Sản phẩm/Dịch vụ</th>
                                                            <th scope="col" width="200">Trạng thái đánh giá</th>
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
                                                                <td>
                                                                    <c:choose>
                                                                        <c:when
                                                                            test="${item.canReview=='YES' && item.requestList.status == 'COMPLETED'}">
                                                                            <button class="btn btn-sm btn-success"
                                                                                data-bs-toggle="modal"
                                                                                data-bs-target="#reviewModal${item.id}">
                                                                                <i class="fas fa-star me-1"></i>Đánh giá
                                                                            </button>
                                                                        </c:when>
                                                                        <c:when test="${item.canReview=='DONE'}">
                                                                            <span class="badge bg-secondary">Đã đánh
                                                                                giá</span>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <span
                                                                                class="badge bg-warning text-dark">Chưa
                                                                                được cấp quyền</span>
                                                                        </c:otherwise>
                                                                    </c:choose>

                                                                    <!-- Review Modal -->
                                                                    <c:if
                                                                        test="${item.canReview=='YES' && item.requestList.status == 'COMPLETED'}">
                                                                        <div class="modal fade"
                                                                            id="reviewModal${item.id}" tabindex="-1"
                                                                            aria-labelledby="reviewModalLabel${item.id}"
                                                                            aria-hidden="true">
                                                                            <div class="modal-dialog modal-lg">
                                                                                <div class="modal-content">
                                                                                    <div
                                                                                        class="modal-header bg-primary text-white">
                                                                                        <h5 class="modal-title"
                                                                                            id="reviewModalLabel${item.id}">
                                                                                            Đánh giá
                                                                                            <c:if
                                                                                                test="${not empty item.product}">
                                                                                                ${item.product.name}
                                                                                            </c:if>
                                                                                            <c:if
                                                                                                test="${not empty item.service}">
                                                                                                ${item.service.name}
                                                                                            </c:if>
                                                                                        </h5>
                                                                                        <button type="button"
                                                                                            class="btn-close btn-close-white"
                                                                                            data-bs-dismiss="modal"
                                                                                            aria-label="Close"></button>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        <form action="/review"
                                                                                            method="post"
                                                                                            class="review-form"
                                                                                            enctype="multipart/form-data">
                                                                                            <input type="hidden"
                                                                                                name="${_csrf.parameterName}"
                                                                                                value="${_csrf.token}">
                                                                                            <input type="hidden"
                                                                                                name="itemId"
                                                                                                value="${item.id}">
                                                                                            <input type="hidden"
                                                                                                name="productId"
                                                                                                value="${not empty item.product ? item.product.id : 0}">
                                                                                            <input type="hidden"
                                                                                                name="serviceId"
                                                                                                value="${not empty item.service ? item.service.id : 0}">

                                                                                            <!-- Rating -->
                                                                                            <div
                                                                                                class="mb-4 text-center">
                                                                                                <h5>Đánh giá của bạn
                                                                                                </h5>
                                                                                                <div
                                                                                                    class="star-rating">
                                                                                                    <label class="star"
                                                                                                        for="star1-${item.id}">★</label>
                                                                                                    <input type="radio"
                                                                                                        id="star1-${item.id}"
                                                                                                        name="rating"
                                                                                                        value="1"
                                                                                                        required>

                                                                                                    <label class="star"
                                                                                                        for="star2-${item.id}">★</label>
                                                                                                    <input type="radio"
                                                                                                        id="star2-${item.id}"
                                                                                                        name="rating"
                                                                                                        value="2">

                                                                                                    <label class="star"
                                                                                                        for="star3-${item.id}">★</label>
                                                                                                    <input type="radio"
                                                                                                        id="star3-${item.id}"
                                                                                                        name="rating"
                                                                                                        value="3">

                                                                                                    <label class="star"
                                                                                                        for="star4-${item.id}">★</label>
                                                                                                    <input type="radio"
                                                                                                        id="star4-${item.id}"
                                                                                                        name="rating"
                                                                                                        value="4">

                                                                                                    <label class="star"
                                                                                                        for="star5-${item.id}">★</label>
                                                                                                    <input type="radio"
                                                                                                        id="star5-${item.id}"
                                                                                                        name="rating"
                                                                                                        value="5">
                                                                                                </div>
                                                                                                <div
                                                                                                    class="text-muted mt-2">
                                                                                                    Chọn số sao để đánh
                                                                                                    giá
                                                                                                </div>
                                                                                            </div>

                                                                                            <!-- Content -->
                                                                                            <div class="mb-3">
                                                                                                <label
                                                                                                    for="content${item.id}"
                                                                                                    class="form-label">Nhận
                                                                                                    xét của bạn:</label>
                                                                                                <textarea
                                                                                                    class="form-control"
                                                                                                    id="content${item.id}"
                                                                                                    name="content"
                                                                                                    rows="4"
                                                                                                    placeholder="Chia sẻ trải nghiệm của bạn với sản phẩm/dịch vụ này..."
                                                                                                    required></textarea>
                                                                                            </div>

                                                                                            <!-- Images -->
                                                                                            <div class="mb-3">
                                                                                                <label
                                                                                                    class="form-label">Hình
                                                                                                    ảnh (tùy
                                                                                                    chọn):</label>
                                                                                                <div class="row">
                                                                                                    <div
                                                                                                        class="col-md-4 mb-2">
                                                                                                        <input
                                                                                                            type="file"
                                                                                                            class="form-control"
                                                                                                            name="imageFile1"
                                                                                                            id="imageFile1-${item.id}"
                                                                                                            accept="image/*"
                                                                                                            onchange="previewImage(this, 'preview1-${item.id}')">
                                                                                                        <div
                                                                                                            class="mt-2">
                                                                                                            <img id="preview1-${item.id}"
                                                                                                                class="preview-image d-none">
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div
                                                                                                        class="col-md-4 mb-2">
                                                                                                        <input
                                                                                                            type="file"
                                                                                                            class="form-control"
                                                                                                            name="imageFile2"
                                                                                                            id="imageFile2-${item.id}"
                                                                                                            accept="image/*"
                                                                                                            onchange="previewImage(this, 'preview2-${item.id}')">
                                                                                                        <div
                                                                                                            class="mt-2">
                                                                                                            <img id="preview2-${item.id}"
                                                                                                                class="preview-image d-none">
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div
                                                                                                        class="col-md-4 mb-2">
                                                                                                        <input
                                                                                                            type="file"
                                                                                                            class="form-control"
                                                                                                            name="imageFile3"
                                                                                                            id="imageFile3-${item.id}"
                                                                                                            accept="image/*"
                                                                                                            onchange="previewImage(this, 'preview3-${item.id}')">
                                                                                                        <div
                                                                                                            class="mt-2">
                                                                                                            <img id="preview3-${item.id}"
                                                                                                                class="preview-image d-none">
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>

                                                                                            <div
                                                                                                class="d-flex justify-content-end">
                                                                                                <button type="button"
                                                                                                    class="btn btn-secondary me-2"
                                                                                                    data-bs-dismiss="modal">Hủy</button>
                                                                                                <button type="submit"
                                                                                                    class="btn btn-primary">
                                                                                                    <i
                                                                                                        class="fas fa-paper-plane me-1"></i>Gửi
                                                                                                    đánh giá
                                                                                                </button>
                                                                                            </div>
                                                                                        </form>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </c:if>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="text-end mt-3">
                                        <a href="/history" class="btn btn-outline-secondary">
                                            <i class="fas fa-arrow-left me-1"></i>Quay lại danh sách
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </div>

                    <jsp:include page="../layout/footer.jsp" />

                    <script>
                        // Sửa lại đoạn code JavaScript trong file detail.jsp
                        document.querySelectorAll('.review-form').forEach(form => {
                            const stars = form.querySelectorAll('.star');
                            const ratingInputs = form.querySelectorAll('input[name="rating"]');

                            // Set initial stars to gray
                            stars.forEach(star => {
                                star.style.color = '#ccc';
                            });

                            // Highlight stars on hover and click
                            stars.forEach((star, index) => {
                                star.addEventListener('mouseenter', () => {
                                    // Highlight stars from 5 down to current
                                    for (let i = 0; i <= index; i++) {
                                        stars[i].style.color = '#ffc107';
                                    }
                                    // Gray out lower stars
                                    for (let i = index + 1; i < 5; i++) {
                                        stars[i].style.color = '#ccc';
                                    }
                                });

                                star.addEventListener('click', () => {
                                    // Select the corresponding radio input - FIX HERE
                                    ratingInputs[4 - index].checked = true;  // Sử dụng index trực tiếp, không đảo ngược
                                });
                            });

                            form.addEventListener('mouseleave', () => {
                                // Find checked input
                                const checkedIndex = Array.from(ratingInputs).findIndex(input => input.checked);

                                if (checkedIndex >= 0) {
                                    // Highlight stars based on selection
                                    stars.forEach((star, index) => {
                                        star.style.color = (index <= checkedIndex) ? '#ffc107' : '#ccc';
                                    });
                                } else {
                                    // Reset all stars to gray
                                    stars.forEach(star => {
                                        star.style.color = '#ccc';
                                    });
                                }
                            });
                        });

                        // Image preview function
                        function previewImage(input, previewId) {
                            const preview = document.getElementById(previewId);
                            if (input.files && input.files[0]) {
                                const reader = new FileReader();
                                reader.onload = function (e) {
                                    preview.src = e.target.result;
                                    preview.classList.remove('d-none');
                                }
                                reader.readAsDataURL(input.files[0]);
                            } else {
                                preview.src = '';
                                preview.classList.add('d-none');
                            }
                        }
                    </script>
                </body>

                </html>