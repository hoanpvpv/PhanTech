<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="PhanTech - Chỉnh sửa sản phẩm" />
                <meta name="author" content="PhanTech" />
                <title>Chỉnh sửa sản phẩm - PhanTech</title>
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
                                        <div class="card-header bg-warning">
                                            <h4 class="mb-0">Chỉnh Sửa Sản Phẩm</h4>
                                        </div>
                                        <div class="card-body">
                                            <form:form action="/admin/product/edit/${product.id}" method="post"
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

                                                        <div class="row mb-3">
                                                            <div class="col-md-4 mb-3">
                                                                <label for="imageFile1" class="form-label">Hình ảnh
                                                                    1</label>
                                                                <input type="file" name="imageFile1" id="imageFile1"
                                                                    class="form-control" accept="image/*" />
                                                                <c:if test="${not empty product.image1}">
                                                                    <div class="mt-2">
                                                                        <p>Hình ảnh hiện tại:</p>
                                                                        <img src="/images/product/${product.image1}"
                                                                            alt="${product.name}" class="img-thumbnail"
                                                                            style="max-height: 150px;">
                                                                    </div>
                                                                </c:if>
                                                            </div>

                                                            <div class="col-md-4 mb-3">
                                                                <label for="imageFile2" class="form-label">Hình ảnh
                                                                    2</label>
                                                                <input type="file" name="imageFile2" id="imageFile2"
                                                                    class="form-control" accept="image/*" />
                                                                <c:if test="${not empty product.image2}">
                                                                    <div class="mt-2">
                                                                        <p>Hình ảnh hiện tại:</p>
                                                                        <img src="/images/product/${product.image2}"
                                                                            alt="${product.name}" class="img-thumbnail"
                                                                            style="max-height: 150px;">
                                                                    </div>
                                                                </c:if>
                                                            </div>

                                                            <div class="col-md-4 mb-3">
                                                                <label for="imageFile3" class="form-label">Hình ảnh
                                                                    3</label>
                                                                <input type="file" name="imageFile3" id="imageFile3"
                                                                    class="form-control" accept="image/*" />
                                                                <c:if test="${not empty product.image3}">
                                                                    <div class="mt-2">
                                                                        <p>Hình ảnh hiện tại:</p>
                                                                        <img src="/images/product/${product.image3}"
                                                                            alt="${product.name}" class="img-thumbnail"
                                                                            style="max-height: 150px;">
                                                                    </div>
                                                                </c:if>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-md-4 mb-3">
                                                                <label for="imageFile4" class="form-label">Hình ảnh
                                                                    4</label>
                                                                <input type="file" name="imageFile4" id="imageFile4"
                                                                    class="form-control" accept="image/*" />
                                                                <c:if test="${not empty product.image4}">
                                                                    <div class="mt-2">
                                                                        <p>Hình ảnh hiện tại:</p>
                                                                        <img src="/images/product/${product.image4}"
                                                                            alt="${product.name}" class="img-thumbnail"
                                                                            style="max-height: 150px;">
                                                                    </div>
                                                                </c:if>
                                                            </div>

                                                            <div class="col-md-4 mb-3">
                                                                <label for="imageFile5" class="form-label">Hình ảnh
                                                                    5</label>
                                                                <input type="file" name="imageFile5" id="imageFile5"
                                                                    class="form-control" accept="image/*" />
                                                                <c:if test="${not empty product.image5}">
                                                                    <div class="mt-2">
                                                                        <p>Hình ảnh hiện tại:</p>
                                                                        <img src="/images/product/${product.image5}"
                                                                            alt="${product.name}" class="img-thumbnail"
                                                                            style="max-height: 150px;">
                                                                    </div>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="d-flex justify-content-between">
                                                    <a href="/admin/product" class="btn btn-secondary">
                                                        <i class="fas fa-arrow-left me-1"></i> Quay lại
                                                    </a>

                                                    <button type="submit" class="btn btn-warning">
                                                        <i class="fas fa-save me-1"></i> Cập nhật sản phẩm
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
                <script
                    src="https://cdn.tiny.cloud/1/nygcenmzq3prqg0wrri75srh2s6zin8p8bykol8nmskn6vf1/tinymce/7/tinymce.min.js"
                    referrerpolicy="origin"></script>
                <!-- TinyMCE Initialization -->
                <script>
                    tinymce.init({
                        selector: '#description',
                        plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount',
                        toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table | align lineheight | numlist bullist indent outdent | emoticons charmap | removeformat',
                        height: 400,
                        language: 'vi',
                        branding: false,
                        promotion: false,
                        menubar: true,
                        images_upload_url: '/admin/product/upload-image-product', // Endpoint để upload ảnh từ TinyMCE nếu cần
                        file_picker_types: 'image',
                        // Đặt theme và options khác nếu cần
                        setup: function (editor) {
                            editor.on('change', function () {
                                editor.save();
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