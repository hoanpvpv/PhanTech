<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>PhanTech - Dự án thang máy chất lượng cao</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                    <link rel="stylesheet" href="/css/demo.css">
                    <link rel="stylesheet" href="/css/style.css">
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

                </head>

                <body>
                    <jsp:include page="../layout/header.jsp" />
                    <div class="banner">
                        <h1>Những dự án PhanTech đã thực hiện</h1>
                    </div>
                    <div class="container my-4">
                        <div class="row">
                            <!-- Filter Sidebar (Left) -->
                            <div class="col-md-3">
                                <div class="filter-sidebar">
                                    <h4>Tìm kiếm dự án</h4>
                                    <form method="get" action="/project" id="filterForm">
                                        <div class="mb-3">
                                            <label for="name" class="filter-label">Tên dự án</label>
                                            <input type="text" class="form-control" id="name" name="name"
                                                value="${name}" placeholder="Nhập tên dự án...">
                                        </div>
                                        <div class="mb-3">
                                            <label for="address" class="filter-label">Địa chỉ</label>
                                            <input type="text" class="form-control" id="address" name="address"
                                                value="${address}" placeholder="Nhập địa chỉ...">
                                        </div>
                                        <div class="mb-3">
                                            <label for="productName" class="filter-label">Sản phẩm</label>
                                            <input type="text" class="form-control" id="productName" name="productName"
                                                value="${productName}" placeholder="Nhập tên sản phẩm...">
                                        </div>
                                        <div class="mb-3">
                                            <label for="serviceId" class="filter-label">Dịch vụ</label>
                                            <select class="form-select" id="serviceId" name="serviceId">
                                                <option value="">Tất cả dịch vụ</option>
                                                <c:forEach items="${services}" var="service">
                                                    <option value="${service.id}" ${serviceId==service.id ? 'selected'
                                                        : '' }>${service.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <button type="submit" class="btn btn-primary filter-button">
                                            <i class="fas fa-search"></i> Tìm kiếm
                                        </button>
                                        <button type="button" class="btn btn-outline-secondary" onclick="resetForm()">
                                            <i class="fas fa-undo"></i> Đặt lại
                                        </button>
                                    </form>
                                </div>
                            </div>
                            <!-- Project Content (Right) -->
                            <div class="col-md-9 project-content">
                                <div id="completed-projects" class="my-5 py-4">
                                    <div class="row d-flex flex-wrap g-4 justify-content-center">
                                        <c:forEach items="${projectPage}" var="project">
                                            <div class="col-lg-4 col-md-6 col-sm-12 mb-4">
                                                <div class="project-card-vertical h-100">
                                                    <div class="pcv-image">
                                                        <img src="/images/project/${project.image}"
                                                            alt="${project.name}" class="img-fluid">
                                                    </div>
                                                    <div class="pcv-content">
                                                        <h5 class="pcv-title">${project.name}</h5>
                                                        <div class="pcv-info">
                                                            <div class="pcv-location"><i
                                                                    class="fas fa-map-marker-alt"></i>
                                                                ${project.address}</div>
                                                            <div class="pcv-date">
                                                                <i class="far fa-calendar-alt"></i>
                                                                <c:choose>
                                                                    <c:when test="${project.date != null}">
                                                                        <fmt:parseDate value="${project.date}"
                                                                            pattern="yyyy-MM-dd" var="parsedDate"
                                                                            type="date" />
                                                                        <fmt:formatDate value="${parsedDate}"
                                                                            pattern="dd/MM/yyyy" />
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <span class="text-muted">Chưa cập nhật</span>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                        </div>
                                                        <div class="pcv-stats">
                                                            <c:if test="${project.service != null}">
                                                                <div class="pcv-stat">
                                                                    <div class="pcv-stat-value">${project.service.name}
                                                                    </div>
                                                                    <div class="pcv-stat-label">Dịch vụ</div>
                                                                </div>
                                                            </c:if>
                                                            <div class="pcv-stat">
                                                                <div class="pcv-stat-value">${project.floor}</div>
                                                                <div class="pcv-stat-label">Tầng</div>
                                                            </div>
                                                            <c:if test="${project.product != null}">
                                                                <div class="pcv-stat">
                                                                    <div class="pcv-stat-value">${project.product.speed}
                                                                    </div>
                                                                    <div class="pcv-stat-label">Tốc độ</div>
                                                                </div>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                    <div class="pcv-footer">
                                                        <a href="/project/${project.id}" class="pcv-btn">Xem chi tiết <i
                                                                class="fas fa-arrow-right"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <!-- No results message -->
                                        <c:if test="${empty projectPage}">
                                            <div class="col-12 text-center py-5">
                                                <i class="fas fa-search fa-3x mb-3 text-muted"></i>
                                                <h4>Không tìm thấy dự án nào phù hợp</h4>
                                                <p class="text-muted">Vui lòng thử lại với các điều kiện tìm kiếm khác.
                                                </p>
                                            </div>
                                        </c:if>
                                    </div>
                                    <!-- Pagination -->
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
                                                <c:if
                                                    test="${i >= currentPage - 2 && i <= currentPage + 2 && totalPages > 1}">
                                                    <li class="page-item ${currentPage == i ? 'active' : ''}">
                                                        <a class="page-link" href="#"
                                                            onclick="gotoPage(${i}); return false;">${i}</a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${totalPages == 1 && i == 1}">
                                                    <li class="page-item active">
                                                        <a class="page-link" href="#" onclick="return false;">1</a>
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
                                    <p class="page-info text-center mt-2">
                                        Hiển thị ${(currentPage-1)*10 + 1} đến ${Math.min(currentPage*10,
                                        totalElements)}
                                        trong tổng số ${totalElements} dự án
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <jsp:include page="../layout/footer.jsp" />
                    <!-- JavaScript for filter form -->
                    <script>
                        function resetForm() {
                            document.getElementById('name').value = '';
                            document.getElementById('address').value = '';
                            document.getElementById('productName').value = '';
                            document.getElementById('serviceId').value = '';

                            window.location.href = '/project';
                        }
                        function gotoPage(page) {
                            if (page < 1 || page > ${ totalPages }) return false;
                            let url = '/project?page=' + page;
                            const name = document.getElementById('name').value;
                            const address = document.getElementById('address').value;
                            const productName = document.getElementById('productName').value;
                            const serviceId = document.getElementById('serviceId').value;

                            if (name) url += '&name=' + encodeURIComponent(name);
                            if (address) url += '&address=' + encodeURIComponent(address);
                            if (productName) url += '&productName=' + encodeURIComponent(productName);
                            if (serviceId) url += '&serviceId=' + encodeURIComponent(serviceId);

                            window.location.href = url;
                            return false;
                        }
                    </script>
                </body>

                </html>