<%-- 
    Document   : login
    Created on : May 17, 2024, 12:59:48 AM
    Author     : BinhTran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">


    <!-- Mirrored from friendkit.cssninja.io/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 May 2024 06:35:50 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />

        <title>Friendkit | Login</title>
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
        <style>
            .error {
                color: red;
            }
            .back-button span {
                text-decoration: none; /* Loại bỏ gạch chân */
            }




        </style>
        <!-- End Google Tag Manager -->

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:600,700,800,900" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet" />
        <!-- Core CSS -->
        <link rel="stylesheet" href="assets/css/app.css" />
        <link rel="stylesheet" href="assets/css/core.css" />
        <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    </head>

    <body class="is-white">
        <!-- Google Tag Manager (noscript) -->
        <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-KQHJPZP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>
        <!-- End Google Tag Manager (noscript) -->

        <!-- Pageloader -->
        <div class="pageloader"></div>
        <div class="infraloader is-active"></div>

        <div class="login-wrapper">
            <!-- Main Wrapper -->
            <div class="login-wrapper columns is-gapless">
                <!--Left Side (Desktop Only)-->
                <div class="column is-6 is-hidden-mobile hero-banner">
                    <div class="hero is-fullheight is-login">
                        <div class="hero-body">
                            <div class="container">
                                <div class="left-caption">
                                    <h2>Join an Exciting Social Experience.</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Right Side-->
                <div class="column is-6">
                    <div class="hero form-hero is-fullheight">
                        <!--Logo-->
                        <div class="logo-wrap">
                            <div class="wrap-inner">
                                <img src="assets/img/vector/logo/friendkit-white.svg" alt="" />
                            </div>
                        </div>
                        <!--Login Form-->
                        <div class="hero-body">
                            <div class="form-wrapper">
                                <!--Form-->
                                <form action="Login" method="POST">
                                    <div class="login-form">
                                        <div class="field">
                                            <div class="control">
                                                <input oninput="checkEmail()" id="email" name="email" class="input email-input" type="text" placeholder="email" required=""/>
                                                <p class="error-message" id="email-error"></p>
                                                <div class="input-icon">
                                                    <i data-feather="user"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="field">
                                            <div class="control">
                                                <input name="password" class="input password-input" type="password" placeholder="●●●●●●●●●" required=""/>
                                                <div class="input-icon">
                                                    <i data-feather="lock"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="field">
                                            <div class="control">
                                                <input type="submit" value="Login" class="button is-solid primary-button raised is-rounded is-fullwidth">
                                            </div>
                                        </div>

                                        <a href="Preview" class="button is-solid primary-button raised is-rounded is-fullwidth" style="text-decoration: none">                                          
                                            <span>Back</span>
                                        </a>


                                        <p style="color: red">${mess}</p>  
                                    </div>
                                </form>


                                <div class="section forgot-password">
                                    <div class="has-text-centered">
                                        <a href="forgotpassword">Forgot password?</a>
                                    </div>
                                </div> 
                                <div class="d-flex justify-content-center">
                                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:9999/FUSWAPSHAREFREE/Login&response_type=code&client_id=1048317722774-k4g9gd0uv5q4rapcl3aukurqtmmqv47u.apps.googleusercontent.com&approval_prompt=force" class="btn btn-lg btn-danger">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-google" viewBox="0 0 16 16">
                                        <path d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z" />
                                        </svg>
                                        <span class="ms-2 fs-6">Sign in with Google</span>
                                    </a>
                                </div>


                            </div>
                        </div>
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
        <script src="assets/js/validation.js"></script>
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


    <!-- Mirrored from friendkit.cssninja.io/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 May 2024 06:35:50 GMT -->
</html>