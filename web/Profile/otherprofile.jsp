<%-- 
    Document   : editprofile
    Created on : May 26, 2024, 7:25:14 PM
    Author     : haoto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">

    <!-- Mirrored from friendkit.cssninja.io/navbar-v2-profile-main.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 May 2024 06:39:09 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
    <head>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />

        <title>Friendkit | Feed</title>
        <script src="cdn-cgi/apps/head/lmplkzhV3pH6fdNUw6kpmpBQ68Q.js"></script><link rel="icon" type="image/png" href="assets/img/favicon.png" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>

        <style>
            .post-image {
                overflow: hidden;
                position: relative;
                width: 100%;
            }
            .style-img-post {
                display: flex;
                transition: transform 0.5s ease;
            }
            .style-img-post a {
                flex-shrink: 0;
                width: 100%;
            }
            .image-btn {
                position: absolute;
                top: 41%;
                width: 100%;
                display: flex;
                justify-content: space-between;
                transform: translateY(-50%);
                z-index: 1000;
            }
            .btn-image {
                font-size: 40px;
                color: white;
                cursor: pointer;
                user-select: none;
                position: absolute;
            }
            .btn-image-pre {
                left: 10px;
            }
            .btn-image-next {
                right: 10px;
            }
            form {
                max-width: 500px;
                margin: 0 auto;
                border-radius: 5px;
            }

            input[type="text"],
            input[type="number"],
            input[type="file"],
            select,
            textarea {
                width: 100%;
                padding: 10px;
                margin: 5px 0;
                border: 1px solid #ccc;
                border-radius: 3px;
                box-sizing: border-box;
            }

            input[type="submit"] {
                width: 100%;
                background-color: #007bff;
                color: #fff;
                padding: 10px;
                border: none;
                border-radius: 3px;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }
            .account-item {
                display: block;
                text-decoration: none;
                color: inherit;
                cursor: pointer;
            }
            .media {
                display: flex;
                align-items: center;
            }
            .icon-wrap {
                margin-right: 10px;
            }
            .button-link {
                border: none;
                background: none;
                padding: 0;
                cursor: pointer;
                color: inherit;
                font: inherit;
                display: block;
                width: 100%;
                text-align: left;
            }
        </style>

        <style>
            .account-item {
                display: block;
                text-decoration: none;
                color: inherit;
                cursor: pointer;
            }
            .media {
                display: flex;
                align-items: center;
            }
            .icon-wrap {
                margin-right: 10px;
            }
            .button-link {
                border: none;
                background: none;
                padding: 0;
                cursor: pointer;
                color: inherit;
                font: inherit;
                display: block;
                width: 100%;
                text-align: left;
            }
            .detail-row {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
            }

            .detail-row h2 {
                margin: 0;
                padding-right: 10px;
                font-size: 16px;
            }

            .detail-row p {
                margin: 0;
                font-size: 16px;
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
        <link href="../cdn.jsdelivr.net/npm/fontisto%40v3.0.4/css/fontisto/fontisto-brands.min.css" rel="stylesheet" />

        <!-- Core CSS -->
        <link rel="stylesheet" href="assets/css/app.css" />
        <link rel="stylesheet" href="assets/css/core.css" />


        <!-- JS edit location -->
        <script>
            document.addEventListener('DOMContentLoaded', (event) => {
                const openModalBtn = document.getElementById('open-modal-btn');
                const modal = document.getElementById('edit-location-modal');

                openModalBtn.addEventListener('click', () => {
                    modal.classList.add('is-active');
                });
            });
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
                    if (districtsData[i].Name === '${district}') {
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

            // Function to simulate change event
            function simulateEvent(element, eventName) {
                var event = new Event(eventName);
                element.dispatchEvent(event);
            }

        </script>

        <!-- JS edit Profile -->
        <script>
            document.addEventListener('DOMContentLoaded', (event) => {
                const openModalBtn = document.getElementById('open-modal-btn1');
                const modal = document.getElementById('edit-profile-modal');

                openModalBtn.addEventListener('click', () => {
                    modal.classList.add('is-active');
                });
            });
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
                    if (districtsData[i].Name === '${district}') {
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

            // Function to simulate change event
            function simulateEvent(element, eventName) {
                var event = new Event(eventName);
                element.dispatchEvent(event);
            }

        </script>

    </head>

    <body>
        <!-- Google Tag Manager (noscript) -->
        <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-KQHJPZP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>
        <!-- End Google Tag Manager (noscript) -->

        <!-- Pageloader -->
        <div class="pageloader"></div>
        <div class="infraloader is-active"></div>

        <div class="app-overlay"></div>

        <div class="navbar-v2">
            <div class="top-nav">
                <div class="left">
                    <div class="brand">
                        <a href="HomePage" class="navbar-logo">
                            <img class="logo light-image" src="assets/img/vector/logo/friendkit-bold.svg" width="112" height="28" alt="" />
                            <img class="logo dark-image" src="assets/img/vector/logo/friendkit-white.svg" width="112" height="28" alt="" />
                        </a>
                    </div>
                    <div class="search">
                        <div class="navbar-item">
                            <div id="global-search" class="control">
                                <input id="tipue_drop_input" class="input is-rounded" type="text" placeholder="Search" required />
                                <span id="clear-search" class="reset-search">
                                    <i data-feather="x"></i>
                                </span>
                                <span class="search-icon">
                                    <i data-feather="search"></i>
                                </span>

                                <div id="tipue_drop_content" class="tipue-drop-content"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="right">
                    <div class="navbar-item is-icon">
                        <a class="icon-link is-primary" href="CreatePost">
                            <i data-feather="plus"></i>
                            <span class="indicator"></span>
                        </a>
                    </div>
                    <div class="navbar-item is-icon drop-trigger">
                        <a class="icon-link is-friends" href="javascript:void(0);">
                            <i data-feather="heart"></i>
                            <span class="indicator"></span>
                        </a>

                        <div class="nav-drop is-right">
                            <div class="inner">
                                <div class="nav-drop-header">
                                    <span>Friend requests</span>
                                    <a href="#">
                                        <i data-feather="search"></i>
                                    </a>
                                </div>
                                <div class="nav-drop-body is-friend-requests">
                                    <!-- Friend request -->
                                    <div class="media">
                                        <figure class="media-left">
                                            <p class="image">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/bobby.jpg" alt="" />
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <a href="#">Bobby Brown</a>
                                            <span>Najeel verwick is a common friend</span>
                                        </div>
                                        <div class="media-right">
                                            <button class="button icon-button is-solid grey-button raised">
                                                <i data-feather="user-plus"></i>
                                            </button>
                                            <button class="button icon-button is-solid grey-button raised">
                                                <i data-feather="user-minus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <!-- Friend request -->
                                    <div class="media">
                                        <figure class="media-left">
                                            <p class="image">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/dan.jpg" alt="" />
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <a href="#">Dan Walker</a>
                                            <span>You have 4 common friends</span>
                                        </div>
                                        <div class="media-right">
                                            <button class="button icon-button is-solid grey-button raised">
                                                <i data-feather="user-plus"></i>
                                            </button>
                                            <button class="button icon-button is-solid grey-button raised">
                                                <i data-feather="user-minus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <!-- Friend request -->
                                    <div class="media">
                                        <figure class="media-left">
                                            <p class="image">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/nelly.png" alt="" />
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <span
                                                >You are now friends with <a href="#">Nelly Schwartz</a>. Check
                                                her <a href="#">profile</a>.</span>
                                        </div>
                                        <div class="media-right">
                                            <div class="added-icon">
                                                <i data-feather="tag"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Friend request -->
                                    <div class="media">
                                        <figure class="media-left">
                                            <p class="image">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/milly.jpg" alt="" />
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <a href="#">Milly Augustine</a>
                                            <span>You have 8 common friends</span>
                                        </div>
                                        <div class="media-right">
                                            <button class="button icon-button is-solid grey-button raised">
                                                <i data-feather="user-plus"></i>
                                            </button>
                                            <button class="button icon-button is-solid grey-button raised">
                                                <i data-feather="user-minus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <!-- Friend request -->
                                    <div class="media">
                                        <figure class="media-left">
                                            <p class="image">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" alt="" />
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <span
                                                >You are now friends with <a href="#">Elise Walker</a>. Check her
                                                <a href="#">profile</a>.</span>
                                        </div>
                                        <div class="media-right">
                                            <div class="added-icon">
                                                <i data-feather="tag"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Friend request -->
                                    <div class="media">
                                        <figure class="media-left">
                                            <p class="image">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/edward.jpeg" alt="" />
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <span
                                                >You are now friends with <a href="#">Edward Mayers</a>. Check his
                                                <a href="#">profile</a>.</span>
                                        </div>
                                        <div class="media-right">
                                            <div class="added-icon">
                                                <i data-feather="tag"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="nav-drop-footer">
                                    <a href="#">View All</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="navbar-item is-icon drop-trigger">
                        <a class="icon-link" href="javascript:void(0);">
                            <i data-feather="bell"></i>
                            <span class="indicator"></span>
                        </a>

                        <div class="nav-drop is-right">
                            <div class="inner">
                                <div class="nav-drop-header">
                                    <span>Notifications</span>
                                    <a href="#">
                                        <i data-feather="bell"></i>
                                    </a>
                                </div>
                                <div class="nav-drop-body is-notifications">
                                    <!-- Notification -->
                                    <div class="media">
                                        <figure class="media-left">
                                            <p class="image">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/david.jpg" alt="" />
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <span
                                                ><a href="#">David Kim</a> commented on
                                                <a href="#">your post</a>.</span>
                                            <span class="time">30 minutes ago</span>
                                        </div>
                                        <div class="media-right">
                                            <div class="added-icon">
                                                <i data-feather="message-square"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Notification -->
                                    <div class="media">
                                        <figure class="media-left">
                                            <p class="image">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/daniel.jpg" alt="" />
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <span
                                                ><a href="#">Daniel Wellington</a> liked your
                                                <a href="#">profile.</a></span>
                                            <span class="time">43 minutes ago</span>
                                        </div>
                                        <div class="media-right">
                                            <div class="added-icon">
                                                <i data-feather="heart"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Notification -->
                                    <div class="media">
                                        <figure class="media-left">
                                            <p class="image">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/stella.jpg" alt="" />
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <span
                                                ><a href="#">Stella Bergmann</a> shared a
                                                <a href="#">New video</a> on your wall.</span>
                                            <span class="time">Yesterday</span>
                                        </div>
                                        <div class="media-right">
                                            <div class="added-icon">
                                                <i data-feather="youtube"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Notification -->
                                    <div class="media">
                                        <figure class="media-left">
                                            <p class="image">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" alt="" />
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <span
                                                ><a href="#">Elise Walker</a> shared an <a href="#">Image</a> with
                                                you an 2 other people.</span>
                                            <span class="time">2 days ago</span>
                                        </div>
                                        <div class="media-right">
                                            <div class="added-icon">
                                                <i data-feather="image"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="nav-drop-footer">
                                    <a href="#">View All</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="navbar-item is-icon drop-trigger">
                        <a class="icon-link is-active" href="javascript:void(0);">
                            <i data-feather="mail"></i>
                            <span class="indicator"></span>
                        </a>

                        <div class="nav-drop is-right">
                            <div class="inner">
                                <div class="nav-drop-header">
                                    <span>Messages</span>
                                    <a href="messages-inbox.html">Inbox</a>
                                </div>
                                <div class="nav-drop-body is-friend-requests">
                                    <!-- Message -->
                                    <div class="media">
                                        <figure class="media-left">
                                            <p class="image">
                                                <img src="https://via.placeholder.com/150x150" data-demo-src="assets/img/avatars/nelly.png" data-user-popover="9" alt="" />
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <a href="#">Nelly Schwartz</a>
                                            <span
                                                >I think we should meet near the Starbucks so we can get...</span>
                                            <span class="time">Yesterday</span>
                                        </div>
                                        <div class="media-right is-centered">
                                            <div class="added-icon">
                                                <i data-feather="message-square"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Message -->
                                    <div class="media">
                                        <figure class="media-left">
                                            <p class="image">
                                                <img src="https://via.placeholder.com/150x150" data-demo-src="assets/img/avatars/edward.jpeg" data-user-popover="5" alt="" />
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <a href="#">Edward Mayers</a>
                                            <span
                                                >That was a real pleasure seeing you last time we really
                                                should...</span>
                                            <span class="time">last week</span>
                                        </div>
                                        <div class="media-right is-centered">
                                            <div class="added-icon">
                                                <i data-feather="message-square"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Message -->
                                    <div class="media">
                                        <figure class="media-left">
                                            <p class="image">
                                                <img src="https://via.placeholder.com/150x150" data-demo-src="assets/img/avatars/dan.jpg" data-user-popover="1" alt="" />
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <a href="#">Dan Walker</a>
                                            <span
                                                >Hey there, would it be possible to borrow your bicycle, i really
                                                need...</span>
                                            <span class="time">Jun 03 2018</span>
                                        </div>
                                        <div class="media-right is-centered">
                                            <div class="added-icon">
                                                <i data-feather="message-square"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="nav-drop-footer">
                                    <a href="#">Clear All</a>
                                </div>
                            </div>
                        </div>
                    </div>



                    <div id="account-dropdown" class="navbar-item is-account drop-trigger has-caret">
                        <div class="user-image">
                            <img src="https://via.placeholder.com/400x400" data-demo-src="${user1.avatarUrl}" alt="" />
                            <span class="indicator"></span>
                        </div>

                        <div class="nav-drop is-account-dropdown">
                            <div class="inner">
                                <div class="nav-drop-header">
                                    <span class="username">${user1.getFull_Name()}</span>
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
                                </div>

                                <div class="nav-drop-body account-items">
                                    <a id="profile-link" href="profile?id=${sessionScope.userInfo.getUserID()}" class="account-item">
                                        <div class="media">
                                            <div class="media-left">
                                                <div class="image">
                                                    <img src="https://via.placeholder.com/400x400" data-demo-src="${user1.avatarUrl}" alt="" />
                                                </div>
                                            </div>
                                            <div class="media-content">
                                                <h3>${user1.getFull_Name()}</h3>
                                                <small>Main account</small>
                                            </div>
                                            <div class="media-right">
                                                <i data-feather="check"></i>
                                            </div>
                                        </div>
                                    </a>
                                    <hr class="account-divider" />
                                    <c:if test="${sessionScope.userInfo.getUserID() == profile.getUserID()}">
                                         <a  class="account-item" >
                                        <div class="media" >
                                            <div class="icon-wrap">
                                                <i data-feather="map-pin"></i>
                                            </div>
                                            <div class="media-content" data-modal="edit-location-modal"  id="open-modal-btn" >
                                                <h3>Manage Location</h3>
                                                <small>Change your location here</small>
                                            </div>
                                        </div>
                                    </a>
                                    </c:if>
                                   
                                    <a href="options-settings.html" class="account-item">
                                        <div class="media">
                                            <div class="icon-wrap">
                                                <i data-feather="settings"></i>
                                            </div>
                                            <div class="media-content">
                                                <h3>Settings</h3>
                                                <small>Access widget settings.</small>
                                            </div>
                                        </div>
                                    </a>
                                    <a class="account-item">
                                        <div class="media">
                                            <div class="icon-wrap">
                                                <i data-feather="life-buoy"></i>
                                            </div>
                                            <div class="media-content">
                                                <h3>Help</h3>
                                                <small>Contact our support.</small>
                                            </div>
                                        </div>
                                    </a>
                                    <form action="logout" method="POST">
                                        <button type="submit" class="button-link account-item">
                                            <div class="media">
                                                <div class="icon-wrap">
                                                    <i data-feather="power"></i>
                                                </div>
                                                <div class="media-content">
                                                    <h3>Log out</h3>
                                                    <small>Log out from your account.</small>
                                                </div>
                                            </div>
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!--Search-->
                <div class="mobile-search is-hidden">
                    <div class="control">
                        <input id="tipue_drop_input_mobile" class="input" placeholder="Search..." />
                        <div class="form-icon">
                            <i data-feather="search"></i>
                        </div>
                        <div class="close-icon">
                            <i data-feather="x"></i>
                        </div>
                        <div id="tipue_drop_content_mobile" class="tipue-drop-content"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="view-wrapper">
            <div id="profile-main" class="navbar-v2-wrapper" style="padding-top: 14rem;">
                <div class="container is-custom">
                    <!-- Profile page main wrapper -->
                    <div class="view-wrap is-headless">
                        <div class="columns is-multiline no-margin">
                            <!-- Left side column -->
                            <div class="column is-paddingless">
                                <!-- Timeline Header -->
                                <!-- html/partials/pages/profile/timeline/timeline-header.html -->
                                <div class="cover-bg">
                                    <img class="cover-image" src="https://via.placeholder.com/1600x460" data-demo-src="assets/img/demo/bg/4.png" alt="" />
                                    <div class="avatar" style="margin-bottom: 60px;">
                                        <img id="user-avatar" class="avatar-image" src="https://via.placeholder.com/300x300" data-demo-src="${profile.getAvatarUrl()}" alt="" />
                                        <div class="avatar-button">
                                            <i data-feather="plus"></i>
                                        </div>
                                        <div class="pop-button is-far-left has-tooltip modal-trigger" data-modal="change-profile-pic-modal" data-placement="right" data-title="Change profile picture">
                                            <a class="inner" class="upload-button">

                                                <label for="imgPath"  >

                                                    <i data-feather="camera"></i>
                                                </label>
                                                <form action="editprofile" method="POST" enctype="multipart/form-data" id="uploadForm">
                                                    <input type="file" id="imgPath" name="imgPath" accept="image/*" required="" class="is-hidden" onchange="submitForm()" >
                                                </form>
                                            </a>


                                        </div>
                                        <div id="follow-pop" class="pop-button pop-shift is-left has-tooltip" data-placement="top" data-title="Subscription">
                                            <a class="inner">
                                                <i class="inactive-icon" data-feather="bell"></i>
                                                <i class="active-icon" data-feather="bell-off"></i>
                                            </a>
                                        </div>
                                        <div id="invite-pop" class="pop-button pop-shift is-center has-tooltip" data-placement="top" data-title="Relationship">
                                            <a href="#" class="inner">
                                                <i class="inactive-icon" data-feather="plus"></i>
                                                <i class="active-icon" data-feather="minus"></i>
                                            </a>
                                        </div>
                                        <div id="chat-pop" class="pop-button is-right has-tooltip" data-placement="top" data-title="Chat">
                                            <a class="inner">
                                                <i data-feather="message-circle"></i>
                                            </a>
                                        </div>
                                        <div class="pop-button is-far-right has-tooltip" data-placement="right" data-title="Block">
                                            <a href="messages-inbox.html" class="inner">
                                                <i data-feather="lock"></i>
                                            </a>
                                        </div>
                                    </div>

                                    <!--/html/partials/pages/profile/timeline/dropdowns/timeline-mobile-dropdown.html-->
                                    <div class="dropdown is-spaced is-right is-accent dropdown-trigger timeline-mobile-dropdown is-hidden-desktop">
                                        <div>
                                            <div class="button">
                                                <i data-feather="more-vertical"></i>
                                            </div>
                                        </div>
                                        <div class="dropdown-menu" role="menu">
                                            <div class="dropdown-content">
                                                <a href="profile-main.html" class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="activity"></i>
                                                        <div class="media-content">
                                                            <h3>Timeline</h3>
                                                            <small>Open Timeline.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a href="profile-about.html" class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="align-right"></i>
                                                        <div class="media-content">
                                                            <h3>About</h3>
                                                            <small>See about info.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a href="profile-friends.html" class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="heart"></i>
                                                        <div class="media-content">
                                                            <h3>Friends</h3>
                                                            <small>See friends.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a href="profile-photos.html" class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="image"></i>
                                                        <div class="media-content">
                                                            <h3>Photos</h3>
                                                            <small>See all photos.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>



                                <div class="profile-subheader">
                                    <div class="subheader-start is-hidden-mobile">
                                        <span>Incoming</span>
                                        <span>Incoming</span>
                                    </div>
                                    <div class="subheader-middle">
                                        <h2>${profile.getFull_Name()}</h2>

                                    </div>
                                    <div class="subheader-end is-hidden-mobile">

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="columns">
                            <div id="profile-timeline-widgets" class="column is-4">
                                <!-- Basic Infos widget -->
                                <!-- html/partials/pages/profile/timeline/widgets/basic-infos-widget.html -->
                                <c:if test="${sessionScope.userInfo.getUserID() == profile.getUserID()}" >
                                <div class="box-heading">
                                    <h4>User details</h4>
                                    <div class="dropdown is-neutral is-spaced is-right dropdown-trigger">
                                        <div>
                                            <div class="button">
                                                <i data-feather="more-vertical"></i>
                                            </div>
                                        </div>
                                        <div class="dropdown-menu" role="menu">
                                            <div class="dropdown-content" data-modal="edit-profile-modal"  id="open-modal-btn1">
                                                <a  class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="edit"></i>
                                                        <div class="media-content" >
                                                            <h3>Edit</h3>
                                                            <small>Change your profile here</small>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </c:if>

                                <div class="basic-infos-wrapper">
                                    <div class="card is-profile-info">
                                        <div class="info-row">
                                            <div>
                                                <span>Points</span>
                                                <a class="is-inverted">${profile.getPoint()}</a>
                                            </div>
                                            <i class="mdi mdi-star"></i>
                                        </div>
                                        <div class="info-row">
                                            <div>
                                                <span>Email</span>
                                                <a class="is-inverted">${profile.getEmail()}</a>
                                            </div>
                                            <i class="mdi mdi-mail"></i>
                                        </div>
                                        <div class="info-row">
                                            <div>
                                                <span>Phone</span>
                                                <a class="is-inverted">${profile.getPhone()}</a>
                                            </div>
                                            <i class="mdi mdi-phone"></i>
                                        </div>
                                        <div class="info-row">
                                            <div>
                                                <span>Address</span>
                                                <a class="is-inverted">${profile.getDistrict()},${profile.getCommune()} </a>
                                            </div>
                                            <i class="mdi mdi-map-marker"></i>
                                        </div>
                                    </div>
                                </div>

                                <!-- Photos widget -->
                                <!-- html/partials/pages/profile/timeline/widgets/photos-widget.html -->

                                <!-- Star friends widget -->
                                <!-- html/partials/pages/profile/timeline/widgets/star-friends-widget.html -->


                                <!-- Schedule calendar widget -->
                                <!-- html/partials/widgets/schedule/schedule-widget.html -->

                            </div>

                            <div class="column is-8">
                                <div id="profile-timeline-posts" class="box-heading">
                                    <h4>Posts</h4>
                                    <div class="button-wrap">
                                        <button type="button" class="button is-active">List Posts</button>
                                        <button type="button" class="button is-active">History</button>
                                    </div>
                                </div>
                                <c:forEach var="post" items="${myPost}"> 
                                    <div id="feed-post-1" class="card is-post">
                                        <!-- Main wrap -->
                                        <div class="content-wrap">
                                            <!-- Post header -->
                                            <div class="card-heading">
                                                <!-- User meta -->
                                                <div class="user-block" style="width: 100%;">
                                                    <div class="image" style="cursor: pointer;"  onclick="window.location.href = 'profile?id=${post.userID}'">
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="${post.getAvatarOwner()}" data-user-popover="1" alt="" />
                                                    </div>
                                                    <div class="user-info" style="width: 100%;">
                                                        <a class="post-name-owner"  href="profile?id=${post.userID}">${post.getFullNameOwner()}</a>
                                                        <span class="time" style="display: inline-block">${post.createTime}</span>
                                                        <span class="status-post-name" style="display: inline-block; padding: 0 10px; float: right;">${post.getStatusName()}</span>
                                                        <span class="type-post-name" style="display: inline-block; float: right;">${post.getTypeName()}</span>
                                                        <span class="quanlity-post" style="display: none; float: right;">${post.getQuanlityName()}</span>
                                                        <span class="addres-post" style="display: none; float: right;">${post.getAddress()}</span>
                                                        <span class="intrucstion-post" style="display: none; float: right;">${post.intructions}</span>

                                                    </div>
                                                </div>
                                                <!-- Right side dropdown -->
                                                <!-- /partials/pages/feed/dropdowns/feed-post-dropdown.html -->
                                                <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                    <div>
                                                        <div class="button">
                                                            <i data-feather="more-vertical"></i>
                                                        </div>
                                                    </div>
                                                    <div class="dropdown-menu" role="menu">
                                                        <div class="dropdown-content">
                                                            <c:if test="${post.avaiableEditPost(profile.userID)}">
                                                                <a class="dropdown-item open-modal-edit modal-trigger edit-modal-trigger" data-post-id="${post.postID}" data-post-title="${post.title}" data-post-quanlity="${post.quanlityID}" data-post-desc="${post.description}" data-post-intr="${post.intructions}" data-post-img="${post.imageUrl}" data-post-commune="${post.commune}"  data-post-district="${post.district}" data-post-street_Number="${post.street_Number}" >
                                                                    <div class="media">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"><path d="M12 3H5a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/><path d="M18.375 2.625a2.121 2.121 0 1 1 3 3L12 15l-4 1l1-4Z"/></g></svg>
                                                                        <div class="media-content">
                                                                            <h3>Edit</h3>
                                                                            <small>Edit your post.</small>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                            </c:if>
                                                            <c:if test="${post.avaiableArchivePost(profile.userID)}">
                                                                <a class="dropdown-item open-modal-archive" data-post-id="${post.postID}">
                                                                    <div class="media">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                                                                        <path fill="currentColor" d="M21 6a3 3 0 0 0-3-3H6a3 3 0 0 0-2 5.22V18a3 3 0 0 0 3 3h10a3 3 0 0 0 3-3V8.22A3 3 0 0 0 21 6M6 5h12a1 1 0 0 1 0 2H6a1 1 0 0 1 0-2m12 13a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V9h12Z"/>
                                                                        <rect width="6" height="2" x="9" y="12" fill="currentColor" rx=".87" ry=".87"/>
                                                                        </svg>
                                                                        <div class="media-content">
                                                                            <h3>Archive</h3>
                                                                            <small>Archive this post, others cannot see it</small>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <div class="post-text">
                                                    <h3 style="font-weight: 500; color: #6ba4e9; margin-bottom: 10px;">
                                                        ${post.title}
                                                    </h3>
                                                </div>
                                                <div class="post-text">
                                                    <p class="post-text-description">
                                                        ${post.description}
                                                    </p>
                                                </div>

                                                <!-- Featured image -->
                                                <div class="post-image">
                                                    <div class="style-img-post">
                                                        <a href="javascript:void(0);" class="modal-trigger post-detail post-open-detail" data-modal="share-modal">
                                                            <img class="element-img-post" src="https://via.placeholder.com/1600x900" data-demo-src="${post.imageUrl}" alt="" />
                                                        </a>
                                                        <a href="javascript:void(0);" class="modal-trigger post-detail post-open-detail" data-modal="share-modal">
                                                            <img class="element-img-post" src="https://via.placeholder.com/1600x900" data-demo-src="${post.imageUrl}" alt="" />
                                                        </a>
                                                        <a href="javascript:void(0);" class="modal-trigger post-detail post-open-detail" data-modal="share-modal">
                                                            <img class="element-img-post" src="https://via.placeholder.com/1600x900" data-demo-src="${post.imageUrl}" alt="" />
                                                        </a>
                                                        <a href="javascript:void(0);" class="modal-trigger post-detail post-open-detail" data-modal="share-modal">
                                                            <img class="element-img-post" src="https://via.placeholder.com/1600x900" data-demo-src="${post.imageUrl}" alt="" />
                                                        </a>
                                                    </div>
                                                    <div class="image-btn">
                                                        <div class="btn-image-next btn-image">&gt;</div>
                                                        <div class="btn-image-pre btn-image">&lt;</div>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="card-footer">
                                                <div class="social-count" style="margin-left: 0px;">
                                                    <div class="likes-count">
                                                        <i data-feather="heart"></i>
                                                        <span>27</span>
                                                    </div>
                                                    <div class="shares-count">
                                                        <i data-feather="link-2"></i>
                                                        <span>9</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach> 

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Edit profile -->
            <div id="edit-profile-modal" class="modal share-modal is-xsmall has-light-bg" >
                <div class="modal-background">
                    <div class="modal-content">
                        <div class="card">
                            <div class="card-heading">

                                <!-- Close X button -->
                                <div class="close-wrap">
                                    <span class="close-modal">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                                    </span>
                                </div>
                            </div>

                            <div class="card-body">
                                <div class="control">
                                    <form action="editprofile" id="edit-profile-modal" method="post" onsubmit="return FormValidate();">
                                        <div class="col-md-12">
                                            <label class="labels">Full Name</label>
                                            <input id="fname" name="name" type="text" class="form-control" value="${profile.getFull_Name()}">
                                            <div style="color: red" id="errorFname"></div>
                                        </div>
                                        <div class="col-md-12">
                                            <label class="labels">Email</label>
                                            <input id="email" name="email" type="text" class="form-control" value="${profile.getEmail()}">
                                            <div style="color: red" id="errorEmail"></div>
                                        </div>
                                        <div class="col-md-12">
                                            <label class="labels">Phone Number</label>
                                            <input id="phoneNum" name="phone" type="text" class="form-control" value="${profile.getPhone()}">
                                            <div style="color: red" id="errorPhone"></div>
                                        </div>
                                        <input type="submit" id="submit-update-profile1" style="display : none;" value="Submit">
                                    </form>
                                </div>
                            </div>
                            <div class="card-footer" >
                                <div class="close-modal" style="width: 98%; " >
                                    <button type="button" class="button is-solid primary-button" style="width: 95%;padding: 0 5px; background-color: #bfbfbf; border: none; color: #000;">
                                        Cancel
                                    </button>
                                </div>
                                <div class="button-wrap" style="width: 98%;">
                                    <button type="button" class="button is-solid primary-button" style="width: 95%; padding: 0 5px;" onclick="document.getElementById('submit-update-profile1').click();">
                                        Update
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Edit location -->
            <div id="edit-location-modal" class="modal share-modal is-xsmall has-light-bg" >
                <div class="modal-background">
                    <div class="modal-content">
                        <div class="card">
                            <div class="card-heading">

                                <!-- Close X button -->
                                <div class="close-wrap">
                                    <span class="close-modal">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                                    </span>
                                </div>
                            </div>

                            <div class="card-body">
                                <div class="control">
                                    <form action="managelocation" id="edit-location-modal" method="post">

                                        <div id="addNewSnippet" style="margin-top: 10px;">
                                            <div class="input-container" style="display: inline-block; width: 49%;">
                                                <select name="district" class="form-select form-select-sm mb-3" id="district" aria-label=".form-select-sm" required="">
                                                    <option value="" selected="">Select district</option>
                                                    <option value="Quận Ba Đình">Quận Ba Đình</option><option value="Quận Hoàn Kiếm">Quận Hoàn Kiếm</option><option value="Quận Tây Hồ">Quận Tây Hồ</option><option value="Quận Long Biên">Quận Long Biên</option><option value="Quận Cầu Giấy">Quận Cầu Giấy</option><option value="Quận Đống Đa">Quận Đống Đa</option><option value="Quận Hai Bà Trưng">Quận Hai Bà Trưng</option><option value="Quận Hoàng Mai">Quận Hoàng Mai</option><option value="Quận Thanh Xuân">Quận Thanh Xuân</option><option value="Huyện Sóc Sơn">Huyện Sóc Sơn</option><option value="Huyện Đông Anh">Huyện Đông Anh</option><option value="Huyện Gia Lâm">Huyện Gia Lâm</option><option value="Quận Nam Từ Liêm">Quận Nam Từ Liêm</option><option value="Huyện Thanh Trì">Huyện Thanh Trì</option><option value="Quận Bắc Từ Liêm">Quận Bắc Từ Liêm</option><option value="Huyện Mê Linh">Huyện Mê Linh</option><option value="Quận Hà Đông">Quận Hà Đông</option><option value="Thị xã Sơn Tây">Thị xã Sơn Tây</option><option value="Huyện Ba Vì">Huyện Ba Vì</option><option value="Huyện Phúc Thọ">Huyện Phúc Thọ</option><option value="Huyện Đan Phượng">Huyện Đan Phượng</option><option value="Huyện Hoài Đức">Huyện Hoài Đức</option><option value="Huyện Quốc Oai">Huyện Quốc Oai</option><option value="Huyện Thạch Thất">Huyện Thạch Thất</option><option value="Huyện Chương Mỹ">Huyện Chương Mỹ</option><option value="Huyện Thanh Oai">Huyện Thanh Oai</option><option value="Huyện Thường Tín">Huyện Thường Tín</option><option value="Huyện Phú Xuyên">Huyện Phú Xuyên</option><option value="Huyện Ứng Hòa">Huyện Ứng Hòa</option><option value="Huyện Mỹ Đức">Huyện Mỹ Đức</option></select>  
                                            </div>
                                            <div class="input-container" style="display: inline-block; width: 50%;">
                                                <select name="commune" class="form-select form-select-sm" id="ward" aria-label=".form-select-sm" required="">
                                                    <option value="" selected="">Select Ward</option>
                                                    <option value="Xã Yên Trung">Xã Yên Trung</option><option value="Xã Yên Bình">Xã Yên Bình</option><option value="Xã Tiến Xuân">Xã Tiến Xuân</option><option value="Thị trấn Liên Quan">Thị trấn Liên Quan</option><option value="Xã Đại Đồng">Xã Đại Đồng</option><option value="Xã Cẩm Yên">Xã Cẩm Yên</option><option value="Xã Lại Thượng">Xã Lại Thượng</option><option value="Xã Phú Kim">Xã Phú Kim</option><option value="Xã Hương Ngải">Xã Hương Ngải</option><option value="Xã Canh Nậu">Xã Canh Nậu</option><option value="Xã Kim Quan">Xã Kim Quan</option><option value="Xã Dị Nậu">Xã Dị Nậu</option><option value="Xã Bình Yên">Xã Bình Yên</option><option value="Xã Chàng Sơn">Xã Chàng Sơn</option><option value="Xã Thạch Hoà">Xã Thạch Hoà</option><option value="Xã Cần Kiệm">Xã Cần Kiệm</option><option value="Xã Hữu Bằng">Xã Hữu Bằng</option><option value="Xã Phùng Xá">Xã Phùng Xá</option><option value="Xã Tân Xã">Xã Tân Xã</option><option value="Xã Thạch Xá">Xã Thạch Xá</option><option value="Xã Bình Phú">Xã Bình Phú</option><option value="Xã Hạ Bằng">Xã Hạ Bằng</option><option value="Xã Đồng Trúc">Xã Đồng Trúc</option></select>
                                            </div>

                                            <input type="submit" id="submit-update-location" style="display : none;" value="Submit">
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="card-footer" >
                                <div class="close-modal" style="width: 98%; " >
                                    <button type="button" class="button is-solid primary-button" style="width: 95%;padding: 0 5px; background-color: #bfbfbf; border: none; color: #000;">
                                        Cancel
                                    </button>
                                </div>
                                <div class="button-wrap" style="width: 98%;">
                                    <button type="button" class="button is-solid primary-button" style="width: 95%; padding: 0 5px;" onclick="document.getElementById('submit-update-location').click();">
                                        Update
                                    </button>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div id="archive-post" class="modal albums-help-modal is-xsmall has-light-bg">
                <div class="modal-background"></div>
                <div class="modal-content">
                    <div class="card">
                        <div class="card-heading">
                            <h3>Archive Post?</h3>
                            <!-- Close X button -->
                            <div class="close-wrap">
                                <span class="close-modal">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                                </span>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="content-archive-post" style="margin: 20px 5px;">
                                <div class="help-text">
                                    <h3>Do you want to archive this post ?</h3>
                                </div>
                            </div>

                            <div class="action" style="text-align: right;">
                                <button type="button" class="button is-solid accent-button next-modal raised close-modal" data-modal="albums-modal" style="background-color: white; color: #5596e6; border: none;">
                                    Cancel
                                </button>
                                <button id="archivePostButton" type="button" class="button is-solid accent-button next-modal raised close-modal" data-modal="albums-modal">
                                    Archive Post
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Load more images -->
            <div class="load-more-wrap has-text-centered">
                <a href="#" class="load-more-button">Load More</a>
            </div>
            <!-- /Load more images -->

            <div id="create-post-modal" class="modal share-modal is-xsmall has-light-bg">
                <div class="modal-background"></div>
                <div class="modal-content">
                    <div class="card">
                        <div class="card-heading">

                            <!-- Close X button -->
                            <div class="close-wrap">
                                <span class="close-modal">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                                </span>
                            </div>
                        </div>

                        <div class="card-body">
                            <div class="control">
                                <form enctype="multipart/form-data" action="CreatePost2" id="create-post" method="post">
                                    <select id="type" name="typePost" required="">

                                        <option value="1" selected="">Exchange</option>

                                        <option value="2" selected="">Free</option>

                                    </select>
                                    <label for="imgPath">Image:</label>
                                    <input type="file" id="imgPath" name="imgPath" accept="image/*" required="">

                                    <label for="Title">Title:</label>
                                    <input type="text" id="title" name="title" required="">
                                    <label for="Title">Description: </label>
                                    <textarea class="textarea comment-textarea" name="description" rows="5" placeholder="e.g 2 x bottles of shampoo, almost full"></textarea>


                                    <label for="quanlity">Quanlity</label>
                                    <select id="quanlity" name="quanlity" required="">

                                        <option value="1">Used</option>

                                        <option value="2">Needs Repair</option>

                                        <option value="3">New</option>

                                    </select>


                                    <div id="addNewSnippet" style="margin-top: 10px;">
                                        <div class="input-container" style="display: inline-block; width: 49%;">
                                            <select name="district" class="form-select form-select-sm mb-3" id="district" aria-label=".form-select-sm" required="">
                                                <option value="" selected="">Select district</option>
                                                <option value="Quận Ba Đình">Quận Ba Đình</option><option value="Quận Hoàn Kiếm">Quận Hoàn Kiếm</option><option value="Quận Tây Hồ">Quận Tây Hồ</option><option value="Quận Long Biên">Quận Long Biên</option><option value="Quận Cầu Giấy">Quận Cầu Giấy</option><option value="Quận Đống Đa">Quận Đống Đa</option><option value="Quận Hai Bà Trưng">Quận Hai Bà Trưng</option><option value="Quận Hoàng Mai">Quận Hoàng Mai</option><option value="Quận Thanh Xuân">Quận Thanh Xuân</option><option value="Huyện Sóc Sơn">Huyện Sóc Sơn</option><option value="Huyện Đông Anh">Huyện Đông Anh</option><option value="Huyện Gia Lâm">Huyện Gia Lâm</option><option value="Quận Nam Từ Liêm">Quận Nam Từ Liêm</option><option value="Huyện Thanh Trì">Huyện Thanh Trì</option><option value="Quận Bắc Từ Liêm">Quận Bắc Từ Liêm</option><option value="Huyện Mê Linh">Huyện Mê Linh</option><option value="Quận Hà Đông">Quận Hà Đông</option><option value="Thị xã Sơn Tây">Thị xã Sơn Tây</option><option value="Huyện Ba Vì">Huyện Ba Vì</option><option value="Huyện Phúc Thọ">Huyện Phúc Thọ</option><option value="Huyện Đan Phượng">Huyện Đan Phượng</option><option value="Huyện Hoài Đức">Huyện Hoài Đức</option><option value="Huyện Quốc Oai">Huyện Quốc Oai</option><option value="Huyện Thạch Thất">Huyện Thạch Thất</option><option value="Huyện Chương Mỹ">Huyện Chương Mỹ</option><option value="Huyện Thanh Oai">Huyện Thanh Oai</option><option value="Huyện Thường Tín">Huyện Thường Tín</option><option value="Huyện Phú Xuyên">Huyện Phú Xuyên</option><option value="Huyện Ứng Hòa">Huyện Ứng Hòa</option><option value="Huyện Mỹ Đức">Huyện Mỹ Đức</option></select>  
                                        </div>
                                        <div class="input-container" style="display: inline-block; width: 50%;">
                                            <select name="ward" class="form-select form-select-sm" id="ward" aria-label=".form-select-sm" required="">
                                                <option value="" selected="">Select Ward</option>
                                                <option value="Xã Yên Trung">Xã Yên Trung</option><option value="Xã Yên Bình">Xã Yên Bình</option><option value="Xã Tiến Xuân">Xã Tiến Xuân</option><option value="Thị trấn Liên Quan">Thị trấn Liên Quan</option><option value="Xã Đại Đồng">Xã Đại Đồng</option><option value="Xã Cẩm Yên">Xã Cẩm Yên</option><option value="Xã Lại Thượng">Xã Lại Thượng</option><option value="Xã Phú Kim">Xã Phú Kim</option><option value="Xã Hương Ngải">Xã Hương Ngải</option><option value="Xã Canh Nậu">Xã Canh Nậu</option><option value="Xã Kim Quan">Xã Kim Quan</option><option value="Xã Dị Nậu">Xã Dị Nậu</option><option value="Xã Bình Yên">Xã Bình Yên</option><option value="Xã Chàng Sơn">Xã Chàng Sơn</option><option value="Xã Thạch Hoà">Xã Thạch Hoà</option><option value="Xã Cần Kiệm">Xã Cần Kiệm</option><option value="Xã Hữu Bằng">Xã Hữu Bằng</option><option value="Xã Phùng Xá">Xã Phùng Xá</option><option value="Xã Tân Xã">Xã Tân Xã</option><option value="Xã Thạch Xá">Xã Thạch Xá</option><option value="Xã Bình Phú">Xã Bình Phú</option><option value="Xã Hạ Bằng">Xã Hạ Bằng</option><option value="Xã Đồng Trúc">Xã Đồng Trúc</option></select>
                                        </div>
                                        <div class="input-container">
                                            <label>Street number</label>
                                            <input name="newAddress" id="Order_name" type="text" maxlength="255" value="" required="">
                                        </div>
                                    </div>
                                    <label>Expires Date<span class="required">*</span></label>
                                    <select name="expiresDate" class="form-select form-select-sm" id="expiresDate" aria-label=".form-select-sm" required="">
                                        <option value="1">1 Day</option>
                                        <option value="3" selected="">3 Days</option>
                                        <option value="7">7 Days</option>
                                        <option value="15">15 Days</option>
                                    </select>

                                    <label for="instructions">Pick-up instructions</label>
                                    <input type="text" id="instructions" name="instructions" required="" placeholder="Pick up today from 4 - 6pm. Please ring doorbell when here">




                                    <input type="submit" id="submit-create-post" style="display : none;" value="Submit">
                                </form>
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="button-wrap" style="width: 98%;">
                                <button type="button" class="button is-solid primary-button" style="width: 100%;" onclick="document.getElementById('submit-create-post').click();">
                                    Post
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="edit-post-modal" class="modal share-modal is-xsmall has-light-bg">
                <div class="modal-background"></div>
                <div class="modal-content">
                    <div class="card">
                        <div class="card-heading">
                            <div class="close-wrap">
                                <span class="close-modal">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                                </span>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="control">
                                <form enctype="multipart/form-data" action="editPost" id="create-post" method="post">
                                    <select id="type" name="typePost" required="">
                                        <option value="1" selected="">Exchange</option>
                                        <option value="2" selected="">Free</option>
                                    </select>
                                    <label for="imgPath">Image:</label>
                                    <input type="file" id="imgPath" name="imgPath" accept="image/*" required="">
                                    <div class="post-image">
                                        <div class="style-img-post">
                                           <img class="element-img-post" src="https://via.placeholder.com/1600x900" data-demo-src="FolderImages/ImagePost/69_image.jpg" alt="" />
                                           <img class="element-img-post" src="https://via.placeholder.com/1600x900" data-demo-src="FolderImages/ImagePost/69_image.jpg" alt="" />
                                           <img class="element-img-post" src="https://via.placeholder.com/1600x900" data-demo-src="FolderImages/ImagePost/69_image.jpg" alt="" />
                                           <img class="element-img-post" src="https://via.placeholder.com/1600x900" data-demo-src="FolderImages/ImagePost/69_image.jpg" alt="" />
                                        </div>
                                        <div class="image-btn">
                                            <div class="btn-image-next btn-image">&gt;</div>
                                            <div class="btn-image-pre btn-image">&lt;</div>
                                        </div>
                                    </div>
                                    <label for="Title">Title:</label>
                                    <input type="text" id="title" name="title" required="">
                                    <label for="Title">Description: </label>
                                    <textarea  id="edit-post-desc"class="textarea comment-textarea" name="description" rows="5" placeholder="e.g 2 x bottles of shampoo, almost full"></textarea>


                                    <label for="quanlity">Quanlity</label>
                                    <select id="quanlity" name="quanlity" required="">
                                        <option value="1">Used</option>
                                        <option value="2">Needs Repair</option>
                                        <option value="3">New</option>
                                    </select>
                                    <div id="addNewSnippet" style="margin-top: 10px;">
                                        <div class="input-container" style="display: inline-block; width: 49%;">
                                            <select name="district" class="form-select form-select-sm mb-3" id="district" aria-label=".form-select-sm" required="">
                                                <option value="" selected="">Select district</option>
                                                <option value="Quận Ba Đình">Quận Ba Đình</option><option value="Quận Hoàn Kiếm">Quận Hoàn Kiếm</option><option value="Quận Tây Hồ">Quận Tây Hồ</option><option value="Quận Long Biên">Quận Long Biên</option><option value="Quận Cầu Giấy">Quận Cầu Giấy</option><option value="Quận Đống Đa">Quận Đống Đa</option><option value="Quận Hai Bà Trưng">Quận Hai Bà Trưng</option><option value="Quận Hoàng Mai">Quận Hoàng Mai</option><option value="Quận Thanh Xuân">Quận Thanh Xuân</option><option value="Huyện Sóc Sơn">Huyện Sóc Sơn</option><option value="Huyện Đông Anh">Huyện Đông Anh</option><option value="Huyện Gia Lâm">Huyện Gia Lâm</option><option value="Quận Nam Từ Liêm">Quận Nam Từ Liêm</option><option value="Huyện Thanh Trì">Huyện Thanh Trì</option><option value="Quận Bắc Từ Liêm">Quận Bắc Từ Liêm</option><option value="Huyện Mê Linh">Huyện Mê Linh</option><option value="Quận Hà Đông">Quận Hà Đông</option><option value="Thị xã Sơn Tây">Thị xã Sơn Tây</option><option value="Huyện Ba Vì">Huyện Ba Vì</option><option value="Huyện Phúc Thọ">Huyện Phúc Thọ</option><option value="Huyện Đan Phượng">Huyện Đan Phượng</option><option value="Huyện Hoài Đức">Huyện Hoài Đức</option><option value="Huyện Quốc Oai">Huyện Quốc Oai</option><option value="Huyện Thạch Thất">Huyện Thạch Thất</option><option value="Huyện Chương Mỹ">Huyện Chương Mỹ</option><option value="Huyện Thanh Oai">Huyện Thanh Oai</option><option value="Huyện Thường Tín">Huyện Thường Tín</option><option value="Huyện Phú Xuyên">Huyện Phú Xuyên</option><option value="Huyện Ứng Hòa">Huyện Ứng Hòa</option><option value="Huyện Mỹ Đức">Huyện Mỹ Đức</option></select>  
                                        </div>
                                        <div class="input-container" style="display: inline-block; width: 50%;">
                                            <select name="ward" class="form-select form-select-sm" id="ward" aria-label=".form-select-sm" required="">
                                                <option value="" selected="">Select Ward</option>
                                                <option value="Xã Yên Trung">Xã Yên Trung</option><option value="Xã Yên Bình">Xã Yên Bình</option><option value="Xã Tiến Xuân">Xã Tiến Xuân</option><option value="Thị trấn Liên Quan">Thị trấn Liên Quan</option><option value="Xã Đại Đồng">Xã Đại Đồng</option><option value="Xã Cẩm Yên">Xã Cẩm Yên</option><option value="Xã Lại Thượng">Xã Lại Thượng</option><option value="Xã Phú Kim">Xã Phú Kim</option><option value="Xã Hương Ngải">Xã Hương Ngải</option><option value="Xã Canh Nậu">Xã Canh Nậu</option><option value="Xã Kim Quan">Xã Kim Quan</option><option value="Xã Dị Nậu">Xã Dị Nậu</option><option value="Xã Bình Yên">Xã Bình Yên</option><option value="Xã Chàng Sơn">Xã Chàng Sơn</option><option value="Xã Thạch Hoà">Xã Thạch Hoà</option><option value="Xã Cần Kiệm">Xã Cần Kiệm</option><option value="Xã Hữu Bằng">Xã Hữu Bằng</option><option value="Xã Phùng Xá">Xã Phùng Xá</option><option value="Xã Tân Xã">Xã Tân Xã</option><option value="Xã Thạch Xá">Xã Thạch Xá</option><option value="Xã Bình Phú">Xã Bình Phú</option><option value="Xã Hạ Bằng">Xã Hạ Bằng</option><option value="Xã Đồng Trúc">Xã Đồng Trúc</option></select>
                                        </div>
                                        <div class="input-container">
                                            <label>Street number</label>
                                            <input name="newAddress" id="Order_name" type="text" maxlength="255" value="" required="">
                                        </div>
                                    </div>
                                    <label for="instructions">Pick-up instructions</label>
                                    <input id="edit-post-inst" type="text" id="instructions" name="instructions" required="" placeholder="Pick up today from 4 - 6pm. Please ring doorbell when here">
                                    <input type="submit" id="submit-edit-post" style="display : none;" value="Submit">
                                </form>
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="button-wrap" style="width: 98%;">
                                <button id="saveEditPostButton" type="button" class="button is-solid primary-button" style="width: 100%;" onclick="document.getElementById('submit-edit-post').click();">
                                    Save
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="share-modal" class="modal share-modal is-xsmall has-light-bg">
                <div class="modal-background"></div>
                <div class="modal-content" style="width: 800px;">
                    <div class="card">
                        <div class="card-heading">
                            <!-- Close X button -->
                            <div class="close-wrap">
                                <span class="close-modal">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                                </span>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="shared-publication" style="margin-top: 0px;">
                                <div class="publication-meta">
                                    <div class="inner-flex" style="align-items: center; margin-bottom: 10px;">
                                        <div class="detail-post-header-left">
                                            <img style="cursor: pointer;" id="share-modal-avatar" src="http://example.com/avatar1.jpg" data-demo-src="http://example.com/avatar1.jpg" data-user-popover="1" alt="" onclick="window.location.href = 'profile?id=2'">
                                        </div>
                                        <div class="detail-post-header-right inner-flex" style="justify-content: space-between;flex-grow: 1;margin-left: 10px;margin-top: 8px;">
                                            <div class="detail-post-header-infor-owner">
                                                <h2 id="share-modal-name" style="cursor: pointer;font-weight: 500;" onclick="window.location.href = 'profile?id=2'">Nguyen Quang Trung</h2>
                                                <p style="padding-left: 0;" id="share-modal-date">2024-06-06 03:00:58.06</p>
                                            </div>
                                            <div class="detail-post-header-infor-post" style="margin-top: 16px;">
                                                <span id="share-modal-status" class="status-post-name" style="display: inline-block; padding: 0px 10px; float: right; color: rgb(54, 169, 85);">Expired</span>
                                                <span id="share-modal-type" class="type-post-name" style="display: inline-block; float: right; color: rgb(107, 164, 233);">Free</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="inner-flex" style="display: flex; flex-direction: column; align-items: flex-start; width: 100%;">
                                        <h2 id="share-modal-title" style=" color: rgb(107, 164, 233); padding-bottom: 3px;">
                                            Bài tập
                                        </h2>
                                        <p id="share-modal-text" style="max-height: none;padding: 0; width: 100%;">
                                            Initiate the construction of the blog HTML template using our advanced AI system, which produces template HTML code, CSS, and JS according to your input. Subsequently, you have the option to modify the template within the AI application.
                                        </p>
                                    </div>
                                </div>
                                <div class="featured-image">
                                    <img id="share-modal-image" src="FolderImages/ImagePost/70_image.jpg" data-demo-src="assets/img/demo/unsplash/1.jpg" alt="">
                                </div>
                                <div class="footer-detail-post" style="margin-top: 10px;">
                                    <div class="detail-row">
                                        <h2 style="font-weight: 500;">Quanlity:</h2>
                                        <p id="share-modal-quanlity">Used</p>
                                    </div>
                                    <div class="detail-row">
                                        <svg style="padding-right: 10px;" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-map-pin"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
                                        <p id="share-modal-address">Trọ Tuấn Cường, Xã Thạch Xá, Huyện Thạch Thất</p>
                                    </div>
                                    <div class="detail-row">
                                        <h2 style="font-weight: 500;">Instructions:</h2>
                                        <p id="share-modal-intruc">8-9pm</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer" style="width: 100%;">
                            <div class="button-wrap" style="width: 100%;">
                                <button style="width: 100%;" type="button" class="button is-solid primary-button close-modal">
                                    Request This
                                </button>
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
            <script src="assets/js/feed.js"></script>

            <!-- profile js -->
            <script src="assets/js/profile.js"></script>
            <script src="assets/js/jsslideimage.js"></script>

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

            <script>
                                                    var form1 = document.getElementById('edit-profile');
                                                    form1.addEventListener('submit', function (event) {
                                                        event.preventDefault();

                                                        var formData = new FormData(form1);

                                                        var xhr = new XMLHttpRequest();

                                                        xhr.open('POST', 'editprofile', true);

                                                        xhr.onload = function () {
                                                            if (xhr.status >= 200 && xhr.status < 300) {
                                                                const modal = document.getElementById('edit-profile-modal');
                                                                modal.classList.remove('is-active');

                                                                iziToast.show({
                                                                    maxWidth: "280px",
                                                                    class: "success-toast",
                                                                    icon: "mdi mdi-error",
                                                                    title: "",
                                                                    message: "Edit profile successfully",
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
                                                            } else {
                                                                const modal = document.getElementById('edit-profile-modal');
                                                                modal.classList.remove('is-active');
                                                                console.log('Success', xhr.responseText);
                                                                //                            var form = document.getElementById('edit-location');
                                                                iziToast.show({
                                                                    maxWidth: "280px",
                                                                    class: "success-toast",
                                                                    icon: "mdi mdi-error",
                                                                    title: "",
                                                                    message: "Edit profile failed",
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
                                                            }
                                                        };

                                                        xhr.onerror = function () {
                                                            console.error('Request failed');
                                                        };

                                                        xhr.send(formData);
                                                    });
            </script>

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

                var form2 = document.getElementById('edit-location');
                form2.addEventListener('submit', function (event) {
                    event.preventDefault();

                    var formData = new FormData(form2);

                    var xhr = new XMLHttpRequest();

                    xhr.open('POST', 'managelocation', true);

                    xhr.onload = function () {
                        if (xhr.status >= 200 && xhr.status < 300) {
                            const modal = document.getElementById('edit-location-modal');
                            modal.classList.remove('is-active');

                            iziToast.show({
                                maxWidth: "280px",
                                class: "success-toast",
                                icon: "mdi mdi-error",
                                title: "",
                                message: "Edit location successfully",
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
                        } else {
                            const modal = document.getElementById('edit-location-modal');
                            modal.classList.remove('is-active');
                            console.log('Success', xhr.responseText);
                            //                            var form = document.getElementById('edit-location');
                            iziToast.show({
                                maxWidth: "280px",
                                class: "success-toast",
                                icon: "mdi mdi-error",
                                title: "",
                                message: "Edit location failed",
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
                        }
                    };

                    xhr.onerror = function () {
                        console.error('Request failed');
                    };

                    xhr.send(formData);
                });
            </script>

            <script>
                function FormValidate() {
                    var isValid = true;

                    // Validate Full Name
                    var fname = document.getElementById('fname').value.trim();
                    var errorFname = document.getElementById('errorFname');
                    if (fname === "") {
                        errorFname.textContent = "Full Name is required";
                        isValid = false;
                    } else {
                        errorFname.textContent = "";
                    }

                    // Validate Email
                    var email = document.getElementById('email').value.trim();
                    var errorEmail = document.getElementById('errorEmail');
                    var reGexEmail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                    if (email === "") {
                        errorEmail.textContent = "Email is required";
                        isValid = false;
                    } else if (!reGexEmail.test(email)) {
                        errorEmail.textContent = "Please enter a valid email address";
                        isValid = false;
                    } else {
                        errorEmail.textContent = "";
                    }

                    // Validate Phone Number
                    var phoneNum = document.getElementById('phoneNum').value.trim();
                    var errorPhone = document.getElementById('errorPhone');
                    var reGexPhone = /(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\b/;
                    if (phoneNum === "") {
                        errorPhone.textContent = "Phone Number is required";
                        isValid = false;
                    } else if (!reGexPhone.test(phoneNum)) {
                        errorPhone.textContent = "Please enter a valid phone number";
                        isValid = false;
                    } else {
                        errorPhone.textContent = "";
                    }

                    return isValid;
                }

            </script>

            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    const statusElements = document.querySelectorAll('.status-post-name');
                    const typeElements = document.querySelectorAll('.type-post-name');
                    statusElements.forEach(function (element) {
                        const statusName = element.textContent.trim().toLowerCase();

                        if (statusName === 'available') {
                            element.style.color = '#36a955';
                        } else {
                            element.style.color = 'red';
                        }
                    });
                    typeElements.forEach(function (element) {
                        const statusName = element.textContent.trim().toLowerCase();

                        if (statusName === 'free') {
                            element.style.color = '#6ba4e9';
                        } else {
                            element.style.color = 'red';
                        }
                    });
                });
                function submitForm() {
                    document.getElementById('uploadForm').submit();
                }

                document.addEventListener("DOMContentLoaded", function () {
                    const openModalArchives = document.querySelectorAll('.open-modal-archive');
                    const modalArchive = document.getElementById('archive-post');
                    const archivePostButton = document.getElementById('archivePostButton');
                    let currentPostId = null;

                    openModalArchives.forEach(openModalArchive => {
                        openModalArchive.addEventListener('click', () => {
                            const postId = openModalArchive.getAttribute('data-post-id');
                            currentPostId = postId;
                            modalArchive.setAttribute('data-post-id', postId);
                            modalArchive.classList.add('is-active');
                        });
                    });

                    archivePostButton.addEventListener('click', () => {
                        if (currentPostId) {
                            const xhr = new XMLHttpRequest();
                            xhr.open('POST', 'PostArchive', true);
                            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                            xhr.onreadystatechange = function () {
                                if (xhr.readyState === 4 && xhr.status === 200) {
                                    console.log(xhr.responseText);
                                    iziToast.show({
                                        maxWidth: "280px",
                                        class: "success-toast",
                                        icon: "mdi mdi-check",
                                        title: "",
                                        message: "Archive post successfully",
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
                                    modalArchive.classList.remove('is-active');
                                }
                            };
                            xhr.send('id=' + currentPostId);
                        }
                    });
                });

                document.addEventListener("DOMContentLoaded", function () {
                    const openModalEditPost = document.querySelectorAll('.open-modal-edit');
                    const modalEditPost = document.getElementById('edit-post-modal');
                    const saveEditPostButton = document.getElementById('saveEditPostButton');

                    openModalEditPost.forEach(openModalEdit => {
                        openModalEdit.addEventListener('click', () => {
                            modalEditPost.setAttribute('data-post-id', openModalEdit.getAttribute('data-post-id'));
                            modalEditPost.querySelector('input[name="title"]').value = openModalEdit.getAttribute('data-post-title');
                            const selectQuanlity = modalEditPost.querySelector('select[name="quanlity"]');
                            const optionQuanlity = selectQuanlity.querySelectorAll('option');
                            optionQuanlity.forEach(option => {
                                if (option.value === openModalEdit.getAttribute('data-post-quanlity')) {
                                    option.selected = true;
                                } else {
                                    option.selected = false;
                                }
                            });
                            modalEditPost.querySelector('textarea[name="description"]').value = openModalEdit.getAttribute('data-post-desc');
                            const selectDistrict = modalEditPost.querySelector('select[name="district"]');
                            const optionDistrict = selectDistrict.querySelectorAll('option');
                            optionDistrict.forEach(option => {
                                if (option.value === openModalEdit.getAttribute('data-post-district')) {
                                    option.selected = true;
                                } else {
                                    option.selected = false;
                                }
                            });
                            const selectWard = modalEditPost.querySelector('select[name="ward"]');
                            const optionWard = selectWard.querySelectorAll('option');
                            optionWard.forEach(option => {
                                if (option.value === openModalEdit.getAttribute('data-post-commune')) {
                                    option.selected = true;
                                } else {
                                    option.selected = false;
                                }
                            });
                            modalEditPost.querySelector('input[name="newAddress"]').value = openModalEdit.getAttribute('data-post-street_Number');
                            modalEditPost.querySelector('input[name="instructions"]').value = openModalEdit.getAttribute('data-post-intr');


                            modalEditPost.classList.add('is-active');
                        });
                    });
                });
            </script>
    </body>


    <!-- Mirrored from friendkit.cssninja.io/navbar-v2-profile-main.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 May 2024 06:39:10 GMT -->
</html>