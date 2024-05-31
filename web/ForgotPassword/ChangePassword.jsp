<%-- 
    Document   : ChangePassword
    Created on : May 28, 2024, 12:08:14 AM
    Author     : Binhtran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <title>Friendkit | Change Password</title>
        <link rel="icon" type="image/png" href="assets/img/favicon.png" />
        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:600,700,800,900" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet" />
        <!-- Core CSS -->
        <link rel="stylesheet" href="assets/css/app.css" />
        <link rel="stylesheet" href="assets/css/core.css" />
    </head>

    <body class="is-white">
        <div class="login-wrapper">
            <div class="login-wrapper columns is-gapless">
                <div class="column is-6 is-hidden-mobile hero-banner">
                    <div class="hero is-fullheight is-login">
                        <div class="hero-body">
                            <div class="container">
                                <div class="left-caption">
                                    <h2>Change your password for better security.</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="column is-6">
                    <div class="hero form-hero is-fullheight">
                        <div class="logo-wrap">
                            <div class="wrap-inner">
                                <img src="assets/img/vector/logo/friendkit-white.svg" alt="" />
                            </div>
                        </div>
                        <div class="hero-body">
                            <div class="form-wrapper">
                                <form action="changepassword" method="POST" onsubmit="return validatePassword()">
                                    <div class="login-form">
                                        <div class="field">
                                            <div class="control">
                                                <input id="newPassword" name="newPassword" class="input" type="password" placeholder="New Password" required />
                                                <div class="input-icon">
                                                    <i data-feather="lock"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="field">
                                            <div class="control">
                                                <input id="confirmNewPassword" name="confirmNewPassword" class="input" type="password" placeholder="Confirm New Password" required />
                                                <div class="input-icon">
                                                    <i data-feather="lock"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="field">
                                            <div class="control">
                                                <input type="submit" value="Change Password" class="button is-solid primary-button raised is-rounded is-fullwidth">
                                            </div>
                                        </div>
                                        <p id="passwordStrengthMessage" style="color: red">${mess}</p>  
                                    </div>
                                </form>                             
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
        <!-- Additional js -->
        <script src="assets/js/main.js"></script>
        <script>
            function validatePassword() {
                const password = document.getElementById('newPassword').value;
                const confirmPassword = document.getElementById('confirmNewPassword').value;
                const message = document.getElementById('passwordStrengthMessage');

                // Basic password strength validation
                const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

                if (!regex.test(password)) {
                    message.textContent = 'Password must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, one number, and one special character.';
                    return false;
                }

                if (password !== confirmPassword) {
                    message.textContent = 'Passwords do not match.';
                    return false;
                }

                return true;
            }
        </script>
    </body>
</html>


