<%-- 
    Document   : users
    Created on : Sep 18, 2023, 3:11:42 PM
    Author     : lvhn1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users Manager - LMS</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="../../../index.html" />
        <meta name="Version" content="v1.2.0" />
        <!-- favicon -->
        <link rel="shortcut icon" href="../assets/img/logo.png">
        <!-- Bootstrap -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- simplebar -->
        <link href="../assets/css/simplebar.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="../assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="../assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet"/>

    </head>
    <body>
        <!-- Loader -->
        <div id="preloader">
            <div id="status">
                <div class="spinner">
                    <div class="double-bounce1"></div>
                    <div class="double-bounce2"></div>
                </div>
            </div>
        </div>
        <!-- Loader -->

        <div class="page-wrapper doctris-theme toggled">
            <jsp:include page="../components/sidebar.jsp"/>

            <!-- Start Page Content -->
            <main class="page-content bg-light">

                <jsp:include page="../components/header.jsp"/>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <nav aria-label="breadcrumb" class="d-inline-block mt-2">
                            <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                <li class="breadcrumb-item"><a href="index.html">Manager</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Class</li>
                            </ul>
                        </nav>
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">Class Manager</h5>

                            <form class="d-flex search" method="get" action="<%= request.getContextPath() %>/manager/class">
                                <input type="text" name="search" class="form-control border rounded-pill" id="searchInput" placeholder="Search...">
                            </form>

                            <a data-bs-toggle="modal"
                               data-bs-target="#addClassModal"
                               href="javascript:void(0"
                               class="btn btn-primary">Add New Class</a>
                        </div>


                        <div class="row">
                            <div class="col-12 mt-4">
                                <div class="table-responsive shadow rounded">
                                    <table class="table table-center bg-white mb-0">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3" style="min-width: 50px;">Id</th>
                                                <th class="border-bottom p-3" style="min-width: 180px;">Class Name</th>
                                                <th class="border-bottom p-3">Subject</th>
                                                <th class="border-bottom p-3">Semester</th>
                                                <th class="border-bottom p-3">Status</th>
                                                <th class="border-bottom p-3">Create by</th>
                                                <th class="border-bottom p-3" style="min-width: 50px;"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.listClass}" var="c">
                                                <tr>
                                                    <th class="p-3">${c.class_id}</th>
                                                    <td class="py-3">
                                                        <div class="d-flex align-items-center">
                                                            <span class="ms-2">${c.class_name}</span>
                                                        </div>
                                                    </td>
                                                    <td class="p-3">${c.class_subject_name}</td>
                                                    <td class="p-3">${c.class_semester_name}</td>
                                                    <td class="p-3">
                                                        <form class="form-check form-switch">
                                                            <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault ${c.class_id}" ${c.class_status ? 'checked' : ''} disabled="">
                                                        </form>
                                                    </td>

                                                    <td class="p-3">${c.created_by}</td>

                                                     <td class="text-end p-3">
                                                        <a href="class-detail?id=${c.class_id}" class="btn btn-icon btn-pills btn-soft-primary">
                                                            <i class="uil uil-edit"></i>
                                                        </a>
                                                    </td>

                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div><!--end row-->

                        <div class="row text-center">
                            <!-- PAGINATION START -->
                            <c:set var="cur" value="${param.page eq null ? 1 : param.page}" />
                            <div class="col-12 mt-4">
                                <div class="d-md-flex align-items-center text-center justify-content-between">
                                    <span class="text-muted me-3">Showing ${(cur - 1) * 8 + 1} - ${(cur * 8) > requestScope.count ? requestScope.count : (cur * 8)} out of ${requestScope.count}</span>
                                    <ul class="pagination justify-content-center mb-0 mt-3 mt-sm-0">
                                        <li class="page-item"><a class="page-link" href="<%= request.getContextPath() %>/manager/class?page=1" aria-label="Previous">First</a></li>
                                            <c:forEach begin="${cur > 1 ? (cur + 3 > totalPages ? (totalPages - 4 < 1 ? 1 : totalPages - 4) : cur - 1) : 1}"
                                                       end="${cur > 1 ? (cur + 3 > totalPages ? totalPages : cur + 3) : (5 > totalPages ? totalPages : 5)}" var="i">
                                            <li class="page-item ${(param.page == i || (i==1 && param.page==null)) ? 'active' : ''}">
                                                <a class="page-link" href="<%= request.getContextPath() %>/manager/class?page=${i}">${i}</a>
                                            </li>
                                        </c:forEach>
                                        <li class="page-item"><a class="page-link" href="<%= request.getContextPath() %>/manager/class?page=${totalPages}" aria-label="Next">Last</a></li>
                                    </ul>
                                </div>
                            </div><!--end col-->
                        </div>
                        </main>
                        <!--End page-content" -->
                    </div>
                    <!-- page-wrapper -->
                    <!-- Modal start -->

                    <!------------------------MODAL ADD CLASS-------------------------->   
                    <%@include file="modal/modal-add-class.jsp"%>
                    <!------------------------MODAL UPDATE CLASS DETAIL-------------------------->   
                    <%@include file="modal/modal-update-class-information.jsp"%>

                    <!-- javascript -->
                    <script src="../assets/js/bootstrap.bundle.min.js"></script>
                    <!-- simplebar -->
                    <script src="../assets/js/simplebar.min.js"></script>
                    <!-- Icons -->
                    <script src="../assets/js/feather.min.js"></script>
                    <!-- Main Js -->
                    <script src="../assets/js/app.js"></script>

                    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

                    <script>
                        const msgAddClass = '<%= session.getAttribute("msgAddClass") %>';
                        if (msgAddClass !== 'null') {
                            const myModal = new bootstrap.Modal(document.getElementById("addClassModal"), {});
                            document.onreadystatechange = function () {
                                myModal.show();
                            };
                        }
                    </script>
                    <script>
                        const msgUpdateClass = '<%= session.getAttribute("msgUpdateClass") %>';
                        if (msgUpdateClass !== 'null') {
                            const myModal = new bootstrap.Modal(document.getElementById("classDetailModal" + msgUpdateClass.split("|")[1]), {});
                            document.onreadystatechange = function () {
                                myModal.show();
                            };
                        }
                    </script>
                    <script>
                        function jumpTo(page) {
                            let search = "${param.search eq null ? '' : param.search}";
                            location.href = "./manager/class?page=" + page + (search == "" ? "" : "&search=" + search);
                        }

                            function search() {
                            let searchKeyword = document.getElementById("searchInput").value;
                            let url = "./manager/class?search=" + searchKeyword;

                            // Thêm tham số trang vào URL
                            url += "&page=1"; // Mặc định chuyển đến trang đầu tiên khi tìm kiếm

                            location.href = url;
                        }
                    </script>




                    <%
                        request.getSession().removeAttribute("msgAddClass");
                        request.getSession().removeAttribute("msgUpdateClass");
                    %>
                    </body>
                    </html>
