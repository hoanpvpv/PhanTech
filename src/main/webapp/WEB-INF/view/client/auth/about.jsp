<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Về chúng tôi - PhanTech</title>
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
                        <h1>Về chúng tôi</h1>
                        <p>Nơi hội tụ công nghệ và kỹ thuật tiên tiến nhất</p>
                    </div>

                    <!-- Giới thiệu công ty -->
                    <div class="container my-5">
                        <div class="row align-items-center">
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <h2 class="section-title">Về PhanTech</h2>
                                <div class="section-divider mb-4"></div>
                                <p class="lead">
                                    Công ty Phát triển Công nghệ và Kỹ thuật PhanTech là đơn vị tiên phong trong
                                    lĩnh vực cung cấp các giải pháp thang máy hiện đại, chất lượng cao.
                                </p>
                                <p>
                                    Với hơn 10 năm kinh nghiệm, chúng tôi đã xây dựng được lòng tin của hàng nghìn khách
                                    hàng trên khắp cả nước.
                                    Chúng tôi không chỉ cung cấp sản phẩm mà còn mang đến các dịch vụ toàn diện
                                    như lắp đặt, bảo trì, sửa chữa và nâng cấp thang máy.
                                </p>
                                <p>
                                    Đội ngũ kỹ sư của chúng tôi luôn sẵn sàng hỗ trợ khách hàng với tinh thần trách
                                    nhiệm cao nhất.
                                </p>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 text-center">
                                <img src="/images/about/company.jpg" alt="Hình ảnh công ty"
                                    class="img-fluid rounded shadow">
                            </div>
                        </div>
                    </div>

                    <!-- Tầm nhìn, Sứ mệnh và Giá trị cốt lõi -->
                    <div class="container-fluid bg-light py-5">
                        <div class="container">
                            <h2 class="text-center section-title">Tầm nhìn & Sứ mệnh</h2>
                            <div class="section-divider mx-auto mb-5"></div>
                            <div class="row text-center">
                                <div class="col-lg-4 col-md-6 col-sm-12 mb-4">
                                    <div class="vision-card h-100 p-4 bg-white rounded shadow-sm">
                                        <div class="icon-wrapper mb-3">
                                            <i class="fas fa-eye fa-3x text-primary"></i>
                                        </div>
                                        <h3 class="fw-bold mb-3">Tầm nhìn</h3>
                                        <p>
                                            Trở thành công ty hàng đầu trong lĩnh vực công nghệ và kỹ thuật, mang
                                            đến các giải pháp thang máy tiên tiến, an toàn và thân thiện với môi trường.
                                        </p>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-12 mb-4">
                                    <div class="vision-card h-100 p-4 bg-white rounded shadow-sm">
                                        <div class="icon-wrapper mb-3">
                                            <i class="fas fa-bullseye fa-3x text-primary"></i>
                                        </div>
                                        <h3 class="fw-bold mb-3">Sứ mệnh</h3>
                                        <p>
                                            Cung cấp các sản phẩm và dịch vụ chất lượng cao, đáp ứng mọi nhu cầu của
                                            khách hàng, đồng thời góp phần nâng cao chất lượng cuộc sống và phát triển
                                            bền vững.
                                        </p>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-12 mb-4">
                                    <div class="vision-card h-100 p-4 bg-white rounded shadow-sm">
                                        <div class="icon-wrapper mb-3">
                                            <i class="fas fa-star fa-3x text-primary"></i>
                                        </div>
                                        <h3 class="fw-bold mb-3">Giá trị cốt lõi</h3>
                                        <p>
                                            An toàn, chất lượng và tận tâm là những giá trị cốt lõi mà chúng tôi
                                            luôn hướng đến trong mọi hoạt động.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Lịch sử phát triển -->
                    <div class="container my-5">
                        <h2 class="text-center section-title">Tầm nhìn chiến lược</h2>
                        <div class="section-divider mx-auto mb-5"></div>

                        <div class="timeline clearfix">
                            <div class="timeline-item clearfix">
                                <div class="timeline-badge bg-primary">01</div>
                                <div class="timeline-content">
                                    <h4>Công nghệ tiên phong</h4>
                                    <p>Nghiên cứu và ứng dụng các công nghệ thang máy tiên tiến nhất, hướng tới sự an
                                        toàn tuyệt đối và thân thiện với môi trường.</p>
                                </div>
                            </div>

                            <div class="timeline-item clearfix">
                                <div class="timeline-badge bg-primary">02</div>
                                <div class="timeline-content">
                                    <h4>Mở rộng thị trường</h4>
                                    <p>Phát triển mạng lưới phân phối rộng khắp cả nước, đưa sản phẩm PhanTech đến với
                                        mọi công trình lớn nhỏ trên toàn quốc.</p>
                                </div>
                            </div>

                            <div class="timeline-item clearfix">
                                <div class="timeline-badge bg-primary">03</div>
                                <div class="timeline-content">
                                    <h4>Dịch vụ toàn diện</h4>
                                    <p>Cung cấp giải pháp trọn gói từ tư vấn, thiết kế, lắp đặt đến bảo trì, đảm bảo
                                        trải nghiệm khách hàng hoàn hảo 24/7.</p>
                                </div>
                            </div>

                            <div class="timeline-item clearfix">
                                <div class="timeline-badge bg-primary">04</div>
                                <div class="timeline-content">
                                    <h4>Phát triển bền vững</h4>
                                    <p>Đầu tư vào các sản phẩm thang máy xanh, tiết kiệm năng lượng và hướng tới mục
                                        tiêu phát triển bền vững cùng cộng đồng.</p>
                                </div>
                            </div>
                        </div>
                    </div>



                    <!-- Footer -->
                    <jsp:include page="../layout/footer.jsp" />

                </body>

                </html>