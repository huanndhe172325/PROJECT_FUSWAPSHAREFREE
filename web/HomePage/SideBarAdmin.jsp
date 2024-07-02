<!doctype html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

 <head>
    <!-- Mirrored from friendkit.cssninja.io/dashboard-home.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 May 2024 06:39:27 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
   
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />

        <title>Friendkit | Dashboard</title>
        <script src="cdn-cgi/apps/head/lmplkzhV3pH6fdNUw6kpmpBQ68Q.js"></script><link rel="icon" type="image/png" href="assets/img/favicon.png" />

        <!-- Google Tag Manager -->
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
        <!-- End Google Tag Manager -->

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:600,700,800,900" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet" />
        <link href="../cdn.jsdelivr.net/npm/fontisto%40v3.0.4/css/fontisto/fontisto-brands.min.css" rel="stylesheet" />

        <!-- Core CSS -->
        <link rel="stylesheet" href="assets/css/app.css" />
        <link rel="stylesheet" href="assets/css/core.css" />
    </head>

    <body>
        <!-- Google Tag Manager (noscript) -->
        <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-KQHJPZP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>
        <!-- End Google Tag Manager (noscript) -->

        <!-- Pageloader -->
        <div class="pageloader"></div>
        <div class="infraloader is-active"></div>
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
               
            </div>
            <div class="dashboard-aside-end">

                <a href="Preview" class="dashboard-aside-link">
                    <img class="link-avatar" src="https://via.placeholder.com/400x400" data-demo-src="${user.avatarUrl}" alt="" />
                </a>
            </div>
        </div>


        <div class="view-wrapper is-dashboard">
            <!--Dashboard container-->
            <div id="creator-dashboard" class="dashboard-container">
                <!--Toolbar-->
                <div class="dashboard-toolbar">
                    <h1 class="title is-4">Creator dashboard</h1>
                    <div class="actions">
                        <label class="theme-toggle">
                            <input type="checkbox" />
                            <span class="toggler">
                                <span class="dark">
                                    <i data-feather="moon"></i>
                                </span>
                                <span class="light">
                                    <i data-feather="sun"></i>
                                </span>
                            </span>
                        </label>
                        <div class="buttons">
                            <a class="button is-solid primary-button is-raised has-icon">
                                <i data-feather="plus"></i>
                                <span>Create</span>
                            </a>
                            <a class="button is-solid live-button has-icon">
                                <i data-feather="video"></i>
                                <span>Go Live</span>
                            </a>
                        </div>
                    </div>
                </div>

               

                            <!--Dashboard box-->
                            <div class="dashboard-box">
                                <h3 class="title is-5 is-thin">Top Users Reported</h3>
                                <p class="small">Last 90 days</p>

                                <div class="box-content">
                                    <div class="box-subscribers">
                                        <!--Subscriber-->
                                        <c:forEach var="c" items="${requestScope.data}">
                                            <div class="box-subscriber" style="margin-bottom: 10px;">
                                                <div class="subscriber-meta" style="display: flex; justify-content: space-between; align-items: center; padding: 5px 0;">
                                                    <span class="meta-title" style="font-weight: bold; margin-right: 20px;">${c.getKey().getNameIdUserReceive().getFull_Name()}</span>
                                                    
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div><div class="link-wrap">
                                        
                                    <a href="manageReportUsers" class="link">
                                        <span>View All</span>
                                        <i data-feather="arrow-right"></i>
                                    </a>
                                </div>
                                </div>

                                
                            </div>

                        </div>




                        <!--Dashboard column-->
                        
                    </div>
                </div>
            </div>

        </div>

        <!-- Concatenated js plugins and jQuery -->
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

        <!-- Landing page js -->

        <!-- Signup page js -->

        <!-- Feed pages js -->

        <!-- profile js -->

        <!-- stories js -->

        <!-- friends js -->

        <!-- questions js -->

        <!-- video js -->

        <!-- events js -->

        <!-- news js -->

        <!-- shop js -->

        <!-- inbox js -->

        <!-- settings js -->

        <!-- map page js -->

        <!-- elements page js -->
    </body>


    <!-- Mirrored from friendkit.cssninja.io/dashboard-home.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 May 2024 06:39:27 GMT -->
</html>