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
            <div class="fake-nav">
                <a href="index.html" class="logo">
                    <img src="assets/img/vector/logo/friendkit-bold.svg" width="112" height="28" alt="" />
                </a>
            </div>

            <div class="process-bar-wrap">
                <div class="process-bar">
                    <div class="progress-wrap">
                        <div class="track"></div>
                        <div class="bar"></div>
                        <div id="step-dot-1" class="dot is-first is-active is-current" data-step="0">
                            <i data-feather="smile"></i>
                        </div>
                        <div id="step-dot-2" class="dot is-second" data-step="25">
                            <i data-feather="user"></i>
                        </div>
                        <div id="step-dot-3" class="dot is-third" data-step="50">
                            <i data-feather="image"></i>
                        </div>
                        <div id="step-dot-4" class="dot is-fourth" data-step="75">
                            <i data-feather="lock"></i>
                        </div>
                        <div id="step-dot-5" class="dot is-fifth" data-step="100">
                            <i data-feather="flag"></i>
                        </div>
                    </div>
                </div>
            </div>
            <form action="SignUp" method="post"  onsubmit="return formValidate();">
                <div class="outer-panel">

                    <div class="outer-panel-inner">
                        <div class="process-title">
                            <h2 id="step-title-1" class="step-title is-active">
                                Welcome, select an account type.
                            </h2>
                            <h2 id="step-title-2" class="step-title">Tell us more about you.</h2>
                            <h2 id="step-title-3" class="step-title">Upload a profile picture.</h2>
                            <h2 id="step-title-4" class="step-title">Secure your account.</h2>
                            <h2 id="step-title-5" class="step-title">You're all set. Ready?</h2>
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
                                        <a class="button is-fullwidth process-button" data-step="step-dot-2">
                                            Continue
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="signup-panel-2" class="process-panel-wrap is-narrow">
                            <div class="form-panel">
                                <div class="field">
                                    <label>Full Name</label>
                                    <div class="control">
                                        <input oninput="checkFullName()" id="fullname" name="fullname" type="text" class="input" placeholder="Enter your full name" required=""/>
                                    </div>
                                </div>
                                <p class="error-message" id="fullname-error"></p>
                                <div class="field">
                                    <label>User name</label>
                                    <div class="control">
                                        <input oninput="checkUserName()" id="username" name="username" type="text" class="input" placeholder="Enter user name" required=""/>
                                    </div>

                                </div>
                                <p class="error-message" id="username-error">${mess1}</p>
                                <div id="addNewSnippet">
                                    <div class="input-container">
                                        <select name="district" class="form-select form-select-sm mb-3" id="district" aria-label=".form-select-sm" required="">
                                            <option value="" selected="">Select district</option>
                                            <option value="Quận Ba Đình">Quận Ba Đình</option><option value="Quận Hoàn Kiếm">Quận Hoàn Kiếm</option><option value="Quận Tây Hồ">Quận Tây Hồ</option><option value="Quận Long Biên">Quận Long Biên</option><option value="Quận Cầu Giấy">Quận Cầu Giấy</option><option value="Quận Đống Đa">Quận Đống Đa</option><option value="Quận Hai Bà Trưng">Quận Hai Bà Trưng</option><option value="Quận Hoàng Mai">Quận Hoàng Mai</option><option value="Quận Thanh Xuân">Quận Thanh Xuân</option><option value="Huyện Sóc Sơn">Huyện Sóc Sơn</option><option value="Huyện Đông Anh">Huyện Đông Anh</option><option value="Huyện Gia Lâm">Huyện Gia Lâm</option><option value="Quận Nam Từ Liêm">Quận Nam Từ Liêm</option><option value="Huyện Thanh Trì">Huyện Thanh Trì</option><option value="Quận Bắc Từ Liêm">Quận Bắc Từ Liêm</option><option value="Huyện Mê Linh">Huyện Mê Linh</option><option value="Quận Hà Đông">Quận Hà Đông</option><option value="Thị xã Sơn Tây">Thị xã Sơn Tây</option><option value="Huyện Ba Vì">Huyện Ba Vì</option><option value="Huyện Phúc Thọ">Huyện Phúc Thọ</option><option value="Huyện Đan Phượng">Huyện Đan Phượng</option><option value="Huyện Hoài Đức">Huyện Hoài Đức</option><option value="Huyện Quốc Oai">Huyện Quốc Oai</option><option value="Huyện Thạch Thất">Huyện Thạch Thất</option><option value="Huyện Chương Mỹ">Huyện Chương Mỹ</option><option value="Huyện Thanh Oai">Huyện Thanh Oai</option><option value="Huyện Thường Tín">Huyện Thường Tín</option><option value="Huyện Phú Xuyên">Huyện Phú Xuyên</option><option value="Huyện Ứng Hòa">Huyện Ứng Hòa</option><option value="Huyện Mỹ Đức">Huyện Mỹ Đức</option></select>  
                                    </div>
                                    <div class="input-container">
                                        <select name="ward" class="form-select form-select-sm" id="ward" aria-label=".form-select-sm" required="">
                                            <option value="" selected="">Select Ward</option>
                                            <option value="Xã Yên Trung">Xã Yên Trung</option><option value="Xã Yên Bình">Xã Yên Bình</option><option value="Xã Tiến Xuân">Xã Tiến Xuân</option><option value="Thị trấn Liên Quan">Thị trấn Liên Quan</option><option value="Xã Đại Đồng">Xã Đại Đồng</option><option value="Xã Cẩm Yên">Xã Cẩm Yên</option><option value="Xã Lại Thượng">Xã Lại Thượng</option><option value="Xã Phú Kim">Xã Phú Kim</option><option value="Xã Hương Ngải">Xã Hương Ngải</option><option value="Xã Canh Nậu">Xã Canh Nậu</option><option value="Xã Kim Quan">Xã Kim Quan</option><option value="Xã Dị Nậu">Xã Dị Nậu</option><option value="Xã Bình Yên">Xã Bình Yên</option><option value="Xã Chàng Sơn">Xã Chàng Sơn</option><option value="Xã Thạch Hoà">Xã Thạch Hoà</option><option value="Xã Cần Kiệm">Xã Cần Kiệm</option><option value="Xã Hữu Bằng">Xã Hữu Bằng</option><option value="Xã Phùng Xá">Xã Phùng Xá</option><option value="Xã Tân Xã">Xã Tân Xã</option><option value="Xã Thạch Xá">Xã Thạch Xá</option><option value="Xã Bình Phú">Xã Bình Phú</option><option value="Xã Hạ Bằng">Xã Hạ Bằng</option><option value="Xã Đồng Trúc">Xã Đồng Trúc</option></select>
                                    </div>
                                </div>
                                <div class="field">
                                    <label>Street Number</label>
                                    <div class="control">
                                        <input name="streetnumber" type="text" class="input" placeholder="Enter the street number" required=""/>
                                    </div>
                                </div>
                                <div class="field">
                                    <label>Email</label>
                                    <div class="control">
                                        <input oninput="checkEmail()"  id="email" name="email" type="text" class="input" placeholder="Enter email" required=""/>
                                    </div>
                                </div>
                                <p class="error-message" id="email-error">${mess2}</p>
                            </div>
                            <div class="buttons">
                                <a class="button process-button" data-step="step-dot-1">Back</a>
                                <a class="button process-button is-next" data-step="step-dot-3">Next</a>
                            </div>
                        </div>
                        <div id="signup-panel-3" class="process-panel-wrap is-narrow">
                            <div class="form-panel">
                                <div class="photo-upload">
                                    <div class="preview">
                                        <label for="imgPath" class="upload-button">
                                            <i data-feather="plus"></i>
                                        </label>
                                        <!--                                        <input type="file" id="imgPath" name="imgPath" accept="image/*" class="is-hidden" required>-->
                                        <img id="upload-preview" src="https://via.placeholder.com/150x150" data-demo-src="assets/img/avatars/avatar-w.png" alt="" />
                                    </div>
                                    <div class="limitation">
                                        <small>Only images with a size lower than 3MB are allowed.</small>
                                    </div>
                                </div>
                            </div>

                            <div class="buttons">
                                <a class="button process-button" data-step="step-dot-2">Back</a>
                                <a class="button process-button is-next" data-step="step-dot-4">Next</a>
                            </div>
                        </div>

                        <div id="signup-panel-4" class="process-panel-wrap is-narrow">
                            <div class="form-panel">
                                <div class="field">
                                    <label>Password</label>
                                    <div class="control">
                                        <input oninput="checkPassword()" name="password" id="password" type="password" class="input" placeholder="Choose a password" />

                                    </div>
                                </div>
                                <p class="error-message" id="password-error"></p>
                                <div class="field">
                                    <label>Repeat Password</label>
                                    <div class="control">
                                        <input oninput="checkPassword()" id="repeatpassword" type="password" class="input" placeholder="Repeat your password" />

                                    </div>
                                </div>
                                <p class="error-message" id="repeatpassword-error"></p>
                                <div class="field">
                                    <label>Phone Number</label>
                                    <div class="control">
                                        <input  oninput="checkPhoneNumber()" id="phone" name="phone" type="text" class="input" placeholder="Enter your phone number" />
                                    </div>
                                </div>
                                <p class="error-message" id="phone-error">${mess3}</p>
                            </div>

                            <div class="buttons">
                                <a class="button process-button" data-step="step-dot-3">Back</a>
                                <a class="button process-button is-next" data-step="step-dot-5">Next</a>
                            </div>
                        </div>

                        <div id="signup-panel-5" class="process-panel-wrap is-narrow">
                            <div class="form-panel">
                                <img class="success-image" src="assets/img/illustrations/signup/mailbox.svg" alt="" />
                                <div class="success-text">
                                    <h3>Congratz, you successfully created your account.</h3>
                                    <p>
                                        We just sent you a confirmation email. PLease confirm your account
                                        within 24 hours.
                                    </p>
                                    <button type="submit" class="button is-fullwidth">Let Me In</button>
                                    <a class="button process-button" data-step="step-dot-4">Back</a>
                                </div>
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
        <script>
                var districts = document.getElementById("district");
                var wards = document.getElementById("ward");
                var selectedCityValue = 'Thành phố Hà Nội';

                var Parameter = {
                    url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
                    method: "GET",
                    responseType: "application/json",
                };

                var promise = axios(Parameter);

                promise.then(function (result) {
                    var data = result.data;
                    var selectedCity = data.find((city) => city.Name === selectedCityValue);
                    renderDistricts(selectedCity.Districts);
                    selectDistrictOption(selectedCity.Districts);
                    selectWardOption(selectedCity.Districts);
                });

                function renderDistricts(districtsData) {
                    for (const district of districtsData) {
                        districts.options[districts.options.length] = new Option(district.Name, district.Name);
                    }

                    districts.onchange = function () {
                        wards.length = 1;
                        const selectedDistrict = districtsData.find((district) => district.Name === this.value);

                        if (this.value !== "") {
                            for (const ward of selectedDistrict.Wards) {
                                wards.options[wards.options.length] = new Option(ward.Name, ward.Name);
                            }
                        }
                    };
                }

                function selectDistrictOption(districtsData) {
                    for (let i = 0; i < districtsData.length; i++) {
                        if (districtsData[i].Name === 'Huyện Thạch Thất') {
                            districts.options[i + 1].selected = true;
                            simulateEvent(districts, 'change');
                            break;
                        }
                    }
                }

                function selectWardOption(districtsData) {
                    const selectedDistrict = districtsData.find((district) => district.Name === '${district}');
                    for (let i = 0; i < selectedDistrict.Wards.length; i++) {
                        if (selectedDistrict.Wards[i].Name === '${ward}') {
                            wards.options[i + 1].selected = true;
                            simulateEvent(wards, 'change');
                            break;
                        }
                    }
                }

                function simulateEvent(element, eventName) {
                    var event = new Event(eventName);
                    element.dispatchEvent(event);
                }


                document.getElementById('imgPath').addEventListener('change', function (event) {
                    const file = event.target.files[0];
                    if (file) {
                        const reader = new FileReader();
                        reader.onload = function (e) {
                            document.getElementById('upload-preview').src = e.target.result;
                        };
                        reader.readAsDataURL(file);
                    }
                });

        </script>
    </body>
</html>
