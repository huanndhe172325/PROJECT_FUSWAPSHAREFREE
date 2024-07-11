<%-- 
    Document   : ForgotPassword
    Created on : May 23, 2024, 4:11:03 PM
    Author     : Binhtran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


    <!-- Mirrored from friendkit.cssninja.io/login-minimal.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 May 2024 06:39:28 GMT -->
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

        <!-- Check Validation Email -->

        <script>
            function validateEmail(email) {
                const emaiRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                return emaiRegex.test(email);
            }
            function validateForm() {
                const email = document.getElementById('email').value;
                if (!validateEmail(email)) {
                    alert('Please enter a valid email address.');
                    return false;
                }
                return true;
            }

        </script>


        <!-- End Google Tag Manager -->

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:600,700,800,900" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet" />
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

        <div class="signup-wrapper">
            <!--Fake navigation-->
            <div class="fake-nav">
                <a href="Preview" class="logo">
                    <img class="light-image" src="assets/img/vector/logo/friendkit-bold.svg" width="112" height="28" alt="" />
                    <img class="dark-image" src="assets/img/vector/logo/friendkit-white.svg" width="112" height="28" alt="" />
                </a>
            </div>

            <div class="container">
                <!--Container-->
                <div class="login-container">
                    <div class="columns is-vcentered">
                        <div class="column is-6 image-column">
                            <!--Illustration-->
                            <img class="light-image login-image" src="assets/img/illustrations/login/login.svg" alt="" />
                            <img class="dark-image login-image" src="assets/img/illustrations/login/login-dark.svg" alt="" />
                        </div>
                        <div class="column is-6">
                            <h2 class="form-title">Password Recovery</h2>
                            <h3 class="form-subtitle">Enter your email to change password</h3>

                            <!--Form-->
                            <form action="forgotpassword" method="POST" onsubmit="return validateForm()">
                                <div class="login-form">
                                    <div class="form-panel">
                                        <div class="field">
                                            <label>Email</label>
                                            <div class="control">
                                                <input name="email" id="email" type="text" class="input" placeholder="Enter your email address" required=""/>
                                            </div>
                                        </div>
                                        <div class="field">
                                            <div class="control">
                                                <button type="submit" class="button is-primary">Submit</button>
                                                 <a href="Preview" class="button is-primary float-end">Back</a>
                                            </div>
                                           
                                        </div>
                                        <p style="color: red">${msg}</p> 
                                    </div>                       
                                </div>
                            </form>

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


    <!-- Mirrored from friendkit.cssninja.io/login-minimal.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 May 2024 06:39:30 GMT -->
</html>
