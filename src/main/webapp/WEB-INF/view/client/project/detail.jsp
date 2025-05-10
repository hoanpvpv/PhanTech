<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>${project.name} - PhanTech</title>
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
                    <jsp:include page="../layout/header.jsp" />



                    <!-- Project Details -->
                    <div class="container my-5">
                        <div class="row">
                            <!-- Project Image -->
                            <div class="col-lg-6 mb-4">
                                <div class="project-image-container" style="height: 400px; overflow: hidden;">
                                    <img src="/images/project/${project.image}" alt="${project.name}"
                                        class="img-fluid rounded shadow w-100 h-100 object-fit-cover">
                                </div>
                            </div>

                            <!-- Project Info -->
                            <div class="col-lg-6">
                                <h1 class="mb-4">${project.name}</h1>

                                <div class="project-meta mb-4">
                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <div class="d-flex align-items-center">
                                                <i class="fas fa-map-marker-alt text-primary me-2 fa-fw"></i>
                                                <span>${project.address}</span>
                                            </div>
                                        </div>

                                        <div class="pcv-date">
                                            <i class="far fa-calendar-alt"></i>
                                            ${project.date.dayOfMonth}/${project.date.monthValue}/${project.date.year}
                                        </div>

                                        <div class="col-md-6">
                                            <div class="d-flex align-items-center">
                                                <i class="fas fa-building text-primary me-2 fa-fw"></i>
                                                <span>${project.floor} tầng</span>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="d-flex align-items-center">
                                                <i class="fas fa-cog text-primary me-2 fa-fw"></i>
                                                <span>${project.service.name}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="product-info p-3 bg-light rounded mb-4">
                                    <h5 class="mb-3">Thang máy sử dụng</h5>
                                    <div class="d-flex align-items-center mb-2">
                                        <i class="fas fa-elevator text-primary me-2 fa-fw"></i>
                                        <span>${project.product.name}</span>
                                    </div>
                                    <a href="/product/${project.product.id}" class="btn btn-primary btn-sm mt-2">
                                        Xem chi tiết thang máy
                                    </a>
                                </div>

                                <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                                    <a href="/contact" class="btn btn-primary">
                                        <i class="fas fa-envelope me-2"></i>Liên hệ ngay
                                    </a>
                                    <a href="/project" class="btn btn-outline-primary">
                                        <i class="fas fa-arrow-left me-2"></i>Quay lại danh sách
                                    </a>
                                </div>
                            </div>
                        </div>

                        <!-- Project Description -->
                        <div class="row mt-5">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header bg-primary text-white">
                                        <h3 class="m-0">Mô tả dự án</h3>
                                    </div>
                                    <div class="card-body">
                                        <div class="project-description">
                                            ${project.description}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <jsp:include page="../layout/footer.jsp" />
                </body>

                </html>