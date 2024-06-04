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
        <title>Manager Product</title>
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
                <a href="adminHome" class="dashboard-aside-link">
                    <div>
                        <i data-feather="home"></i>
                        <span>Home</span>
                    </div>
                </a>
                <a href="managePosts" class="dashboard-aside-link">
                    <div>
                        <i data-feather="file"></i>
                        <span>Users</span>
                    </div>
                </a>
                <a href="manageUsers" class="dashboard-aside-link">
                    <div>
                        <i data-feather="file"></i>
                        <span>Manage Users</span>
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
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <h2>Manage <b>Users</b></h2>   
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>
                                ID
                            </th>
                            <th>UserName</th>
                            <th>PassWord</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Full_Name</th>
                            <th>District</th>
                            <th>Point</th>
                            <th>Status</th>
                            
              
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${users}"  var ="c" >
                            <tr>
                                  <th>
                               </th>
                                <td>${c.userID}</td>
                                <td>${c.userName}</td>
                                <td>${c.passWord}</td>
                                <td>${c.email}</td>
                                <td>${c.phone}</td>
                                <td>${c.full_Name}</td>
                                <td>${c.district}</td>
                                <td>${c.point}</td>
                              
                                <td>

                                    <c:choose>
                                        <c:when test="${c.getStatusID()==1}">
                                            <i class="bi bi-toggle-on"></i>
                                        </c:when>    
                                        <c:otherwise>
                                            <i class="bi bi-toggle2-off"></i>
                                        </c:otherwise>
                                    </c:choose>

                                <td>
                                    <a href="EditAccount?UserID=${c.getUserID()}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                               </tr>
                        </c:forEach>
                    </tbody>
                </table>
                
            </div>
            <a href="#">
               



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

