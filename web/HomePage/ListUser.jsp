<%-- 
    Document   : manageUsers
    Created on : Jun 2, 2024, 4:59:56 PM
    Author     : admin
--%>

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
    </head>
    <body>

        <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-KQHJPZP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>
        <div class="dashboard-aside">
            <a class="dashboard-aside-brand">
                <img class="logo light-image" src="assets/img/vector/logo/friendkit-bold.svg" width="112" height="28" alt="" />
                <img class="logo dark-image" src="assets/img/vector/logo/friendkit-white.svg" width="112" height="28" alt="" />
            </a>
            <div class="dashboard-aside-body">
                <a href="SideBarAdmin" class="dashboard-aside-link">
                    <div>
                        <i data-feather="home"></i>
                        <span>Home</span>
                    </div>
                </a>
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
                <a href="dashboard-videos.html" class="dashboard-aside-link">
                    <div>
                        <i data-feather="video"></i>
                        <span>Videos</span>
                    </div>
                </a>
                <a href="navbar-v1-settings-v1.html" class="dashboard-aside-link">
                    <div>
                        <i data-feather="settings"></i>
                        <span>Settings</span>
                    </div>
                </a>
            </div>
            <div class="dashboard-aside-end">
                <a href="Preview" class="dashboard-aside-link">
                    <img class="link-avatar" src="https://via.placeholder.com/400x400" data-demo-src="${user.avatarUrl}" alt="" />
                </a>
            </div>
        </div>
        <!DOCTYPE html>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Search Form</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    background-color: #f8f9fa;
                    margin: 0;
                    padding: 0;
                }

                .container {
                    width: 80%;
                    margin: 20px auto;
                }

                .table-wrapper {
                    box-shadow: 0 1px 1px rgba(0,0,0,.1);
                    background-color: #fff;
                    border-radius: 5px;
                    overflow: hidden;
                }

                .table-title {
                    padding: 15px;
                    background: #007bff; /* Màu xanh biển đậm hơn */
                    color: #fff;
                    border-radius: 5px 5px 0 0;
                }

                .table-title h2 {
                    margin: 0;
                    font-size: 24px;
                }

                .search-box {
                    float: right;
                }

                .search-box input[type="text"] {
                    height: 34px;
                    border-radius: 20px;
                    padding: 0 15px;
                    border: 1px solid #ddd;
                    outline: none;
                    width: 200px;
                    transition: width 0.4s ease-in-out;
                    color: #000; /* Màu chữ đen */
                }

                .search-box input[type="text"]:focus {
                    width: 300px;
                }

                .search-box button {
                    border: none;
                    background: none;
                    color: #fff;
                    font-size: 18px;
                    margin-left: -30px;
                    cursor: pointer;
                }

                table.table {
                    width: 100%;
                    margin-top: 20px;
                    border-collapse: collapse;
                }

                table.table th, table.table td {
                    padding: 12px 15px;
                    text-align: left;
                }

                table.table th {
                    background: #f4f4f4;
                }

                table.table-striped tbody tr:nth-of-type(odd) {
                    background-color: #f9f9f9;
                }

                .btn-primary {
                    background-color:#007bff; /* Màu xanh biển đậm hơn */
                    color: white;
                    border: none;
                    padding: 10px 20px;
                    border-radius: 5px;
                    cursor: pointer;
                    text-decoration: none;
                    display: inline-block;
                    margin: 20px 0;
                }

                .btn-primary:hover {
                    background-color: #006a86;
                }
            </style>
        </head>
        <body>
           <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                            <div class="col-sm-8"><h2>Manage <b>Users</b></h2></div>
                            <div class="col-sm-4">
                                <div class="search-box">
                                    <form action="/search" method="get">
                                        <input type="text" name="query" placeholder="Search...">
                                        <button type="submit">&#128269;</button> <!-- Unicode character for a magnifying glass -->
                                    </form>
                                </div>
                            </div>
                        </div>
                </div>

                <table class="table table-hover table-bordered">
                    <thead class="thead-dark">
                        <tr>
                            <th>ID</th>
                            <th>UserName</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Full Name</th>
                            <th>District</th>
                            <th>Point</th>
                            <th>Status ID</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="c" items="${users}">
                            <tr>
                                <td>${c.userID}</td>
                                <td>${c.userName}</td>
                                <td>${c.email}</td>
                                <td>${c.phone}</td>
                                <td>${c.full_Name}</td>
                                <td>${c.commune}-${c.district}</td>
                                <td>${c.point}</td>
                                <td>${c.statusID}</td>
                                <td>
                                    <button class="btn btn-danger btn-sm" onclick="doDelete(${c.userID})">Delete</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <!-- Pagination -->
                <c:if test="${noOfPages > 1}">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <c:if test="${currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="ListUser?page=${currentPage - 1}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>

                            <c:forEach begin="1" end="${noOfPages}" var="i">
                                <li class="page-item ${i == currentPage ? 'active' : ''}">
                                    <a class="page-link" href="ListUser?page=${i}">${i}</a>
                                </li>
                            </c:forEach>

                            <c:if test="${currentPage < noOfPages}">
                                <li class="page-item">
                                    <a class="page-link" href="ListUser?page=${currentPage + 1}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </c:if>

                <a href="SideBarAdmin">
                    <button type="button" class="btn btn-primary" onclick="back()">Back to home</button>
                </a>
            </div>
        </div>

        </body>
    </html>

    <script src="js/ManagerProduct.js" type="text/javascript"></script>
    <script src="assets/js/app.js"></script>
    <script src="https://js.stripe.com/v3/"></script>

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

