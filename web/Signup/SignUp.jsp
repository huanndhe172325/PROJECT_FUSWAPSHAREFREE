<%-- 
    Document   : SignUp
    Created on : May 16, 2024, 2:58:44 PM
    Author     : Anhnh
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
            <div class="fake-nav">
                <a href="Preview" class="logo">
                    <img src="assets/img/vector/logo/friendkit-bold.svg" width="112" height="28" alt="" />
                </a>
            </div>

            <div class="signup-wrapper">
                <!--Fake navigation-->


                <div class="container">
                    <!--Container-->
                    <div class="login-container is-centered">
                        <div class="columns is-vcentered">
                            <div class="column">

                                <h3 class="form-subtitle has-text-centered">
                                    Lets create your account.
                                </h3>

                                <!--Form-->
                                <form action="Signup" method="POST">
                                    <div class="login-form">
                                        <p class="text-white-50 mb-5"><%=request.getAttribute("mess")!=null?request.getAttribute("mess"):""%></p>
                                        <div class="form-panel">
                                            <div class="columns is-multiline">
                                                <div class="column is-6">
                                                    <div class="field">
                                                        <label class="form-label" for="typeFullNameX">Full Name</label>
                                                        <div class="control">
                                                            <input name="fname" type="fname" id="typeFullNameX" class="input" placeholder="Enter your Full Name" value=""/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="column is-6">
                                                    <div class="field">
                                                        <label>Username</label>
                                                        <div class="control">
                                                            <input name="username" type="username" id="typeUserNameX" class="input" placeholder="Enter your Username" value=""/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="column is-6">
                                                    <div class="field">
                                                        <label>Password</label>
                                                        <div class="control">
                                                            <input name="pass" type="password" id="TypePasswordX" class="input" placeholder="Enter your password" value=""/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="column is-6">
                                                    <div class="field">
                                                        <label>Re-password</label>
                                                        <div class="control">
                                                            <input name="repass" type="password" id="TypePasswordX" class="input" placeholder="Enter your Re-password" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="column is-12">
                                                    <div class="field">
                                                        <label>Email</label>
                                                        <div class="control">
                                                            <input name="email" type="email" id="typeEmailX" class="input" placeholder="Enter your email address" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="column is-12">
                                                    <div class="field">
                                                        <label>Phone</label>
                                                        <div class="control">
                                                            <input name="phone"type="phone" id="typePhoneX" class="input" placeholder="Enter your Phone" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <select  name="city" class="form-select form-select-sm mb-3" id="city" aria-label=".form-select-sm">
                                                    <option value=""  selected>Chọn tỉnh thành</option>           
                                                </select> 
                                                <select name="district" type="district"  class="form-select form-select-sm mb-3" id="district" aria-label=".form-select-sm">
                                                    <option value="" selected>Chọn quận huyện</option>
                                                </select>  
                                                <select name="commune" type="commune" class="form-select form-select-sm" id="ward" aria-label=".form-select-sm">
                                                    <option value="" selected>Chọn phường xã</option>
                                                </select>   
                                                

                                                <div class="column is-12">
                                                    <div class="field">
                                                        <label>Streetnumber</label>
                                                        <div class="control">
                                                            <input name="streetnumber"type="streetnumber" id="typeStreetnumberX" class="input" placeholder="Enter your Streetnumber" />
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                        <button class="buttons mt-2" type="submit">
                                            <a class="button is-solid primary-button is-fullwidth raised" >Create Account</a>
                                        </button>


                                    </div>
                                </form>
                                <div class="account-link has-text-centered">
                                    <a href="Login">Have an account? Sign In</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>


        <!--Edit Credit card Modal-->



        <script>
            var cities = document.getElementById("city");
            var districts = document.getElementById("district");
            var wards = document.getElementById("ward");
            var selectedCityValue = '${city}'; // Replace with the actual value of the selected city

            var Parameter = {
                url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
                method: "GET",
                responseType: "application/json",
            };

            var promise = axios(Parameter);

            promise.then(function (result) {
                renderCity(result.data);
                selectCityOption(result.data);
                selectDistrictOption(result.data);
                selectWardOption(result.data);
            });

            function selectCityOption(data) {
                for (let i = 0; i < cities.options.length; i++) {
                    if (cities.options[i].value === selectedCityValue) {
                        cities.options[i].selected = true;
                        // Trigger change event to populate districts and wards
                        simulateEvent(cities, 'change');
                        break;
                    }
                }
            }
            function selectDistrictOption(data) {
                const selectedCity = data.find((city) => city.Name === selectedCityValue);
                for (let i = 0; i < selectedCity.Districts.length; i++) {
                    if (selectedCity.Districts[i].Name === '${district}') {
                        districts.options[i + 1].selected = true; // Plus 1 to account for the initial "Chọn quận huyện" option
                        simulateEvent(districts, 'change');
                        break;
                    }
                }
            }

            function selectWardOption(data) {
                const selectedCity = data.find((city) => city.Name === selectedCityValue);
                const selectedDistrict = selectedCity.Districts.find((district) => district.Name === '${district}');
                for (let i = 0; i < selectedDistrict.Wards.length; i++) {
                    if (selectedDistrict.Wards[i].Name === '${ward}') {
                        wards.options[i + 1].selected = true; // Plus 1 to account for the initial "Chọn phường xã" option
                        simulateEvent(wards, 'change');
                        break;
                    }
                }
            }
            function renderCity(data) {
                for (const city of data) {
                    cities.options[cities.options.length] = new Option(city.Name, city.Name); // Use "Name" as both value and text.
                }

                cities.onchange = function () {
                    districts.length = 1;
                    wards.length = 1;

                    if (this.value !== "") {
                        const selectedCity = data.find((city) => city.Name === this.value);

                        for (const district of selectedCity.Districts) {
                            districts.options[districts.options.length] = new Option(district.Name, district.Name); // Use "Name" as both value and text.
                        }
                    }
                };

                districts.onchange = function () {
                    wards.length = 1;
                    const selectedCity = data.find((city) => city.Name === cities.value);
                    const selectedDistrict = selectedCity.Districts.find((district) => district.Name === this.value);

                    if (this.value !== "") {
                        for (const ward of selectedDistrict.Wards) {
                            wards.options[wards.options.length] = new Option(ward.Name, ward.Name); // Use "Name" as both value and text.
                        }
                    }
                };
            }

            // Function to simulate change event
            function simulateEvent(element, eventName) {
                var event = new Event(eventName);
                element.dispatchEvent(event);
            }
            function sendback() {
                window.location.href = "Preview";
            }

        </script>
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
        <script src="assets/js/signup.js"></script>

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


    <!-- Mirrored from friendkit.cssninja.io/signup.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 May 2024 06:35:55 GMT -->
</html>
