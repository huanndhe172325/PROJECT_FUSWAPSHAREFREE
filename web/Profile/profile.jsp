<%-- 
    Document   : editprofile
    Created on : May 26, 2024, 7:25:14 PM
    Author     : haoto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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

        <!-- JS list block User -->
        <script>
            document.addEventListener('DOMContentLoaded', (event) => {
                const openModalBtn = document.getElementById('list-block-btn');
                const modal = document.getElementById('list-block-modal');
                const userBlockingAddBtn = document.querySelector('.user-blocking-initial__add-btn');
                const userBlockingPopup = document.getElementById('userBlockingPopup');
                const listBlockedUsers = document.getElementById('listBlockedUsers');
                const backBtn = document.querySelector('.user-blocking-popup__back-btn');
                const closeBtn = document.querySelector('.user-blocking-popup__close-btn');
                const closeModal = document.querySelector('.close-modal');
                openModalBtn.addEventListener('click', () => {
                    modal.classList.add('is-active');
                });
                userBlockingAddBtn.addEventListener('click', () => {
                    listBlockedUsers.style.display = 'none';
                    userBlockingPopup.style.display = 'block';
                });
                function showListBlockedUsers() {
                    userBlockingPopup.style.display = 'none';
                    listBlockedUsers.style.display = 'block';
                }

                backBtn.addEventListener('click', showListBlockedUsers);
                closeBtn.addEventListener('click', showListBlockedUsers);
                closeModal.addEventListener('click', () => {
                    modal.classList.remove('is-active');
                });
            });
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
                                <span class="search-icon" style="margin: 5px">
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
                            <img src="https://via.placeholder.com/400x400" data-demo-src="${profile.avatarUrl}" alt="" />
                            <span class="indicator"></span>
                        </div>

                        <div class="nav-drop is-account-dropdown">
                            <div class="inner">
                                <div class="nav-drop-header">
                                    <span class="username">${profile.getFull_Name()}</span>
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
                                                    <img src="https://via.placeholder.com/400x400" data-demo-src="${profile.avatarUrl}" alt="" />
                                                </div>
                                            </div>
                                            <div class="media-content">
                                                <h3>${profile.getFull_Name()}</h3>
                                                <small>Main account</small>
                                            </div>
                                            <div class="media-right">
                                                <i data-feather="check"></i>
                                            </div>
                                        </div>
                                    </a>
                                    <hr class="account-divider" />
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

                                    <a class="account-item" >
                                        <div class="media">
                                            <div class="icon-wrap">
                                                <i data-feather="list"></i>
                                            </div>
                                            <div class="media-content" data-modal="list-block-modal"  id="list-block-btn">
                                                <h3>List Users Blocked</h3>
                                                <small>Users blocked</small>
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
                                    <!--                                    <img class="cover-image" src="https://via.placeholder.com/1600x460" data-demo-src="assets/img/demo/bg/4.png" alt="" />-->
                                    <div class="avatar" style="margin-bottom: 60px;">
                                        <img id="user-avatar" class="avatar-image" src="${profile.avatarUrl}" alt="" />
                                        <div class="avatar-button">
                                            <i data-feather="plus"></i>
                                        </div>

                                        <div class="pop-button is-far-left has-tooltip modal-trigger" data-modal="change-profile-pic-modal" data-placement="right" data-title="Change profile picture">
                                            <form action="UpdateImage" method="POST" enctype="multipart/form-data">
                                                <label for="imgAvatar" class="inner upload-button">
                                                    <i style="margin: 7px;" data-feather="camera"></i>
                                                </label>
                                                <input type="file" id="imgAvatar" name="imgAvatar" accept="image/*" required="" class="is-hidden" onchange="this.form.submit()">
                                            </form>
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
                                        <div class="pop-button is-far-right has-tooltip" data-placement="right" data-title="Send message">
                                            <a href="messages-inbox.html" class="inner">
                                                <i data-feather="mail"></i>
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
                                        z-index: 10;
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

                                    #btn-all,
                                    #btn-newest,
                                    #btn-exchange,
                                    #btn-free,
                                    #btn-quality {
                                        background-color: #007bff;
                                        color: white;
                                        border-color: #007bff;
                                    }

                                    /* Thiết lập màu khi di chuột qua */
                                    #btn-all:hover,
                                    #btn-newest:hover,
                                    #btn-exchange:hover,
                                    #btn-free:hover,
                                    #btn-quality:hover {
                                        background-color: #0056b3;
                                        border-color: #0056b3;
                                    }
                                    .quality-options {
                                        display: flex;
                                        flex-wrap: wrap;
                                        justify-content: center;
                                        margin-top: 10px;
                                    }

                                    .quality-button {
                                        position: relative;
                                        display: inline-block;
                                    }

                                    .quality-options {
                                        position: absolute;
                                        top: 100%;
                                        left: 0;
                                        z-index: 1;
                                        display: none;
                                        background-color: #f9f9f9;
                                        box-shadow: 0 8px 16px rgba(0,0,0,0.1);
                                        padding: 5px;
                                        min-width: auto;
                                    }

                                    .quality-options button {
                                        display: block;
                                        width: 100%;
                                        padding: 10px;
                                        text-align: left;
                                        border: none;
                                        background-color: transparent;
                                        cursor: pointer;
                                    }

                                    .quality-options button:hover {
                                        background-color: #f1f1f1;
                                    }
                                    /* CSS cho hình ảnh */
                                    .user-post-image1 img {
                                        width: 500px;
                                        height: 300px; /* Điều chỉnh chiều cao của ảnh */
                                        object-fit: cover; /* Đảm bảo ảnh không bị bóp méo */
                                    }

                                    /* CSS cho nút điều hướng */
                                    .user-image-btn1 button {
                                        background: rgba(255, 255, 255, 0.7);
                                        border: none;
                                        border-radius: 50%;
                                        padding: 10px;
                                        cursor: pointer;
                                        font-size: 1.5em; /* Kích thước phù hợp */
                                    }

                                    /* CSS cho nút điều hướng của người dùng */
                                    .user-navigation-buttons button {
                                        padding: 10px 20px;
                                        background-color: #4267B2;
                                        color: white;
                                        border: none;
                                        border-radius: 4px;
                                        cursor: pointer;
                                    }

                                    .user-navigation-buttons button:hover {
                                        background-color: #345498;
                                    }
                                    #user-near-me-post-container1 {
                                        max-width: 600px;
                                        margin: auto;
                                        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                                        border-radius: 8px;
                                        overflow: hidden;
                                        background-color: #f5f5f5;
                                        padding: 15px;
                                    }

                                    /* Phần tiêu đề */
                                    #user-near-me-post-container1 h4 {
                                        margin: 0;
                                        font-size: 20px;
                                        color: #333;
                                        text-align: center;
                                    }

                                    /* Card của sản phẩm */
                                    .user-product-card1 {
                                        margin-top: 15px;
                                    }

                                    /* Hình ảnh bài đăng */
                                    .user-post-image1 {
                                        position: relative;
                                        height: 300px;
                                        overflow: hidden;
                                    }

                                    /* Nút điều hướng hình ảnh */
                                    .user-image-btn1 {
                                        position: absolute;
                                        top: 50%;
                                        left: 0;
                                        right: 0;
                                        transform: translateY(-50%);
                                        display: flex;
                                        justify-content: space-between;
                                        padding: 0 10px;
                                    }

                                    .user-image-btn1 button {
                                        background: rgba(255, 255, 255, 0.7);
                                        border: none;
                                        border-radius: 50%;
                                        padding: 10px;
                                        cursor: pointer;
                                    }

                                    /* Thông tin sản phẩm */
                                    .user-product-info1 {
                                        padding: 15px;
                                        background-color: #fff;
                                        border-radius: 8px;
                                        margin-top: -10px;
                                    }

                                    /* Tiêu đề bài đăng */
                                    #user-post-title1 {
                                        margin: 0 0 10px;
                                        font-size: 18px;
                                        color: #6ba4e9;
                                        font-weight: bold;
                                    }

                                    /* Mô tả bài đăng */
                                    #user-post-description1 {
                                        margin: 0;
                                        font-size: 14px;
                                        color: #666;
                                    }

                                    /* Các thông tin nhỏ bên dưới */
                                    .user-product-info1 p {
                                        margin: 5px 0;
                                    }

                                    /* Nút điều hướng sản phẩm */
                                    .user-navigation-buttons {
                                        display: flex;
                                        justify-content: space-between;
                                        margin-top: 15px;
                                    }

                                    .user-navigation-buttons button {
                                        padding: 10px 20px;
                                        background-color: #4267B2;
                                        color: white;
                                        border: none;
                                        border-radius: 4px;
                                        cursor: pointer;
                                    }

                                    /* Liên kết xem profile */
                                    #user-post-owner-link {
                                        color: #4267B2;
                                        text-decoration: none;
                                        cursor: pointer;
                                    }

                                    #user-post-owner-link:hover {
                                        text-decoration: underline;
                                    }
                                    .type-free {
                                        color: #1a936f;
                                    }


                                    .type-exchange {
                                        color: #d32f2f;
                                    }

                                </style>                            

                                <div id="user-near-me-post-container1" style="max-width: 600px; margin: auto; box-shadow: 0 2px 4px rgba(0,0,0,0.1); border-radius: 8px; overflow: hidden; background-color: #f5f5f5; padding: 15px;">
                                    <h4 style="margin: 0; font-size: 20px; color: #333; text-align: center;">Posts Liked</h4>
                                    <c:forEach items="${listLiked}" var="listLiked" varStatus="postStatus">
                                        <div id="user-post-${postStatus.index}" class="user-product-card1" style="margin-top: 15px; display: none;">
                                            <div style="position: relative; height: 300px;">
                                                <c:forEach items="${listLiked.listPostLiked().getListImg()}" var="img" varStatus="imgStatus">
                                                    <img src="${pageContext.request.contextPath}/${img}" alt="Post image ${imgStatus.index + 1}" 
                                                         style="width: 100%; height: 100%; object-fit: cover; position: absolute; top: 0; left: 0; opacity: 0; transition: opacity 0.5s ease;" 
                                                         class="post-image" data-index="${imgStatus.index}">
                                                </c:forEach>

                                                <div class="user-image-btn1" style="position: absolute; top: 50%; left: 0; right: 0; transform: translateY(-50%); display: flex; justify-content: space-between; padding: 0 10px; z-index: 10;">
                                                    <button onclick="prevUserImage(this)" style="background: rgba(255,255,255,0.7); border: none; border-radius: 50%; padding: 10px; cursor: pointer;">◀</button>
                                                    <button onclick="nextUserImage(this)" style="background: rgba(255,255,255,0.7); border: none; border-radius: 50%; padding: 10px; cursor: pointer;">▶</button>
                                                </div>
                                            </div>
                                            <div class="user-product-info1" style="padding: 15px; background-color: #fff; border-radius: 8px; margin-top: -10px;">
                                                <h3 id="user-post-title1" style="margin: 0 0 10px; font-size: 18px; color: #6ba4e9; font-weight: bold;"> ${listLiked.listPostLiked().getTitle()}</h3>
                                                <p id="user-post-description1" style="margin: 0; font-size: 14px; color: #666;">${listLiked.listPostLiked().getDescription()}</p>
                                                <p><strong>Date:</strong> <span>${listLiked.listPostLiked().getCreateTime()}</span></p>
                                                <p><strong>Type:</strong> <span id="user-post-type1">${listLiked.listPostLiked().getTypeName()}</span></p>
                                                <p><strong>Quanlity:</strong> <span id="user-post-quanlity1">${listLiked.listPostLiked().getQuanlityName()}</span></p>
                                                <p><strong>Instructions:</strong> <span id="user-post-instructions1">${listLiked.listPostLiked().getIntructions()}</span></p>
                                                <p><strong>Owner:</strong> <a id="user-post-owner-link" href="otherprofile?id=${listLiked.listPostLiked().getUserID()}" onclick="viewUserProfile()">View profile ${listLiked.listPostLiked().getFullNameOwner()} </a></p>
                                            </div>
                                        </div>
                                    </c:forEach>

                                    <div class="user-navigation-buttons" style="display: flex; justify-content: space-between; margin-top: 15px;">
                                        <button id="user-prev-button" onclick="prevUserPost()" style="padding: 10px 20px; background-color: #4267B2; color: white; border: none; border-radius: 4px; cursor: pointer;">Previous</button>
                                        <button id="user-next-button" onclick="nextUserPost()" style="padding: 10px 20px; background-color: #4267B2; color: white; border: none; border-radius: 4px; cursor: pointer;">Next</button>
                                    </div>
                                </div>
                            </div>

                            <script>
                                function showImage(container, index) {
                                    const images = container.querySelectorAll('.post-image');
                                    images.forEach(img => img.style.opacity = '0');
                                    if (images[index]) {
                                        images[index].style.opacity = '1';
                                    }
                                }

                                function prevUserImage(button) {
                                    const container = button.closest('.user-product-card1');
                                    const images = container.querySelectorAll('.post-image');
                                    let currentIndex = Array.from(images).findIndex(img => img.style.opacity === '1');
                                    let newIndex = (currentIndex - 1 + images.length) % images.length;
                                    showImage(container, newIndex);
                                }

                                function nextUserImage(button) {
                                    const container = button.closest('.user-product-card1');
                                    const images = container.querySelectorAll('.post-image');
                                    let currentIndex = Array.from(images).findIndex(img => img.style.opacity === '1');
                                    let newIndex = (currentIndex + 1) % images.length;
                                    showImage(container, newIndex);
                                }

