
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/ManagerProduct.css" rel="stylesheet" type="text/css"/>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
            rel="stylesheet"
            />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
        <script>

            function back() {
                window.location.href = "home";
            }
            function doDelete(id)
            {
                var c = confirm("Are you sure?");
                if (c)
                {
                    window.location.href = "delete?pid=" + id;
                }
            }
        </script>
        <script>
            ;
            (function (w, d, s, l, i) {
                w[l] = w[l] || []
                w[l].push({
                    'gtm.start': new Date().getTime(),
                    event: 'gtm.js'
                })
                var f = d.getElementsByTagName(s)[0],
                        j = d.createElement(s),
                        dl = l != 'dataLayer' ? '&l=' + l : ''
                j.async = true
                j.src = '../www.googletagmanager.com/gtm5445.html?id=' + i + dl
                f.parentNode.insertBefore(j, f)
            })(window, document, 'script', 'dataLayer', 'GTM-KQHJPZP')
        </script>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:600,700,800,900" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet" />
        <link href="../cdn.jsdelivr.net/npm/fontisto%40v3.0.4/css/fontisto/fontisto-brands.min.css" rel="stylesheet" />

        <!-- Core CSS -->
        <link rel="stylesheet" href="assets/css/app.css" />
        <link rel="stylesheet" href="assets/css/core.css" />
        <link rel="stylesheet" href="assets2/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets2/css/plugins.min.css" />
        <link rel="stylesheet" href="assets2/css/kaiadmin.min.css" />

    </head>
    <body>

        <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-KQHJPZP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>
        <div class="dashboard-aside">
            <a class="dashboard-aside-brand">
                <img class="logo light-image" src="assets/img/vector/logo/friendkit-bold.svg" width="112" height="28" alt="" />
                <img class="logo dark-image" src="assets/img/vector/logo/friendkit-white.svg" width="112" height="28" alt="" />
            </a>
            <div class="dashboard-aside-body">

                <a href="manageReportUsers" class="dashboard-aside-link">
                    <div>
                        <i data-feather="file"></i>
                        <span>Manage Report Users</span>
                    </div>
                </a>
                <a href="manageReportPost" class="dashboard-aside-link">
                    <div>
                        <i data-feather="file"></i>
                        <span> Manage Report Posts</span>
                    </div>
                </a>
                <a href="ListUser" class="dashboard-aside-link">
                    <div>
                        <i data-feather="file"></i>
                        <span> List User</span>
                    </div>
                </a>

            </div>
            <div class="dashboard-aside-end">
                <a href="Preview" class="dashboard-aside-link">
                    <img class="link-avatar" src="https://via.placeholder.com/400x400" data-demo-src="${user.avatarUrl}" alt="" />
                </a>
            </div>
        </div>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Search Form</title>
        <style>
            body {

                .btn-primary:hover {
                    background-color: #006a86;
                }
                .card-header {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                }
                .nav-search {
                    margin-left: auto;
                }

                .button-container {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-top: 20px;
                    width: 100%;  /* Đảm bảo container chiếm toàn bộ chiều rộng */
                }

                .download-form {
                    margin-left: auto;  /* Đẩy form sang bên phải */
                }

                .btn-primary {
                    margin: 5px;  /* Thêm khoảng cách giữa các nút nếu cần */

                }
            </style>

        <div class="container">
            <div class="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <div class="card-title">List Report Posts</div>
                                <nav class="navbar navbar-expand-lg navbar-form nav-search p-0">
                                    <div class="input-group">

                                    </div>
                                </nav>
                            </div>
                            <div class="card-body">
                                <table class="table mt-3">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th></th>
                                            <th>ID</th>
                                            <th>Title</th>
                                            <th>Description</th>
                                            <th>Time</th>
                                            <th>Content</th>                          
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.reportPosts}" var="c">
                                            <tr>
                                                <th>
                                                <td>
                                                    <a href="detailPost?idpost=${c.post.postID}">

                                                        ${c.post.postID}
                                                    </a>


                                                </td>
                                                <td>${c.post.title}</td>
                                                <td>${c.post.description}</td>
                                                <td>${c.reportTime}</td>
                                                <td>${c.message}</td>
                                                <td>
                                                    <button class="btn btn-danger delete-btn" data-post-id="${c.post.postID}">Delete</button>
                                                </td>
                                                </th>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <c:if test="${totalPages > 1}">
                                    <nav aria-label="Page navigation">
                                        <ul class="pagination">
                                            <!-- Nút Previous -->
                                            <c:if test="${currentPage > 1}">
                                                <li class="page-item">
                                                    <a class="page-link" href="manageReportPost?index=${currentPage - 1}&size=${pageSize}" aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                        <span class="sr-only">Previous</span>
                                                    </a>
                                                </li>
                                            </c:if>

                                            <!-- Các nút trang -->
                                            <c:forEach begin="1" end="${totalPages}" var="i">
                                                <c:if test="${i >= currentPage - 2 && i <= currentPage + 2}">
                                                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                                                        <a class="page-link" href="manageReportPost?index=${i}&size=${pageSize}">${i}</a>
                                                    </li>
                                                </c:if>
                                            </c:forEach>

                                            <!-- Nút Next -->
                                            <c:if test="${currentPage < totalPages}">
                                                <li class="page-item">
                                                    <a class="page-link" href="manageReportPost?index=${currentPage + 1}&size=${pageSize}" aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                        <span class="sr-only">Next</span>
                                                    </a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </nav>
                                </c:if>
                            </div>
                            <div id="deleteConfirmationModal" class="modal fade" role="dialog">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close cancel-btn" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Confirm Deletion</h4>
                                        </div>
                                        <div class="modal-body">
                                            <p>Are you sure you want to delete this post?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default cancel-btn" data-dismiss="modal">Cancel</button>
                                            <button type="button" class="btn btn-danger delete-btn-confirm" id="confirmDeleteBtn">Delete</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="button-container">
                                <a href="SideBarAdmin">
                                    <button type="button" class="btn btn-primary" onclick="back()">Back to home</button>
                                </a>
                                <form action="manageReportPost" method="post" class="download-form">
                                    <input type="hidden" name="action" value="download">
                                    <button type="submit" class="btn btn-primary">Export Reported Posts</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $('.delete-btn').click(function () {
                    var postID = $(this).data('post-id');
                    $('#deleteConfirmationModal').addClass('in');
                    $('#deleteConfirmationModal').attr('aria-hidden', 'false');
                    $('#deleteConfirmationModal').css('display', 'block');
                    $('#confirmDeleteBtn').data('post-id', postID);
                    $('#confirmDeleteBtn').data('status-id', statusID);
                });

                // Function to handle delete action
                $(document).on('click', '#confirmDeleteBtn', function () {
                    var postID = $(this).data('post-id');
                    ;
                    $.ajax({
                        type: "POST",
                        url: "/FUSWAPSHAREFREE/DeletePostServlet",
                        data: {pid: postID},
                        success: function (response) {
                            iziToast.show({
                                maxWidth: "280px",
                                class: "success-toast",
                                icon: "mdi mdi-check",
                                title: "",
                                message: "Remove post successfully",
                                titleColor: "#fff",
                                messageColor: "#fff",
                                iconColor: "#fff",
                                backgroundColor: "#60c032",
                                progressBarColor: "#0062ff",
                                position: "bottomRight",
                                transitionIn: "fadeInUp",
                                close: false,
                                timeout: 1800,
                                zindex: 99999
                            });
                            $('#deleteConfirmationModal').removeClass('in');
                            $('#deleteConfirmationModal').attr('aria-hidden', 'true');
                            $('#deleteConfirmationModal').css('display', 'none');
                        },
                        error: function (xhr, status, error) {
                            iziToast.show({
                                maxWidth: "280px",
                                class: "success-toast",
                                icon: "mdi mdi-error",
                                title: "",
                                message: "Remove post failed",
                                titleColor: "#fff",
                                messageColor: "#fff",
                                iconColor: "#fff",
                                backgroundColor: "#FF0000",
                                progressBarColor: "#0062ff",
                                position: "bottomRight",
                                transitionIn: "fadeInUp",
                                close: false,
                                timeout: 1800,
                                zindex: 99999
                            });
                            $('#deleteConfirmationModal').css('display', 'block');
                        }
                    });
                });

                // Function to close modal on cancel
                $('.cancel-btn').click(function () {
                    $('#deleteConfirmationModal').removeClass('in');
                    $('#deleteConfirmationModal').attr('aria-hidden', 'true');
                    $('#deleteConfirmationModal').css('display', 'none');
                });
            });
        </script>
        <script src="js/ManagerProduct.js" type="text/javascript"></script>
        <script src="assets/js/app.js"></script>
        <script src="https://js.stripe.com/v3/"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


        <!-- Core js -->
        <script src="assets/js/global.js"></script>

        <!-- Navigation options js -->
        <script src="assets/js/navbar-v1.js"></script>
        <script src="assets/js/navbar-v2.js"></script>
        <script src="assets/js/navbar-mobile.js"></script>
        <script src="assets/js/navbar-options.js"></script>
        <script src="assets/js/sidebar-v1.js"></script>

        <!-- Core instance js -->
        <script src="assets/js/main.js"></script>
        <script src="assets/js/chat.js"></script>
        <script src="assets/js/touch.js"></script>
        <script src="assets/js/tour.js"></script>

        <!-- Components js -->
        <script src="assets/js/explorer.js"></script>
        <script src="assets/js/widgets.js"></script>
        <script src="assets/js/modal-uploader.js"></script>
        <script src="assets/js/popovers-users.js"></script>
        <script src="assets/js/popovers-pages.js"></script>
        <script src="assets/js/lightbox.js"></script>
    </body>
</html>

