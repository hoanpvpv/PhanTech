<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="PhanTech - Chi tiết form liên hệ" />
                    <meta name="author" content="PhanTech" />
                    <title>Chi tiết form liên hệ #${form.id} - PhanTech</title>
                    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
                        rel="stylesheet" />
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />

                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidenav.jsp" />

                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Chi tiết form liên hệ #${form.id}</h1>


                                    <div class="row">
                                        <div class="col-md-12 mb-4">
                                            <div class="card shadow-lg">
                                                <div
                                                    class="card-header d-flex justify-content-between align-items-center bg-primary text-white">
                                                    <h5 class="mb-0">
                                                        <i class="fas fa-envelope me-2"></i>Thông tin liên hệ
                                                    </h5>
                                                    <span
                                                        class="badge ${form.read ? 'bg-success' : 'bg-warning text-dark'} fs-6">
                                                        ${form.read ? 'Đã đọc' : 'Chưa đọc'}
                                                    </span>
                                                </div>
                                                <div class="card-body">
                                                    <div class="row mb-4">
                                                        <div class="col-md-6">
                                                            <div class="card h-100">
                                                                <div class="card-header bg-light">
                                                                    <h5 class="mb-0">Thông tin người gửi</h5>
                                                                </div>
                                                                <div class="card-body">
                                                                    <p><strong>Họ và tên:</strong> ${form.name}</p>
                                                                    <p><strong>Email:</strong> ${form.email}</p>
                                                                    <p><strong>Số điện thoại:</strong> ${form.phone}</p>
                                                                    <p><strong>Địa chỉ:</strong> ${form.address}</p>
                                                                    <p><strong>Ngày gửi:</strong>
                                                                        <fmt:parseDate value="${form.createdAt}"
                                                                            pattern="yyyy-MM-dd'T'HH:mm"
                                                                            var="parsedDate" />
                                                                        <fmt:formatDate value="${parsedDate}"
                                                                            pattern="dd/MM/yyyy HH:mm" />
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="card h-100">
                                                                <div class="card-header bg-light">
                                                                    <h5 class="mb-0">Nội dung tin nhắn</h5>
                                                                </div>
                                                                <div class="card-body">
                                                                    <div class="p-3 bg-light rounded"
                                                                        style="min-height: 200px;">
                                                                        ${form.message}
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="d-flex justify-content-end gap-2">
                                                                <c:if test="${!form.read}">
                                                                    <form action="/admin/form/mark-as-read"
                                                                        method="post">
                                                                        <input type="hidden"
                                                                            name="${_csrf.parameterName}"
                                                                            value="${_csrf.token}" />
                                                                        <input type="hidden" name="id"
                                                                            value="${form.id}">
                                                                        <button type="submit" class="btn btn-success">
                                                                            <i class="fas fa-check me-1"></i> Đánh dấu
                                                                            đã đọc
                                                                        </button>
                                                                    </form>
                                                                </c:if>

                                                                <a href="/admin/form" class="btn btn-secondary">
                                                                    <i class="fas fa-arrow-left me-1"></i> Quay lại
                                                                </a>

                                                                <button class="btn btn-danger"
                                                                    onclick="confirmDelete('${form.id}', '${form.name}')">
                                                                    <i class="fas fa-trash-alt me-1"></i> Xóa form
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </main>
                        </div>
                    </div>

                    <!-- Modal Xác nhận xóa -->
                    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header bg-danger text-white">
                                    <h5 class="modal-title" id="deleteModalLabel">Xác nhận xóa form liên hệ</h5>
                                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <p>Bạn có chắc chắn muốn xóa form liên hệ của <strong>${form.name}</strong>?</p>
                                    <p class="text-danger"><i class="fas fa-exclamation-triangle me-2"></i>Hành động này
                                        không thể hoàn tác.</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                    <form action="/admin/form/delete" method="post">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <input type="hidden" name="id" value="${form.id}">
                                        <button type="submit" class="btn btn-danger">Xóa</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/js/scripts.js"></script>
                    <script>
                        function confirmDelete(id, name) {
                            var deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
                            deleteModal.show();
                        }
                    </script>
                </body>

                </html>