// Hiển thị ảnh đầu tiên cho mỗi bài post khi trang được tải
                                document.addEventListener('DOMContentLoaded', function () {
                                    document.querySelectorAll('.user-product-card1').forEach(container => {
                                        showImage(container, 0);
                                    });
                                });
                            </script>
                            <script>
                                let currentPostIndex = 0;
                                const posts = document.querySelectorAll('.user-product-card1');

                                function showPost(index) {
                                    posts.forEach(post => post.style.display = 'none');
                                    if (posts[index]) {
                                        posts[index].style.display = 'block';
                                        showImage(posts[index], 0);  // Hiển thị ảnh đầu tiên của bài post
                                    }
                                }

                                function prevUserPost() {
                                    currentPostIndex = (currentPostIndex - 1 + posts.length) % posts.length;
                                    showPost(currentPostIndex);
                                }

                                function nextUserPost() {
                                    currentPostIndex = (currentPostIndex + 1) % posts.length;
                                    showPost(currentPostIndex);
                                }

                                function showImage(container, index) {
                                    const images = container.querySelectorAll('.post-image');
                                    images.forEach(img => img.style.opacity = '0');
                                    if (images[index]) {
                                        images[index].style.opacity = '1';
                                    }
                                }

                                function prevUserImage(button) {
                                    const container = button.closest('.user-product-card1');
                                    const images = container.querySelectorAll('.post-image');
                                    let currentIndex = Array.from(images).findIndex(img => img.style.opacity === '1');
                                    let newIndex = (currentIndex - 1 + images.length) % images.length;
                                    showImage(container, newIndex);
                                }

                                function nextUserImage(button) {
                                    const container = button.closest('.user-product-card1');
                                    const images = container.querySelectorAll('.post-image');
                                    let currentIndex = Array.from(images).findIndex(img => img.style.opacity === '1');
                                    let newIndex = (currentIndex + 1) % images.length;
                                    showImage(container, newIndex);
                                }

