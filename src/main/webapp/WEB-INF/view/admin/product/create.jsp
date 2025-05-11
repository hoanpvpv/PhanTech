<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="PhanTech - Tạo sản phẩm mới" />
                <meta name="author" content="PhanTech" />
                <title>Tạo sản phẩm mới - PhanTech</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <!-- TinyMCE -->
                <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/6/tinymce.min.js"
                    referrerpolicy="origin"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />

                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidenav.jsp" />

                    <div id="layoutSidenav_content">
                        <div class="container-fluid pt-4">
                            <div class="row mb-4">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header bg-primary text-white">
                                            <h4 class="mb-0">Tạo Sản Phẩm Mới</h4>
                                        </div>
                                        <div class="card-body">
                                            <form:form action="/admin/product/create" method="post"
                                                modelAttribute="product" enctype="multipart/form-data"
                                                class="needs-validation" novalidate="true">

                                                <div class="row mb-4">
                                                    <div class="col-md-6">
                                                        <h5 class="border-bottom pb-2">Thông tin cơ bản</h5>

                                                        <div class="mb-3">
                                                            <label for="name" class="form-label">Tên sản phẩm <span
                                                                    class="text-danger">*</span></label>
                                                            <form:input path="name" id="name" class="form-control"
                                                                required="true" />
                                                            <div class="invalid-feedback">Vui lòng nhập tên sản phẩm
                                                            </div>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="price" class="form-label">Giá sản phẩm <span
                                                                    class="text-danger">*</span></label>
                                                            <form:input path="price" id="price" class="form-control"
                                                                type="number" step="1000" min="0" required="true" />
                                                            <div class="invalid-feedback">Vui lòng nhập giá sản phẩm
                                                            </div>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="shortDescription" class="form-label">Mô tả ngắn
                                                                <span class="text-danger">*</span></label>
                                                            <form:input path="shortDescription" id="shortDescription"
                                                                class="form-control" required="true" />
                                                            <div class="invalid-feedback">Vui lòng nhập mô tả ngắn</div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-6 mb-3">
                                                                <label for="manufacturer" class="form-label">Nhà sản
                                                                    xuất <span class="text-danger">*</span></label>
                                                                <form:select path="manufacturer" id="manufacturer"
                                                                    class="form-select" required="true">
                                                                    <form:option value=""
                                                                        label="-- Chọn nhà sản xuất --" />
                                                                    <form:options items="${manufacturers}"
                                                                        itemValue="id" itemLabel="name" />
                                                                </form:select>
                                                                <div class="invalid-feedback">Vui lòng chọn nhà sản xuất
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6 mb-3">
                                                                <label for="elevatorType" class="form-label">Loại thang
                                                                    máy <span class="text-danger">*</span></label>
                                                                <form:select path="elevatorType" id="elevatorType"
                                                                    class="form-select" required="true">
                                                                    <form:option value=""
                                                                        label="-- Chọn loại thang máy --" />
                                                                    <form:options items="${elevatorTypes}"
                                                                        itemValue="id" itemLabel="name" />
                                                                </form:select>
                                                                <div class="invalid-feedback">Vui lòng chọn loại thang
                                                                    máy</div>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-md-6 mb-3">
                                                                <label for="loadCapacity" class="form-label">Tải trọng
                                                                    (kg) <span class="text-danger">*</span></label>
                                                                <form:input path="loadCapacity" id="loadCapacity"
                                                                    class="form-control" type="number" step="0.01"
                                                                    required="true" />
                                                                <div class="invalid-feedback">Vui lòng nhập tải trọng
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6 mb-3">
                                                                <label for="speed" class="form-label">Tốc độ (m/s) <span
                                                                        class="text-danger">*</span></label>
                                                                <form:input path="speed" id="speed" class="form-control"
                                                                    type="number" step="0.01" required="true" />
                                                                <div class="invalid-feedback">Vui lòng nhập tốc độ</div>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-md-6 mb-3">
                                                                <label for="cabinSize" class="form-label">Kích thước
                                                                    cabin (m²)</label>
                                                                <form:input path="cabinSize" id="cabinSize"
                                                                    class="form-control" type="number" step="0.01" />
                                                            </div>

                                                            <div class="col-md-6 mb-3">
                                                                <label for="doorType" class="form-label">Loại
                                                                    cửa</label>
                                                                <form:input path="doorType" id="doorType"
                                                                    class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <h5 class="border-bottom pb-2">Thông số kỹ thuật</h5>

                                                        <div class="mb-3">
                                                            <label for="controlTechnology" class="form-label">Công nghệ
                                                                điều khiển</label>
                                                            <form:input path="controlTechnology" id="controlTechnology"
                                                                class="form-control" />
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="pitOrMachineRoom" class="form-label">Hố
                                                                pit/Phòng máy</label>
                                                            <form:input path="pitOrMachineRoom" id="pitOrMachineRoom"
                                                                class="form-control" />
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="powerSupply" class="form-label">Nguồn
                                                                điện</label>
                                                            <form:input path="powerSupply" id="powerSupply"
                                                                class="form-control" />
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-md-6 mb-3">
                                                                <label for="warranty" class="form-label">Bảo hành
                                                                    (tháng)</label>
                                                                <form:input path="warranty" id="warranty"
                                                                    class="form-control" type="number" />
                                                            </div>

                                                            <div class="col-md-6 mb-3">
                                                                <label for="video" class="form-label">Link video
                                                                    (YouTube)</label>
                                                                <form:input path="video" id="video"
                                                                    class="form-control" />
                                                            </div>
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="documentation" class="form-label">Link tài
                                                                liệu</label>
                                                            <form:input path="documentation" id="documentation"
                                                                class="form-control" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row mb-4">
                                                    <div class="col-12">
                                                        <h5 class="border-bottom pb-2">Mô tả sản phẩm</h5>
                                                        <div class="mb-3">
                                                            <form:textarea path="description" id="description"
                                                                class="form-control" rows="10" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row mb-4">
                                                    <div class="col-12">
                                                        <h5 class="border-bottom pb-2">Hình ảnh sản phẩm</h5>

                                                        <div class="row">
                                                            <div class="col-md-4 mb-3">
                                                                <label for="imageFile1" class="form-label">Hình ảnh 1
                                                                    <span class="text-danger">*</span></label>
                                                                <input type="file" name="imageFile1" id="imageFile1"
                                                                    class="form-control" accept="image/*" required />
                                                                <div class="invalid-feedback">Vui lòng chọn hình ảnh
                                                                    chính cho sản phẩm</div>
                                                            </div>

                                                            <div class="col-md-4 mb-3">
                                                                <label for="imageFile2" class="form-label">Hình ảnh
                                                                    2</label>
                                                                <input type="file" name="imageFile2" id="imageFile2"
                                                                    class="form-control" accept="image/*" />
                                                            </div>

                                                            <div class="col-md-4 mb-3">
                                                                <label for="imageFile3" class="form-label">Hình ảnh
                                                                    3</label>
                                                                <input type="file" name="imageFile3" id="imageFile3"
                                                                    class="form-control" accept="image/*" />
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-md-4 mb-3">
                                                                <label for="imageFile4" class="form-label">Hình ảnh
                                                                    4</label>
                                                                <input type="file" name="imageFile4" id="imageFile4"
                                                                    class="form-control" accept="image/*" />
                                                            </div>

                                                            <div class="col-md-4 mb-3">
                                                                <label for="imageFile5" class="form-label">Hình ảnh
                                                                    5</label>
                                                                <input type="file" name="imageFile5" id="imageFile5"
                                                                    class="form-control" accept="image/*" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="d-flex justify-content-between">
                                                    <a href="/admin/product" class="btn btn-secondary">
                                                        <i class="fas fa-arrow-left me-1"></i> Quay lại
                                                    </a>

                                                    <button type="submit" class="btn btn-primary">
                                                        <i class="fas fa-save me-1"></i> Lưu sản phẩm
                                                    </button>
                                                </div>
                                            </form:form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
                <!-- TinyMCE với API key -->
                <script
                    src="https://cdn.tiny.cloud/1/nygcenmzq3prqg0wrri75srh2s6zin8p8bykol8nmskn6vf1/tinymce/7/tinymce.min.js"
                    referrerpolicy="origin"></script>
                <!-- filepath: c:\Users\hoany\Desktop\WEB\PhanTech\src\main\webapp\WEB-INF\view\admin\product\create.jsp -->
                <script>
                    tinymce.init({
                        selector: '#description',
                        plugins: [
                            // Core editing features
                            'anchor', 'autolink', 'charmap', 'codesample', 'emoticons', 'image', 'link', 'lists', 'media',
                            'searchreplace', 'table', 'visualblocks', 'wordcount',

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
                        images_upload_url: '/admin/product/upload-image-product', // Endpoint cho upload ảnh sản phẩm

                        file_picker_types: 'image',

                        // Áp dụng style responsive cho tất cả hình ảnh
                        content_style: 'img { max-width: 100%; height: auto; display: block; }',

                        tinycomments_mode: 'embedded',
                        tinycomments_author: 'Admin',
                        mergetags_list: [
                            { value: 'product.name', title: 'Tên sản phẩm' },
                            { value: 'manufacturer.name', title: 'Nhà sản xuất' },
                        ],
                        ai_request: (request, respondWith) => respondWith.string(() =>
                            Promise.reject('AI Assistant chưa được cấu hình')),

                        // Mở rộng setup để xử lý hình ảnh responsive
                        setup: function (editor) {
                            editor.on('change', function () {
                                editor.save();
                            });

                            // Xử lý hình ảnh đã có khi khởi tạo editor
                            editor.on('init', function () {
                                // Thêm class cho tất cả hình ảnh đã có
                                editor.getBody().querySelectorAll('img').forEach(function (img) {
                                    img.classList.add('img-fluid');
                                    img.removeAttribute('width');
                                    img.removeAttribute('height');
                                    img.style.maxWidth = '100%';
                                    img.style.height = 'auto';
                                });
                            });

                            // Xử lý hình ảnh khi chèn vào
                            editor.on('ObjectSelected', function (e) {
                                if (e.target.nodeName == 'IMG') {
                                    e.target.classList.add('img-fluid');
                                    e.target.removeAttribute('width');
                                    e.target.removeAttribute('height');
                                }
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
                        'use strict'

                        // Fetch all the forms we want to apply custom Bootstrap validation styles to
                        var forms = document.querySelectorAll('.needs-validation')

                        // Loop over them and prevent submission
                        Array.prototype.slice.call(forms)
                            .forEach(function (form) {
                                form.addEventListener('submit', function (event) {
                                    if (!form.checkValidity()) {
                                        event.preventDefault()
                                        event.stopPropagation()
                                    }

                                    form.classList.add('was-validated')
                                }, false)
                            })
                    })()
                </script>
            </body>

            </html>