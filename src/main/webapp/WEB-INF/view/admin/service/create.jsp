<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="PhanTech - Tạo dịch vụ mới" />
                <meta name="author" content="PhanTech" />
                <title>Tạo dịch vụ mới - PhanTech</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <!-- TinyMCE -->
                <script
                    src="https://cdn.tiny.cloud/1/nygcenmzq3prqg0wrri75srh2s6zin8p8bykol8nmskn6vf1/tinymce/7/tinymce.min.js"
                    referrerpolicy="origin"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />

                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidenav.jsp" />

                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Tạo Dịch Vụ Mới</h1>

                                <div class="card mb-4">
                                    <div class="card-header bg-success text-white">
                                        <i class="fas fa-plus me-1"></i>
                                        Thông tin dịch vụ mới
                                    </div>
                                    <div class="card-body">
                                        <form action="/admin/service/create" method="post" enctype="multipart/form-data"
                                            class="needs-validation" novalidate>
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <div class="row mb-3">
                                                <div class="col-md-12">
                                                    <div class="form-floating mb-3">
                                                        <input class="form-control" id="name" name="name" type="text"
                                                            placeholder="Tên dịch vụ" required="required" />
                                                        <label for="name">Tên dịch vụ</label>
                                                        <div class="invalid-feedback">Vui lòng nhập tên dịch vụ</div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <div class="col-md-12">
                                                    <div class="form-floating mb-3">
                                                        <textarea class="form-control" id="shortDesc" name="shortDesc"
                                                            style="height: 100px;" placeholder="Mô tả ngắn"></textarea>
                                                        <label for="shortDesc">Mô tả ngắn</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <div class="col-md-12">
                                                    <label for="detailDesc" class="form-label">Mô tả chi tiết</label>
                                                    <textarea class="form-control" id="detailDesc"
                                                        name="detailDesc"></textarea>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <div class="col-md-12">
                                                    <label for="imageFile" class="form-label">Hình ảnh</label>
                                                    <input class="form-control" id="imageFile" name="imageFile"
                                                        type="file" accept="image/*" />
                                                    <div class="form-text">Chọn hình ảnh cho dịch vụ (định dạng: jpg,
                                                        png, gif)</div>
                                                </div>
                                            </div>

                                            <div class="mt-4 mb-0 d-flex justify-content-between">
                                                <a href="/admin/service" class="btn btn-secondary">
                                                    <i class="fas fa-arrow-left me-1"></i> Quay lại
                                                </a>
                                                <button type="submit" class="btn btn-success">
                                                    <i class="fas fa-plus me-1"></i> Tạo dịch vụ
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </main>
                    </div>
                </div>

                <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>

                <!-- TinyMCE Initialization -->
                <script>
                    tinymce.init({
                        selector: '#detailDesc',
                        plugins: [
                            // Core editing features
                            'anchor', 'autolink', 'charmap', 'codesample', 'emoticons', 'image', 'link', 'lists', 'media',
                            'searchreplace', 'table', 'visualblocks', 'wordcount',
                            // Premium features
                            'checklist', 'mediaembed', 'casechange', 'formatpainter', 'pageembed', 'a11ychecker',
                            'tinymcespellchecker', 'permanentpen', 'powerpaste', 'advtable', 'advcode', 'editimage',
                            'advtemplate', 'mentions', 'tinycomments', 'tableofcontents', 'footnotes',
                            'mergetags', 'autocorrect', 'typography', 'inlinecss', 'markdown'
                        ],
                        toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table mergetags | addcomment showcomments | spellcheckdialog a11ycheck typography | align lineheight | checklist numlist bullist indent outdent | emoticons charmap | removeformat',
                        height: 400,
                        language: 'vi',
                        branding: false,
                        promotion: false,
                        menubar: true,

                        // Cấu hình cho hình ảnh responsive
                        image_advtab: true,
                        image_class_list: [
                            { title: 'Responsive', value: 'img-fluid' }
                        ],
                        image_dimensions: false,
                        automatic_uploads: true,
                        images_upload_url: '/admin/service/upload-image-service', // Endpoint upload
                        images_upload_headers: {
                            '${_csrf.headerName}': '${_csrf.token}'
                        },
                        file_picker_types: 'image',

                        // Áp dụng style responsive cho tất cả hình ảnh
                        content_style: 'img { max-width: 100%; height: auto; display: block; }',

                        // Mở rộng setup để xử lý hình ảnh responsive
                        setup: function (editor) {
                            editor.on('change', function () {
                                editor.save();
                            });

                            // Xử lý hình ảnh khi khởi tạo editor
                            editor.on('init', function () {
                                editor.getBody().querySelectorAll('img').forEach(function (img) {
                                    img.classList.add('img-fluid');
                                    img.removeAttribute('width');
                                    img.removeAttribute('height');
                                });
                            });

                            // Áp dụng responsive cho hình ảnh mới
                            editor.on('SetContent', function () {
                                const imgs = editor.getBody().querySelectorAll('img:not(.img-fluid)');
                                imgs.forEach(img => {
                                    img.classList.add('img-fluid');
                                    img.removeAttribute('width');
                                    img.removeAttribute('height');
                                });
                            });
                        }
                    });

                    // Form validation
                    (function () {
                        'use strict';
                        var forms = document.querySelectorAll('.needs-validation');
                        Array.prototype.slice.call(forms).forEach(function (form) {
                            form.addEventListener('submit', function (event) {
                                if (!form.checkValidity()) {
                                    event.preventDefault();
                                    event.stopPropagation();
                                }
                                form.classList.add('was-validated');
                            }, false);
                        });
                    })();
                </script>
            </body>

            </html>