// Hiển thị bài post đầu tiên khi trang được tải
                                document.addEventListener('DOMContentLoaded', function () {
                                    showPost(currentPostIndex);
                                });
                            </script>



                            <style>
                                #history-form {
                                    display: none;
                                }
                            </style>

                            <div class="column is-8">
                                <div id="profile-timeline-posts" class="box-heading">
                                    <h4>Posts</h4>
                                    <div class="button-wrap">
                                        <button id="list-posts-btn" type="button" class="button is-active">List Posts</button>
                                        <button id="history-btn" type="button" class="button is-active">History</button>
                                        <button id="view-list-friends" class="button is-active" onclick="window.location.href = 'ListFriends';">List Friends</button>
                                    </div>
                                </div>
                                <div id="list-posts-form">
                                    <c:forEach var="post" items="${myPost}"> 
                                        <div class="card is-post post" data-post-id="${post.postID}">
                                            <!-- Main wrap -->
                                            <div class="content-wrap">
                                                <!-- Post header -->
                                                <div class="card-heading">
                                                    <!-- User meta -->
                                                    <div class="user-block" style="width: 100%;">
                                                        <div class="image" style="cursor: pointer;" onclick="window.location.href = 'profile?id=${post.userID}'">
                                                            <img src="https://via.placeholder.com/300x300" data-demo-src="${post.getAvatarOwner()}" data-user-popover="1" alt="" />
                                                        </div>
                                                        <div class="user-info" style="width: 100%;">
                                                            <a class="post-name-owner" href="profile?id=${post.userID}">${post.getFullNameOwner()}</a>
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
                                                                    <a class="dropdown-item open-modal-edit modal-trigger edit-modal-trigger" data-post-id="${post.postID}" data-post-title="${post.title}" data-post-quanlity="${post.quanlityID}" data-post-desc="${post.description}" data-post-intr="${post.intructions}" data-post-commune="${post.commune}" data-post-district="${post.district}" data-post-street_Number="${post.street_Number}" data-all-img="${post.imageUrl}">
                                                                        <div class="media">
                                                                            <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                                                                            <g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                                                            <path d="M12 3H5a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/>
                                                                            <path d="M18.375 2.625a2.121 2.121 0 1 1 3 3L12 15l-4 1l1-4Z"/>
                                                                            </g>
                                                                            </svg>
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
                                                            <c:forEach var="img" items="${post.getListImg()}">
                                                                <a style="margin: auto;" href="javascript:void(0);" class="modal-trigger post-detail post-open-detail" data-modal="share-modal">
                                                                    <img class="element-img-post" src="https://via.placeholder.com/1600x900" data-demo-src="${img}" alt="" />
                                                                </a>
                                                            </c:forEach>     
                                                        </div>
                                                        <c:if test="${fn:length(post.listImg) >= 2}">
                                                            <div class="image-btn">
                                                                <div class="btn-image-next btn-image">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                                                                    <path stroke-width="1.5" stroke="black" fill="currentColor" d="M5.536 21.886a1.004 1.004 0 0 0 1.033-.064l13-9a1 1 0 0 0 0-1.644l-13-9A1 1 0 0 0 5 3v18a1 1 0 0 0 .536.886"/>
                                                                    </svg>
                                                                </div>
                                                                <div class="btn-image-pre btn-image">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                                                                    <path stroke-width="1.5" stroke="black" fill="currentColor" d="m4.431 12.822l13 9A1 1 0 0 0 19 21V3a1 1 0 0 0-1.569-.823l-13 9a1.003 1.003 0 0 0 0 1.645"/>
                                                                    </svg>
                                                                </div>
                                                            </div>
                                                        </c:if>
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




                                <div id="history-form" >
                                    <c:forEach var="post" items="${hisPost}"> 
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
                                                                    <a class="dropdown-item open-modal-edit modal-trigger edit-modal-trigger" data-post-id="${post.postID}" data-post-title="${post.title}" data-post-quanlity="${post.quanlityID}" data-post-desc="${post.description}" data-post-intr="${post.intructions}" data-post-commune="${post.commune}"  data-post-district="${post.district}" data-post-street_Number="${post.street_Number}" data-all-img="${post.imageUrl}">
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
                                                            <c:forEach var="img" items="${post.getListImg()}">
                                                                <a style="margin: auto;" href="javascript:void(0);" class="modal-trigger post-detail post-open-detail" data-modal="share-modal">
                                                                    <img class="element-img-post" src="https://via.placeholder.com/1600x900" data-demo-src="${img}" alt="" />
                                                                </a>
                                                            </c:forEach>     
                                                        </div>
                                                        <c:if test="${fn:length(post.listImg) >= 2}">
                                                            <div class="image-btn">
                                                                <div class="btn-image-next btn-image">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                                                                    <path stroke-width="1.5" stroke="black" fill="currentColor" d="M5.536 21.886a1.004 1.004 0 0 0 1.033-.064l13-9a1 1 0 0 0 0-1.644l-13-9A1 1 0 0 0 5 3v18a1 1 0 0 0 .536.886"/>
                                                                    </svg>
                                                                </div>
                                                                <div class="btn-image-pre btn-image">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                                                                    <path stroke-width="1.5" stroke="black" fill="currentColor" d="m4.431 12.822l13 9A1 1 0 0 0 19 21V3a1 1 0 0 0-1.569-.823l-13 9a1.003 1.003 0 0 0 0 1.645"/>
                                                                    </svg>
                                                                </div>
                                                            </div>
                                                        </c:if>
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









                                <div class="load-more-wrap has-text-centered">
                                    <a href="#" class="load-more-button">Load More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    const posts = document.querySelectorAll(".post");
                    const loadMoreButton = document.querySelector(".load-more-button");
                    let currentIndex = 0;
                    const postsPerPage = 3;
                    function showPosts(startIndex, endIndex) {
                        for (let i = startIndex; i < endIndex && i < posts.length; i++) {
                            posts[i].style.display = "block";
                        }
                    }

                    function hideAllPosts() {
                        posts.forEach(post => post.style.display = "none");
                    }

                    function handleLoadMore() {
                        currentIndex += postsPerPage;
                        showPosts(currentIndex, currentIndex + postsPerPage);
                        if (currentIndex + postsPerPage >= posts.length) {
                            loadMoreButton.style.display = "none";
                        }
                    }

                    // Initially hide all posts
                    hideAllPosts();
                    // Show initial posts
                    showPosts(0, postsPerPage);
                    // Add event listener to Load More button
                    loadMoreButton.addEventListener("click", function (e) {
                        e.preventDefault();
                        handleLoadMore();
                    });
                });
            </script>

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

                                        <input type="submit" id="submit-update-profile1" style="display: none;" value="Submit">
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



            <style>
                block-list {
                    font-family: Arial, sans-serif;
                    background-color: #f0f2f5;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    height: 100vh;
                    margin: 0;
                }


                .header {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-bottom: 20px;
                }

                .header h2 {
                    margin: 0;
                }

                .description {
                    font-size: 14px;
                    color: #606770;
                    margin-bottom: 20px;
                }

                .user-blocking-initial__search-input {
                    display: flex;
                    align-items: center;
                    margin-bottom: 20px;
                }

                .user-blocking-initial__add-btn {
                    background-color: #1877f2;
                    color: white;
                    border: none;
                    padding: 10px;
                    border-radius: 5px;
                    cursor: pointer;
                    margin-right: 10px;
                    flex-shrink: 0;
                }

                .user-blocking-initial__add-btn:hover {
                    background-color: #155dc2;
                }

                .user-blocking-initial__search-input {
                    flex-grow: 1;
                    padding: 10px;
                    border-radius: 5px;
                    border: 1px solid #ccc;
                }

                .user-block-list .user {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-bottom: 15px;
                }

                .avatar {
                    width: 40px;
                    height: 40px;
                    border-radius: 50%;
                    margin-right: 10px;
                }

                .user span {
                    flex-grow: 1;
                }

                .btn-unblock {
                    background-color: #e4e6eb;
                    border: none;
                    padding: 5px 10px;
                    border-radius: 5px;
                    cursor: pointer;
                }

                .btn-unblock:hover {
                    background-color: #d4d6db;
                }
            </style>

            <style>
                .user-blocking-popup {
                    width: 100%;
                    max-width: 400px;
                    background-color: #fff;
                    border-radius: 8px;
                    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                }

                .user-blocking-popup__header {
                    display: flex;
                    align-items: center;
                    padding: 12px 16px;
                    border-bottom: 1px solid #e0e0e0;
                }

                .user-blocking-popup__back-btn,
                .user-blocking-popup__close-btn {
                    background: none;
                    border: none;
                    cursor: pointer;
                    padding: 4px;
                }

                .user-blocking-popup__header h2 {
                    flex-grow: 1;
                    text-align: center;
                    font-size: 18px;
                    margin: 0;
                }

                .user-blocking-popup__search {
                    padding: 12px 16px;
                    border-bottom: 1px solid #e0e0e0;
                }

                .user-blocking-popup__search-input {
                    width: 100%;
                    padding: 8px 12px;
                    border: 1px solid #ccc;
                    border-radius: 20px;
                    font-size: 14px;
                }

                .user {
                    display: flex;
                    align-items: center;
                    padding: 12px 16px;
                    border-bottom: 1px solid #f0f0f0;
                }

                .avatar {
                    width: 40px;
                    height: 40px;
                    border-radius: 50%;
                    margin-right: 12px;
                    object-fit: cover;
                }

                .user span {
                    flex-grow: 1;
                    font-size: 14px;
                }

                .btn-block {
                    background-color: #f0f0f0;
                    border: none;
                    padding: 6px 12px;
                    border-radius: 4px;
                    font-size: 14px;
                    cursor: pointer;
                }

                .btn-block:hover {
                    background-color: #e0e0e0;
                }
                .user-blocking-popup__search {
                    border-bottom: 1px solid #e0e0e0;
                }
                .user-blocking-popup__divider {
                    border: none;
                    border-top: 1px solid #e0e0e0;
                    margin: 0;
                }
            </style>

            <style>
                .user-blocking-popup {
                    display: none;
                    position: fixed;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    background-color: white;
                    padding: 20px;
                    border-radius: 8px;
                    box-shadow: 0 0 10px rgba(0,0,0,0.1);
                }
                .user-blocking-popup__header {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-bottom: 15px;
                }
                .user-blocking-popup__close-btn {
                    cursor: pointer;
                }
                .user-blocking-popup__search-container {
                    margin-top: 10px;
                }
                .user-blocking-popup__search-input {
                    width: 100%;
                    padding: 8px;
                    border: 1px solid #ccc;
                    border-radius: 4px;
                }



                .user-blocking-popup__header {
                    display: flex;
                    align-items: center;
                    padding: 10px;
                    border-bottom: 1px solid #e0e0e0;
                }

                .user-blocking-popup__back-btn {
                    background: none;
                    border: none;
                    cursor: pointer;
                    padding: 5px;
                    margin-right: 10px;
                }

                .user-blocking-popup__back-btn svg {
                    width: 20px;
                    height: 20px;
                }

                .user-blocking-popup__header h2 {
                    flex-grow: 1;
                    text-align: center;
                    margin: 0;
                }

                .user-blocking-popup__close-btn {
                    font-size: 20px;
                    cursor: pointer;
                    padding: 5px;
                }

                .user-blocking-popup__search-input {
                    width: 100%;
                    padding: 10px;
                    margin-top: 10px;
                    border: 1px solid #e0e0e0;
                    border-radius: 4px;
                }
                .user-blocking-popup {
                    background-color: white;
                    border-radius: 8px;
                    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                    width: 100%;
                    max-width: 400px;
                    margin: auto;
                }

                .user-blocking-popup__header {
                    display: flex;
                    align-items: center;
                    padding: 12px 16px;
                    border-bottom: 1px solid #e0e0e0;
                }

                .user-blocking-popup__back-btn,
                .user-blocking-popup__close-btn {
                    background: none;
                    border: none;
                    cursor: pointer;
                    padding: 0;
                }

                .user-blocking-popup__back-btn svg,
                .user-blocking-popup__close-btn svg {
                    width: 24px;
                    height: 24px;
                    color: #666;
                }

                .user-blocking-popup__header h2 {
                    flex-grow: 1;
                    text-align: center;
                    margin: 0;
                    font-size: 18px;
                    font-weight: bold;
                }

                .user-blocking-popup__search {
                    padding: 16px;
                }

                .user-blocking-popup__search-input {
                    width: 100%;
                    padding: 10px 12px;
                    border: 1px solid #e0e0e0;
                    border-radius: 4px;
                    font-size: 14px;
                }

                .user-blocking-popup__search-input::placeholder {
                    color: #999;
                }
            </style>


            <!-- Block list users -->
            <div id="list-block-modal" class="modal share-modal is-xsmall has-light-bg">
                <div class="modal-background">
                    <div class="modal-content">
                        <div class="card">
                            <div class="card-heading">
                                <div class="modal-header">
                                    <h2 style="margin-left: 167px ; font-weight: bold">List Users Blocked</h2>
                                </div>
                                <!-- Close X button -->
                                <div class="close-wrap">
                                    <span class="close-modal">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                                    </span>
                                </div>
                            </div>

                            <div class="card-body block-list">
                                <div class="control">
                                    <div class="modal-body" id="listBlockedUsers">
                                        <p class="description">
                                            Khi bạn chặn ai đó, họ sẽ không xem được nội dung bạn đăng trên dòng thời gian của mình,thêm bạn làm bạn bè và trao đổi các đồ dùng.
                                            Lưu ý: Điều này không bao gồm các trao đổi mà cả bạn và người này đều tham gia trước đó.
                                        </p>
                                        <div class="user-blocking-initial">
                                            <button type="button" class="user-blocking-initial__add-btn">+ Thêm vào danh sách chặn</button>
                                            <input type="text" placeholder="Search..." class="user-blocking-initial__search-input" />
                                        </div>
                                        <hr class="user-blocking-popup__divider">
                                        <div class="col-md-12 user-block-list">
                                            <c:forEach var="bl" items="${userBlock}">
                                                <form action="UnBlockUser" method="post" class="user">
                                                    <input type="hidden" name="blockUserId" value="${bl.getInfoUser().getUserID()}" />
                                                    <img src="${bl.getInfoUser().getAvatarUrl()}" alt="Avatar" class="avatar" />
                                                    <span>${bl.getInfoUser().getFull_Name()}</span>
                                                    <button type="submit" class="btn-unblock">Bỏ chặn</button>
                                                </form>
                                            </c:forEach>
                                        </div>
                                    </div>

                                    <div class="user-blocking-popup" id="userBlockingPopup" style="display: none;">
                                        <div class="user-blocking-popup__header">
                                            <button class="user-blocking-popup__back-btn">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                <line x1="19" y1="12" x2="5" y2="12"></line>
                                                <polyline points="12 19 5 12 12 5"></polyline>
                                                </svg>
                                            </button>
                                            <h2>Chặn người dùng</h2>
                                            <button class="user-blocking-popup__close-btn">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                <line x1="18" y1="6" x2="6" y2="18"></line>
                                                <line x1="6" y1="6" x2="18" y2="18"></line>
                                                </svg>
                                            </button>                                              
                                        </div>
                                        <div class="user-blocking-popup__search">
                                            <input type="text" placeholder="Nhập tên một người" class="user-blocking-popup__search-input" />
                                        </div>
                                        <c:forEach var="l" items="${userList}">
                                            <form action="BlockUser" method="post" class="user user-item">
                                                <input type="hidden" name="id" value="${l.getUserID()}" />
                                                <img src="${l.getAvatarUrl()}" alt="Avatar" class="avatar" />
                                                <span class="user-name">${l.getFull_Name()}</span>
                                                <button type="submit" class="btn-block">Chặn</button>
                                            </form>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    const searchInput = document.querySelector('.user-blocking-popup__search-input');
                    const userItems = document.querySelectorAll('.user-item');

                    // Ẩn tất cả người dùng khi trang được tải
                    function hideAllUsers() {
                        userItems.forEach(item => item.style.display = 'none');
                    }

                    // Gọi hàm để ẩn tất cả người dùng khi trang được tải
                    hideAllUsers();

                    searchInput.addEventListener('input', function () {
                        const searchTerm = this.value.trim().toLowerCase();

                        if (searchTerm === '') {
                            // Nếu ô tìm kiếm trống, ẩn tất cả người dùng
                            hideAllUsers();
                        } else {
                            userItems.forEach(item => {
                                const userName = item.querySelector('.user-name').textContent.toLowerCase();
                                if (userName.includes(searchTerm)) {
                                    item.style.display = 'flex'; // hoặc 'block', tùy thuộc vào styling của bạn
                                } else {
                                    item.style.display = 'none';
                                }
                            });
                        }
                    });
                });
            </script>
            <script>
                // Hàm để loại bỏ dấu và khoảng trống từ chuỗi
                function normalizeString(str) {
                    return str
                            .normalize("NFD")
                            .replace(/[\u0300-\u036f]/g, "")
                            .replace(/\s+/g, "")
                            .toLowerCase();
                }

                // Select the search input and the container for the blocked users
                const searchInput = document.querySelector('.user-blocking-initial__search-input');
                const userBlockList = document.querySelector('.user-block-list');
                // Add event listener to the search input
                searchInput.addEventListener('input', function () {
                    const searchTerm = normalizeString(this.value);
                    const users = userBlockList.querySelectorAll('.user');
                    users.forEach(user => {
                        const userName = normalizeString(user.querySelector('span').textContent);
                        if (userName.includes(searchTerm)) {
                            user.style.display = ''; // Show matching users
                        } else {
                            user.style.display = 'none'; // Hide non-matching users
                        }
                    });
                });
            </script>

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
            <!-- /Load more images -->

            <div id="edit-post-modal" class="modal share-modal is-xsmall has-light-bg">
                <div class="modal-background"></div>
                <div class="modal-content">
                    <div class="card">
                        <div class="card-heading">
                            <div class="close-wrap">
                                <span class="close-modal" onclick="document.getElementById('edit-post').reset();">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                                </span>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="control">
                                <form enctype="multipart/form-data" id="edit-post" method="post">
                                    <label for="Title">Title:</label>
                                    <input type="text" id="title" name="titleEdit" required="">
                                    <span id="title-error" class="error-message" style="display: none; color: red;">Please input title!!!</span>
                                    <label for="Title">Description: </label>
                                    <textarea id="description" required class="textarea comment-textarea" name="descriptionEdit" rows="5" placeholder="e.g 2 x bottles of shampoo, almost full">Món đồ này đã có một vài năm sử dụng nhưng vẫn đáp ứng tốt nhu cầu sử dụng hàng ngày.</textarea>
                                    <span id="title-error-desc" class="error-message" style="display: none; color: red;">Please input description!!!</span>

                                    <label for="imgPath">Image:</label>
                                    <input type="file" id="imgPathEditPost" name="imgPathEdit" accept="image/*" multiple>
                                    <div class="post-image preview-img" style="display: block;">
                                    </div> 

                                    <table style="margin-top: 15px;">
                                        <tr>
                                            <td style="padding: 5px;">
                                                <label for="quality">Quanlity:</label>
                                            </td>
                                            <td style="padding: 5px;">
                                                <label><input type="radio" name="qualityEdit" value="1" required checked>Used</label>
                                            </td>
                                            <td style="padding: 5px;">
                                                <label><input type="radio" name="qualityEdit" value="2" required> Needs Repair</label>
                                            </td>
                                            <td style="padding: 5px;">
                                                <label><input type="radio" name="qualityEdit" value="3" required> New</label>
                                            </td>
                                        </tr>
                                    </table>


                                    <div id="addNewSnippet" style="margin-top: 10px;">
                                        <div class="input-container" style="display: inline-block; width: 49%;">
                                            <select name="districtEdit" class="form-select form-select-sm mb-3" id="district" aria-label=".form-select-sm" required="">
                                                <option value="" selected="">Select district</option>
                                                <option value="Quận Ba Đình">Quận Ba Đình</option><option value="Quận Hoàn Kiếm">Quận Hoàn Kiếm</option><option value="Quận Tây Hồ">Quận Tây Hồ</option><option value="Quận Long Biên">Quận Long Biên</option><option value="Quận Cầu Giấy">Quận Cầu Giấy</option><option value="Quận Đống Đa">Quận Đống Đa</option><option value="Quận Hai Bà Trưng">Quận Hai Bà Trưng</option><option value="Quận Hoàng Mai">Quận Hoàng Mai</option><option value="Quận Thanh Xuân">Quận Thanh Xuân</option><option value="Huyện Sóc Sơn">Huyện Sóc Sơn</option><option value="Huyện Đông Anh">Huyện Đông Anh</option><option value="Huyện Gia Lâm">Huyện Gia Lâm</option><option value="Quận Nam Từ Liêm">Quận Nam Từ Liêm</option><option value="Huyện Thanh Trì">Huyện Thanh Trì</option><option value="Quận Bắc Từ Liêm">Quận Bắc Từ Liêm</option><option value="Huyện Mê Linh">Huyện Mê Linh</option><option value="Quận Hà Đông">Quận Hà Đông</option><option value="Thị xã Sơn Tây">Thị xã Sơn Tây</option><option value="Huyện Ba Vì">Huyện Ba Vì</option><option value="Huyện Phúc Thọ">Huyện Phúc Thọ</option><option value="Huyện Đan Phượng">Huyện Đan Phượng</option><option value="Huyện Hoài Đức">Huyện Hoài Đức</option><option value="Huyện Quốc Oai">Huyện Quốc Oai</option><option value="Huyện Thạch Thất">Huyện Thạch Thất</option><option value="Huyện Chương Mỹ">Huyện Chương Mỹ</option><option value="Huyện Thanh Oai">Huyện Thanh Oai</option><option value="Huyện Thường Tín">Huyện Thường Tín</option><option value="Huyện Phú Xuyên">Huyện Phú Xuyên</option><option value="Huyện Ứng Hòa">Huyện Ứng Hòa</option><option value="Huyện Mỹ Đức">Huyện Mỹ Đức</option></select>  
                                        </div>
                                        <div class="input-container" style="display: inline-block; width: 50%;">
                                            <select name="wardEdit" class="form-select form-select-sm" id="ward" aria-label=".form-select-sm" required="">
                                                <option value="" selected="">Select Ward</option>
                                                <option value="Xã Yên Trung">Xã Yên Trung</option><option value="Xã Yên Bình">Xã Yên Bình</option><option value="Xã Tiến Xuân">Xã Tiến Xuân</option><option value="Thị trấn Liên Quan">Thị trấn Liên Quan</option><option value="Xã Đại Đồng">Xã Đại Đồng</option><option value="Xã Cẩm Yên">Xã Cẩm Yên</option><option value="Xã Lại Thượng">Xã Lại Thượng</option><option value="Xã Phú Kim">Xã Phú Kim</option><option value="Xã Hương Ngải">Xã Hương Ngải</option><option value="Xã Canh Nậu">Xã Canh Nậu</option><option value="Xã Kim Quan">Xã Kim Quan</option><option value="Xã Dị Nậu">Xã Dị Nậu</option><option value="Xã Bình Yên">Xã Bình Yên</option><option value="Xã Chàng Sơn">Xã Chàng Sơn</option><option value="Xã Thạch Hoà">Xã Thạch Hoà</option><option value="Xã Cần Kiệm">Xã Cần Kiệm</option><option value="Xã Hữu Bằng">Xã Hữu Bằng</option><option value="Xã Phùng Xá">Xã Phùng Xá</option><option value="Xã Tân Xã">Xã Tân Xã</option><option value="Xã Thạch Xá">Xã Thạch Xá</option><option value="Xã Bình Phú">Xã Bình Phú</option><option value="Xã Hạ Bằng">Xã Hạ Bằng</option><option value="Xã Đồng Trúc">Xã Đồng Trúc</option></select>
                                        </div>
                                        <div class="input-container">
                                            <label>Street number</label>
                                            <input name="newAddressEdit" id="Order_name" type="text" maxlength="255" value="Số nhà ...." required="">
                                            <span id="title-error-add" class="error-message" style="display: none; color: red;">Please input street number!!!</span>
                                        </div>
                                    </div>
                                    <label>Expires Date<span class="required">*</span></label>
                                    <select name="expiresDateEdit" class="form-select form-select-sm" id="expiresDate" aria-label=".form-select-sm" required="">
                                        <option value="1">1 Day</option>
                                        <option value="3">3 Days</option>
                                        <option value="7">7 Days</option>
                                        <option value="15" selected>15 Days</option>
                                    </select>

                                    <label for="instructions">Pick-up instructions</label>
                                    <input type="text" value="4-6pm khi tới nơi hãy gọi cho tôi" id="instructions" name="instructionsEdit" required="" placeholder="Pick up today from 4 - 6pm. Please ring doorbell when here">
                                    <span id="title-error-inst" class="error-message" style="display: none; color: red;">Please input instructions!!!</span>
                                    <input type="text" name="postIdEdit" style="display : none;">



                                    <input type="submit" id="submit-edit-post" style="display : none;" value="Submit">
                                </form>
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="button-wrap" style="width: 98%;">
                                <button type="button" id="saveEditButton" class="button is-solid primary-button" style="width: 100%;">
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
                                    <i data-feather="x"></i>
                                </span>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="shared-publication" style="margin-top: 0px;">
                                <div class="publication-meta">
                                    <div class="inner-flex" style="align-items: center; margin-bottom: 10px;">
                                        <div class="detail-post-header-left">
                                            <img style="cursor: pointer;" id="share-modal-avatar" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/dan.jpg" data-user-popover="1" alt="" />
                                        </div>
                                        <div class="detail-post-header-right inner-flex" style="justify-content: space-between;flex-grow: 1;margin-left: 10px;margin-top: 8px;">
                                            <div class="detail-post-header-infor-owner">
                                                <h2 id="share-modal-name" style="cursor: pointer;font-weight: 500;">-</h2>
                                                <p style="padding-left: 0;" id="share-modal-date">-</p>
                                            </div>
                                            <div class="detail-post-header-infor-post" style="margin-top: 16px;">
                                                <span id="share-modal-status" class="status-post-name" style="display: inline-block; padding: 0px 10px; float: right; color: rgb(54, 169, 85);">-</span>
                                                <span id="share-modal-type" class="type-post-name" style="display: inline-block; float: right; color: rgb(107, 164, 233);">-</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="inner-flex" style="display: flex; flex-direction: column; align-items: flex-start; width: 100%;">
                                        <h2 id="share-modal-title" style=" color: rgb(107, 164, 233); padding-bottom: 3px;">Title</h2>
                                        <p id="share-modal-text" style="max-height: none;padding: 0; width: 100%;">
                                            -
                                        </p>
                                    </div>
                                </div>
                                <div class="featured-image">
                                    <img id="share-modal-image" src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/1.jpg" alt="" />
                                </div>
                                <div class="footer-detail-post" style="margin-top: 10px;">
                                    <div class="detail-row">
                                        <h2 style="font-weight: 500;">Quanlity:</h2>
                                        <p id="share-modal-quanlity">-</p>
                                    </div>
                                    <div class="detail-row">
                                        <svg style="padding-right: 10px;" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-map-pin"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
                                        <p id="share-modal-address">-</p>
                                    </div>
                                    <div class="detail-row">
                                        <h2 style="font-weight: 500;">Instructions:</h2>
                                        <p id="share-modal-intruc">-</p>
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
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
            <script src="assets/js/opensharemodal.js"></script>

            <!-- profile js -->
            <script src="assets/js/profile.js"></script>

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
                function validateFullName() {
                    var fname = document.getElementById('fname').value.trim();
                    var errorFname = document.getElementById('errorFname');
                    if (fname === "") {
                        errorFname.textContent = "Full Name is required";
                        return false;
                    } else {
                        errorFname.textContent = "";
                        return true;
                    }
                }

                function validateEmail() {
                    var email = document.getElementById('email').value.trim();
                    var errorEmail = document.getElementById('errorEmail');
                    var reGexEmail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                    if (email === "") {
                        errorEmail.textContent = "Email is required";
                        return false;
                    } else if (!reGexEmail.test(email)) {
                        errorEmail.textContent = "Please enter a valid email address";
                        return false;
                    } else {
                        errorEmail.textContent = "";
                        return true;
                    }
                }

                function validatePhoneNumber() {
                    var phoneNum = document.getElementById('phoneNum').value.trim();
                    var errorPhone = document.getElementById('errorPhone');
                    var reGexPhone = /(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\b/;
                    if (phoneNum === "") {
                        errorPhone.textContent = "Phone Number is required";
                        return false;
                    } else if (!reGexPhone.test(phoneNum)) {
                        errorPhone.textContent = "Please enter a valid phone number";
                        return false;
                    } else {
                        errorPhone.textContent = "";
                        return true;
                    }
                }

                function FormValidate() {
                    var isValid = true;
                    isValid &= validateFullName();
                    isValid &= validateEmail();
                    isValid &= validatePhoneNumber();
                    return isValid;
                }

                document.getElementById('fname').addEventListener('input', validateFullName);
                document.getElementById('email').addEventListener('input', validateEmail);
                document.getElementById('phoneNum').addEventListener('input', validatePhoneNumber);
            </script>

            <script>


                function submitForm() {
                    document.getElementById('uploadForm').submit();
                }
                document.getElementById('imgPathEditPost').addEventListener('change', function (event) {
                    const files = event.target.files;
                    const blockImg = document.querySelector('.post-image.preview-img');
                    const imageContainer = blockImg.querySelector('.style-img-post');
                    imageContainer.innerHTML = '';
                    for (let i = 0; i < files.length; i++) {
                        const file = files[i];
                        const imageURL = URL.createObjectURL(file);
                        const imgElement = document.createElement('img');
                        imgElement.classList.add('element-img-post');
                        imgElement.src = imageURL;
                        imageContainer.appendChild(imgElement);
                        imgElement.onload = function () {
                            URL.revokeObjectURL(imageURL);
                        };
                    }
                    if (files.length >= 2) {
                        blockImg.querySelector('.image-btn').style.display = 'block';
                    } else {
                        blockImg.querySelector('.image-btn').style.display = 'none';
                    }
                    blockImg.style.display = 'block';
                    imageContainer.style.transform = 'translateX(0px)';
                });
            </script>

            <script>
                // Lấy tham chiếu tới các nút và các form
                const listPostsBtn = document.getElementById('list-posts-btn');
                const historyBtn = document.getElementById('history-btn');
                const listPostsForm = document.getElementById('list-posts-form');
                const historyForm = document.getElementById('history-form');
                // Ẩn các form ban đầu
                historyForm.style.display = 'none';
                // Thêm sự kiện click cho nút "List Posts"
                listPostsBtn.addEventListener('click', () => {
                    listPostsForm.style.display = 'block';
                    historyForm.style.display = 'none';
                });
                // Thêm sự kiện click cho nút "History"
                historyBtn.addEventListener('click', () => {
                    listPostsForm.style.display = 'none';
                    historyForm.style.display = 'block';
                });
            </script>


            <script src="assets/js/jsslideimage.js"></script>
            <script src="assets/js/huanndhe172325.js"></script>
            <script src="assets/js/reloadJs.js"></script>

    </body>


    <!-- Mirrored from friendkit.cssninja.io/navbar-v2-profile-main.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 May 2024 06:39:10 GMT -->
</html>