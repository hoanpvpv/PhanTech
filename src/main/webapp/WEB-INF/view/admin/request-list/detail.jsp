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
                    <meta name="description" content="PhanTech - Chi tiết yêu cầu" />
                    <meta name="author" content="PhanTech" />
                    <title>Chi tiết yêu cầu #${requestList.id} - PhanTech</title>
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
                                    <h1 class="mt-4">Chi tiết yêu cầu #${requestList.id}</h1>


                                    <div class="row mb-4">
                                        <div class="col-md-6">
                                            <div class="card">
                                                <div class="card-header bg-primary text-white">
                                                    <h5 class="mb-0"><i class="fas fa-user-circle me-2"></i>Thông tin
                                                        khách hàng</h5>
                                                </div>
                                                <div class="card-body">
                                                    <div class="row mb-2">
                                                        <div class="col-md-4 fw-bold">Họ và tên:</div>
                                                        <div class="col-md-8">${requestList.fullNameInfo}</div>
                                                    </div>
                                                    <div class="row mb-2">
                                                        <div class="col-md-4 fw-bold">Email:</div>
                                                        <div class="col-md-8">${requestList.emailInfo}</div>
                                                    </div>
                                                    <div class="row mb-2">
                                                        <div class="col-md-4 fw-bold">Số điện thoại:</div>
                                                        <div class="col-md-8">${requestList.phoneInfo}</div>
                                                    </div>
                                                    <div class="row mb-2">
                                                        <div class="col-md-4 fw-bold">Địa chỉ:</div>
                                                        <div class="col-md-8">${requestList.addressInfo}</div>
                                                    </div>
                                                    <div class="row mb-2">
                                                        <div class="col-md-4 fw-bold">Ghi chú:</div>
                                                        <div class="col-md-8">${requestList.noteInfo}</div>
                                                    </div>
                                                    <c:if test="${not empty requestList.user}">
                                                        <div class="row">
                                                            <div class="col-md-4 fw-bold">Tài khoản:</div>
                                                            <div class="col-md-8">${requestList.user.email}</div>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="card">
                                                <div class="card-header bg-primary text-white">
                                                    <h5 class="mb-0"><i class="fas fa-info-circle me-2"></i>Thông tin
                                                        yêu cầu</h5>
                                                </div>
                                                <div class="card-body">
                                                    <div class="row mb-2">
                                                        <div class="col-md-4 fw-bold">Mã yêu cầu:</div>
                                                        <div class="col-md-8">#${requestList.id}</div>
                                                    </div>
                                                    <div class="row mb-2">
                                                        <div class="col-md-4 fw-bold">Ngày tạo:</div>
                                                        <div class="col-md-8">
                                                            ${requestList.createdAt}

                                                        </div>
                                                    </div>
                                                    <div class="row mb-2">
                                                        <div class="col-md-4 fw-bold">Trạng thái:</div>
                                                        <div class="col-md-8">
                                                            <c:choose>
                                                                <c:when test="${requestList.status == 'PENDING'}">
                                                                    <span class="badge bg-warning text-dark">Chờ xử
                                                                        lý</span>
                                                                </c:when>
                                                                <c:when test="${requestList.status == 'PROCESSING'}">
                                                                    <span class="badge bg-primary">Đang xử lý</span>
                                                                </c:when>
                                                                <c:when test="${requestList.status == 'COMPLETED'}">
                                                                    <span class="badge bg-success">Hoàn thành</span>
                                                                </c:when>
                                                                <c:when test="${requestList.status == 'CANCELED'}">
                                                                    <span class="badge bg-danger">Đã hủy</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span
                                                                        class="badge bg-secondary">${requestList.status}</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-2">
                                                        <div class="col-md-4 fw-bold">Cập nhật lần cuối:</div>
                                                        <div class="col-md-8">
                                                            <c:if test="${not empty requestList.updateStatusdAt}">
                                                                ${requestList.updateStatusdAt}
                                                            </c:if>
                                                            <c:if test="${empty requestList.updateStatusdAt}">
                                                                <span class="text-muted">Chưa cập nhật</span>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-2">
                                                        <div class="col-md-4 fw-bold">Ghi chú nội bộ:</div>
                                                        <div class="col-md-8">${requestList.message}</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12 mt-3">
                                                            <button class="btn btn-primary w-100" data-bs-toggle="modal"
                                                                data-bs-target="#updateStatusModal">
                                                                <i class="fas fa-edit me-1"></i> Cập nhật trạng thái
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card mb-4">
                                        <div class="card-header bg-primary text-white">
                                            <h5 class="mb-0"><i class="fas fa-list me-2"></i>Danh sách sản phẩm/dịch vụ
                                            </h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table id="requestItemsTable" class="table table-bordered table-hover">
                                                    <thead class="table-dark">
                                                        <tr>
                                                            <th>STT</th>
                                                            <th>Hình ảnh</th>
                                                            <th>Tên sản phẩm/dịch vụ</th>
                                                            <th>Loại</th>
                                                            <th>Cho phép đánh giá</th>
                                                            <th>Thao tác</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${Items}" var="item" varStatus="status">
                                                            <tr>
                                                                <td>${status.index + 1}</td>
                                                                <td>
                                                                    <c:if test="${not empty item.product}">
                                                                        <img src="/images/product/${item.product.image1}"
                                                                            alt="${item.product.name}" width="50"
                                                                            height="50" class="img-thumbnail">
                                                                    </c:if>
                                                                    <c:if test="${not empty item.service}">
                                                                        <img src="/images/public/${item.service.image}"
                                                                            alt="${item.service.name}" width="50"
                                                                            height="50" class="img-thumbnail">
                                                                    </c:if>
                                                                </td>
                                                                <td>
                                                                    <c:if test="${not empty item.product}">
                                                                        ${item.product.name}
                                                                    </c:if>
                                                                    <c:if test="${not empty item.service}">
                                                                        ${item.service.name}
                                                                    </c:if>
                                                                </td>
                                                                <td>
                                                                    <c:if test="${not empty item.product}">
                                                                        <span class="badge bg-primary">Sản phẩm</span>
                                                                    </c:if>
                                                                    <c:if test="${not empty item.service}">
                                                                        <span class="badge bg-success">Dịch vụ</span>
                                                                    </c:if>
                                                                </td>
                                                                <td class="text-center">
                                                                    <c:choose>
                                                                        <c:when test="${item.canReview == 'YES'}">
                                                                            <span class="badge bg-success">Đã cho
                                                                                phép</span>
                                                                        </c:when>
                                                                        <c:when test="${item.canReview == 'DONE'}">
                                                                            <span class="badge bg-success">Đã đánh
                                                                                giá</span>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <span class="badge bg-secondary">Chưa cho
                                                                                phép</span>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </td>
                                                                <td>
                                                                    <c:if test="${requestList.status == 'COMPLETED'}">
                                                                        <form
                                                                            action="/admin/request-list/allow-to-review"
                                                                            method="post">
                                                                            <input type="hidden"
                                                                                name="${_csrf.parameterName}"
                                                                                value="${_csrf.token}" />
                                                                            <input type="hidden" name="RequestItemId"
                                                                                value="${item.id}">

                                                                            <c:choose>

                                                                                <c:when
                                                                                    test="${item.canReview == 'YES' || item.canReview == 'DONE'}">
                                                                                    <button type="button"
                                                                                        class="btn btn-sm btn-outline-success"
                                                                                        disabled>
                                                                                        <i
                                                                                            class="fas fa-check-circle me-1"></i>
                                                                                        <c:if
                                                                                            test="${item.canReview == 'YES'}">
                                                                                            Đã cấp quyền đánh giá</c:if>
                                                                                        <c:if
                                                                                            test="${item.canReview == 'DONE'}">
                                                                                            Đã hoàn thành đánh giá
                                                                                        </c:if>
                                                                                    </button>
                                                                                </c:when>


                                                                                <c:otherwise>
                                                                                    <button type="submit"
                                                                                        class="btn btn-sm btn-success">
                                                                                        <i
                                                                                            class="fas fa-check me-1"></i>
                                                                                        Cấp quyền đánh giá
                                                                                    </button>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </form>
                                                                    </c:if>

                                                                    <c:if test="${requestList.status != 'COMPLETED'}">
                                                                        <button class="btn btn-sm btn-secondary"
                                                                            disabled>
                                                                            <i class="fas fa-lock me-1"></i>Yêu cầu chưa
                                                                            hoàn thành
                                                                        </button>
                                                                    </c:if>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Modal cập nhật trạng thái -->
                                    <div class="modal fade" id="updateStatusModal" tabindex="-1"
                                        aria-labelledby="updateStatusModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header bg-primary text-white">
                                                    <h5 class="modal-title" id="updateStatusModalLabel">
                                                        Cập nhật trạng thái yêu cầu #${requestList.id}
                                                    </h5>
                                                    <button type="button" class="btn-close btn-close-white"
                                                        data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="/admin/request-list/update-status" method="post">
                                                        <input type="hidden" name="${_csrf.parameterName}"
                                                            value="${_csrf.token}">
                                                        <input type="hidden" name="requestListId"
                                                            value="${requestList.id}">

                                                        <div class="mb-3">
                                                            <label for="status" class="form-label">Trạng thái:</label>
                                                            <select class="form-select" id="status" name="status"
                                                                required <c:if
                                                                test="${requestList.status == 'COMPLETED'}">disabled
                                                                </c:if>>
                                                                <option value="PENDING" ${requestList.status=='PENDING'
                                                                    ? 'selected' : '' }>
                                                                    Chờ xử lý
                                                                </option>
                                                                <option value="COMPLETED"
                                                                    ${requestList.status=='COMPLETED' ? 'selected' : ''
                                                                    }>
                                                                    Hoàn thành
                                                                </option>
                                                            </select>

                                                            <c:if test="${requestList.status == 'COMPLETED'}">
                                                                <!-- Thêm hidden field để đảm bảo giá trị được gửi khi select bị disabled -->
                                                                <input type="hidden" name="status" value="COMPLETED">
                                                                <div class="form-text text-warning mt-2">
                                                                    <i class="fas fa-info-circle me-1"></i>
                                                                    Trạng thái đã hoàn thành không thể thay đổi.
                                                                </div>
                                                            </c:if>

                                                            <c:if test="${requestList.status != 'COMPLETED'}">
                                                                <div class="form-text" id="statusHelp">
                                                                    Khi chuyển sang trạng thái "Hoàn thành", khách hàng
                                                                    có thể được cấp quyền đánh giá sản phẩm/dịch vụ.
                                                                </div>
                                                            </c:if>
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="message" class="form-label">Tin nhắn tới khách
                                                                hàng:</label>
                                                            <textarea class="form-control" id="message" name="message"
                                                                rows="4">${requestList.message}</textarea>
                                                        </div>

                                                        <div class="d-flex justify-content-end">
                                                            <button type="button" class="btn btn-secondary me-2"
                                                                data-bs-dismiss="modal">Hủy</button>
                                                            <button type="submit" class="btn btn-primary">
                                                                <i class="fas fa-save me-1"></i> Lưu thay đổi
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </main>


                        </div>
                    </div>

                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/js/scripts.js"></script>
                    <script
                        src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>

                </body>

                </html>