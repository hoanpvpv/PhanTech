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
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <link rel="stylesheet" href="/css/demo.css">
                <link rel="stylesheet" href="/css/style.css">
                <!-- Font Awesome for icons -->
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
            </head>

            <body>
                <jsp:include page="../layout/header.jsp" />
                <div class="banner">
                    <h1>Những dự án PhanTech đã thực hiện</h1>
                </div>
                <div id="completed-projects" class="container-fluid my-5 bg-light py-5">

                    <div class="row d-flex flex-wrap g-3 justify-content-center">
                        <!-- Dự án 1 -->
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
                                        <a href="/project/${project.id}" class="pcv-btn">Xem chi tiết <i
                                                class="fas fa-arrow-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <jsp:include page="../layout/footer.jsp" />
            </body>

            </html>