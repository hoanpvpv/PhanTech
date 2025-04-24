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
                                                                <form:select path="product" id="product"
                                                                    class="form-select">
                                                                    <form:option value="" label="-- Không có --" />
                                                                    <form:options items="${products}" itemValue="id"
                                                                        itemLabel="name" />
                                                                </form:select>
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

                <!-- TinyMCE Initialization -->
                <script>
                    tinymce.init({
                        selector: '#description',
                        plugins: [
                            // Core editing features
                            'anchor', 'autolink', 'charmap', 'codesample', 'emoticons', 'image', 'link', 'lists', 'media',
                            'searchreplace', 'table', 'visualblocks', 'wordcount',
                            // Premium features
                            'checklist', 'mediaembed', 'casechange', 'formatpainter', 'pageembed', 'a11ychecker',
                            'tinymcespellchecker', 'permanentpen', 'powerpaste', 'advtable', 'advcode', 'editimage',
                            'advtemplate', 'ai', 'mentions', 'tinycomments', 'tableofcontents', 'footnotes',
                            'mergetags', 'autocorrect', 'typography', 'inlinecss', 'markdown', 'importword',
                            'exportword', 'exportpdf'
                        ],
                        toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table mergetags | addcomment showcomments | spellcheckdialog a11ycheck typography | align lineheight | checklist numlist bullist indent outdent | emoticons charmap | removeformat',
                        height: 400,
                        language: 'vi',
                        branding: false,
                        promotion: false,
                        menubar: true,
                        images_upload_url: '/admin/project/upload-image-project', // Endpoint để upload ảnh từ TinyMCE
                        file_picker_types: 'image',
                        tinycomments_mode: 'embedded',
                        tinycomments_author: 'Admin',
                        mergetags_list: [
                            { value: 'project.name', title: 'Tên dự án' },
                            { value: 'project.address', title: 'Địa chỉ' },
                        ],
                        ai_request: (request, respondWith) => respondWith.string(() =>
                            Promise.reject('AI Assistant chưa được cấu hình')),
                        // Lưu nội dung khi thay đổi
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