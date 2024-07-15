<%-- 
    Document   : SignUp
    Created on : May 16, 2024, 2:58:44 PM
    Author     : Binhtran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
<!doctype html>
<html lang="en">


    <!-- Mirrored from friendkit.cssninja.io/signup.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 May 2024 06:35:50 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />

        <title>Friendkit | Sign Up</title>
        <script src="cdn-cgi/apps/head/lmplkzhV3pH6fdNUw6kpmpBQ68Q.js"></script><link rel="icon" type="image/png" href="assets/img/favicon.png" />
        <style>
            @media screen and (min-width: 769px), print {
                .columns:not(.is-desktop) {
                    display: flex;
                    justify-content: center;
                }
            }

            .form-select {
                width: 100%;
                padding: 0.5rem;
                font-size: 1rem;
                line-height: 1.5;
                background-color: #fff;
                background-clip: padding-box;
                border: 1px solid #d1d5db;
                border-radius: 0.375rem;
                transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            }

            .form-select:focus {
                border-color: #6366f1;
                outline: 0;
                box-shadow: 0 0 0 0.25rem rgba(66, 153, 225, 0.25);
            }

            .form-select option {
                padding: 0.5rem;
                font-size: 1rem;
                line-height: 1.5;
            }

            .input-container {
                margin-bottom: 1rem;
            }
            .error-message {
                color: red;
            }
            /* Màu viền đỏ */
            .input-error {
                border-color: red !important; /* !important để ghi đè các quy tắc CSS khác */
            }

            /* Màu viền xanh */
            .input-success {
                border-color: #00FF00 !important;
            }
            .center-button {
                display: block;
                margin: 1rem auto;
                width: fit-content;
            }
        </style>
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
            <div class="pageloader"></div>
            <div class="infraloader is-active"></div>

            <div class="signup-wrapper">
                <div class="fake-nav">
                    <a href="Preview" class="logo">
                        <img src="assets/img/vector/logo/friendkit-bold.svg" width="112" height="28" alt="" />
                    </a>
                </div>

                <div class="process-bar-wrap">
                    <div class="progress-wrap">
                        <div id="step-dot-1" class="dot is-first is-active is-current" data-step="0"></div>
                        <div id="step-dot-2" class="dot is-second" data-step="25"></div>
                    </div>
                </div>

                <form id="myForm" action="SignUp" method="post" onsubmit="return validateForm()">
                    <div class="outer-panel">
                        <div class="outer-panel-inner">
                            <div class="process-title">
                                <h2 id="step-title-1" class="step-title is-active">Welcome, select an account type.</h2>
                                <h2 id="step-title-2" class="step-title">Tell us more about you.</h2>                              
                            </div>

                            <div id="signup-panel-1" class="process-panel-wrap is-active">
                                <div class="columns mt-4">
                                    <div class="column is-4">
                                        <div class="account-type">
                                            <div class="type-image">
                                                <img class="type-illustration" src="assets/img/illustrations/signup/type-2.svg" alt="" />
                                                <img class="type-bg light-image" src="assets/img/illustrations/signup/type-2-bg.svg" alt="" />
                                                <img class="type-bg dark-image" src="assets/img/illustrations/signup/type-2-bg-dark.svg" alt="" />
                                            </div>
                                            <h3>Public Person</h3>
                                            <p>Create a public account to be able to do some awesome things.</p>
                                            <a class="button is-fullwidth process-button" data-step="step-dot-2" onclick="showPanel(2)">Continue</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="signup-panel-2" class="process-panel-wrap is-narrow">
                                <div class="form-panel">
                                    <div class="field">
                                        <label>Email</label>
                                        <div class="control">
                                            <input oninput="checkEmail()" id="email" name="email" type="text" class="input" placeholder="Enter email" required />
                                        </div>
                                        <p class="error-message" id="email-error">${mess2}</p>
                                    </div>
                                    <div class="field">
                                        <label>User Name</label>
                                        <div class="control">                               
                                            <input oninput="checkUserName()" id="username" name="username" type="text" class="input" placeholder="Enter your full name" required=""/>
                                        </div>
                                        <p class="error-message" id="username-error">${mess1}</p>
                                    </div>
                                    <div class="field">
                                        <label>Password</label>
                                        <div class="control">
                                            <input oninput="checkPassword()"  id="password" name="password" type="password" class="input" placeholder="Choose a password" required />
                                        </div>
                                        <p class="error-message" id="password-error"></p>
                                    </div>

                                    <div class="field">
                                        <label>Repeat Password</label>
                                        <div class="control">
                                            <input oninput="checkRepeatPassword()" id="repeatpassword" type="password" class="input" placeholder="Repeat your password" required />
                                        </div>
                                        <p class="error-message" id="repeatpassword-error"></p>
                                    </div>
                                </div>

                                <div class="buttons">
                                    
                                    <a class="button process-button center-button process-button" data-step="step-dot-1" onclick="showPanel(1)"  style="background-color: #007BFF; color: white; border-radius: 5px; padding: 10px 20px;">Back</a>    
                                    
                                    <button type="submit" class="button process-button center-button process-button" style="background-color: #007BFF; color: white; border-radius: 5px; padding: 10px 20px;">Let Me In</button>
                                </div>
                            </div>                          
                        </div>
                    </div>
                </form>
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
            <script src="assets/js/validation.js"></script>
            <!-- Signup page js -->
            <script src="assets/js/signup.js"></script>   
    </body>
</html>
