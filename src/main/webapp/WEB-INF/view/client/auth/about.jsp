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
                    </div>

                    <!-- Khách hàng nói gì -->
                    <div class="container my-5">
                        <h2 class="text-center section-title">Khách hàng nói gì</h2>
                        <div class="section-divider mx-auto mb-5"></div>

                        <div id="testimonialCarousel" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <div class="testimonial-item p-4 text-center">
                                        <div class="testimonial-content bg-light p-4 rounded shadow-sm mb-4">
                                            <p class="mb-0">
                                                <i class="fas fa-quote-left text-primary me-2"></i>
                                                PhanTech đã mang đến cho gia đình tôi một giải pháp thang máy tuyệt vời.
                                                Dịch vụ rất chuyên nghiệp và kỹ thuật viên rất tận tâm!
                                                <i class="fas fa-quote-right text-primary ms-2"></i>
                                            </p>
                                        </div>
                                        <img src="/images/about/customer1.jpg" alt="Nguyễn Thị Hương"
                                            class="rounded-circle mb-2" width="70">
                                        <h5 class="mb-0">Nguyễn Thị Hương</h5>
                                        <p class="text-muted small">TP.HCM</p>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="testimonial-item p-4 text-center">
                                        <div class="testimonial-content bg-light p-4 rounded shadow-sm mb-4">
                                            <p class="mb-0">
                                                <i class="fas fa-quote-left text-primary me-2"></i>
                                                Đội ngũ kỹ thuật của PhanTech rất tận tâm, hỗ trợ chúng tôi từ khâu
                                                thiết kế đến lắp đặt.
                                                Tôi rất hài lòng với sự phục vụ này.
                                                <i class="fas fa-quote-right text-primary ms-2"></i>
                                            </p>
                                        </div>
                                        <img src="/images/about/customer2.jpg" alt="Lê Văn Nam"
                                            class="rounded-circle mb-2" width="70">
                                        <h5 class="mb-0">Lê Văn Nam</h5>
                                        <p class="text-muted small">Hà Nội</p>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="testimonial-item p-4 text-center">
                                        <div class="testimonial-content bg-light p-4 rounded shadow-sm mb-4">
                                            <p class="mb-0">
                                                <i class="fas fa-quote-left text-primary me-2"></i>
                                                Sản phẩm chất lượng cao, giá cả hợp lý. Thang máy hoạt động ổn định và
                                                tiết kiệm điện.
                                                Tôi rất hài lòng với sự lựa chọn này.
                                                <i class="fas fa-quote-right text-primary ms-2"></i>
                                            </p>
                                        </div>
                                        <img src="/images/about/customer3.jpg" alt="Trần Quốc Anh"
                                            class="rounded-circle mb-2" width="70">
                                        <h5 class="mb-0">Trần Quốc Anh</h5>
                                        <p class="text-muted small">Đà Nẵng</p>
                                    </div>
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#testimonialCarousel"
                                data-bs-slide="prev">
                                <span class="carousel-control-prev-icon bg-primary rounded-circle"
                                    aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#testimonialCarousel"
                                data-bs-slide="next">
                                <span class="carousel-control-next-icon bg-primary rounded-circle"
                                    aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>

                    <!-- Liên hệ nhanh -->
                    <div class="container-fluid bg-primary text-white py-5">
                        <div class="container">
                            <div class="row align-items-center">
                                <div class="col-lg-6 mb-4 mb-lg-0">
                                    <h2>Bạn cần tư vấn?</h2>
                                    <p class="lead">Hãy để lại thông tin, chúng tôi sẽ liên hệ với bạn trong thời gian
                                        sớm nhất.</p>
                                    <div class="contact-info mt-4">
                                        <div class="d-flex mb-3">
                                            <i class="fas fa-map-marker-alt me-3 fa-fw"></i>
                                            <span>123 Đường ABC, Quận XYZ, TP.HCM</span>
                                        </div>
                                        <div class="d-flex mb-3">
                                            <i class="fas fa-phone-alt me-3 fa-fw"></i>
                                            <span>0123 456 789</span>
                                        </div>
                                        <div class="d-flex">
                                            <i class="fas fa-envelope me-3 fa-fw"></i>
                                            <span>info@phantech.com</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="card border-0 shadow">
                                        <div class="card-body p-4">
                                            <h4 class="text-primary mb-4">Gửi yêu cầu tư vấn</h4>
                                            <form action="/contact/submit" method="post">
                                                <div class="row g-3">
                                                    <div class="col-md-6">
                                                        <input type="text" class="form-control" name="name"
                                                            placeholder="Họ và tên" required>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <input type="tel" class="form-control" name="phone"
                                                            placeholder="Số điện thoại" required>
                                                    </div>
                                                    <div class="col-12">
                                                        <input type="email" class="form-control" name="email"
                                                            placeholder="Email" required>
                                                    </div>
                                                    <div class="col-12">
                                                        <textarea class="form-control" name="message" rows="3"
                                                            placeholder="Nội dung yêu cầu" required></textarea>
                                                    </div>
                                                    <div class="col-12">
                                                        <button type="submit" class="btn btn-primary w-100">Gửi yêu
                                                            cầu</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Bản đồ -->
                    <div class="container my-5">
                        <h2 class="text-center text-primary mb-4">Bản đồ</h2>
                        <div class="map-responsive">
                            <iframe
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.682574420091!2d106.6800683153344!3d10.76262299232744!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f3f1c6f6e5b%3A0x2b1b1b1b1b1b1b1b!2zQ8O0bmcgdHkgUGjDoXQgdHLhuqVuaCBDw7RuZyBuZ2jhu4cgduG7iyBQaGFuVGVjaA!5e0!3m2!1sen!2s!4v1681234567890!5m2!1sen!2s"
                                width="100%" height="400" style="border:0;" allowfullscreen="" loading="lazy"
                                referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                    </div>

                    <!-- Footer -->
                    <jsp:include page="../layout/footer.jsp" />

                    <!-- CSS đặc thù cho trang About -->
                    <style>
                        .section-title {
                            position: relative;
                            color: #343a40;
                            font-weight: 700;
                            margin-bottom: 15px;
                        }

                        .section-divider {
                            height: 3px;
                            width: 60px;
                            background-color: #0d6efd;
                            margin-bottom: 30px;
                        }

                        .team-img {
                            width: 150px;
                            height: 150px;
                            object-fit: cover;
                            border: 5px solid #f8f9fa;
                            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
                            transition: transform 0.3s;
                        }

                        .team-card:hover .team-img {
                            transform: scale(1.05);
                        }

                        .team-social {
                            margin-top: 15px;
                        }

                        .social-icon {
                            display: inline-flex;
                            width: 35px;
                            height: 35px;
                            margin: 0 5px;
                            border-radius: 50%;
                            background-color: #f8f9fa;
                            color: #0d6efd;
                            justify-content: center;
                            align-items: center;
                            transition: all 0.3s;
                        }

                        .social-icon:hover {
                            background-color: #0d6efd;
                            color: white;
                        }

                        .timeline {
                            position: relative;
                            padding: 20px 0;
                        }

                        .timeline::before {
                            content: '';
                            position: absolute;
                            top: 0;
                            bottom: 0;
                            left: 50%;
                            width: 3px;
                            margin-left: -1.5px;
                            background-color: #e9ecef;
                        }

                        .timeline-item {
                            position: relative;
                            margin-bottom: 40px;
                        }

                        .timeline-badge {
                            position: absolute;
                            left: 50%;
                            width: 70px;
                            height: 70px;
                            line-height: 70px;
                            margin-left: -35px;
                            text-align: center;
                            color: white;
                            border-radius: 50%;
                            font-size: 1.4rem;
                            font-weight: bold;
                            z-index: 100;
                            border: 3px solid white;
                            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
                        }

                        .timeline-content {
                            position: relative;
                            width: 45%;
                            background-color: #fff;
                            padding: 20px;
                            border-radius: 8px;
                            box-shadow: 0 3px 15px rgba(0, 0, 0, 0.05);
                        }

                        .timeline-item:nth-child(odd) .timeline-content {
                            float: right;
                            margin-left: 55%;
                        }

                        .timeline-item:nth-child(even) .timeline-content {
                            float: left;
                            text-align: right;
                        }

                        .testimonial-content {
                            position: relative;
                        }

                        .testimonial-content:after {
                            content: '';
                            position: absolute;
                            bottom: -10px;
                            left: 50%;
                            transform: translateX(-50%);
                            border-width: 10px 10px 0;
                            border-style: solid;
                            border-color: #f8f9fa transparent;
                        }
                    </style>
                </body>

                </html>