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
                    <meta name="description" content="PhanTech - Quản lý form liên hệ" />
                    <meta name="author" content="PhanTech" />
                    <title>Quản lý form liên hệ - PhanTech</title>
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
                                    <h1 class="mt-4">Quản lý form liên hệ</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                        <li class="breadcrumb-item active">Danh sách form liên hệ</li>
                                    </ol>

                                    <div class="card shadow-lg mb-4">
                                        <div
                                            class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                                            <h4 class="mb-0"><i class="fas fa-envelope me-2"></i>Danh sách form liên hệ
                                                từ khách hàng</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table id="formTable" class="table table-striped table-hover">
                                                    <thead class="table-dark">
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Họ tên</th>
                                                            <th>Thông tin liên hệ</th>
                                                            <th>Tin nhắn</th>
                                                            <th>Ngày gửi</th>
                                                            <th>Trạng thái</th>
                                                            <th width="120">Thao tác</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${forms}" var="form">
                                                            <tr class="${form.read ? '' : 'table-warning'}">
                                                                <td>${form.id}</td>
                                                                <td>
                                                                    <strong>${form.name}</strong>
                                                                </td>
                                                                <td>
                                                                    <i class="fas fa-envelope me-1 text-primary"></i>
                                                                    ${form.email}<br>
                                                                    <i class="fas fa-phone me-1 text-success"></i>
                                                                    ${form.phone}<br>
                                                                    <c:if test="${not empty form.address}">
                                                                        <i
                                                                            class="fas fa-map-marker-alt me-1 text-danger"></i>
                                                                        ${form.address}
                                                                    </c:if>
                                                                </td>
                                                                <td>
                                                                    <span class="text-truncate d-inline-block"
                                                                        style="max-width: 150px;">
                                                                        ${form.message}
                                                                    </span>
                                                                </td>
                                                                <td>
                                                                    ${form.createdAt}
                                                                </td>
                                                                <td>
                                                                    <c:choose>
                                                                        <c:when test="${form.read}">
                                                                            <span class="badge bg-success">Đã đọc</span>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <span
                                                                                class="badge bg-warning text-dark">Chưa
                                                                                đọc</span>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </td>
                                                                <td>
                                                                    <div class="btn-group" role="group">
                                                                        <a href="/admin/form/${form.id}"
                                                                            class="btn btn-sm btn-info"
                                                                            title="Chi tiết">
                                                                            <i class="fas fa-eye"></i> Xem
                                                                        </a>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
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
                                    <p>Bạn có chắc chắn muốn xóa form liên hệ của <strong
                                            id="formNameToDelete"></strong>?</p>
                                    <p class="text-danger"><i class="fas fa-exclamation-triangle me-2"></i>Hành động này
                                        không thể hoàn tác.</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                    <form action="/admin/form/delete" method="post" id="deleteForm">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <input type="hidden" name="id" id="formIdToDelete" value="">
                                        <button type="submit" class="btn btn-danger">Xóa</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/js/scripts.js"></script>
                    <script
                        src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>
                    <script>
                        // Initialize DataTable
                        document.addEventListener('DOMContentLoaded', function () {
                            const formTable = document.getElementById('formTable');
                            if (formTable) {
                                new simpleDatatables.DataTable(formTable, {
                                    perPageSelect: [10, 20, 50, 100],
                                    columns: [
                                        // Disable sorting for actions column
                                        { select: 6, sortable: false }
                                    ]
                                });
                            }
                        });


                    </script>
                </body>

                </html>