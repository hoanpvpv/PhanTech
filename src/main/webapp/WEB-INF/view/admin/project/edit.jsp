<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="PhanTech - Chỉnh sửa dự án" />
                <meta name="author" content="PhanTech" />
                <title>Chỉnh sửa dự án - PhanTech</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <!-- TinyMCE -->
                <!-- TinyMCE -->
                <script
                    src="https://cdn.tiny.cloud/1/nygcenmzq3prqg0wrri75srh2s6zin8p8bykol8nmskn6vf1/tinymce/7/tinymce.min.js"
                    referrerpolicy="origin"></script>

                <!-- Thêm Select2 CSS -->
                <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css"
                    rel="stylesheet" />
                <link
                    href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css"
                    rel="stylesheet" />
                <script
                    src="https://cdn.tiny.cloud/1/nygcenmzq3prqg0wrri75srh2s6zin8p8bykol8nmskn6vf1/tinymce/7/tinymce.min.js"
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
                                        <div class="card-header bg-warning">
                                            <h4 class="mb-0">Chỉnh Sửa Dự Án</h4>
                                        </div>
                                        <div class="card-body">
                                            <form:form action="/admin/project/edit/${project.id}" method="post"
                                                modelAttribute="project" enctype="multipart/form-data"
                                                class="needs-validation" novalidate="true">

                                                <div class="row mb-4">
                                                    <div class="col-md-6">
                                                        <h5 class="border-bottom pb-2">Thông tin dự án</h5>

                                                        <div class="mb-3">
                                                            <label for="name" class="form-label">Tên dự án <span
                                                                    class="text-danger">*</span></label>
                                                            <form:input path="name" id="name" class="form-control"
                                                                required="true" />
                                                            <div class="invalid-feedback">Vui lòng nhập tên dự án</div>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="date" class="form-label">Ngày hoàn thành <span
                                                                    class="text-danger">*</span></label>
                                                            <form:input path="date" id="date" type="date"
                                                                class="form-control" required="true" />
                                                            <div class="invalid-feedback">Vui lòng nhập ngày hoàn thành
                                                                dự án</div>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="floor" class="form-label">Số tầng <span
                                                                    class="text-danger">*</span></label>
                                                            <form:input path="floor" id="floor" class="form-control"
                                                                required="true" />
                                                            <div class="invalid-feedback">Vui lòng nhập số tầng dự án
                                                            </div>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="address" class="form-label">Địa chỉ <span
                                                                    class="text-danger">*</span></label>
                                                            <form:input path="address" id="address" class="form-control"
                                                                required="true" />
                                                            <div class="invalid-feedback">Vui lòng nhập địa chỉ dự án
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-md-6 mb-3">
                                                                <label for="product" class="form-label">Sản phẩm sử
                                                                    dụng</label>
                                                                <select name="product.id" id="product"
                                                                    class="form-control product-select">
                                                                    <option value="">-- Không có --</option>
                                                                    <c:if test="${not empty project.product}">
                                                                        <option value="${project.product.id}" selected>
                                                                            ${project.product.name}</option>
                                                                    </c:if>
                                                                </select>
                                                                <div class="form-text">Nhập tối thiểu 2 ký tự để tìm
                                                                    kiếm sản phẩm</div>
                                                            </div>

                                                            <div class="col-md-6 mb-3">
                                                                <label for="service" class="form-label">Dịch vụ sử
                                                                    dụng</label>
                                                                <form:select path="service" id="service"
                                                                    class="form-select">
                                                                    <form:option value="" label="-- Không có --" />
                                                                    <form:options items="${services}" itemValue="id"
                                                                        itemLabel="name" />
                                                                </form:select>
                                                            </div>
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="imageFile" class="form-label">Hình ảnh dự
                                                                án</label>
                                                            <input type="file" name="imageFile" id="imageFile"
                                                                class="form-control" accept="image/*" />
                                                            <div class="form-text">Để trống nếu không muốn thay đổi hình
                                                                ảnh</div>

                                                            <c:if test="${not empty project.image}">
                                                                <div class="mt-3">
                                                                    <p>Hình ảnh hiện tại:</p>
                                                                    <img src="/images/project/${project.image}"
                                                                        alt="${project.name}" class="img-thumbnail"
                                                                        style="max-height: 200px;">
                                                                </div>
                                                            </c:if>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <h5 class="border-bottom pb-2">Mô tả dự án</h5>
                                                        <div class="mb-3">
                                                            <form:textarea path="description" id="description"
                                                                class="form-control" rows="12" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="d-flex justify-content-between">
                                                    <a href="/admin/project" class="btn btn-secondary">
                                                        <i class="fas fa-arrow-left me-1"></i> Quay lại
                                                    </a>

                                                    <button type="submit" class="btn btn-warning">
                                                        <i class="fas fa-save me-1"></i> Cập nhật dự án
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

                <!-- filepath: c:\Users\hoany\Desktop\WEB\PhanTech\src\main\webapp\WEB-INF\view\admin\project\edit.jsp -->
                <!-- TinyMCE Initialization -->
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
                        images_upload_url: '/admin/project/upload-image-project', // Endpoint để upload ảnh từ TinyMCE
                        images_upload_headers: {
                            '${_csrf.headerName}': '${_csrf.token}'
                        },
                        file_picker_types: 'image',

                        // Áp dụng style responsive cho tất cả hình ảnh
                        content_style: 'img { max-width: 100%; height: auto; display: block; }',

                        tinycomments_mode: 'embedded',
                        tinycomments_author: 'Admin',
                        mergetags_list: [
                            { value: 'project.name', title: 'Tên dự án' },
                            { value: 'project.address', title: 'Địa chỉ' },
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
                <!-- Select2 JS (thêm sau jQuery) -->
                <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

                <script>
                    $(document).ready(function () {
                        // Khởi tạo Select2 cho tìm kiếm sản phẩm
                        $('.product-select').select2({
                            theme: 'bootstrap-5',
                            width: '100%',
                            placeholder: 'Tìm kiếm sản phẩm...',
                            allowClear: true,
                            minimumInputLength: 2,
                            ajax: {
                                url: '/admin/product/search',
                                dataType: 'json',
                                delay: 300,
                                data: function (params) {
                                    return {
                                        query: params.term
                                    };
                                },
                                processResults: function (data) {
                                    return {
                                        results: $.map(data, function (item) {
                                            return {
                                                text: item.name,
                                                id: item.id
                                            }
                                        })
                                    };
                                },
                                cache: true
                            },
                            language: {
                                inputTooShort: function () {
                                    return 'Nhập ít nhất 2 ký tự để tìm kiếm';
                                },
                                noResults: function () {
                                    return "Không tìm thấy sản phẩm";
                                },
                                searching: function () {
                                    return "Đang tìm...";
                                }
                            }
                        });

                        // Đảm bảo sản phẩm đã chọn trước đó hiển thị đúng
                        var selectedProductId = $('#product').find('option:selected').val();
                        var selectedProductText = $('#product').find('option:selected').text();

                        if (selectedProductId) {
                            // Tạo option mới với dữ liệu hiện tại và chèn vào select
                            var selectedOption = new Option(selectedProductText, selectedProductId, true, true);
                            $('.product-select').append(selectedOption).trigger('change');
                        }

                        // Đảm bảo form gửi đúng giá trị product ID
                        $('form').on('submit', function () {
                            var productId = $('.product-select').val();
                            if (productId) {
                                // Kiểm tra xem productId có được chọn hay không
                                console.log("Product ID được chọn: " + productId);
                            }
                            return true;
                        });
                    });
                </script>
            </body>

            </html>