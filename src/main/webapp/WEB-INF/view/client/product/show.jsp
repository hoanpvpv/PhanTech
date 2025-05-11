<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>PhanTech - Sản phẩm thang máy chất lượng cao</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                    <link rel="stylesheet" href="/css/demo.css">
                    <link rel="stylesheet" href="/css/style.css">
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                    <style>

                    </style>

                </head>

                <body>
                    <jsp:include page="../layout/header.jsp" />

                    <div class="banner">
                        <h1>Sản phẩm thang máy PhanTech</h1>
                    </div>

                    <div class="container my-4">
                        <div class="row">
                            <!-- Filter Sidebar (Left) -->
                            <div class="col-md-3">
                                <div class="filter-sidebar">
                                    <h4 class="mb-3">Tìm kiếm sản phẩm</h4>
                                    <form method="get" action="/product" id="filterForm">
                                        <!-- Tên sản phẩm -->
                                        <div class="mb-3">
                                            <label for="name" class="filter-label">Tên sản phẩm</label>
                                            <input type="text" class="form-control" id="name" name="name"
                                                value="${name}" placeholder="Nhập tên sản phẩm...">
                                        </div>

                                        <!-- Loại thang máy -->
                                        <div class="mb-3">
                                            <label class="filter-label">Loại thang máy</label>
                                            <div class="checkbox-container">
                                                <c:forEach items="${allElevatorTypes}" var="type">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox"
                                                            name="elevatorTypes" value="${type.id}"
                                                            id="elevatorType${type.id}" ${elevatorTypes !=null &&
                                                            elevatorTypes.contains(type.id) ? 'checked' : '' }>
                                                        <label class="form-check-label" for="elevatorType${type.id}">
                                                            ${type.name}
                                                        </label>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>

                                        <!-- Nhà sản xuất -->
                                        <div class="mb-3">
                                            <label class="filter-label">Nhà sản xuất</label>
                                            <div class="checkbox-container">
                                                <c:forEach items="${allManufacturers}" var="manufacturer">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox"
                                                            name="manufacturers" value="${manufacturer.id}"
                                                            id="manufacturer${manufacturer.id}" ${manufacturers !=null
                                                            && manufacturers.contains(manufacturer.id) ? 'checked' : ''
                                                            }>
                                                        <label class="form-check-label"
                                                            for="manufacturer${manufacturer.id}">
                                                            ${manufacturer.name}
                                                        </label>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>

                                        <!-- Khoảng giá -->
                                        <div class="mb-3">
                                            <label class="filter-label">Khoảng giá (triệu VNĐ)</label>
                                            <div class="row">
                                                <div class="col-5">
                                                    <input type="number" class="form-control" id="minPrice"
                                                        name="minPrice" value="${minPrice}" placeholder="Từ" min="0">
                                                </div>
                                                <div class="col-2 text-center">
                                                    <span>-</span>
                                                </div>
                                                <div class="col-5">
                                                    <input type="number" class="form-control" id="maxPrice"
                                                        name="maxPrice" value="${maxPrice}" placeholder="Đến" min="0">
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Khoảng tốc độ -->
                                        <div class="mb-3">
                                            <label class="filter-label">Tốc độ (m/s)</label>
                                            <div class="row">
                                                <div class="col-5">
                                                    <input type="number" class="form-control" id="minSpeed"
                                                        name="minSpeed" value="${minSpeed}" placeholder="Từ" min="0"
                                                        step="0.1">
                                                </div>
                                                <div class="col-2 text-center">
                                                    <span>-</span>
                                                </div>
                                                <div class="col-5">
                                                    <input type="number" class="form-control" id="maxSpeed"
                                                        name="maxSpeed" value="${maxSpeed}" placeholder="Đến" min="0"
                                                        step="0.1">
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Khoảng tải trọng -->
                                        <div class="mb-3">
                                            <label class="filter-label">Tải trọng (kg)</label>
                                            <div class="row">
                                                <div class="col-5">
                                                    <input type="number" class="form-control" id="minLoad"
                                                        name="minLoad" value="${minLoad}" placeholder="Từ" min="0">
                                                </div>
                                                <div class="col-2 text-center">
                                                    <span>-</span>
                                                </div>
                                                <div class="col-5">
                                                    <input type="number" class="form-control" id="maxLoad"
                                                        name="maxLoad" value="${maxLoad}" placeholder="Đến" min="0">
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Sắp xếp -->
                                        <div class="mb-3">
                                            <label for="sortBy" class="filter-label">Sắp xếp theo</label>
                                            <select class="form-select" id="sortBy" name="sortBy"
                                                onchange="updateSortDir()">
                                                <option value="id" ${sortBy=='id' ? 'selected' : '' }>Mới nhất</option>
                                                <option value="price" ${sortBy=='price' && sortDir=='asc' ? 'selected'
                                                    : '' } data-dir="asc">Giá tăng dần</option>
                                                <option value="price" ${sortBy=='price' && sortDir=='desc' ? 'selected'
                                                    : '' } data-dir="desc">Giá giảm dần</option>
                                                <option value="rating" ${sortBy=='rating' ? 'selected' : '' }>Đánh giá
                                                    cao nhất</option>
                                                <option value="reviewCount" ${sortBy=='reviewCount' ? 'selected' : '' }>
                                                    Nhiều đánh giá nhất</option>
                                                <option value="name" ${sortBy=='name' ? 'selected' : '' }>Tên A-Z
                                                </option>
                                            </select>
                                            <input type="hidden" id="sortDir" name="sortDir" value="${sortDir}">
                                        </div>

                                        <!-- Nút tìm kiếm và reset -->
                                        <div class="d-grid gap-2">
                                            <button type="submit" class="btn btn-primary filter-button">
                                                <i class="fas fa-search"></i> Tìm kiếm
                                            </button>
                                            <button type="button" class="btn btn-outline-secondary filter-button"
                                                onclick="resetForm()">
                                                <i class="fas fa-undo"></i> Đặt lại
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <!-- Product Content (Right) -->
                            <div class="col-md-9">
                                <div class="d-flex justify-content-between align-items-center mb-4">
                                    <h4>Danh sách sản phẩm</h4>
                                    <p class="mb-0">Tìm thấy ${totalItems} sản phẩm</p>
                                </div>

                                <div class="row g-4">
                                    <c:forEach items="${products}" var="product">
                                        <div class="col-lg-4 col-md-6 col-sm-12 mb-4">
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
                                                                    <fmt:formatNumber value="${product.price}"
                                                                        type="currency" currencySymbol="₫"
                                                                        maxFractionDigits="0" />
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
                                                        <form action="/add-product-to-request-list/${product.id}"
                                                            method="post" class="me-2">
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

                                    <!-- No results message -->
                                    <c:if test="${empty products}">
                                        <div class="col-12 text-center py-5">
                                            <i class="fas fa-search fa-3x mb-3 text-muted"></i>
                                            <h4>Không tìm thấy sản phẩm nào phù hợp</h4>
                                            <p class="text-muted">Vui lòng thử lại với các điều kiện tìm kiếm khác.</p>
                                        </div>
                                    </c:if>
                                </div>

                                <!-- Pagination -->
                                <c:if test="${totalPages > 1}">
                                    <nav aria-label="Page navigation" class="d-flex justify-content-center mt-4">
                                        <ul class="pagination">
                                            <!-- Previous button -->
                                            <li class="page-item ${currentPage <= 1 ? 'disabled' : ''}">
                                                <a class="page-link" href="#"
                                                    onclick="gotoPage(${currentPage - 1}); return false;">
                                                    <i class="fas fa-chevron-left"></i>
                                                </a>
                                            </li>

                                            <!-- Page numbers -->
                                            <c:forEach begin="1" end="${totalPages}" var="i">
                                                <c:if test="${i >= currentPage - 2 && i <= currentPage + 2}">
                                                    <li class="page-item ${currentPage == i ? 'active' : ''}">
                                                        <a class="page-link" href="#"
                                                            onclick="gotoPage(${i}); return false;">${i}</a>
                                                    </li>
                                                </c:if>
                                            </c:forEach>

                                            <!-- Next button -->
                                            <li class="page-item ${currentPage >= totalPages ? 'disabled' : ''}">
                                                <a class="page-link" href="#"
                                                    onclick="gotoPage(${currentPage + 1}); return false;">
                                                    <i class="fas fa-chevron-right"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>

                                    <!-- Page info -->
                                    <p class="text-center text-muted mt-2">
                                        Hiển thị ${(currentPage-1)*9 + 1} đến ${Math.min(currentPage*9, totalItems)}
                                        trong tổng số ${totalItems} sản phẩm
                                    </p>
                                </c:if>
                            </div>
                        </div>
                    </div>

                    <jsp:include page="../layout/footer.jsp" />

                    <!-- JavaScript for filter form -->
                    <script>
                        function resetForm() {
                            document.getElementById('name').value = '';

                            // Reset checkboxes
                            const checkboxes = document.querySelectorAll('input[type="checkbox"]');
                            checkboxes.forEach(checkbox => checkbox.checked = false);

                            // Reset range inputs
                            document.getElementById('minPrice').value = '';
                            document.getElementById('maxPrice').value = '';
                            document.getElementById('minSpeed').value = '';
                            document.getElementById('maxSpeed').value = '';
                            document.getElementById('minLoad').value = '';
                            document.getElementById('maxLoad').value = '';

                            // Reset sort
                            document.getElementById('sortBy').value = 'id';
                            document.getElementById('sortDir').value = 'desc';

                            window.location.href = '/product';
                        }

                        function updateSortDir() {
                            const sortBySelect = document.getElementById('sortBy');
                            const sortDirInput = document.getElementById('sortDir');
                            const selectedOption = sortBySelect.options[sortBySelect.selectedIndex];

                            if (sortBySelect.value === 'price') {
                                const dataDir = selectedOption.getAttribute('data-dir');
                                sortDirInput.value = dataDir || 'asc';
                            } else if (sortBySelect.value === 'name') {
                                sortDirInput.value = 'asc';
                            } else {
                                sortDirInput.value = 'desc';
                            }
                        }

                        function gotoPage(page) {
                            if (page < 1 || page > ${ totalPages }) return false;

                            let url = '/product?page=' + page;

                            // Tên sản phẩm
                            const name = document.getElementById('name').value;
                            if (name) url += '&name=' + encodeURIComponent(name);

                            // Loại thang máy
                            const elevatorTypeCheckboxes = document.querySelectorAll('input[name="elevatorTypes"]:checked');
                            elevatorTypeCheckboxes.forEach(checkbox => {
                                url += '&elevatorTypes=' + checkbox.value;
                            });

                            // Nhà sản xuất
                            const manufacturerCheckboxes = document.querySelectorAll('input[name="manufacturers"]:checked');
                            manufacturerCheckboxes.forEach(checkbox => {
                                url += '&manufacturers=' + checkbox.value;
                            });

                            // Khoảng giá
                            const minPrice = document.getElementById('minPrice').value;
                            const maxPrice = document.getElementById('maxPrice').value;
                            if (minPrice) url += '&minPrice=' + minPrice;
                            if (maxPrice) url += '&maxPrice=' + maxPrice;

                            // Khoảng tốc độ
                            const minSpeed = document.getElementById('minSpeed').value;
                            const maxSpeed = document.getElementById('maxSpeed').value;
                            if (minSpeed) url += '&minSpeed=' + minSpeed;
                            if (maxSpeed) url += '&maxSpeed=' + maxSpeed;

                            // Khoảng tải trọng
                            const minLoad = document.getElementById('minLoad').value;
                            const maxLoad = document.getElementById('maxLoad').value;
                            if (minLoad) url += '&minLoad=' + minLoad;
                            if (maxLoad) url += '&maxLoad=' + maxLoad;

                            // Sắp xếp
                            const sortBy = document.getElementById('sortBy').value;
                            const sortDir = document.getElementById('sortDir').value;
                            if (sortBy) url += '&sortBy=' + sortBy;
                            if (sortDir) url += '&sortDir=' + sortDir;

                            window.location.href = url;
                            return false;
                        }

                        // Khởi tạo sortDir dựa vào sortBy khi tải trang
                        document.addEventListener('DOMContentLoaded', function () {
                            updateSortDir();
                        });
                    </script>
                </body>

                </html>