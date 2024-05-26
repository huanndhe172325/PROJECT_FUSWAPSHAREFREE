<%-- 
    Document   : HomePage
    Created on : May 20, 2024, 10:37:57 PM
    Author     : FPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">


    <!-- Mirrored from friendkit.cssninja.io/navbar-v1-feed.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 May 2024 06:35:55 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />

        <title>Friendkit | Feed</title>
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
            form {
                max-width: 500px;
                margin: 0 auto;
                padding: 20px;
                border: 1px solid #ccc;
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
        </style>
        <!-- End Google Tag Manager -->

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:600,700,800,900" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet" />
        <link href="../cdn.jsdelivr.net/npm/fontisto%40v3.0.4/css/fontisto/fontisto-brands.min.css" rel="stylesheet" />
        <!-- Core CSS -->
        <link rel="stylesheet" href="assets/css/app.css" />
        <link rel="stylesheet" href="assets/css/core.css" />
        <script>
            document.addEventListener('DOMContentLoaded', (event) => {
                const openModalBtn = document.getElementById('open-modal-btn');
                const modal = document.getElementById('create-post-modal');

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
    </style>
    <body>
        <h1>${requestScope.listPoint.size()}</h1>
        <!-- Google Tag Manager (noscript) -->
        <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-KQHJPZP" height="0" width="0" style="display: none; visibility: hidden"></iframe></noscript>
        <!-- End Google Tag Manager (noscript) -->

        <!-- Pageloader -->
        <div class="pageloader"></div>
        <div class="infraloader is-active"></div>

        <div class="app-overlay"></div>

        <div id="main-navbar" class="navbar navbar-v1 is-inline-flex is-transparent no-shadow is-hidden-mobile">
            <div class="container is-fluid">
                <div class="navbar-brand">
                    <a href="index.html" class="navbar-item">
                        <img class="logo light-image" src="assets/img/vector/logo/friendkit-bold.svg" width="112" height="28" alt="" />
                        <img class="logo dark-image" src="assets/img/vector/logo/friendkit-white.svg" width="112" height="28" alt="" />
                    </a>
                </div>
                <div class="navbar-menu">
                    <div class="navbar-start">
                        <!-- Navbar Search -->

                        <div class="navbar-item is-icon drop-trigger">
                            <a class="icon-link is-friends" href="javascript:void(0);">
                                <i data-feather="heart"></i>
                                <span class="indicator"></span>
                            </a>

                            <div class="nav-drop">
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

                            <div class="nav-drop">
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

                            <div class="nav-drop">
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


                        <div class="navbar-item is-icon open-chat">
                            <a class="icon-link is-primary" href="javascript:void(0);">
                                <i data-feather="message-square"></i>
                                <span class="indicator"></span>
                            </a>
                        </div>



                        <div id="explorer-trigger" class="navbar-item is-icon">
                            <a class="icon-link is-primary">
                                <i class="mdi mdi-apps"></i>
                            </a>
                        </div>

                        <div class="navbar-item is-icon">
                            <a class="icon-link is-primary" href="javascript:void(0);" data-modal="create-post-modal" id="open-modal-btn">
                                <i data-feather="plus"></i>
                                <span class="indicator"></span>
                            </a>
                        </div>
                    </div>

                    <div class="navbar-end">
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
                        <div id="account-dropdown" class="navbar-item is-account drop-trigger has-caret">
                            <div class="user-image">
                                <img src="https://via.placeholder.com/400x400" data-demo-src="assets/img/avatars/jenna.png" alt="" />
                                <span class="indicator"></span>
                            </div>

                            <div class="nav-drop is-account-dropdown">
                                <div class="inner">
                                    <div class="nav-drop-header">
                                        <span class="username">Jenna Davis</span>
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
                                        <a id="profile-link" href="Profile" class="account-item">
                                            <div class="media">
                                                <div class="media-left">
                                                    <div class="image">
                                                        <img src="https://via.placeholder.com/400x400" data-demo-src="assets/img/avatars/jenna.png" alt="" />
                                                    </div>
                                                </div>
                                                <div class="media-content">
                                                    <h3>Jenna Davis</h3>
                                                    <small>Main account</small>
                                                </div>
                                                <div class="media-right">
                                                    <i data-feather="check"></i>
                                                </div>
                                            </div>
                                        </a>
                                        <hr class="account-divider" />
                                        <a class="account-item">
                                            <div class="media">
                                                <div class="icon-wrap">
                                                    <i data-feather="map-pin"></i>
                                                </div>
                                                <div class="media-content">
                                                    <h3>Manage Location</h3>
                                                    <small>Change your location here</small>
                                                </div>
                                            </div>
                                        </a>
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
                </div>
            </div>
        </div>
        <nav class="navbar mobile-navbar is-hidden-desktop" aria-label="main navigation">
            <!-- Brand -->
            <div class="navbar-brand">
                <a class="navbar-item" href="index.html">
                    <img class="light-image" src="assets/img/vector/logo/friendkit-bold.svg" alt="" />
                    <img class="dark-image" src="assets/img/vector/logo/friendkit-white.svg" alt="" />
                </a>

                <div class="navbar-item is-icon drop-trigger">
                    <a class="icon-link is-friends" href="javascript:void(0);">
                        <i data-feather="heart"></i>
                        <span class="indicator"></span>
                    </a>

                    <div class="nav-drop">
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

                    <div class="nav-drop">
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

                    <div class="nav-drop">
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

                <div id="mobile-explorer-trigger" class="navbar-item is-icon">
                    <a class="icon-link is-primary">
                        <i class="mdi mdi-apps"></i>
                    </a>
                </div>

                <div id="open-mobile-search" class="navbar-item is-icon">
                    <a class="icon-link is-primary" href="javascript:void(0);">
                        <i data-feather="search"></i>
                    </a>
                </div>

                <!-- Mobile menu toggler icon -->
                <div class="navbar-burger">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
            <!-- Navbar mobile menu -->
            <div class="navbar-menu">
                <!-- Account -->
                <div class="navbar-item has-dropdown is-active">
                    <a href="navbar-v1-profile-main.html" class="navbar-link">
                        <img src="https://via.placeholder.com/150x150" data-demo-src="assets/img/avatars/jenna.png" alt="" />
                        <span class="is-heading">Jenna Davis</span>
                    </a>

                    <!-- Mobile Dropdown -->
                    <div class="navbar-dropdown">
                        <a href="navbar-v1-feed.html" class="navbar-item is-flex is-mobile-icon">
                            <span><i data-feather="activity"></i>Feed</span>
                            <span class="menu-badge">87</span>
                        </a>
                        <a href="navbar-v1-videos-home-v2.html" class="navbar-item is-flex is-mobile-icon">
                            <span><i data-feather="play-circle"></i>Watch</span>
                            <span class="menu-badge">21</span>
                        </a>
                        <a href="navbar-v1-profile-friends.html" class="navbar-item is-flex is-mobile-icon">
                            <span><i data-feather="heart"></i>Friend Requests</span>
                            <span class="menu-badge">3</span>
                        </a>
                        <a href="navbar-v1-profile-main.html" class="navbar-item is-flex is-mobile-icon">
                            <span><i data-feather="user"></i>Profile</span>
                        </a>
                        <a href="navbar-v1-ecommerce-cart.html" class="navbar-item is-flex is-mobile-icon">
                            <span><i data-feather="shopping-cart"></i>Cart</span>
                            <span class="menu-badge">3</span>
                        </a>
                        <a href="#" class="navbar-item is-flex is-mobile-icon">
                            <span><i data-feather="bookmark"></i>Bookmarks</span>
                        </a>
                    </div>
                </div>

                <!-- More -->
                <div class="navbar-item has-dropdown">
                    <a href="navbar-v1-settings.html" class="navbar-link">
                        <i data-feather="user"></i>
                        <span class="is-heading">Account</span>
                    </a>

                    <!-- Mobile Dropdown -->
                    <div class="navbar-dropdown">
                        <a href="#" class="navbar-item is-flex is-mobile-icon">
                            <span><i data-feather="life-buoy"></i>Support</span>
                        </a>
                        <a href="navbar-v1-settings.html" class="navbar-item is-flex is-mobile-icon">
                            <span><i data-feather="settings"></i>Settings</span>
                        </a>
                        <a class="navbar-item is-flex is-mobile-icon">
                            <span><i href="logout" data-feather="log-out"></i>Logout</span>
                        </a>
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
        </nav>


        <div class="view-wrapper">
            <!-- Container -->
            <div id="main-feed" class="container">
                <!-- Content placeholders at page load -->
                <!-- this holds the animated content placeholders that show up before content -->
                <div id="shadow-dom" class="view-wrap">
                    <div class="columns">
                        <div class="column is-3">
                            <!-- Placeload element -->
                            <div class="placeload weather-widget-placeload">
                                <div class="header">
                                    <div class="inner-wrap">
                                        <div class="img loads"></div>
                                        <div class="content-shape loads"></div>
                                        <div class="content-shape loads"></div>
                                    </div>
                                </div>
                                <div class="body">
                                    <div class="inner-wrap">
                                        <div class="rect loads"></div>
                                        <div class="content-shape loads"></div>
                                        <div class="content-shape loads"></div>
                                    </div>
                                </div>
                            </div>

                            <!-- Placeload element -->
                            <div class="placeload list-placeload">
                                <div class="header">
                                    <div class="content-shape loads"></div>
                                </div>
                                <div class="body">
                                    <div class="flex-block">
                                        <div class="img loads"></div>
                                        <div class="inner-wrap">
                                            <div class="content-shape loads"></div>
                                            <div class="content-shape loads"></div>
                                        </div>
                                    </div>
                                    <div class="flex-block">
                                        <div class="img loads"></div>
                                        <div class="inner-wrap">
                                            <div class="content-shape loads"></div>
                                            <div class="content-shape loads"></div>
                                        </div>
                                    </div>
                                    <div class="flex-block">
                                        <div class="img loads"></div>
                                        <div class="inner-wrap">
                                            <div class="content-shape loads"></div>
                                            <div class="content-shape loads"></div>
                                        </div>
                                    </div>
                                    <div class="flex-block">
                                        <div class="img loads"></div>
                                        <div class="inner-wrap">
                                            <div class="content-shape loads"></div>
                                            <div class="content-shape loads"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="column is-6">
                            <!-- Placeload element -->
                            <div class="placeload compose-placeload">
                                <div class="header">
                                    <div class="content-shape is-lg loads"></div>
                                    <div class="content-shape is-lg loads"></div>
                                    <div class="content-shape is-lg loads"></div>
                                </div>
                                <div class="body">
                                    <div class="img loads"></div>
                                    <div class="inner-wrap">
                                        <div class="content-shape loads"></div>
                                        <div class="content-shape loads"></div>
                                    </div>
                                </div>
                            </div>

                            <!-- Placeload element -->
                            <div class="placeload post-placeload">
                                <div class="header">
                                    <div class="img loads"></div>
                                    <div class="header-content">
                                        <div class="content-shape loads"></div>
                                        <div class="content-shape loads"></div>
                                    </div>
                                </div>
                                <div class="image-placeholder loads"></div>
                                <div class="placeholder-footer">
                                    <div class="footer-block">
                                        <div class="img loads"></div>
                                        <div class="inner-wrap">
                                            <div class="content-shape loads"></div>
                                            <div class="content-shape loads"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Placeload element -->
                            <div class="placeload post-placeload">
                                <div class="header">
                                    <div class="img loads"></div>
                                    <div class="header-content">
                                        <div class="content-shape loads"></div>
                                        <div class="content-shape loads"></div>
                                    </div>
                                </div>
                                <div class="image-placeholder loads"></div>
                                <div class="placeholder-footer">
                                    <div class="footer-block">
                                        <div class="img loads"></div>
                                        <div class="inner-wrap">
                                            <div class="content-shape loads"></div>
                                            <div class="content-shape loads"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Placeload element -->
                            <div class="placeload post-placeload">
                                <div class="header">
                                    <div class="img loads"></div>
                                    <div class="header-content">
                                        <div class="content-shape loads"></div>
                                        <div class="content-shape loads"></div>
                                    </div>
                                </div>
                                <div class="image-placeholder loads"></div>
                                <div class="placeholder-footer">
                                    <div class="footer-block">
                                        <div class="img loads"></div>
                                        <div class="inner-wrap">
                                            <div class="content-shape loads"></div>
                                            <div class="content-shape loads"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Placeload element -->
                            <div class="placeload post-placeload">
                                <div class="header">
                                    <div class="img loads"></div>
                                    <div class="header-content">
                                        <div class="content-shape loads"></div>
                                        <div class="content-shape loads"></div>
                                    </div>
                                </div>
                                <div class="image-placeholder loads"></div>
                                <div class="placeholder-footer">
                                    <div class="footer-block">
                                        <div class="img loads"></div>
                                        <div class="inner-wrap">
                                            <div class="content-shape loads"></div>
                                            <div class="content-shape loads"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="column is-3">
                            <!-- Placeload element -->
                            <div class="placeload stories-placeload">
                                <div class="header">
                                    <div class="content-shape loads"></div>
                                </div>
                                <div class="body">
                                    <div class="flex-block">
                                        <div class="img loads"></div>
                                        <div class="inner-wrap">
                                            <div class="content-shape loads"></div>
                                            <div class="content-shape loads"></div>
                                        </div>
                                    </div>
                                    <div class="flex-block">
                                        <div class="img loads"></div>
                                        <div class="inner-wrap">
                                            <div class="content-shape loads"></div>
                                            <div class="content-shape loads"></div>
                                        </div>
                                    </div>
                                    <div class="flex-block">
                                        <div class="img loads"></div>
                                        <div class="inner-wrap">
                                            <div class="content-shape loads"></div>
                                            <div class="content-shape loads"></div>
                                        </div>
                                    </div>
                                    <div class="flex-block">
                                        <div class="img loads"></div>
                                        <div class="inner-wrap">
                                            <div class="content-shape loads"></div>
                                            <div class="content-shape loads"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Placeload element -->
                            <div class="placeload mini-widget-placeload">
                                <div class="body">
                                    <div class="inner-wrap">
                                        <div class="img loads"></div>
                                        <div class="content-shape loads"></div>
                                        <div class="content-shape loads"></div>
                                        <div class="content-shape loads"></div>
                                        <div class="button-shape loads"></div>
                                    </div>
                                </div>
                            </div>

                            <!-- Placeload element -->
                            <div class="placeload list-placeload">
                                <div class="header">
                                    <div class="content-shape loads"></div>
                                </div>
                                <div class="body">
                                    <div class="flex-block">
                                        <div class="img loads"></div>
                                        <div class="inner-wrap">
                                            <div class="content-shape loads"></div>
                                            <div class="content-shape loads"></div>
                                        </div>
                                    </div>
                                    <div class="flex-block">
                                        <div class="img loads"></div>
                                        <div class="inner-wrap">
                                            <div class="content-shape loads"></div>
                                            <div class="content-shape loads"></div>
                                        </div>
                                    </div>
                                    <div class="flex-block">
                                        <div class="img loads"></div>
                                        <div class="inner-wrap">
                                            <div class="content-shape loads"></div>
                                            <div class="content-shape loads"></div>
                                        </div>
                                    </div>
                                    <div class="flex-block">
                                        <div class="img loads"></div>
                                        <div class="inner-wrap">
                                            <div class="content-shape loads"></div>
                                            <div class="content-shape loads"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Feed page main wrapper -->
                <div id="activity-feed" class="view-wrap true-dom is-hidden">
                    <div class="columns">
                        <!-- Left side column -->
                        <div class="column is-3 is-hidden-mobile">
                            <!-- Weather widget -->
                            <!-- /partials/widgets/weather-widget.html -->


                            <!-- Pages widget -->
                            <!-- /partials/widgets/recommended-pages-1-widget.html -->
                            <div class="card">
                                <div class="card-heading is-bordered">
                                    <h4>Recommended Pages</h4>
                                    <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                        <div>
                                            <div class="button">
                                                <i data-feather="more-vertical"></i>
                                            </div>
                                        </div>
                                        <div class="dropdown-menu" role="menu">
                                            <div class="dropdown-content">
                                                <a href="#" class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="file-text"></i>
                                                        <div class="media-content">
                                                            <h3>All Recommandations</h3>
                                                            <small>View all recommandations.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="settings"></i>
                                                        <div class="media-content">
                                                            <h3>Settings</h3>
                                                            <small>Access widget settings.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <hr class="dropdown-divider" />
                                                <a href="#" class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="trash-2"></i>
                                                        <div class="media-content">
                                                            <h3>Remove</h3>
                                                            <small>Removes this widget from your feed.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body no-padding">
                                    <!-- Recommended Page -->
                                    <div class="page-block transition-block">
                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/vector/icons/logos/fastpizza.svg" data-page-popover="0" alt="" />
                                        <div class="page-meta">
                                            <span>Fast Pizza</span>
                                            <span>Pizza & Fast Food</span>
                                        </div>
                                        <div class="add-page add-transition">
                                            <i data-feather="bookmark"></i>
                                        </div>
                                    </div>
                                    <!-- Recommended Page -->
                                    <div class="page-block transition-block">
                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/vector/icons/logos/lonelydroid.svg" data-page-popover="1" alt="" />
                                        <div class="page-meta">
                                            <span>Lonely Droid</span>
                                            <span>Technology</span>
                                        </div>
                                        <div class="add-page add-transition">
                                            <i data-feather="bookmark"></i>
                                        </div>
                                    </div>
                                    <!-- Recommended Page -->
                                    <div class="page-block transition-block">
                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/vector/icons/logos/metamovies.svg" data-page-popover="2" alt="" />
                                        <div class="page-meta">
                                            <span>Meta Movies</span>
                                            <span>Movies / Entertainment</span>
                                        </div>
                                        <div class="add-page add-transition">
                                            <i data-feather="bookmark"></i>
                                        </div>
                                    </div>
                                    <!-- Recommended Page -->
                                    <div class="page-block transition-block">
                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/vector/icons/logos/nuclearjs.svg" data-page-popover="3" alt="" />
                                        <div class="page-meta">
                                            <span>Nuclearjs</span>
                                            <span>Technology</span>
                                        </div>
                                        <div class="add-page add-transition">
                                            <i data-feather="bookmark"></i>
                                        </div>
                                    </div>
                                    <!-- Recommended Page -->
                                    <div class="page-block transition-block">
                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/vector/icons/logos/slicer.svg" data-page-popover="4" alt="" />
                                        <div class="page-meta">
                                            <span>Slicer</span>
                                            <span>Web / Design</span>
                                        </div>
                                        <div class="add-page add-transition">
                                            <i data-feather="bookmark"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Fake Ad -->
                            <!-- /partials/widgets/fake-add-widget.html -->

                            <!-- Latest activities widget -->
                            <!-- /partials/widgets/latest-activity-1-widget.html -->
                            <div id="latest-activity-1" class="card">
                                <div class="card-heading is-bordered">
                                    <h4>User Ranking</h4>
                                    <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                        <div>
                                            <div class="button">
                                                <i data-feather="more-vertical"></i>
                                            </div>
                                        </div>
                                        <div class="dropdown-menu" role="menu">
                                            <div class="dropdown-content">
                                                <a href="#" class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="list"></i>
                                                        <div class="media-content">
                                                            <h3>All updates</h3>
                                                            <small>View my network's activity.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="settings"></i>
                                                        <div class="media-content">
                                                            <h3>Settings</h3>
                                                            <small>Access widget settings.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <hr class="dropdown-divider" />
                                                <a href="#" class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="trash-2"></i>
                                                        <div class="media-content">
                                                            <h3>Remove</h3>
                                                            <small>Removes this widget from your feed.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body no-padding">
                                    <!-- Recommended Page -->
                                    <c:forEach var="c" items="${requestScope.listPoint}">
                                        <div class="page-block">
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/hanzo.svg" data-page-popover="5" alt="" />
                                            <div class="page-meta">
                                                <span>${c.userName}</span>
                                                <span>${c.point}</span>
                                            </div>
                                            <div class="add-page">
                                                <i data-feather="eye"></i>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <!-- /Left side column -->

                        <!-- Middle column -->
                        <div class="column is-6">

                            <!-- Post 1 -->
                            <!-- /partials/pages/feed/posts/feed-post1.html -->
                            <!-- POST #1 -->
                            <div id="feed-post-1" class="card is-post">
                                <!-- Main wrap -->
                                <div class="content-wrap">
                                    <!-- Post header -->
                                    <div class="card-heading">
                                        <!-- User meta -->
                                        <div class="user-block">
                                            <div class="image">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/dan.jpg" data-user-popover="1" alt="" />
                                            </div>
                                            <div class="user-info">
                                                <a href="#">Dan Walker</a>
                                                <span class="time">July 26 2018, 01:03pm</span>
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
                                                    <a href="#" class="dropdown-item">
                                                        <div class="media">
                                                            <i data-feather="bookmark"></i>
                                                            <div class="media-content">
                                                                <h3>Bookmark</h3>
                                                                <small>Add this post to your bookmarks.</small>
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <a class="dropdown-item">
                                                        <div class="media">
                                                            <i data-feather="bell"></i>
                                                            <div class="media-content">
                                                                <h3>Notify me</h3>
                                                                <small>Send me the updates.</small>
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <hr class="dropdown-divider" />
                                                    <a href="#" class="dropdown-item">
                                                        <div class="media">
                                                            <i data-feather="flag"></i>
                                                            <div class="media-content">
                                                                <h3>Flag</h3>
                                                                <small>In case of inappropriate content.</small>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Post header -->

                                    <!-- Post body -->
                                    <div class="card-body">
                                        <!-- Post body text -->
                                        <div class="post-text">
                                            <p>
                                                Yesterday with <a href="#">@Karen Miller</a> and
                                                <a href="#">@Marvin Stemperd</a> at the
                                                <a href="#">#Rock'n'Rolla</a> concert in LA. Was totally fantastic!
                                                People were really excited about this one!
                                            </p>
                                        </div>
                                        <!-- Featured image -->
                                        <div class="post-image">
                                            <a data-fancybox="post1" data-lightbox-type="comments" data-thumb="assets/img/demo/unsplash/1.jpg" href="https://via.placeholder.com/1600x900" data-demo-href="assets/img/demo/unsplash/1.jpg">
                                                <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/1.jpg" alt="" />
                                            </a>
                                            <!-- Action buttons -->
                                            <!-- /partials/pages/feed/buttons/feed-post-actions.html -->
                                            <div class="like-wrapper">
                                                <a href="javascript:void(0);" class="like-button">
                                                    <i class="mdi mdi-heart not-liked bouncy"></i>
                                                    <i class="mdi mdi-heart is-liked bouncy"></i>
                                                    <span class="like-overlay"></span>
                                                </a>
                                            </div>

                                            <div class="fab-wrapper is-share">
                                                <a href="javascript:void(0);" class="small-fab share-fab modal-trigger" data-modal="share-modal">
                                                    <i data-feather="link-2"></i>
                                                </a>
                                            </div>

                                            <div class="fab-wrapper is-comment">
                                                <a href="javascript:void(0);" class="small-fab">
                                                    <i data-feather="message-circle"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Post body -->

                                    <!-- Post footer -->
                                    <div class="card-footer">
                                        <!-- Followers avatars -->
                                        <div class="likers-group">
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/dan.jpg" data-user-popover="1" alt="" />
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/david.jpg" data-user-popover="4" alt="" />
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/edward.jpeg" data-user-popover="5" alt="" />
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/milly.jpg" data-user-popover="7" alt="" />
                                        </div>
                                        <!-- Followers text -->
                                        <div class="likers-text">
                                            <p>
                                                <a href="#">Milly</a>,
                                                <a href="#">David</a>
                                            </p>
                                            <p>and 23 more liked this</p>
                                        </div>
                                        <!-- Post statistics -->
                                        <div class="social-count">
                                            <div class="likes-count">
                                                <i data-feather="heart"></i>
                                                <span>27</span>
                                            </div>
                                            <div class="shares-count">
                                                <i data-feather="link-2"></i>
                                                <span>9</span>
                                            </div>
                                            <div class="comments-count">
                                                <i data-feather="message-circle"></i>
                                                <span>3</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Post footer -->
                                </div>
                                <!-- /Main wrap -->

                                <!-- Post #1 Comments -->
                                <div class="comments-wrap is-hidden">
                                    <!-- Header -->
                                    <div class="comments-heading">
                                        <h4>Comments <small>(8)</small></h4>
                                        <div class="close-comments">
                                            <i data-feather="x"></i>
                                        </div>
                                    </div>
                                    <!-- /Header -->

                                    <!-- Comments body -->
                                    <div class="comments-body has-slimscroll">
                                        <!-- Comment -->
                                        <div class="media is-comment">
                                            <!-- User image -->
                                            <div class="media-left">
                                                <div class="image">
                                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/dan.jpg" data-user-popover="1" alt="" />
                                                </div>
                                            </div>
                                            <!-- Content -->
                                            <div class="media-content">
                                                <a href="#">Dan Walker</a>
                                                <span class="time">28 minutes ago</span>
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                    eiusmod tempo incididunt ut labore et dolore magna aliqua. Ut enim
                                                    ad minim veniam, quis nostrud exercitation ullamco laboris
                                                    consequat.
                                                </p>
                                                <!-- Actions -->
                                                <div class="controls">
                                                    <div class="like-count">
                                                        <i data-feather="thumbs-up"></i>
                                                        <span>4</span>
                                                    </div>
                                                    <div class="reply">
                                                        <a href="#">Reply</a>
                                                    </div>
                                                    <div class="edit">
                                                        <a href="#">Edit</a>
                                                    </div>
                                                </div>

                                                <!-- Nested Comment -->
                                                <div class="media is-comment">
                                                    <!-- User image -->
                                                    <div class="media-left">
                                                        <div class="image">
                                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/david.jpg" data-user-popover="4" alt="" />
                                                        </div>
                                                    </div>
                                                    <!-- Content -->
                                                    <div class="media-content">
                                                        <a href="#">David Kim</a>
                                                        <span class="time">15 minutes ago</span>
                                                        <p>
                                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                            eiusmod tempo incididunt ut labore et dolore magna aliqua.
                                                        </p>
                                                        <!-- Actions -->
                                                        <div class="controls">
                                                            <div class="like-count">
                                                                <i data-feather="thumbs-up"></i>
                                                                <span>0</span>
                                                            </div>
                                                            <div class="reply">
                                                                <a href="#">Reply</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Right side dropdown -->
                                                    <div class="media-right">
                                                        <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                            <div>
                                                                <div class="button">
                                                                    <i data-feather="more-vertical"></i>
                                                                </div>
                                                            </div>
                                                            <div class="dropdown-menu" role="menu">
                                                                <div class="dropdown-content">
                                                                    <a class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="x"></i>
                                                                            <div class="media-content">
                                                                                <h3>Hide</h3>
                                                                                <small>Hide this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                    <div class="dropdown-divider"></div>
                                                                    <a href="#" class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="flag"></i>
                                                                            <div class="media-content">
                                                                                <h3>Report</h3>
                                                                                <small>Report this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /Nested Comment -->
                                            </div>
                                            <!-- Right side dropdown -->
                                            <div class="media-right">
                                                <!-- /partials/pages/feed/dropdowns/comment-dropdown.html -->
                                                <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                    <div>
                                                        <div class="button">
                                                            <i data-feather="more-vertical"></i>
                                                        </div>
                                                    </div>
                                                    <div class="dropdown-menu" role="menu">
                                                        <div class="dropdown-content">
                                                            <a class="dropdown-item">
                                                                <div class="media">
                                                                    <i data-feather="x"></i>
                                                                    <div class="media-content">
                                                                        <h3>Hide</h3>
                                                                        <small>Hide this comment.</small>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item">
                                                                <div class="media">
                                                                    <i data-feather="flag"></i>
                                                                    <div class="media-content">
                                                                        <h3>Report</h3>
                                                                        <small>Report this comment.</small>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Comment -->

                                        <!-- Comment -->
                                        <div class="media is-comment">
                                            <!-- User image -->
                                            <div class="media-left">
                                                <div class="image">
                                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/rolf.jpg" data-user-popover="13" alt="" />
                                                </div>
                                            </div>
                                            <!-- Content -->
                                            <div class="media-content">
                                                <a href="#">Rolf Krupp</a>
                                                <span class="time">9 hours ago</span>
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                    eiusmod tempo incididunt ut labore et dolore magna aliqua.
                                                    Exercitation ullamco laboris consequat.
                                                </p>
                                                <!-- Actions -->
                                                <div class="controls">
                                                    <div class="like-count">
                                                        <i data-feather="thumbs-up"></i>
                                                        <span>2</span>
                                                    </div>
                                                    <div class="reply">
                                                        <a href="#">Reply</a>
                                                    </div>
                                                </div>

                                                <!-- Nested Comment -->
                                                <div class="media is-comment">
                                                    <!-- User image -->
                                                    <div class="media-left">
                                                        <div class="image">
                                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" data-user-popover="6" alt="" />
                                                        </div>
                                                    </div>
                                                    <!-- Content -->
                                                    <div class="media-content">
                                                        <a href="#">Elise Walker</a>
                                                        <span class="time">8 hours ago</span>
                                                        <p>
                                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                            eiusmod tempo incididunt ut labore et dolore magna aliqua.
                                                        </p>
                                                        <!-- Actions -->
                                                        <div class="controls">
                                                            <div class="like-count">
                                                                <i data-feather="thumbs-up"></i>
                                                                <span>0</span>
                                                            </div>
                                                            <div class="reply">
                                                                <a href="#">Reply</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Right side dropdown -->
                                                    <div class="media-right">
                                                        <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                            <div>
                                                                <div class="button">
                                                                    <i data-feather="more-vertical"></i>
                                                                </div>
                                                            </div>
                                                            <div class="dropdown-menu" role="menu">
                                                                <div class="dropdown-content">
                                                                    <a class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="x"></i>
                                                                            <div class="media-content">
                                                                                <h3>Hide</h3>
                                                                                <small>Hide this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                    <div class="dropdown-divider"></div>
                                                                    <a href="#" class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="flag"></i>
                                                                            <div class="media-content">
                                                                                <h3>Report</h3>
                                                                                <small>Report this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /Nested Comment -->

                                                <!-- Nested Comment -->
                                                <div class="media is-comment">
                                                    <!-- User image -->
                                                    <div class="media-left">
                                                        <div class="image">
                                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/rolf.jpg" data-user-popover="13" alt="" />
                                                        </div>
                                                    </div>
                                                    <!-- Content -->
                                                    <div class="media-content">
                                                        <a href="#">Rolf Krupp</a>
                                                        <span class="time">7 hours ago</span>
                                                        <p>
                                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                            eiusmod tempo incididunt ut labore et dolore magna aliqua.
                                                        </p>
                                                        <!-- Actions -->
                                                        <div class="controls">
                                                            <div class="like-count">
                                                                <i data-feather="thumbs-up"></i>
                                                                <span>1</span>
                                                            </div>
                                                            <div class="reply">
                                                                <a href="#">Reply</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Right side dropdown -->
                                                    <div class="media-right">
                                                        <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                            <div>
                                                                <div class="button">
                                                                    <i data-feather="more-vertical"></i>
                                                                </div>
                                                            </div>
                                                            <div class="dropdown-menu" role="menu">
                                                                <div class="dropdown-content">
                                                                    <a class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="x"></i>
                                                                            <div class="media-content">
                                                                                <h3>Hide</h3>
                                                                                <small>Hide this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                    <div class="dropdown-divider"></div>
                                                                    <a href="#" class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="flag"></i>
                                                                            <div class="media-content">
                                                                                <h3>Report</h3>
                                                                                <small>Report this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /Nested Comment -->

                                                <!-- Nested Comment -->
                                                <div class="media is-comment">
                                                    <!-- User image -->
                                                    <div class="media-left">
                                                        <div class="image">
                                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" data-user-popover="6" alt="" />
                                                        </div>
                                                    </div>
                                                    <!-- Content -->
                                                    <div class="media-content">
                                                        <a href="#">Elise Walker</a>
                                                        <span class="time">6 hours ago</span>
                                                        <p>
                                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                            eiusmod tempo incididunt ut labore et dolore magna aliqua.
                                                        </p>
                                                        <!-- Actions -->
                                                        <div class="controls">
                                                            <div class="like-count">
                                                                <i data-feather="thumbs-up"></i>
                                                                <span>0</span>
                                                            </div>
                                                            <div class="reply">
                                                                <a href="#">Reply</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Right side dropdown -->
                                                    <div class="media-right">
                                                        <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                            <div>
                                                                <div class="button">
                                                                    <i data-feather="more-vertical"></i>
                                                                </div>
                                                            </div>
                                                            <div class="dropdown-menu" role="menu">
                                                                <div class="dropdown-content">
                                                                    <a class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="x"></i>
                                                                            <div class="media-content">
                                                                                <h3>Hide</h3>
                                                                                <small>Hide this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                    <div class="dropdown-divider"></div>
                                                                    <a href="#" class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="flag"></i>
                                                                            <div class="media-content">
                                                                                <h3>Report</h3>
                                                                                <small>Report this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /Nested Comment -->
                                            </div>
                                            <!-- Right side dropdown -->
                                            <div class="media-right">
                                                <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                    <div>
                                                        <div class="button">
                                                            <i data-feather="more-vertical"></i>
                                                        </div>
                                                    </div>
                                                    <div class="dropdown-menu" role="menu">
                                                        <div class="dropdown-content">
                                                            <a class="dropdown-item">
                                                                <div class="media">
                                                                    <i data-feather="x"></i>
                                                                    <div class="media-content">
                                                                        <h3>Hide</h3>
                                                                        <small>Hide this comment.</small>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item">
                                                                <div class="media">
                                                                    <i data-feather="flag"></i>
                                                                    <div class="media-content">
                                                                        <h3>Report</h3>
                                                                        <small>Report this comment.</small>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Comment -->

                                        <!-- Comment -->
                                        <div class="media is-comment">
                                            <!-- User image -->
                                            <div class="media-left">
                                                <div class="image">
                                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/lana.jpeg" data-user-popover="10" alt="" />
                                                </div>
                                            </div>
                                            <!-- Content -->
                                            <div class="media-content">
                                                <a href="#">Lana Henrikssen</a>
                                                <span class="time">10 hours ago</span>
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                    eiusmod tempo incididunt ut labore et dolore magna aliqua.
                                                </p>
                                                <!-- Comment actions -->
                                                <div class="controls">
                                                    <div class="like-count">
                                                        <i data-feather="thumbs-up"></i>
                                                        <span>5</span>
                                                    </div>
                                                    <div class="reply">
                                                        <a href="#">Reply</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Right side dropdown -->
                                            <div class="media-right">
                                                <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                    <div>
                                                        <div class="button">
                                                            <i data-feather="more-vertical"></i>
                                                        </div>
                                                    </div>
                                                    <div class="dropdown-menu" role="menu">
                                                        <div class="dropdown-content">
                                                            <a class="dropdown-item">
                                                                <div class="media">
                                                                    <i data-feather="x"></i>
                                                                    <div class="media-content">
                                                                        <h3>Hide</h3>
                                                                        <small>Hide this comment.</small>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item">
                                                                <div class="media">
                                                                    <i data-feather="flag"></i>
                                                                    <div class="media-content">
                                                                        <h3>Report</h3>
                                                                        <small>Report this comment.</small>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Comment -->
                                    </div>
                                    <!-- /Comments body -->

                                    <!-- Comments footer -->
                                    <div class="card-footer">
                                        <div class="media post-comment has-emojis">
                                            <!-- Comment Textarea -->
                                            <div class="media-content">
                                                <div class="field">
                                                    <p class="control">
                                                        <textarea class="textarea comment-textarea" rows="5" placeholder="Write a comment..."></textarea>
                                                    </p>
                                                </div>
                                                <!-- Additional actions -->
                                                <div class="actions">
                                                    <div class="image is-32x32">
                                                        <img class="is-rounded" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="" />
                                                    </div>
                                                    <div class="toolbar">
                                                        <div class="action is-auto">
                                                            <i data-feather="at-sign"></i>
                                                        </div>
                                                        <div class="action is-emoji">
                                                            <i data-feather="smile"></i>
                                                        </div>
                                                        <div class="action is-upload">
                                                            <i data-feather="camera"></i>
                                                            <input type="file" />
                                                        </div>
                                                        <a class="button is-solid primary-button raised">Post Comment</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Comments footer -->
                                </div>
                                <!-- /Post #1 Comments -->
                            </div>
                            <!-- POST #1 -->

                            <!-- Post 2 -->
                            <!-- /partials/pages/feed/posts/feed-post2.html -->
                            <!-- POST #2 -->
                            <div class="card is-post">
                                <!-- Main wrap -->
                                <div class="content-wrap">
                                    <!-- Post header -->
                                    <div class="card-heading">
                                        <!-- User meta -->
                                        <div class="user-block">
                                            <div class="image">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/edward.jpeg" data-user-popover="5" alt="" />
                                            </div>
                                            <div class="user-info">
                                                <a href="#">Edward Mayers</a>
                                                <span class="time">July 26 2018, 11:14am</span>
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
                                                    <a href="#" class="dropdown-item">
                                                        <div class="media">
                                                            <i data-feather="bookmark"></i>
                                                            <div class="media-content">
                                                                <h3>Bookmark</h3>
                                                                <small>Add this post to your bookmarks.</small>
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <a class="dropdown-item">
                                                        <div class="media">
                                                            <i data-feather="bell"></i>
                                                            <div class="media-content">
                                                                <h3>Notify me</h3>
                                                                <small>Send me the updates.</small>
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <hr class="dropdown-divider" />
                                                    <a href="#" class="dropdown-item">
                                                        <div class="media">
                                                            <i data-feather="flag"></i>
                                                            <div class="media-content">
                                                                <h3>Flag</h3>
                                                                <small>In case of inappropriate content.</small>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Post header -->

                                    <!-- Post body -->
                                    <div class="card-body">
                                        <!-- Post body text -->
                                        <div class="post-text">
                                            <p>
                                                You all know how i love bootstrap, but i didn't have time to dig
                                                deeper into it. Therefore i found this very interesting video i wanted
                                                to share with you all. <a href="#">#bootsrap #webdesign</a>
                                            </p>

                                            <p></p>
                                        </div>
                                        <!-- Featured youtube video -->
                                        <div class="post-link is-video">
                                            <!-- Link image -->
                                            <div class="link-image">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/demo/video/bootstrap.jpg" alt="" />
                                                <div class="video-overlay"></div>
                                                <a class="video-button" data-fancybox href="https://www.youtube.com/watch?v=N8GksI_-iIM">
                                                    <img src="assets/img/icons/video/play.svg" alt="" />
                                                </a>
                                            </div>
                                            <!-- Link content -->
                                            <div class="link-content">
                                                <h4>
                                                    <a href="#">What's new in Bootstrap 4 ?</a>
                                                </h4>
                                                <p>
                                                    Before I create the new Bootstrap 4 crash course I want to go over
                                                    some of the changes from Bootstrap 3.
                                                </p>
                                                <small>Youtube.com</small>
                                            </div>
                                            <!-- Post actions -->
                                            <!-- /partials/pages/feed/buttons/feed-post-actions.html -->
                                            <div class="like-wrapper">
                                                <a href="javascript:void(0);" class="like-button">
                                                    <i class="mdi mdi-heart not-liked bouncy"></i>
                                                    <i class="mdi mdi-heart is-liked bouncy"></i>
                                                    <span class="like-overlay"></span>
                                                </a>
                                            </div>

                                            <div class="fab-wrapper is-share">
                                                <a href="javascript:void(0);" class="small-fab share-fab modal-trigger" data-modal="share-modal">
                                                    <i data-feather="link-2"></i>
                                                </a>
                                            </div>

                                            <div class="fab-wrapper is-comment">
                                                <a href="javascript:void(0);" class="small-fab">
                                                    <i data-feather="message-circle"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Post body -->

                                    <!-- Post footer -->
                                    <div class="card-footer">
                                        <!-- Followers -->
                                        <div class="likers-group">
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/daniel.jpg" data-user-popover="3" alt="" />
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" data-user-popover="6" alt="" />
                                        </div>
                                        <div class="likers-text">
                                            <p>
                                                <a href="#">Daniel</a> and
                                                <a href="#">Elise</a>
                                            </p>
                                            <p>liked this</p>
                                        </div>
                                        <!-- Post statistics -->
                                        <div class="social-count">
                                            <div class="likes-count">
                                                <i data-feather="heart"></i>
                                                <span>2</span>
                                            </div>
                                            <div class="shares-count">
                                                <i data-feather="link-2"></i>
                                                <span>0</span>
                                            </div>
                                            <div class="comments-count">
                                                <i data-feather="message-circle"></i>
                                                <span>2</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Post footer -->
                                </div>
                                <!-- /Main wrap -->

                                <!-- Post #2 comments -->
                                <div class="comments-wrap is-hidden">
                                    <!-- Header -->
                                    <div class="comments-heading">
                                        <h4>Comments <small>(2)</small></h4>
                                        <div class="close-comments">
                                            <i data-feather="x"></i>
                                        </div>
                                    </div>
                                    <!-- /Header -->

                                    <!-- Comments body -->
                                    <div class="comments-body has-slimscroll">
                                        <!-- Comment -->
                                        <div class="media is-comment">
                                            <!-- User image -->
                                            <div class="media-left">
                                                <div class="image">
                                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" data-user-popover="6" alt="" />
                                                </div>
                                            </div>
                                            <!-- Content -->
                                            <div class="media-content">
                                                <a href="#">Elise Walker</a>
                                                <span class="time">2 days ago</span>
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                    eiusmod tempo incididunt ut labore et dolore magna aliqua. Ut enim
                                                    ad minim veniam, quis nostrud exercitation ullamco laboris
                                                    consequat.
                                                </p>
                                                <!-- Comment actions -->
                                                <div class="controls">
                                                    <div class="like-count">
                                                        <i data-feather="thumbs-up"></i>
                                                        <span>1</span>
                                                    </div>
                                                    <div class="reply">
                                                        <a href="#">Reply</a>
                                                    </div>
                                                </div>

                                                <!-- Nested Comment -->
                                                <div class="media is-comment">
                                                    <!-- User image -->
                                                    <div class="media-left">
                                                        <div class="image">
                                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/daniel.jpg" data-user-popover="3" alt="" />
                                                        </div>
                                                    </div>
                                                    <!-- Content -->
                                                    <div class="media-content">
                                                        <a href="#">Daniel Wellington</a>
                                                        <span class="time">2 days ago</span>
                                                        <p>
                                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                            eiusmod tempo incididunt ut labore et dolore magna aliqua.
                                                        </p>
                                                        <!-- Comment actions -->
                                                        <div class="controls">
                                                            <div class="like-count">
                                                                <i data-feather="thumbs-up"></i>
                                                                <span>0</span>
                                                            </div>
                                                            <div class="reply">
                                                                <a href="#">Reply</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Right side dropdown -->
                                                    <div class="media-right">
                                                        <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                            <div>
                                                                <div class="button">
                                                                    <i data-feather="more-vertical"></i>
                                                                </div>
                                                            </div>
                                                            <div class="dropdown-menu" role="menu">
                                                                <div class="dropdown-content">
                                                                    <a class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="x"></i>
                                                                            <div class="media-content">
                                                                                <h3>Hide</h3>
                                                                                <small>Hide this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                    <div class="dropdown-divider"></div>
                                                                    <a href="#" class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="flag"></i>
                                                                            <div class="media-content">
                                                                                <h3>Report</h3>
                                                                                <small>Report this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /Nested Comment -->
                                            </div>
                                            <!-- Right side dropdown -->
                                            <div class="media-right">
                                                <!-- /partials/pages/feed/dropdowns/comment-dropdown.html -->
                                                <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                    <div>
                                                        <div class="button">
                                                            <i data-feather="more-vertical"></i>
                                                        </div>
                                                    </div>
                                                    <div class="dropdown-menu" role="menu">
                                                        <div class="dropdown-content">
                                                            <a class="dropdown-item">
                                                                <div class="media">
                                                                    <i data-feather="x"></i>
                                                                    <div class="media-content">
                                                                        <h3>Hide</h3>
                                                                        <small>Hide this comment.</small>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item">
                                                                <div class="media">
                                                                    <i data-feather="flag"></i>
                                                                    <div class="media-content">
                                                                        <h3>Report</h3>
                                                                        <small>Report this comment.</small>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Comment -->
                                    </div>
                                    <!-- /Comments body -->

                                    <!-- Comments footer -->
                                    <div class="card-footer">
                                        <!-- User image -->
                                        <div class="media post-comment has-emojis">
                                            <!-- Textarea -->
                                            <div class="media-content">
                                                <div class="field">
                                                    <p class="control">
                                                        <textarea class="textarea comment-textarea" rows="5" placeholder="Write a comment..."></textarea>
                                                    </p>
                                                </div>
                                                <!-- Additional actions -->
                                                <div class="actions">
                                                    <div class="image is-32x32">
                                                        <img class="is-rounded" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="" />
                                                    </div>
                                                    <div class="toolbar">
                                                        <div class="action is-auto">
                                                            <i data-feather="at-sign"></i>
                                                        </div>
                                                        <div class="action is-emoji">
                                                            <i data-feather="smile"></i>
                                                        </div>
                                                        <div class="action is-upload">
                                                            <i data-feather="camera"></i>
                                                            <input type="file" />
                                                        </div>
                                                        <a class="button is-solid primary-button raised">Post Comment</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Comments footer -->
                                </div>
                                <!-- /Post #2 comments -->
                            </div>
                            <!-- /POST #2 -->

                            <!-- Post 3 -->
                            <!-- /partials/pages/feed/posts/feed-post3.html -->
                            <!-- POST #3 -->
                            <div class="card is-post">
                                <!-- Main wrap -->
                                <div class="content-wrap">
                                    <!-- Header -->
                                    <div class="card-heading">
                                        <div class="user-block">
                                            <div class="image">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" data-user-popover="6" alt="" />
                                            </div>
                                            <div class="user-info">
                                                <a href="#">Elise Walker</a>
                                                <span class="time">July 19 2018, 19:42pm</span>
                                            </div>
                                        </div>
                                        <!-- /partials/pages/feed/dropdowns/feed-post-dropdown.html -->
                                        <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                            <div>
                                                <div class="button">
                                                    <i data-feather="more-vertical"></i>
                                                </div>
                                            </div>
                                            <div class="dropdown-menu" role="menu">
                                                <div class="dropdown-content">
                                                    <a href="#" class="dropdown-item">
                                                        <div class="media">
                                                            <i data-feather="bookmark"></i>
                                                            <div class="media-content">
                                                                <h3>Bookmark</h3>
                                                                <small>Add this post to your bookmarks.</small>
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <a class="dropdown-item">
                                                        <div class="media">
                                                            <i data-feather="bell"></i>
                                                            <div class="media-content">
                                                                <h3>Notify me</h3>
                                                                <small>Send me the updates.</small>
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <hr class="dropdown-divider" />
                                                    <a href="#" class="dropdown-item">
                                                        <div class="media">
                                                            <i data-feather="flag"></i>
                                                            <div class="media-content">
                                                                <h3>Flag</h3>
                                                                <small>In case of inappropriate content.</small>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Header -->

                                    <!-- Post body -->
                                    <div class="card-body">
                                        <!-- Post body text -->
                                        <div class="post-text">
                                            <p>
                                                Thanks a lot to <a href="#">@Gaelle</a> and <a href="#">@Rolf</a> for
                                                this wonderful team lunch. The food was really tasty and we had some
                                                great laughs. Thanks to all the team, you're all awesome !
                                            </p>

                                            <p></p>
                                        </div>
                                        <!-- Featured image -->
                                        <div class="post-image">
                                            <a data-fancybox="post2" data-lightbox-type="comments" data-thumb="assets/img/demo/unsplash/2.jpg" href="https://via.placeholder.com/1600x900" data-demo-href="assets/img/demo/unsplash/2.jpg">
                                                <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/2.jpg" alt="" />
                                            </a>
                                            <!-- Post actions -->
                                            <!-- /partials/pages/feed/buttons/feed-post-actions.html -->
                                            <div class="like-wrapper">
                                                <a href="javascript:void(0);" class="like-button">
                                                    <i class="mdi mdi-heart not-liked bouncy"></i>
                                                    <i class="mdi mdi-heart is-liked bouncy"></i>
                                                    <span class="like-overlay"></span>
                                                </a>
                                            </div>

                                            <div class="fab-wrapper is-share">
                                                <a href="javascript:void(0);" class="small-fab share-fab modal-trigger" data-modal="share-modal">
                                                    <i data-feather="link-2"></i>
                                                </a>
                                            </div>

                                            <div class="fab-wrapper is-comment">
                                                <a href="javascript:void(0);" class="small-fab">
                                                    <i data-feather="message-circle"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Post body -->

                                    <!-- Post footer -->
                                    <div class="card-footer">
                                        <!-- Followers -->
                                        <div class="likers-group">
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/gaelle.jpeg" data-user-popover="11" alt="" />
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/edward.jpeg" data-user-popover="5" alt="" />
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/nelly.png" data-user-popover="9" alt="" />
                                        </div>
                                        <div class="likers-text">
                                            <p>
                                                <a href="#">Gaelle</a>,
                                                <a href="#">Edward</a>
                                            </p>
                                            <p>and 1 more liked this</p>
                                        </div>
                                        <!-- Post statistics -->
                                        <div class="social-count">
                                            <div class="likes-count">
                                                <i data-feather="heart"></i>
                                                <span>3</span>
                                            </div>
                                            <div class="shares-count">
                                                <i data-feather="link-2"></i>
                                                <span>0</span>
                                            </div>
                                            <div class="comments-count">
                                                <i data-feather="message-circle"></i>
                                                <span>5</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Post footer -->
                                </div>
                                <!-- /Main wrap -->

                                <!-- Post #3 comments -->
                                <div class="comments-wrap is-hidden">
                                    <!-- Header -->
                                    <div class="comments-heading">
                                        <h4>Comments <small>(5)</small></h4>
                                        <div class="close-comments">
                                            <i data-feather="x"></i>
                                        </div>
                                    </div>
                                    <!-- Header -->

                                    <!-- Comments body -->
                                    <div class="comments-body has-slimscroll">
                                        <!-- Comment -->
                                        <div class="media is-comment">
                                            <!-- User image -->
                                            <div class="media-left">
                                                <div class="image">
                                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/gaelle.jpeg" data-user-popover="11" alt="" />
                                                </div>
                                            </div>
                                            <!-- Content -->
                                            <div class="media-content">
                                                <a href="#">Gaelle Morris</a>
                                                <span class="time">2 days ago</span>
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                    eiusmod tempo incididunt ut labore et dolore magna aliqua. Ut enim
                                                    ad minim veniam, quis nostrud exercitation ullamco laboris
                                                    consequat.
                                                </p>
                                                <!-- Comment actions -->
                                                <div class="controls">
                                                    <div class="like-count">
                                                        <i data-feather="thumbs-up"></i>
                                                        <span>3</span>
                                                    </div>
                                                    <div class="reply">
                                                        <a href="#">Reply</a>
                                                    </div>
                                                </div>

                                                <!-- Nested Comment -->
                                                <div class="media is-comment">
                                                    <!-- User image -->
                                                    <div class="media-left">
                                                        <div class="image">
                                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" data-user-popover="6" alt="" />
                                                        </div>
                                                    </div>
                                                    <!-- Content -->
                                                    <div class="media-content">
                                                        <a href="#">Elise Walker</a>
                                                        <span class="time">2 days ago</span>
                                                        <p>
                                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                            eiusmod tempo incididunt ut labore et dolore magna aliqua.
                                                        </p>
                                                        <!-- Comment actions -->
                                                        <div class="controls">
                                                            <div class="like-count">
                                                                <i data-feather="thumbs-up"></i>
                                                                <span>1</span>
                                                            </div>
                                                            <div class="reply">
                                                                <a href="#">Reply</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Right side dropdown -->
                                                    <div class="media-right">
                                                        <!-- /partials/pages/feed/dropdowns/comment-dropdown.html -->
                                                        <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                            <div>
                                                                <div class="button">
                                                                    <i data-feather="more-vertical"></i>
                                                                </div>
                                                            </div>
                                                            <div class="dropdown-menu" role="menu">
                                                                <div class="dropdown-content">
                                                                    <a class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="x"></i>
                                                                            <div class="media-content">
                                                                                <h3>Hide</h3>
                                                                                <small>Hide this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                    <div class="dropdown-divider"></div>
                                                                    <a href="#" class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="flag"></i>
                                                                            <div class="media-content">
                                                                                <h3>Report</h3>
                                                                                <small>Report this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /Nested Comment -->

                                                <!-- Nested Comment -->
                                                <div class="media is-comment">
                                                    <!-- User image -->
                                                    <div class="media-left">
                                                        <div class="image">
                                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/rolf.jpg" data-user-popover="13" alt="" />
                                                        </div>
                                                    </div>
                                                    <!-- Content -->
                                                    <div class="media-content">
                                                        <a href="#">Rolf Krupp</a>
                                                        <span class="time">2 days ago</span>
                                                        <p>
                                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                            eiusmod tempo incididunt.
                                                        </p>
                                                        <!-- Comment actions -->
                                                        <div class="controls">
                                                            <div class="like-count">
                                                                <i data-feather="thumbs-up"></i>
                                                                <span>1</span>
                                                            </div>
                                                            <div class="reply">
                                                                <a href="#">Reply</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Right side dropdown -->
                                                    <div class="media-right">
                                                        <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                            <div>
                                                                <div class="button">
                                                                    <i data-feather="more-vertical"></i>
                                                                </div>
                                                            </div>
                                                            <div class="dropdown-menu" role="menu">
                                                                <div class="dropdown-content">
                                                                    <a class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="x"></i>
                                                                            <div class="media-content">
                                                                                <h3>Hide</h3>
                                                                                <small>Hide this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                    <div class="dropdown-divider"></div>
                                                                    <a href="#" class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="flag"></i>
                                                                            <div class="media-content">
                                                                                <h3>Report</h3>
                                                                                <small>Report this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /Nested Comment -->

                                                <!-- Nested Comment -->
                                                <div class="media is-comment">
                                                    <!-- User image -->
                                                    <div class="media-left">
                                                        <div class="image">
                                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" data-user-popover="6" alt="" />
                                                        </div>
                                                    </div>
                                                    <!-- Content -->
                                                    <div class="media-content">
                                                        <a href="#">Elise Walker</a>
                                                        <span class="time">2 days ago</span>
                                                        <p>
                                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                            eiusmod tempo incididunt ut labore et dolore magna aliqua.
                                                        </p>
                                                        <!-- Comment actions -->
                                                        <div class="controls">
                                                            <div class="like-count">
                                                                <i data-feather="thumbs-up"></i>
                                                                <span>1</span>
                                                            </div>
                                                            <div class="reply">
                                                                <a href="#">Reply</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Right side dropdown -->
                                                    <div class="media-right">
                                                        <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                            <div>
                                                                <div class="button">
                                                                    <i data-feather="more-vertical"></i>
                                                                </div>
                                                            </div>
                                                            <div class="dropdown-menu" role="menu">
                                                                <div class="dropdown-content">
                                                                    <a class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="x"></i>
                                                                            <div class="media-content">
                                                                                <h3>Hide</h3>
                                                                                <small>Hide this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                    <div class="dropdown-divider"></div>
                                                                    <a href="#" class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="flag"></i>
                                                                            <div class="media-content">
                                                                                <h3>Report</h3>
                                                                                <small>Report this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /Nested Comment -->
                                            </div>
                                            <!-- Right side dropdown -->
                                            <div class="media-right">
                                                <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                    <div>
                                                        <div class="button">
                                                            <i data-feather="more-vertical"></i>
                                                        </div>
                                                    </div>
                                                    <div class="dropdown-menu" role="menu">
                                                        <div class="dropdown-content">
                                                            <a class="dropdown-item">
                                                                <div class="media">
                                                                    <i data-feather="x"></i>
                                                                    <div class="media-content">
                                                                        <h3>Hide</h3>
                                                                        <small>Hide this comment.</small>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item">
                                                                <div class="media">
                                                                    <i data-feather="flag"></i>
                                                                    <div class="media-content">
                                                                        <h3>Report</h3>
                                                                        <small>Report this comment.</small>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Comment -->

                                        <!-- Comment -->
                                        <div class="media is-comment">
                                            <!-- User image -->
                                            <div class="media-left">
                                                <div class="image">
                                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/nelly.png" data-user-popover="9" alt="" />
                                                </div>
                                            </div>
                                            <!-- Content -->
                                            <div class="media-content">
                                                <a href="#">Nelly Schwartz</a>
                                                <span class="time">2 days ago</span>
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                    eiusmod tempo incididunt ut labore et dolore magna aliqua.
                                                </p>
                                                <!-- Comment actions -->
                                                <div class="controls">
                                                    <div class="like-count">
                                                        <i data-feather="thumbs-up"></i>
                                                        <span>1</span>
                                                    </div>
                                                    <div class="reply">
                                                        <a href="#">Reply</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Right side dropdown -->
                                            <div class="media-right">
                                                <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                    <div>
                                                        <div class="button">
                                                            <i data-feather="more-vertical"></i>
                                                        </div>
                                                    </div>
                                                    <div class="dropdown-menu" role="menu">
                                                        <div class="dropdown-content">
                                                            <a class="dropdown-item">
                                                                <div class="media">
                                                                    <i data-feather="x"></i>
                                                                    <div class="media-content">
                                                                        <h3>Hide</h3>
                                                                        <small>Hide this comment.</small>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item">
                                                                <div class="media">
                                                                    <i data-feather="flag"></i>
                                                                    <div class="media-content">
                                                                        <h3>Report</h3>
                                                                        <small>Report this comment.</small>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Comment -->
                                    </div>
                                    <!-- Comments body -->

                                    <!-- Comments footer -->
                                    <div class="card-footer">
                                        <div class="media post-comment has-emojis">
                                            <!-- Textarea -->
                                            <div class="media-content">
                                                <div class="field">
                                                    <p class="control">
                                                        <textarea class="textarea comment-textarea" rows="5" placeholder="Write a comment..."></textarea>
                                                    </p>
                                                </div>
                                                <!-- Additional actions -->
                                                <div class="actions">
                                                    <div class="image is-32x32">
                                                        <img class="is-rounded" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="" />
                                                    </div>
                                                    <div class="toolbar">
                                                        <div class="action is-auto">
                                                            <i data-feather="at-sign"></i>
                                                        </div>
                                                        <div class="action is-emoji">
                                                            <i data-feather="smile"></i>
                                                        </div>
                                                        <div class="action is-upload">
                                                            <i data-feather="camera"></i>
                                                            <input type="file" />
                                                        </div>
                                                        <a class="button is-solid primary-button raised">Post Comment</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Comments footer -->
                                </div>
                                <!-- /Post #3 Comments -->
                            </div>
                            <!-- /POST #3 -->

                            <!-- Post 4 -->
                            <!-- /partials/pages/feed/posts/feed-post4.html -->
                            <!-- POST #4 -->
                            <div class="card is-post">
                                <!-- Main wrap -->
                                <div class="content-wrap">
                                    <!-- Header -->
                                    <div class="card-heading">
                                        <div class="user-block">
                                            <div class="image">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/stella.jpg" data-user-popover="2" alt="" />
                                            </div>
                                            <div class="user-info">
                                                <a href="#">Stella Bergmann</a>
                                                <span class="time">July 19 2018, 15:13pm</span>
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
                                                    <a href="#" class="dropdown-item">
                                                        <div class="media">
                                                            <i data-feather="bookmark"></i>
                                                            <div class="media-content">
                                                                <h3>Bookmark</h3>
                                                                <small>Add this post to your bookmarks.</small>
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <a class="dropdown-item">
                                                        <div class="media">
                                                            <i data-feather="bell"></i>
                                                            <div class="media-content">
                                                                <h3>Notify me</h3>
                                                                <small>Send me the updates.</small>
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <hr class="dropdown-divider" />
                                                    <a href="#" class="dropdown-item">
                                                        <div class="media">
                                                            <i data-feather="flag"></i>
                                                            <div class="media-content">
                                                                <h3>Flag</h3>
                                                                <small>In case of inappropriate content.</small>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Header -->

                                    <!-- Post body -->
                                    <div class="card-body">
                                        <!-- Post body text -->
                                        <div class="post-text">
                                            <p>
                                                Hey friends ! Iam back and i wanted to share with you some awesome
                                                pictures we took during our trip to Santa Monica. We had wonderful
                                                holidays at the beach. Kisses to all !
                                            </p>

                                            <p></p>
                                        </div>
                                        <!-- Featured image -->
                                        <div class="post-image">
                                            <!-- CSS masonry wrap -->
                                            <div class="masonry-grid">
                                                <!-- Left column -->
                                                <div class="masonry-column-left">
                                                    <a data-fancybox="post3" data-lightbox-type="comments" data-thumb="assets/img/demo/unsplash/3.jpg" href="https://via.placeholder.com/1600x900" data-demo-href="assets/img/demo/unsplash/3.jpg">
                                                        <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/3.jpg" alt="" />
                                                    </a>
                                                    <a data-fancybox="post3" data-lightbox-type="comments" data-thumb="assets/img/demo/unsplash/4.jpg" href="https://via.placeholder.com/1600x900" data-demo-href="assets/img/demo/unsplash/4.jpg">
                                                        <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/4.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <!-- Right column -->
                                                <div class="masonry-column-right">
                                                    <a data-fancybox="post3" data-lightbox-type="comments" data-thumb="assets/img/demo/unsplash/5.jpg" href="https://via.placeholder.com/1600x900" data-demo-href="assets/img/demo/unsplash/5.jpg">
                                                        <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/5.jpg" alt="" />
                                                    </a>
                                                    <a data-fancybox="post3" data-lightbox-type="comments" data-thumb="assets/img/demo/unsplash/6.jpg" href="https://via.placeholder.com/1600x900" data-demo-href="assets/img/demo/unsplash/6.jpg">
                                                        <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/6.jpg" alt="" />
                                                    </a>
                                                    <a data-fancybox="post3" data-lightbox-type="comments" data-thumb="assets/img/demo/unsplash/7.jpg" href="https://via.placeholder.com/1600x900" data-demo-href="assets/img/demo/unsplash/7.jpg">
                                                        <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/7.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <!-- Post actions -->
                                                <!-- /partials/pages/feed/buttons/feed-post-actions.html -->
                                                <div class="like-wrapper">
                                                    <a href="javascript:void(0);" class="like-button">
                                                        <i class="mdi mdi-heart not-liked bouncy"></i>
                                                        <i class="mdi mdi-heart is-liked bouncy"></i>
                                                        <span class="like-overlay"></span>
                                                    </a>
                                                </div>

                                                <div class="fab-wrapper is-share">
                                                    <a href="javascript:void(0);" class="small-fab share-fab modal-trigger" data-modal="share-modal">
                                                        <i data-feather="link-2"></i>
                                                    </a>
                                                </div>

                                                <div class="fab-wrapper is-comment">
                                                    <a href="javascript:void(0);" class="small-fab">
                                                        <i data-feather="message-circle"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Post body -->

                                    <!-- Post footer -->
                                    <div class="card-footer">
                                        <!-- Followers -->
                                        <div class="likers-group">
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/rolf.jpg" data-user-popover="13" alt="" />
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/mike.jpg" data-user-popover="12" alt="" />
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/daniel.jpg" data-user-popover="3" alt="" />
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" data-user-popover="6" alt="" />
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/david.jpg" data-user-popover="4" alt="" />
                                        </div>
                                        <div class="likers-text">
                                            <p>
                                                <a href="#">Gaelle</a>,
                                                <a href="#">Rolf</a>
                                            </p>
                                            <p>and 31 more liked this</p>
                                        </div>
                                        <!-- Post statistics -->
                                        <div class="social-count">
                                            <div class="likes-count">
                                                <i data-feather="heart"></i>
                                                <span>33</span>
                                            </div>
                                            <div class="shares-count">
                                                <i data-feather="link-2"></i>
                                                <span>1</span>
                                            </div>
                                            <div class="comments-count">
                                                <i data-feather="message-circle"></i>
                                                <span>9</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Post footer -->
                                </div>
                                <!-- Main wrap -->

                                <!-- Post #4 comments -->
                                <div class="comments-wrap is-hidden">
                                    <!-- Header -->
                                    <div class="comments-heading">
                                        <h4>Comments <small>(9)</small></h4>
                                        <div class="close-comments">
                                            <i data-feather="x"></i>
                                        </div>
                                    </div>
                                    <!-- /Header -->

                                    <!-- Comments body -->
                                    <div class="comments-body has-slimscroll">
                                        <!-- Comment -->
                                        <div class="media is-comment">
                                            <!-- User image -->
                                            <div class="media-left">
                                                <div class="image">
                                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="" />
                                                </div>
                                            </div>
                                            <!-- Content -->
                                            <div class="media-content">
                                                <a href="#">Jenna Davis</a>
                                                <span class="time">30 minutes ago</span>
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                    eiusmod tempo incididunt ut labore et dolore magna aliqua. Ut enim
                                                    ad minim veniam, quis nostrud exercitation ullamco laboris
                                                    consequat.
                                                </p>
                                                <!-- Comment actions -->
                                                <div class="controls">
                                                    <div class="like-count">
                                                        <i data-feather="thumbs-up"></i>
                                                        <span>0</span>
                                                    </div>
                                                    <div class="reply">
                                                        <a href="#">Reply</a>
                                                    </div>
                                                </div>

                                                <!-- Nested Comment -->
                                                <div class="media is-comment">
                                                    <!-- User image -->
                                                    <div class="media-left">
                                                        <div class="image">
                                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/lana.jpeg" data-user-popover="10" alt="" />
                                                        </div>
                                                    </div>
                                                    <!-- Content -->
                                                    <div class="media-content">
                                                        <a href="#">Lana Henrikssen</a>
                                                        <span class="time">15 minutes ago</span>
                                                        <p>
                                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                            eiusmod tempo.
                                                        </p>
                                                        <!-- Comment actions -->
                                                        <div class="controls">
                                                            <div class="like-count">
                                                                <i data-feather="thumbs-up"></i>
                                                                <span>2</span>
                                                            </div>
                                                            <div class="reply">
                                                                <a href="#">Reply</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Right side dropdown -->
                                                    <div class="media-right">
                                                        <!-- /partials/pages/feed/dropdowns/comment-dropdown.html -->
                                                        <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                            <div>
                                                                <div class="button">
                                                                    <i data-feather="more-vertical"></i>
                                                                </div>
                                                            </div>
                                                            <div class="dropdown-menu" role="menu">
                                                                <div class="dropdown-content">
                                                                    <a class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="x"></i>
                                                                            <div class="media-content">
                                                                                <h3>Hide</h3>
                                                                                <small>Hide this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                    <div class="dropdown-divider"></div>
                                                                    <a href="#" class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="flag"></i>
                                                                            <div class="media-content">
                                                                                <h3>Report</h3>
                                                                                <small>Report this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /Nested Comment -->

                                                <!-- Nested Comment -->
                                                <div class="media is-comment">
                                                    <!-- User image -->
                                                    <div class="media-left">
                                                        <div class="image">
                                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/david.jpg" data-user-popover="4" alt="" />
                                                        </div>
                                                    </div>
                                                    <!-- Content -->
                                                    <div class="media-content">
                                                        <a href="#">David Kim</a>
                                                        <span class="time">12 minutes ago</span>
                                                        <p>
                                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                            eiusmod tempo incididunt ut labore et dolore magna aliqua.
                                                        </p>
                                                        <div class="controls">
                                                            <div class="like-count">
                                                                <i data-feather="thumbs-up"></i>
                                                                <span>5</span>
                                                            </div>
                                                            <div class="reply">
                                                                <a href="#">Reply</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Right side dropdown -->
                                                    <div class="media-right">
                                                        <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                            <div>
                                                                <div class="button">
                                                                    <i data-feather="more-vertical"></i>
                                                                </div>
                                                            </div>
                                                            <div class="dropdown-menu" role="menu">
                                                                <div class="dropdown-content">
                                                                    <a class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="x"></i>
                                                                            <div class="media-content">
                                                                                <h3>Hide</h3>
                                                                                <small>Hide this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                    <div class="dropdown-divider"></div>
                                                                    <a href="#" class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="flag"></i>
                                                                            <div class="media-content">
                                                                                <h3>Report</h3>
                                                                                <small>Report this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /Nested Comment -->

                                                <!-- Nested Comment -->
                                                <div class="media is-comment">
                                                    <!-- User image -->
                                                    <div class="media-left">
                                                        <div class="image">
                                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/mike.jpg" data-user-popover="12" alt="" />
                                                        </div>
                                                    </div>
                                                    <!-- Content -->
                                                    <div class="media-content">
                                                        <a href="#">Mike Lasalle</a>
                                                        <span class="time">8 minutes ago</span>
                                                        <p>
                                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                            eiusmod tempo incididunt.
                                                        </p>
                                                        <div class="controls">
                                                            <div class="like-count">
                                                                <i data-feather="thumbs-up"></i>
                                                                <span>5</span>
                                                            </div>
                                                            <div class="reply">
                                                                <a href="#">Reply</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Right side dropdown -->
                                                    <div class="media-right">
                                                        <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                            <div>
                                                                <div class="button">
                                                                    <i data-feather="more-vertical"></i>
                                                                </div>
                                                            </div>
                                                            <div class="dropdown-menu" role="menu">
                                                                <div class="dropdown-content">
                                                                    <a class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="x"></i>
                                                                            <div class="media-content">
                                                                                <h3>Hide</h3>
                                                                                <small>Hide this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                    <div class="dropdown-divider"></div>
                                                                    <a href="#" class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="flag"></i>
                                                                            <div class="media-content">
                                                                                <h3>Report</h3>
                                                                                <small>Report this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /Nested Comment -->

                                                <!-- Nested Comment -->
                                                <div class="media is-comment">
                                                    <!-- User image -->
                                                    <div class="media-left">
                                                        <div class="image">
                                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/stella.jpg" data-user-popover="2" alt="" />
                                                        </div>
                                                    </div>
                                                    <!-- Content -->
                                                    <div class="media-content">
                                                        <a href="#">Stella Bergmann</a>
                                                        <span class="time">Just now</span>
                                                        <p>
                                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                            eiusmod tempo incididunt.
                                                        </p>
                                                        <div class="controls">
                                                            <div class="like-count">
                                                                <i data-feather="thumbs-up"></i>
                                                                <span>2</span>
                                                            </div>
                                                            <div class="reply">
                                                                <a href="#">Reply</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Right side dropdown -->
                                                    <div class="media-right">
                                                        <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                            <div>
                                                                <div class="button">
                                                                    <i data-feather="more-vertical"></i>
                                                                </div>
                                                            </div>
                                                            <div class="dropdown-menu" role="menu">
                                                                <div class="dropdown-content">
                                                                    <a class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="x"></i>
                                                                            <div class="media-content">
                                                                                <h3>Hide</h3>
                                                                                <small>Hide this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                    <div class="dropdown-divider"></div>
                                                                    <a href="#" class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="flag"></i>
                                                                            <div class="media-content">
                                                                                <h3>Report</h3>
                                                                                <small>Report this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /Nested Comment -->
                                            </div>
                                            <!-- Right side dropdown -->
                                            <div class="media-right">
                                                <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                    <div>
                                                        <div class="button">
                                                            <i data-feather="more-vertical"></i>
                                                        </div>
                                                    </div>
                                                    <div class="dropdown-menu" role="menu">
                                                        <div class="dropdown-content">
                                                            <a class="dropdown-item">
                                                                <div class="media">
                                                                    <i data-feather="x"></i>
                                                                    <div class="media-content">
                                                                        <h3>Hide</h3>
                                                                        <small>Hide this comment.</small>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item">
                                                                <div class="media">
                                                                    <i data-feather="flag"></i>
                                                                    <div class="media-content">
                                                                        <h3>Report</h3>
                                                                        <small>Report this comment.</small>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Comment -->

                                        <!-- Comment -->
                                        <div class="media is-comment">
                                            <!-- User image -->
                                            <div class="media-left">
                                                <div class="image">
                                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/daniel.jpg" data-user-popover="3" alt="" />
                                                </div>
                                            </div>
                                            <!-- Content -->
                                            <div class="media-content">
                                                <a href="#">Daniel Wellington</a>
                                                <span class="time">5 hours ago</span>
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                    eiusmod tempo incididunt ut labore et dolore magna aliqua.
                                                </p>
                                                <!-- Comment actions -->
                                                <div class="controls">
                                                    <div class="like-count">
                                                        <i data-feather="thumbs-up"></i>
                                                        <span>1</span>
                                                    </div>
                                                    <div class="reply">
                                                        <a href="#">Reply</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Right side dropdown -->
                                            <div class="media-right">
                                                <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                    <div>
                                                        <div class="button">
                                                            <i data-feather="more-vertical"></i>
                                                        </div>
                                                    </div>
                                                    <div class="dropdown-menu" role="menu">
                                                        <div class="dropdown-content">
                                                            <a class="dropdown-item">
                                                                <div class="media">
                                                                    <i data-feather="x"></i>
                                                                    <div class="media-content">
                                                                        <h3>Hide</h3>
                                                                        <small>Hide this comment.</small>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item">
                                                                <div class="media">
                                                                    <i data-feather="flag"></i>
                                                                    <div class="media-content">
                                                                        <h3>Report</h3>
                                                                        <small>Report this comment.</small>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Comment -->

                                        <!-- Comment -->
                                        <div class="media is-comment">
                                            <!-- User image -->
                                            <div class="media-left">
                                                <div class="image">
                                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/bobby.jpg" data-user-popover="8" alt="" />
                                                </div>
                                            </div>
                                            <!-- Content -->
                                            <div class="media-content">
                                                <a href="#">Bobby Brown</a>
                                                <span class="time">7 hours ago</span>
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                    eiusmod tempo incididunt ut labore et dolore magna aliqua.
                                                </p>
                                                <!-- Comment actions -->
                                                <div class="controls">
                                                    <div class="like-count">
                                                        <i data-feather="thumbs-up"></i>
                                                        <span>1</span>
                                                    </div>
                                                    <div class="reply">
                                                        <a href="#">Reply</a>
                                                    </div>
                                                </div>

                                                <!-- Nested Comment -->
                                                <div class="media is-comment">
                                                    <!-- User image -->
                                                    <div class="media-left">
                                                        <div class="image">
                                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/stella.jpg" data-user-popover="2" alt="" />
                                                        </div>
                                                    </div>
                                                    <!-- Content -->
                                                    <div class="media-content">
                                                        <a href="#">Stella Bergmann</a>
                                                        <span class="time">7 hours ago</span>
                                                        <p>
                                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                            eiusmod tempo incididunt.
                                                        </p>
                                                        <div class="controls">
                                                            <div class="like-count">
                                                                <i data-feather="thumbs-up"></i>
                                                                <span>2</span>
                                                            </div>
                                                            <div class="reply">
                                                                <a href="#">Reply</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Right side dropdown -->
                                                    <div class="media-right">
                                                        <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                            <div>
                                                                <div class="button">
                                                                    <i data-feather="more-vertical"></i>
                                                                </div>
                                                            </div>
                                                            <div class="dropdown-menu" role="menu">
                                                                <div class="dropdown-content">
                                                                    <a class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="x"></i>
                                                                            <div class="media-content">
                                                                                <h3>Hide</h3>
                                                                                <small>Hide this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                    <div class="dropdown-divider"></div>
                                                                    <a href="#" class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="flag"></i>
                                                                            <div class="media-content">
                                                                                <h3>Report</h3>
                                                                                <small>Report this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /Nested Comment -->

                                                <!-- Nested Comment -->
                                                <div class="media is-comment">
                                                    <!-- User image -->
                                                    <div class="media-left">
                                                        <div class="image">
                                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/lana.jpeg" data-user-popover="10" alt="" />
                                                        </div>
                                                    </div>
                                                    <!-- Content -->
                                                    <div class="media-content">
                                                        <a href="#">Lana Henrikssen</a>
                                                        <span class="time">15 minutes ago</span>
                                                        <p>
                                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                            eiusmod tempo.
                                                        </p>
                                                        <!-- Comment actions -->
                                                        <div class="controls">
                                                            <div class="like-count">
                                                                <i data-feather="thumbs-up"></i>
                                                                <span>2</span>
                                                            </div>
                                                            <div class="reply">
                                                                <a href="#">Reply</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Right side dropdown -->
                                                    <div class="media-right">
                                                        <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                            <div>
                                                                <div class="button">
                                                                    <i data-feather="more-vertical"></i>
                                                                </div>
                                                            </div>
                                                            <div class="dropdown-menu" role="menu">
                                                                <div class="dropdown-content">
                                                                    <a class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="x"></i>
                                                                            <div class="media-content">
                                                                                <h3>Hide</h3>
                                                                                <small>Hide this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                    <div class="dropdown-divider"></div>
                                                                    <a href="#" class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="flag"></i>
                                                                            <div class="media-content">
                                                                                <h3>Report</h3>
                                                                                <small>Report this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /Nested Comment -->
                                            </div>
                                            <!-- Right side dropdown -->
                                            <div class="media-right">
                                                <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                    <div>
                                                        <div class="button">
                                                            <i data-feather="more-vertical"></i>
                                                        </div>
                                                    </div>
                                                    <div class="dropdown-menu" role="menu">
                                                        <div class="dropdown-content">
                                                            <a class="dropdown-item">
                                                                <div class="media">
                                                                    <i data-feather="x"></i>
                                                                    <div class="media-content">
                                                                        <h3>Hide</h3>
                                                                        <small>Hide this comment.</small>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item">
                                                                <div class="media">
                                                                    <i data-feather="flag"></i>
                                                                    <div class="media-content">
                                                                        <h3>Report</h3>
                                                                        <small>Report this comment.</small>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Comment -->
                                    </div>
                                    <!-- /Comments body -->

                                    <!-- Comments footer -->
                                    <div class="card-footer">
                                        <div class="media post-comment has-emojis">
                                            <!-- Textarea -->
                                            <div class="media-content">
                                                <div class="field">
                                                    <p class="control">
                                                        <textarea class="textarea comment-textarea" rows="5" placeholder="Write a comment..."></textarea>
                                                    </p>
                                                </div>
                                                <!-- Additional actions -->
                                                <div class="actions">
                                                    <div class="image is-32x32">
                                                        <img class="is-rounded" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="" />
                                                    </div>
                                                    <div class="toolbar">
                                                        <div class="action is-auto">
                                                            <i data-feather="at-sign"></i>
                                                        </div>
                                                        <div class="action is-emoji">
                                                            <i data-feather="smile"></i>
                                                        </div>
                                                        <div class="action is-upload">
                                                            <i data-feather="camera"></i>
                                                            <input type="file" />
                                                        </div>
                                                        <a class="button is-solid primary-button raised">Post Comment</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Comments footer -->
                                </div>
                                <!-- /Post #4 comments -->
                            </div>
                            <!-- /POST #4 -->

                            <!-- Post 5 -->
                            <!-- /partials/pages/feed/posts/feed-post5.html -->
                            <!-- POST #5 -->
                            <div class="card is-post">
                                <!-- Main wrap -->
                                <div class="content-wrap">
                                    <!-- Header -->
                                    <div class="card-heading">
                                        <!-- User image -->
                                        <div class="user-block">
                                            <div class="image">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/david.jpg" data-user-popover="4" alt="" />
                                            </div>
                                            <div class="user-info">
                                                <a href="#">David Kim</a>
                                                <span class="time">August 02 2018, 03:04pm</span>
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
                                                    <a href="#" class="dropdown-item">
                                                        <div class="media">
                                                            <i data-feather="bookmark"></i>
                                                            <div class="media-content">
                                                                <h3>Bookmark</h3>
                                                                <small>Add this post to your bookmarks.</small>
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <a class="dropdown-item">
                                                        <div class="media">
                                                            <i data-feather="bell"></i>
                                                            <div class="media-content">
                                                                <h3>Notify me</h3>
                                                                <small>Send me the updates.</small>
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <hr class="dropdown-divider" />
                                                    <a href="#" class="dropdown-item">
                                                        <div class="media">
                                                            <i data-feather="flag"></i>
                                                            <div class="media-content">
                                                                <h3>Flag</h3>
                                                                <small>In case of inappropriate content.</small>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Header -->

                                    <!-- Post body -->
                                    <div class="card-body">
                                        <!-- Post body text -->
                                        <div class="post-text">
                                            <p>
                                                Just discovered this awesome CSS framework named
                                                <a href="#">#bulmaCss</a>. It's based on flexbox, so easy to use and
                                                comes with so many mobile first modifiers. You can build anything from
                                                scratch easily with Bulma.
                                                <a href="#">#webdesign #bulmaio</a>
                                            </p>
                                        </div>
                                        <!-- Featured link -->
                                        <div class="post-link">
                                            <!-- link image -->
                                            <div class="link-image">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/demo/video/bulma2.png" alt="" />
                                            </div>
                                            <!-- Link content -->
                                            <div class="link-content">
                                                <h4>
                                                    <a href="#">Bulma CSS Framework</a>
                                                </h4>
                                                <p>
                                                    Bulma is a mobile first CSS framework built on top of Flexbox. It's
                                                    awesome and so easy to use.
                                                </p>
                                                <small>Bulma.io</small>
                                            </div>
                                            <!-- Post actions -->
                                            <!-- /partials/pages/feed/buttons/feed-post-actions.html -->
                                            <div class="like-wrapper">
                                                <a href="javascript:void(0);" class="like-button">
                                                    <i class="mdi mdi-heart not-liked bouncy"></i>
                                                    <i class="mdi mdi-heart is-liked bouncy"></i>
                                                    <span class="like-overlay"></span>
                                                </a>
                                            </div>

                                            <div class="fab-wrapper is-share">
                                                <a href="javascript:void(0);" class="small-fab share-fab modal-trigger" data-modal="share-modal">
                                                    <i data-feather="link-2"></i>
                                                </a>
                                            </div>

                                            <div class="fab-wrapper is-comment">
                                                <a href="javascript:void(0);" class="small-fab">
                                                    <i data-feather="message-circle"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Post body -->

                                    <!-- Post footer -->
                                    <div class="card-footer">
                                        <!-- Followers -->
                                        <div class="likers-group">
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/lana.jpeg" data-user-popover="10" alt="" />
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/mike.jpg" data-user-popover="12" alt="" />
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/gaelle.jpeg" data-user-popover="11" alt="" />
                                        </div>
                                        <div class="likers-text">
                                            <p>
                                                <a href="#">Lana</a>,
                                                <a href="#">Mike</a>
                                            </p>
                                            <p>and 1 more liked this</p>
                                        </div>
                                        <!-- Post statistics -->
                                        <div class="social-count">
                                            <div class="likes-count">
                                                <i data-feather="heart"></i>
                                                <span>11</span>
                                            </div>
                                            <div class="shares-count">
                                                <i data-feather="link-2"></i>
                                                <span>3</span>
                                            </div>
                                            <div class="comments-count">
                                                <i data-feather="message-circle"></i>
                                                <span>2</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Post footer -->
                                </div>
                                <!-- /Main wrap -->

                                <!-- Post #5 comments -->
                                <div class="comments-wrap is-hidden">
                                    <!-- Header -->
                                    <div class="comments-heading">
                                        <h4>
                                            Comments
                                            <small>(2)</small>
                                        </h4>
                                        <div class="close-comments">
                                            <i data-feather="x"></i>
                                        </div>
                                    </div>
                                    <!-- /Header -->

                                    <!-- Comments body -->
                                    <div class="comments-body has-slimscroll">
                                        <!-- Comment -->
                                        <div class="media is-comment">
                                            <!-- User image -->
                                            <div class="media-left">
                                                <div class="image">
                                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/lana.jpeg" data-user-popover="10" alt="" />
                                                </div>
                                            </div>
                                            <!-- Content -->
                                            <div class="media-content">
                                                <a href="#">Lana Henrikssen</a>
                                                <span class="time">2 days ago</span>
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                    eiusmod tempo incididunt ut labore et dolore magna aliqua. Ut enim
                                                    ad minim veniam, quis nostrud exercitation ullamco laboris
                                                    consequat.
                                                </p>
                                                <!-- Comment actions -->
                                                <div class="controls">
                                                    <div class="like-count">
                                                        <i data-feather="thumbs-up"></i>
                                                        <span>1</span>
                                                    </div>
                                                    <div class="reply">
                                                        <a href="#">Reply</a>
                                                    </div>
                                                </div>

                                                <!-- Nested Comment -->
                                                <div class="media is-comment">
                                                    <!-- User image -->
                                                    <div class="media-left">
                                                        <div class="image">
                                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/david.jpg" data-user-popover="4" alt="" />
                                                        </div>
                                                    </div>
                                                    <!-- Content -->
                                                    <div class="media-content">
                                                        <a href="#">David Kim</a>
                                                        <span class="time">2 days ago</span>
                                                        <p>
                                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                            eiusmod tempo incididunt ut labore et dolore magna aliqua.
                                                        </p>
                                                        <!-- Comment actions -->
                                                        <div class="controls">
                                                            <div class="like-count">
                                                                <i data-feather="thumbs-up"></i>
                                                                <span>0</span>
                                                            </div>
                                                            <div class="reply">
                                                                <a href="#">Reply</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Right side dropdown -->
                                                    <div class="media-right">
                                                        <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                            <div>
                                                                <div class="button">
                                                                    <i data-feather="more-vertical"></i>
                                                                </div>
                                                            </div>
                                                            <div class="dropdown-menu" role="menu">
                                                                <div class="dropdown-content">
                                                                    <a class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="x"></i>
                                                                            <div class="media-content">
                                                                                <h3>Hide</h3>
                                                                                <small>Hide this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                    <div class="dropdown-divider"></div>
                                                                    <a href="#" class="dropdown-item">
                                                                        <div class="media">
                                                                            <i data-feather="flag"></i>
                                                                            <div class="media-content">
                                                                                <h3>Report</h3>
                                                                                <small>Report this comment.</small>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /Nested Comment -->
                                            </div>
                                            <!-- Right side dropdown -->
                                            <div class="media-right">
                                                <!-- /partials/pages/feed/dropdowns/comment-dropdown.html -->
                                                <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                    <div>
                                                        <div class="button">
                                                            <i data-feather="more-vertical"></i>
                                                        </div>
                                                    </div>
                                                    <div class="dropdown-menu" role="menu">
                                                        <div class="dropdown-content">
                                                            <a class="dropdown-item">
                                                                <div class="media">
                                                                    <i data-feather="x"></i>
                                                                    <div class="media-content">
                                                                        <h3>Hide</h3>
                                                                        <small>Hide this comment.</small>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item">
                                                                <div class="media">
                                                                    <i data-feather="flag"></i>
                                                                    <div class="media-content">
                                                                        <h3>Report</h3>
                                                                        <small>Report this comment.</small>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Comment -->
                                    </div>
                                    <!-- Comments body -->

                                    <!-- Comments footer -->
                                    <div class="card-footer">
                                        <div class="media post-comment has-emojis">
                                            <!-- Textarea -->
                                            <div class="media-content">
                                                <div class="field">
                                                    <p class="control">
                                                        <textarea class="textarea comment-textarea" rows="5" placeholder="Write a comment..."></textarea>
                                                    </p>
                                                </div>
                                                <!-- Additional actions -->
                                                <div class="actions">
                                                    <div class="image is-32x32">
                                                        <img class="is-rounded" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="" />
                                                    </div>
                                                    <div class="toolbar">
                                                        <div class="action is-auto">
                                                            <i data-feather="at-sign"></i>
                                                        </div>
                                                        <div class="action is-emoji">
                                                            <i data-feather="smile"></i>
                                                        </div>
                                                        <div class="action is-upload">
                                                            <i data-feather="camera"></i>
                                                            <input type="file" />
                                                        </div>
                                                        <a class="button is-solid primary-button raised">Post Comment</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Comments footer -->
                                </div>
                                <!-- /Post #5 comments -->
                            </div>
                            <!-- /POST #5 -->

                            <!-- Post 6 -->
                            <!-- /partials/pages/feed/posts/feed-post6.html -->
                            <!-- POST #6 -->
                            <div class="card is-post is-simple">
                                <!-- Main wrap -->
                                <div class="content-wrap">
                                    <!-- Header -->
                                    <div class="card-heading">
                                        <!-- User image -->
                                        <div class="user-block">
                                            <div class="image">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/bobby.jpg" data-user-popover="8" alt="" />
                                            </div>
                                            <div class="user-info">
                                                <a href="#">Bobby Brown</a>
                                                <span class="time">July 26 2018, 11:14am</span>
                                            </div>
                                        </div>
                                        <!-- /partials/pages/feed/dropdowns/feed-post-dropdown.html -->
                                        <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                            <div>
                                                <div class="button">
                                                    <i data-feather="more-vertical"></i>
                                                </div>
                                            </div>
                                            <div class="dropdown-menu" role="menu">
                                                <div class="dropdown-content">
                                                    <a href="#" class="dropdown-item">
                                                        <div class="media">
                                                            <i data-feather="bookmark"></i>
                                                            <div class="media-content">
                                                                <h3>Bookmark</h3>
                                                                <small>Add this post to your bookmarks.</small>
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <a class="dropdown-item">
                                                        <div class="media">
                                                            <i data-feather="bell"></i>
                                                            <div class="media-content">
                                                                <h3>Notify me</h3>
                                                                <small>Send me the updates.</small>
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <hr class="dropdown-divider" />
                                                    <a href="#" class="dropdown-item">
                                                        <div class="media">
                                                            <i data-feather="flag"></i>
                                                            <div class="media-content">
                                                                <h3>Flag</h3>
                                                                <small>In case of inappropriate content.</small>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Header -->

                                    <!-- Post body -->
                                    <div class="card-body">
                                        <!-- Post body text -->
                                        <div class="post-text">
                                            <p>
                                                Today, when i was walking back home from my job, i figured that i
                                                should build the best social media template in ThemeForest. As soon as
                                                i got back, i started working on this fresh and new project. Any
                                                suggestions about where i could find some interesting resources for
                                                social media design? <a href="#">#webdesign #socialmedia</a>
                                            </p>

                                            <p></p>
                                        </div>
                                        <!-- Post actions -->
                                        <div class="post-actions">
                                            <!-- /partials/pages/feed/buttons/feed-post-actions.html -->
                                            <div class="like-wrapper">
                                                <a href="javascript:void(0);" class="like-button">
                                                    <i class="mdi mdi-heart not-liked bouncy"></i>
                                                    <i class="mdi mdi-heart is-liked bouncy"></i>
                                                    <span class="like-overlay"></span>
                                                </a>
                                            </div>

                                            <div class="fab-wrapper is-share">
                                                <a href="javascript:void(0);" class="small-fab share-fab modal-trigger" data-modal="share-modal">
                                                    <i data-feather="link-2"></i>
                                                </a>
                                            </div>

                                            <div class="fab-wrapper is-comment">
                                                <a href="javascript:void(0);" class="small-fab">
                                                    <i data-feather="message-circle"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Post body -->

                                    <!-- Post footer -->
                                    <div class="card-footer">
                                        <!-- Followers -->
                                        <div class="likers-group">
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/daniel.jpg" data-user-popover="3" alt="" />
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" data-user-popover="6" alt="" />
                                        </div>
                                        <div class="likers-text">
                                            <p>
                                                <a href="#">Daniel</a> and
                                                <a href="#">Elise</a>
                                            </p>
                                            <p>liked this</p>
                                        </div>
                                        <!-- Post statistics -->
                                        <div class="social-count">
                                            <div class="likes-count">
                                                <i data-feather="heart"></i>
                                                <span>2</span>
                                            </div>
                                            <div class="shares-count">
                                                <i data-feather="link-2"></i>
                                                <span>0</span>
                                            </div>
                                            <div class="comments-count">
                                                <i data-feather="message-circle"></i>
                                                <span>0</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Post footer -->
                                </div>
                                <!-- /Main wrap -->

                                <!-- Post #6 comments -->
                                <div class="comments-wrap is-hidden">
                                    <!-- Header -->
                                    <div class="comments-heading">
                                        <h4>
                                            Comments
                                            <small>(0)</small>
                                        </h4>
                                        <div class="close-comments">
                                            <i data-feather="x"></i>
                                        </div>
                                    </div>
                                    <!-- /Header -->

                                    <!-- Comments body -->
                                    <div class="comments-body has-slimscroll">
                                        <div class="comments-placeholder">
                                            <img src="assets/img/icons/feed/bubble.svg" alt="" />
                                            <h3>Nothing in here yet</h3>
                                            <p>Be the first to post a comment.</p>
                                        </div>
                                    </div>
                                    <!-- /Comments body -->

                                    <!-- Comments footer -->
                                    <div class="card-footer">
                                        <div class="media post-comment has-emojis">
                                            <!-- Textarea -->
                                            <div class="media-content">
                                                <div class="field">
                                                    <p class="control">
                                                        <textarea class="textarea comment-textarea" rows="5" placeholder="Write a comment..."></textarea>
                                                    </p>
                                                </div>
                                                <!-- Additional actions -->
                                                <div class="actions">
                                                    <div class="image is-32x32">
                                                        <img class="is-rounded" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="" />
                                                    </div>
                                                    <div class="toolbar">
                                                        <div class="action is-auto">
                                                            <i data-feather="at-sign"></i>
                                                        </div>
                                                        <div class="action is-emoji">
                                                            <i data-feather="smile"></i>
                                                        </div>
                                                        <div class="action is-upload">
                                                            <i data-feather="camera"></i>
                                                            <input type="file" />
                                                        </div>
                                                        <a class="button is-solid primary-button raised">Post Comment</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Comments footer -->
                                </div>
                                <!-- /Post #6 comments -->
                            </div>
                            <!-- /POST #6 -->

                            <!-- Load more posts -->
                            <div class="load-more-wrap narrow-top has-text-centered">
                                <a href="#" class="load-more-button">Load More</a>
                            </div>
                            <!-- /Load more posts -->
                        </div>
                        <!-- /Middle column -->

                        <!-- Right side column -->
                        <div class="column is-3">
                            <!-- Stories widget -->
                            <!-- /partials/widgets/stories-widget.html -->
                            <div class="card">
                                <div class="card-heading is-bordered">
                                    <h4>Stories</h4>
                                    <div class="dropdown is-spaced is-neutral is-right dropdown-trigger">
                                        <div>
                                            <div class="button">
                                                <i data-feather="more-vertical"></i>
                                            </div>
                                        </div>
                                        <div class="dropdown-menu" role="menu">
                                            <div class="dropdown-content">
                                                <a href="#" class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="tv"></i>
                                                        <div class="media-content">
                                                            <h3>Browse stories</h3>
                                                            <small>View all recent stories.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="settings"></i>
                                                        <div class="media-content">
                                                            <h3>Settings</h3>
                                                            <small>Access widget settings.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <hr class="dropdown-divider" />
                                                <a href="#" class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="trash-2"></i>
                                                        <div class="media-content">
                                                            <h3>Remove</h3>
                                                            <small>Removes this widget from your feed.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body no-padding">
                                    <!-- Story block -->
                                    <div class="story-block">
                                        <a id="add-story-button" href="#" class="add-story">
                                            <i data-feather="plus"></i>
                                        </a>
                                        <div class="story-meta">
                                            <span>Add a new Story</span>
                                            <span>Share an image, a video or some text</span>
                                        </div>
                                    </div>
                                    <!-- Story block -->
                                    <div class="story-block">
                                        <div class="img-wrapper">
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/dan.jpg" data-user-popover="1" alt="" />
                                        </div>
                                        <div class="story-meta">
                                            <span>Dan Walker</span>
                                            <span>1 hour ago</span>
                                        </div>
                                    </div>
                                    <!-- Story block -->
                                    <div class="story-block">
                                        <div class="img-wrapper">
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/bobby.jpg" data-user-popover="8" alt="" />
                                        </div>
                                        <div class="story-meta">
                                            <span>Bobby Brown</span>
                                            <span>3 days ago</span>
                                        </div>
                                    </div>
                                    <!-- Story block -->
                                    <div class="story-block">
                                        <div class="img-wrapper">
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" data-user-popover="6" alt="" />
                                        </div>
                                        <div class="story-meta">
                                            <span>Elise Walker</span>
                                            <span>Last week</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Birthday widget -->
                            <!-- /partials/widgets/birthday-widget.html -->


                            <!-- Suggested friends widget -->
                            <!-- /partials/widgets/suggested-friends-1-widget.html -->
                            <div class="card">
                                <div class="card-heading is-bordered">
                                    <h4>User near me</h4>
                                    <div class="dropdown is-spaced is-right dropdown-trigger">
                                        <div>
                                            <div class="button">
                                                <i data-feather="more-vertical"></i>
                                            </div>
                                        </div>
                                        <div class="dropdown-menu" role="menu">
                                            <div class="dropdown-content">
                                                <a href="#" class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="users"></i>
                                                        <div class="media-content">
                                                            <h3>All Suggestions</h3>
                                                            <small>View all friend suggestions.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="settings"></i>
                                                        <div class="media-content">
                                                            <h3>Settings</h3>
                                                            <small>Access widget settings.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <hr class="dropdown-divider" />
                                                <a href="#" class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="trash-2"></i>
                                                        <div class="media-content">
                                                            <h3>Remove</h3>
                                                            <small>Removes this widget from your feed.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body no-padding">
                                    <div class="add-friend-block transition-block">
                                        <c:forEach var="user" items="${requestScope.usersInSameDistrict}">
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/nelly.png" data-user-popover="9" alt="" />
                                            <div class="page-meta">
                                                <span>${user.userName}</span>
                                                <span>${user.district}</span>
                                            </div>
                                            <div class="add-friend add-transition">
                                                <i data-feather="user-plus"></i>
                                            </div>
                                        </c:forEach>  
                                    </div>


                                </div>
                            </div>

                            <!-- New job widget -->
                        </div>
                        <!-- /Right side column -->
                    </div>
                </div>
                <!-- /Feed page main wrapper -->
            </div>
            <!-- /Container -->

            <!-- Create group modal in compose card -->
            <!-- /partials/pages/feed/modals/create-group-modal.html -->
            <div id="create-group-modal" class="modal create-group-modal is-light-bg">
                <div class="modal-background"></div>
                <div class="modal-content">
                    <div class="card">
                        <div class="card-heading">
                            <h3>Create group</h3>
                            <!-- Close X button -->
                            <div class="close-wrap">
                                <span class="close-modal">
                                    <i data-feather="x"></i>
                                </span>
                            </div>
                        </div>
                        <!-- Modal subheading -->
                        <div class="subheading">
                            <!-- Group avatar -->
                            <div class="group-avatar">
                                <input id="group-avatar-upload" type="file" />
                                <div class="add-photo">
                                    <i data-feather="plus"></i>
                                </div>
                            </div>
                            <!-- Group name -->
                            <div class="control">
                                <input type="text" class="input" placeholder="Give the group a name" />
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="inner">
                                <div class="left-section">
                                    <div class="search-subheader">
                                        <div class="control">
                                            <input type="text" class="input" placeholder="Search for friends to add" />
                                            <span class="icon">
                                                <i data-feather="search"></i>
                                            </span>
                                        </div>
                                    </div>
                                    <div id="new-group-list" class="user-list has-slimscroll">
                                        <!-- Friend -->
                                        <div class="friend-block" data-ref="ref-1">
                                            <img class="friend-avatar" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/dan.jpg" alt="" />
                                            <div class="friend-name">Dan Walker</div>
                                            <div class="round-checkbox is-small">
                                                <div>
                                                    <input type="checkbox" id="checkbox-group-1" />
                                                    <label for="checkbox-group-1"></label>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Friend -->
                                        <div class="friend-block" data-ref="ref-2">
                                            <img class="friend-avatar" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/daniel.jpg" alt="" />
                                            <div class="friend-name">Daniel Wellington</div>
                                            <div class="round-checkbox is-small">
                                                <div>
                                                    <input type="checkbox" id="checkbox-group-2" />
                                                    <label for="checkbox-group-2"></label>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Friend -->
                                        <div class="friend-block" data-ref="ref-3">
                                            <img class="friend-avatar" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/stella.jpg" alt="" />
                                            <div class="friend-name">Stella Bergmann</div>
                                            <div class="round-checkbox is-small">
                                                <div>
                                                    <input type="checkbox" id="checkbox-group-3" />
                                                    <label for="checkbox-group-3"></label>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Friend -->
                                        <div class="friend-block" data-ref="ref-4">
                                            <img class="friend-avatar" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/david.jpg" alt="" />
                                            <div class="friend-name">David Kim</div>
                                            <div class="round-checkbox is-small">
                                                <div>
                                                    <input type="checkbox" id="checkbox-group-4" />
                                                    <label for="checkbox-group-4"></label>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Friend -->
                                        <div class="friend-block" data-ref="ref-5">
                                            <img class="friend-avatar" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/nelly.png" alt="" />
                                            <div class="friend-name">Nelly Schwartz</div>
                                            <div class="round-checkbox is-small">
                                                <div>
                                                    <input type="checkbox" id="checkbox-group-5" />
                                                    <label for="checkbox-group-5"></label>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Friend -->
                                        <div class="friend-block" data-ref="ref-6">
                                            <img class="friend-avatar" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" alt="" />
                                            <div class="friend-name">Elise Walker</div>
                                            <div class="round-checkbox is-small">
                                                <div>
                                                    <input type="checkbox" id="checkbox-group-6" />
                                                    <label for="checkbox-group-6"></label>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Friend -->
                                        <div class="friend-block" data-ref="ref-7">
                                            <img class="friend-avatar" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/bobby.jpg" alt="" />
                                            <div class="friend-name">Bobby Brown</div>
                                            <div class="round-checkbox is-small">
                                                <div>
                                                    <input type="checkbox" id="checkbox-group-7" />
                                                    <label for="checkbox-group-7"></label>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Friend -->
                                        <div class="friend-block" data-ref="ref-8">
                                            <img class="friend-avatar" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/lana.jpeg" alt="" />
                                            <div class="friend-name">Lana Henrikssen</div>
                                            <div class="round-checkbox is-small">
                                                <div>
                                                    <input type="checkbox" id="checkbox-group-8" />
                                                    <label for="checkbox-group-8"></label>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Friend -->
                                        <div class="friend-block" data-ref="ref-9">
                                            <img class="friend-avatar" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/gaelle.jpeg" alt="" />
                                            <div class="friend-name">Gaelle Morris</div>
                                            <div class="round-checkbox is-small">
                                                <div>
                                                    <input type="checkbox" id="checkbox-group-9" />
                                                    <label for="checkbox-group-9"></label>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Friend -->
                                        <div class="friend-block" data-ref="ref-10">
                                            <img class="friend-avatar" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/mike.jpg" alt="" />
                                            <div class="friend-name">Mike Lasalle</div>
                                            <div class="round-checkbox is-small">
                                                <div>
                                                    <input type="checkbox" id="checkbox-group-10" />
                                                    <label for="checkbox-group-10"></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="right-section has-slimscroll">
                                    <div class="selected-count">
                                        <span>Selected</span>
                                        <span id="selected-friends-count">0</span>
                                    </div>

                                    <div id="selected-list" class="selected-list"></div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <button type="button" class="button is-solid grey-button close-modal">
                                Cancel
                            </button>
                            <button type="button" class="button is-solid accent-button close-modal">
                                Create a Group
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Albums onboarding modal -->
            <!-- /partials/pages/feed/modals/albums-help-modal.html -->
            <div id="albums-help-modal" class="modal albums-help-modal is-xsmall has-light-bg">
                <div class="modal-background"></div>
                <div class="modal-content">
                    <div class="card">
                        <div class="card-heading">
                            <h3>Add Photos</h3>
                            <!-- Close X button -->
                            <div class="close-wrap">
                                <span class="close-modal">
                                    <i data-feather="x"></i>
                                </span>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="content-block is-active">
                                <img src="assets/img/illustrations/cards/albums.svg" alt="" />
                                <div class="help-text">
                                    <h3>Manage your photos</h3>
                                    <p>
                                        Lorem ipsum sit dolor amet is a dummy text used by the typography
                                        industry and the web industry.
                                    </p>
                                </div>
                            </div>

                            <div class="content-block">
                                <img src="assets/img/illustrations/cards/upload.svg" alt="" />
                                <div class="help-text">
                                    <h3>Upload your photos</h3>
                                    <p>
                                        Lorem ipsum sit dolor amet is a dummy text used by the typography
                                        industry and the web industry.
                                    </p>
                                </div>
                            </div>

                            <div class="slide-dots">
                                <div class="dot is-active"></div>
                                <div class="dot"></div>
                            </div>
                            <div class="action">
                                <button type="button" class="button is-solid accent-button next-modal raised" data-modal="albums-modal">
                                    Next
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Album upload modal -->
            <!-- /partials/pages/feed/modals/albums-modal.html -->
            <div id="albums-modal" class="modal albums-modal is-xxl has-light-bg">
                <div class="modal-background"></div>
                <div class="modal-content">
                    <div class="card">
                        <div class="card-heading">
                            <h3>New album</h3>
                            <div class="button is-solid accent-button fileinput-button">
                                <i class="mdi mdi-plus"></i>
                                Add pictures/videos
                            </div>

                            <!-- Close X button -->
                            <div class="close-wrap">
                                <span class="close-modal">
                                    <i data-feather="x"></i>
                                </span>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="left-section">
                                <div class="album-form">
                                    <div class="control">
                                        <input type="text" class="input is-sm no-radius is-fade" placeholder="Album name" />
                                        <div class="icon">
                                            <i data-feather="camera"></i>
                                        </div>
                                    </div>
                                    <div class="control">
                                        <textarea class="textarea is-fade no-radius is-sm" rows="3" placeholder="describe your album ..."></textarea>
                                    </div>
                                    <div class="control">
                                        <input type="text" class="input is-sm no-radius is-fade" placeholder="Place" />
                                        <div class="icon">
                                            <i data-feather="map-pin"></i>
                                        </div>
                                    </div>
                                </div>

                                <div id="album-date" class="album-date">
                                    <div class="head">
                                        <h4>Change the date</h4>
                                        <button type="button" class="button is-solid dark-grey-button icon-button">
                                            <i data-feather="plus"></i>
                                        </button>
                                    </div>

                                    <p>Set a date for your album. You can always change it later.</p>
                                    <div class="control is-hidden">
                                        <input id="album-datepicker" type="text" class="input is-sm is-fade" placeholder="Select a date" />
                                        <div class="icon">
                                            <i data-feather="calendar"></i>
                                        </div>
                                    </div>
                                </div>

                                <div id="tagged-in-album" class="tagged-in-album">
                                    <div class="head">
                                        <h4>Tag friends in this album</h4>
                                        <button type="button" class="button is-solid dark-grey-button icon-button">
                                            <i data-feather="plus"></i>
                                        </button>
                                    </div>

                                    <p>
                                        Tag friends in this album. Tagged friends can see photos they are
                                        tagged in.
                                    </p>
                                    <div class="field is-autocomplete is-hidden">
                                        <div class="control">
                                            <input id="create-album-friends-autocpl" type="text" class="input is-sm is-fade" placeholder="Search for friends" />
                                            <div class="icon">
                                                <i data-feather="search"></i>
                                            </div>
                                        </div>
                                    </div>

                                    <div id="album-tag-list" class="album-tag-list"></div>
                                </div>

                                <div class="shared-album">
                                    <div class="head">
                                        <h4>Allow friends to add photos</h4>
                                        <div class="basic-checkbox">
                                            <input class="styled-checkbox" id="styled-checkbox-1" type="checkbox" value="value1" />
                                            <label for="styled-checkbox-1"></label>
                                        </div>
                                    </div>

                                    <p>
                                        Tagged friends will be able to share content inside this album.
                                    </p>
                                </div>
                            </div>
                            <div class="right-section has-slimscroll">
                                <div class="modal-uploader">
                                    <div id="actions" class="columns is-multiline no-mb">
                                        <div class="column is-12">
                                            <span
                                                class="button has-icon is-solid grey-button fileinput-button"
                                                >
                                                <i data-feather="plus"></i>
                                            </span>
                                            <button type="submit" class="button start is-hidden">
                                                <span>Upload</span>
                                            </button>
                                            <button type="reset" class="button is-solid grey-button cancel">
                                                <span>Clear all</span>
                                            </button>
                                            <span class="file-count">
                                                <span id="modal-uploader-file-count">0</span> file(s) selected
                                            </span>
                                        </div>

                                        <div class="column is-12 is-hidden">
                                            <!-- The global file processing state -->
                                            <div class="fileupload-process">
                                                <div id="total-progress" class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
                                                    <div class="progress-bar progress-bar-success" style="width: 0%" data-dz-uploadprogress></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="columns is-multiline" id="previews">
                                        <div id="template" class="column is-4 is-template">
                                            <div class="preview-box">
                                                <!-- This is used as the file preview template -->
                                                <div class="remove-button" data-dz-remove>
                                                    <i class="mdi mdi-close"></i>
                                                </div>
                                                <div>
                                                    <span class="preview"
                                                          ><img
                                                            src="https://via.placeholder.com/120x120"
                                                            data-dz-thumbnail
                                                            alt=""
                                                            /></span>
                                                </div>
                                                <div class="preview-body">
                                                    <div class="item-meta">
                                                        <div>
                                                            <p class="name" data-dz-name></p>
                                                            <strong
                                                                class="error text-danger"
                                                                data-dz-errormessage
                                                                ></strong>
                                                        </div>
                                                        <small class="size" data-dz-size></small>
                                                    </div>
                                                    <div class="upload-item-progress">
                                                        <div class="progress active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
                                                            <div class="progress-bar progress-bar-success" data-dz-uploadprogress></div>
                                                        </div>
                                                    </div>
                                                    <div class="upload-item-description">
                                                        <div class="control">
                                                            <textarea class="textarea is-small is-fade no-radius" rows="4" placeholder="Describe this photo ..."></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="upload-item-actions is-hidden">
                                                        <button class="button start is-hidden">
                                                            <span>Start</span>
                                                        </button>
                                                        <button data-dz-remove class="button cancel is-hidden">
                                                            <span>Cancel</span>
                                                        </button>
                                                        <button data-dz-remove class="button delete is-hidden">
                                                            <span>Delete</span>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <!-- Dropdown menu -->
                            <div class="dropdown is-up is-spaced is-modern is-neutral is-right dropdown-trigger">
                                <div>
                                    <button class="button" aria-haspopup="true">
                                        <i class="main-icon" data-feather="smile"></i>
                                        <span>Friends</span>
                                        <i class="caret" data-feather="chevron-down"></i>
                                    </button>
                                </div>
                                <div class="dropdown-menu" role="menu">
                                    <div class="dropdown-content">
                                        <a href="#" class="dropdown-item">
                                            <div class="media">
                                                <i data-feather="globe"></i>
                                                <div class="media-content">
                                                    <h3>Public</h3>
                                                    <small>Anyone can see this publication.</small>
                                                </div>
                                            </div>
                                        </a>
                                        <a class="dropdown-item">
                                            <div class="media">
                                                <i data-feather="users"></i>
                                                <div class="media-content">
                                                    <h3>Friends</h3>
                                                    <small>only friends can see this publication.</small>
                                                </div>
                                            </div>
                                        </a>
                                        <a class="dropdown-item">
                                            <div class="media">
                                                <i data-feather="user"></i>
                                                <div class="media-content">
                                                    <h3>Specific friends</h3>
                                                    <small>Don't show it to some friends.</small>
                                                </div>
                                            </div>
                                        </a>
                                        <hr class="dropdown-divider" />
                                        <a class="dropdown-item">
                                            <div class="media">
                                                <i data-feather="lock"></i>
                                                <div class="media-content">
                                                    <h3>Only me</h3>
                                                    <small>Only me can see this publication.</small>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <button type="button" class="button is-solid accent-button close-modal">
                                Create album
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Live video onboarding modal -->
            <!-- /partials/pages/feed/modals/videos-help-modal.html -->
            <div id="videos-help-modal" class="modal videos-help-modal is-xsmall has-light-bg">
                <div class="modal-background"></div>
                <div class="modal-content">
                    <div class="card">
                        <div class="card-heading">
                            <h3>Add Photos</h3>
                            <!-- Close X button -->
                            <div class="close-wrap">
                                <span class="close-modal">
                                    <i data-feather="x"></i>
                                </span>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="content-block is-active">
                                <img src="assets/img/illustrations/cards/videotrip.svg" alt="" />
                                <div class="help-text">
                                    <h3>Share live videos</h3>
                                    <p>
                                        Lorem ipsum sit dolor amet is a dummy text used by the typography
                                        industry and the web industry.
                                    </p>
                                </div>
                            </div>

                            <div class="content-block">
                                <img src="assets/img/illustrations/cards/videocall.svg" alt="" />
                                <div class="help-text">
                                    <h3>To build your audience</h3>
                                    <p>
                                        Lorem ipsum sit dolor amet is a dummy text used by the typography
                                        industry and the web industry.
                                    </p>
                                </div>
                            </div>

                            <div class="slide-dots">
                                <div class="dot is-active"></div>
                                <div class="dot"></div>
                            </div>
                            <div class="action">
                                <button type="button" class="button is-solid accent-button next-modal raised" data-modal="videos-modal">
                                    Next
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Live video modal -->
            <!-- /partials/pages/feed/modals/videos-modal.html -->
            <div id="videos-modal" class="modal videos-modal is-xxl has-light-bg">
                <div class="modal-background"></div>
                <div class="modal-content">
                    <div class="card">
                        <div class="card-heading">
                            <h3>Go live</h3>
                            <div id="stop-stream" class="button is-solid accent-button is-hidden" onclick="stopWebcam();">
                                <i class="mdi mdi-video-off"></i>
                                Stop stream
                            </div>
                            <div id="start-stream" class="button is-solid accent-button" onclick="startWebcam();">
                                <i class="mdi mdi-video"></i>
                                Start stream
                            </div>

                            <!-- Close X button -->
                            <div class="close-wrap">
                                <span class="close-modal">
                                    <i data-feather="x"></i>
                                </span>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="inner">
                                <div class="left-section">
                                    <div class="video-wrapper">
                                        <div class="video-wrap">
                                            <div id="live-indicator" class="live is-vhidden">Live</div>
                                            <video id="video" width="400" height="240" controls autoplay></video>
                                        </div>
                                    </div>
                                </div>
                                <div class="right-section">
                                    <div class="header">
                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="" />
                                        <div class="user-meta">
                                            <span>Jenna Davis <small>is live</small></span>
                                            <span><small>right now</small></span>
                                        </div>
                                        <button type="button" class="button">Follow</button>
                                        <div class="dropdown is-spaced is-right dropdown-trigger">
                                            <div>
                                                <div class="button">
                                                    <i data-feather="more-vertical"></i>
                                                </div>
                                            </div>
                                            <div class="dropdown-menu" role="menu">
                                                <div class="dropdown-content">
                                                    <div class="dropdown-item is-title">Who can see this ?</div>
                                                    <a href="#" class="dropdown-item">
                                                        <div class="media">
                                                            <i data-feather="globe"></i>
                                                            <div class="media-content">
                                                                <h3>Public</h3>
                                                                <small>Anyone can see this publication.</small>
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <a class="dropdown-item">
                                                        <div class="media">
                                                            <i data-feather="users"></i>
                                                            <div class="media-content">
                                                                <h3>Friends</h3>
                                                                <small>only friends can see this publication.</small>
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <a class="dropdown-item">
                                                        <div class="media">
                                                            <i data-feather="user"></i>
                                                            <div class="media-content">
                                                                <h3>Specific friends</h3>
                                                                <small>Don't show it to some friends.</small>
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <hr class="dropdown-divider" />
                                                    <a class="dropdown-item">
                                                        <div class="media">
                                                            <i data-feather="lock"></i>
                                                            <div class="media-content">
                                                                <h3>Only me</h3>
                                                                <small>Only me can see this publication.</small>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="inner-content">
                                        <div class="control">
                                            <input type="text" class="input is-sm is-fade" placeholder="What is this live about?" />
                                            <div class="icon">
                                                <i data-feather="activity"></i>
                                            </div>
                                        </div>
                                        <div class="live-stats">
                                            <div class="social-count">
                                                <div class="likes-count">
                                                    <i data-feather="heart"></i>
                                                    <span>0</span>
                                                </div>
                                                <div class="shares-count">
                                                    <i data-feather="link-2"></i>
                                                    <span>0</span>
                                                </div>
                                                <div class="comments-count">
                                                    <i data-feather="message-circle"></i>
                                                    <span>0</span>
                                                </div>
                                            </div>
                                            <div class="social-count ml-auto">
                                                <div class="views-count">
                                                    <i data-feather="eye"></i>
                                                    <span>0</span>
                                                    <span class="views"><small>views</small></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="actions">
                                            <div class="action">
                                                <i data-feather="thumbs-up"></i>
                                                <span>Like</span>
                                            </div>
                                            <div class="action">
                                                <i data-feather="message-circle"></i>
                                                <span>Comment</span>
                                            </div>
                                            <div class="action">
                                                <i data-feather="link-2"></i>
                                                <span>Share</span>
                                            </div>
                                            <div class="dropdown is-spaced is-right dropdown-trigger">
                                                <div>
                                                    <div class="avatar-button">
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="" />
                                                        <i data-feather="triangle"></i>
                                                    </div>
                                                </div>
                                                <div class="dropdown-menu has-margin" role="menu">
                                                    <div class="dropdown-content">
                                                        <a href="#" class="dropdown-item is-selected">
                                                            <div class="media">
                                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="" />
                                                                <div class="media-content">
                                                                    <h3>Jenna Davis</h3>
                                                                    <small>Interact as Jenna Davis.</small>
                                                                </div>
                                                                <div class="checkmark">
                                                                    <i data-feather="check"></i>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <hr class="dropdown-divider" />
                                                        <a href="#" class="dropdown-item">
                                                            <div class="media">
                                                                <img src="https://via.placeholder.com/478x344" data-demo-src="assets/img/avatars/hanzo.svg" alt="" />
                                                                <div class="media-content">
                                                                    <h3>Css Ninja</h3>
                                                                    <small>Interact as Css Ninja.</small>
                                                                </div>
                                                                <div class="checkmark">
                                                                    <i data-feather="check"></i>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tabs-wrapper">
                                        <div class="tabs is-fullwidth">
                                            <ul>
                                                <li class="is-active">
                                                    <a>Comments</a>
                                                </li>
                                                <li>
                                                    <a>Upcoming</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="tab-content has-slimscroll">
                                            <div class="media is-comment">
                                                <figure class="media-left">
                                                    <p class="image is-32x32">
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/dan.jpg" alt="" data-user-popover="1" />
                                                    </p>
                                                </figure>
                                                <div class="media-content">
                                                    <div class="username">Dan Walker</div>
                                                    <p>
                                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                                        Proin ornare magna eros.
                                                    </p>
                                                    <div class="comment-actions">
                                                        <a href="javascript:void(0);" class="is-inverted">Like</a>
                                                        <span>3h</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="media is-comment">
                                                <figure class="media-left">
                                                    <p class="image is-32x32">
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/david.jpg" alt="" data-user-popover="4" />
                                                    </p>
                                                </figure>
                                                <div class="media-content">
                                                    <div class="username">David Kim</div>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing.</p>
                                                    <div class="comment-actions">
                                                        <a href="javascript:void(0);" class="is-inverted">Like</a>
                                                        <span>4h</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="media is-comment">
                                                <figure class="media-left">
                                                    <p class="image is-32x32">
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/rolf.jpg" alt="" data-user-popover="17" />
                                                    </p>
                                                </figure>
                                                <div class="media-content">
                                                    <div class="username">Rolf Krupp</div>
                                                    <p>
                                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                                        Proin ornare magna eros. Consectetur adipiscing elit.
                                                        Proin ornare magna eros.
                                                    </p>
                                                    <div class="comment-actions">
                                                        <a href="javascript:void(0);" class="is-inverted">Like</a>
                                                        <span>4h</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="comment-controls">
                                        <div class="controls-inner">
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="" />
                                            <div class="control">
                                                <textarea class="textarea comment-textarea is-rounded" rows="1"></textarea>
                                                <button class="emoji-button">
                                                    <i data-feather="smile"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Share from feed modal -->
            <!-- /partials/pages/feed/modals/share-modal.html -->
            <div id="share-modal" class="modal share-modal is-xsmall has-light-bg">
                <div class="modal-background"></div>
                <div class="modal-content">
                    <div class="card">
                        <div class="card-heading">
                            <div class="dropdown is-primary share-dropdown">
                                <div>
                                    <div class="button">
                                        <i class="mdi mdi-format-float-left"></i>
                                        <span>Share in your feed</span>
                                        <i data-feather="chevron-down"></i>
                                    </div>
                                </div>
                                <div class="dropdown-menu" role="menu">
                                    <div class="dropdown-content">
                                        <div class="dropdown-item" data-target-channel="feed">
                                            <div class="media">
                                                <i class="mdi mdi-format-float-left"></i>
                                                <div class="media-content">
                                                    <h3>Share in your feed</h3>
                                                    <small>Share this publication on your feed.</small>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="dropdown-item" data-target-channel="friend">
                                            <div class="media">
                                                <i class="mdi mdi-account-heart"></i>
                                                <div class="media-content">
                                                    <h3>Share in a friend's feed</h3>
                                                    <small>Share this publication on a friend's feed.</small>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="dropdown-item" data-target-channel="group">
                                            <div class="media">
                                                <i class="mdi mdi-account-group"></i>
                                                <div class="media-content">
                                                    <h3>Share in a group</h3>
                                                    <small>Share this publication in a group.</small>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="dropdown-item" data-target-channel="page">
                                            <div class="media">
                                                <i class="mdi mdi-file-document-box"></i>
                                                <div class="media-content">
                                                    <h3>Share in a page</h3>
                                                    <small>Share this publication in a page.</small>
                                                </div>
                                            </div>
                                        </div>
                                        <hr class="dropdown-divider" />
                                        <div class="dropdown-item" data-target-channel="private-message">
                                            <div class="media">
                                                <i class="mdi mdi-email-plus"></i>
                                                <div class="media-content">
                                                    <h3>Share in message</h3>
                                                    <small>Share this publication in a private message.</small>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Close X button -->
                            <div class="close-wrap">
                                <span class="close-modal">
                                    <i data-feather="x"></i>
                                </span>
                            </div>
                        </div>
                        <div class="share-inputs">
                            <div class="field is-autocomplete">
                                <div id="share-to-friend" class="control share-channel-control is-hidden">
                                    <input id="share-with-friend" type="text" class="input is-sm no-radius share-input simple-users-autocpl" placeholder="Your friend's name" />
                                    <div class="input-heading">Friend :</div>
                                </div>
                            </div>

                            <div class="field is-autocomplete">
                                <div id="share-to-group" class="control share-channel-control is-hidden">
                                    <input id="share-with-group" type="text" class="input is-sm no-radius share-input simple-groups-autocpl" placeholder="Your group's name" />
                                    <div class="input-heading">Group :</div>
                                </div>
                            </div>

                            <div id="share-to-page" class="control share-channel-control no-border is-hidden">
                                <div class="page-controls">
                                    <div class="page-selection">
                                        <div class="dropdown is-accent page-dropdown">
                                            <div>
                                                <div class="button page-selector">
                                                    <img src="https://via.placeholder.com/150x150" data-demo-src="assets/img/avatars/hanzo.svg" alt="" />
                                                    <span>Css Ninja</span> <i data-feather="chevron-down"></i>
                                                </div>
                                            </div>
                                            <div class="dropdown-menu" role="menu">
                                                <div class="dropdown-content">
                                                    <div class="dropdown-item">
                                                        <div class="media">
                                                            <img src="https://via.placeholder.com/150x150" data-demo-src="assets/img/avatars/hanzo.svg" alt="" />
                                                            <div class="media-content">
                                                                <h3>Css Ninja</h3>
                                                                <small>Share on Css Ninja.</small>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="dropdown-item">
                                                        <div class="media">
                                                            <img src="https://via.placeholder.com/150x150" data-demo-src="assets/img/vector/icons/logos/nuclearjs.svg" alt="" />
                                                            <div class="media-content">
                                                                <h3>NuclearJs</h3>
                                                                <small>Share on NuclearJs.</small>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="dropdown-item">
                                                        <div class="media">
                                                            <img src="https://via.placeholder.com/150x150" data-demo-src="assets/img/vector/icons/logos/slicer.svg" alt="" />
                                                            <div class="media-content">
                                                                <h3>Slicer</h3>
                                                                <small>Share on Slicer.</small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="alias">
                                        <img src="https://via.placeholder.com/150x150" data-demo-src="assets/img/avatars/jenna.png" alt="" />
                                    </div>
                                </div>
                            </div>

                            <div class="field is-autocomplete">
                                <div id="share-to-private-message" class="control share-channel-control is-hidden">
                                    <input id="share-with-private-message" type="text" class="input is-sm no-radius share-input simple-users-autocpl" placeholder="Message a friend" />
                                    <div class="input-heading">To :</div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="control">
                                <textarea class="textarea comment-textarea" rows="1" placeholder="Say something about this ..."></textarea>
                                <button class="emoji-button">
                                    <i data-feather="smile"></i>
                                </button>
                            </div>
                            <div class="shared-publication">
                                <div class="featured-image">
                                    <img id="share-modal-image" src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/1.jpg" alt="" />
                                </div>
                                <div class="publication-meta">
                                    <div class="inner-flex">
                                        <img id="share-modal-avatar" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/dan.jpg" data-user-popover="1" alt="" />
                                        <p id="share-modal-text">
                                            Yesterday with <a href="#">@Karen Miller</a> and
                                            <a href="#">@Marvin Stemperd</a> at the
                                            <a href="#">#Rock'n'Rolla</a> concert in LA. Was totally
                                            fantastic! People were really excited about this one!
                                        </p>
                                    </div>
                                    <div class="publication-footer">
                                        <div class="stats">
                                            <div class="stat-block">
                                                <i class="mdi mdi-earth"></i>
                                                <small>Public</small>
                                            </div>
                                            <div class="stat-block">
                                                <i class="mdi mdi-eye"></i>
                                                <small>163 views</small>
                                            </div>
                                        </div>
                                        <div class="publication-origin">
                                            <small>Friendkit.io</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="bottom-share-inputs">
                            <div id="action-place" class="field is-autocomplete is-dropup is-hidden">
                                <div id="share-place" class="control share-bottom-channel-control">
                                    <input type="text" class="input is-sm no-radius share-input simple-locations-autocpl" placeholder="Where are you?" />
                                    <div class="input-heading">Location :</div>
                                </div>
                            </div>

                            <div id="action-tag" class="field is-autocomplete is-dropup is-hidden">
                                <div id="share-tags" class="control share-bottom-channel-control">
                                    <input id="share-friend-tags-autocpl" type="text" class="input is-sm no-radius share-input" placeholder="Who are you with" />
                                    <div class="input-heading">Friends :</div>
                                </div>
                                <div id="share-modal-tag-list" class="tag-list no-margin"></div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="action-wrap">
                                <div class="footer-action" data-target-action="tag">
                                    <i class="mdi mdi-account-plus"></i>
                                </div>
                                <div class="footer-action" data-target-action="place">
                                    <i class="mdi mdi-map-marker"></i>
                                </div>
                                <div class="footer-action dropdown is-spaced is-neutral dropdown-trigger is-up" data-target-action="permissions">
                                    <div>
                                        <i class="mdi mdi-lock-clock"></i>
                                    </div>
                                    <div class="dropdown-menu" role="menu">
                                        <div class="dropdown-content">
                                            <a href="#" class="dropdown-item">
                                                <div class="media">
                                                    <i data-feather="globe"></i>
                                                    <div class="media-content">
                                                        <h3>Public</h3>
                                                        <small>Anyone can see this publication.</small>
                                                    </div>
                                                </div>
                                            </a>
                                            <a class="dropdown-item">
                                                <div class="media">
                                                    <i data-feather="users"></i>
                                                    <div class="media-content">
                                                        <h3>Friends</h3>
                                                        <small>only friends can see this publication.</small>
                                                    </div>
                                                </div>
                                            </a>
                                            <a class="dropdown-item">
                                                <div class="media">
                                                    <i data-feather="user"></i>
                                                    <div class="media-content">
                                                        <h3>Specific friends</h3>
                                                        <small>Don't show it to some friends.</small>
                                                    </div>
                                                </div>
                                            </a>
                                            <hr class="dropdown-divider" />
                                            <a class="dropdown-item">
                                                <div class="media">
                                                    <i data-feather="lock"></i>
                                                    <div class="media-content">
                                                        <h3>Only me</h3>
                                                        <small>Only me can see this publication.</small>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="button-wrap">
                                <button type="button" class="button is-solid dark-grey-button close-modal">
                                    Cancel
                                </button>
                                <button type="button" class="button is-solid primary-button close-modal">
                                    Publish
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div id="create-post-modal" class="modal create-post-modal is-xsmall has-light-bg">
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
                                <form action="CreatePost" id="create-post" method="post" enctype="multipart/form-data">
                                    <select id="type" name="typePost" required>
                                        <c:forEach items="${listType}" var="type">
                                            <option value="${type.typeID}" selected>${type.name}</option>
                                        </c:forEach>
                                    </select>
                                    <label for="imgPath">Image:</label>
                                    <input type="file" id="imgPath" name="imgPath" accept="image/*" multiple required>

                                    <label for="Title">Title:</label>
                                    <input type="text" id="title" name="title" required>
                                    <label for="Title">Description: </label>
                                    <textarea class="textarea comment-textarea" name="description" rows="1" placeholder="e.g 2 x bottles of shampoo, almost full"></textarea>


                                    <label for="quanlity">Quanlity</label>
                                    <select id="quanlity" name="quanlity" required>
                                        <c:forEach items="${listQuanlity}" var="quan">
                                            <option value="${quan.quanlityID}">${quan.name}</option>
                                        </c:forEach>
                                    </select>


                                    <div id="addNewSnippet" style="margin-top: 10px;">
                                        <div class="input-container" style="display: inline-block; width: 49%;">
                                            <select name="district" class="form-select form-select-sm mb-3" id="district" aria-label=".form-select-sm" required>
                                                <option value="" selected>Select district</option>
                                            </select>  
                                        </div>
                                        <div class="input-container" style="display: inline-block; width: 50%;">
                                            <select name="ward" class="form-select form-select-sm" id="ward" aria-label=".form-select-sm" required>
                                                <option value="" selected>Select Ward</option>
                                            </select>
                                        </div>
                                        <div class="input-container">
                                            <label>Street number</label>
                                            <input name="newAddress" id="Order_name" type="text" maxlength="255" value="${address}" required>
                                        </div>
                                    </div>


                                    <label for="instructions">Pick-up instructions</label>
                                    <input type="text" id="instructions" name="instructions" required placeholder="Pick up to day from 4 - 6pm. Please ring doorbell when here">

                                    <label>Expires Date<span class="required">*</span></label>
                                    <select name="expiresDate" class="form-select form-select-sm" id="expiresDate" aria-label=".form-select-sm" required>
                                        <option value="1" >1 Day</option>
                                        <option value="3" selected>3 Days</option>
                                        <option value="7">7 Days</option>
                                        <option value="15">15 Days</option>
                                    </select>


                                    <input type="submit" id="submit-create-post" style="display : none;" value="Submit">
                                </form>

                            </div>
                        </div>

                        <div class="card-footer">
                            <div class="button-wrap" style="width: 100%;">
                                <button type="button" class="button is-solid primary-button" style="width: 100%;" onclick="document.getElementById('submit-create-post').click();">
                                    Post
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- No Stream modal -->
            <!-- /partials/pages/feed/modals/no-stream-modal.html -->
            <div id="no-stream-modal" class="modal no-stream-modal is-xsmall has-light-bg">
                <div class="modal-background"></div>
                <div class="modal-content">
                    <div class="card">
                        <div class="card-heading">
                            <h3></h3>
                            <!-- Close X button -->
                            <div class="close-wrap">
                                <span class="close-modal">
                                    <i data-feather="x"></i>
                                </span>
                            </div>
                        </div>
                        <div class="card-body has-text-centered">
                            <div class="image-wrap">
                                <img src="assets/img/illustrations/characters/no-stream.svg" alt="" />
                            </div>

                            <h3>Streaming Disabled</h3>
                            <p>
                                Streaming is not allowed from mobile web. Please use our mobile apps
                                for mobile streaming.
                            </p>

                            <div class="action">
                                <a href="index.html#demos-section" class="button is-solid accent-button raised is-fullwidth">Got It</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Google places Lib -->
            <script src="https://maps.google.com/maps/api/js?key=AIzaSyAGLO_M5VT7BsVdjMjciKoH1fFJWWdhDPU&amp;libraries=places"></script>

        </div>

        <div class="chat-wrapper">
            <div class="chat-inner">
                <!-- Chat top navigation -->
                <div class="chat-nav">
                    <div class="nav-start">
                        <div class="recipient-block">
                            <div class="avatar-container">
                                <img class="user-avatar" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/dan.jpg" alt="" />
                            </div>
                            <div class="username">
                                <span>Dan Walker</span>
                                <span><i data-feather="star"></i> <span>| Online</span></span>
                            </div>
                        </div>
                    </div>
                    <div class="nav-end">
                        <!-- Settings icon dropdown -->
                        <div class="dropdown is-spaced is-neutral is-right dropdown-trigger">
                            <div>
                                <a class="chat-nav-item is-icon">
                                    <i data-feather="settings"></i>
                                </a>
                            </div>
                            <div class="dropdown-menu" role="menu">
                                <div class="dropdown-content">
                                    <a href="#" class="dropdown-item">
                                        <div class="media">
                                            <i data-feather="message-square"></i>
                                            <div class="media-content">
                                                <h3>Details</h3>
                                                <small>View this conversation's details.</small>
                                            </div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item">
                                        <div class="media">
                                            <i data-feather="settings"></i>
                                            <div class="media-content">
                                                <h3>Preferences</h3>
                                                <small>Define your preferences.</small>
                                            </div>
                                        </div>
                                    </a>
                                    <hr class="dropdown-divider" />
                                    <a class="dropdown-item">
                                        <div class="media">
                                            <i data-feather="bell"></i>
                                            <div class="media-content">
                                                <h3>Notifications</h3>
                                                <small>Set notifications settings.</small>
                                            </div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item">
                                        <div class="media">
                                            <i data-feather="bell-off"></i>
                                            <div class="media-content">
                                                <h3>Silence</h3>
                                                <small>Disable notifications.</small>
                                            </div>
                                        </div>
                                    </a>
                                    <hr class="dropdown-divider" />
                                    <a class="dropdown-item">
                                        <div class="media">
                                            <i data-feather="box"></i>
                                            <div class="media-content">
                                                <h3>Archive</h3>
                                                <small>Archive this conversation.</small>
                                            </div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item">
                                        <div class="media">
                                            <i data-feather="trash-2"></i>
                                            <div class="media-content">
                                                <h3>Delete</h3>
                                                <small>Delete this conversation.</small>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="chat-search">
                            <div class="control has-icon">
                                <input type="text" class="input" placeholder="Search messages" />
                                <div class="form-icon">
                                    <i data-feather="search"></i>
                                </div>
                            </div>
                        </div>
                        <a class="chat-nav-item is-icon is-hidden-mobile">
                            <i data-feather="at-sign"></i>
                        </a>
                        <a class="chat-nav-item is-icon is-hidden-mobile">
                            <i data-feather="star"></i>
                        </a>

                        <!-- More dropdown -->
                        <div class="dropdown is-spaced is-neutral is-right dropdown-trigger">
                            <div>
                                <a class="chat-nav-item is-icon no-margin">
                                    <i data-feather="more-vertical"></i>
                                </a>
                            </div>
                            <div class="dropdown-menu" role="menu">
                                <div class="dropdown-content">
                                    <a href="#" class="dropdown-item">
                                        <div class="media">
                                            <i data-feather="file-text"></i>
                                            <div class="media-content">
                                                <h3>Files</h3>
                                                <small>View all your files.</small>
                                            </div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item">
                                        <div class="media">
                                            <i data-feather="users"></i>
                                            <div class="media-content">
                                                <h3>Users</h3>
                                                <small>View all users you're talking to.</small>
                                            </div>
                                        </div>
                                    </a>
                                    <hr class="dropdown-divider" />
                                    <a class="dropdown-item">
                                        <div class="media">
                                            <i data-feather="gift"></i>
                                            <div class="media-content">
                                                <h3>Daily bonus</h3>
                                                <small>Get your daily bonus.</small>
                                            </div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item">
                                        <div class="media">
                                            <i data-feather="download-cloud"></i>
                                            <div class="media-content">
                                                <h3>Downloads</h3>
                                                <small>See all your downloads.</small>
                                            </div>
                                        </div>
                                    </a>
                                    <hr class="dropdown-divider" />
                                    <a class="dropdown-item">
                                        <div class="media">
                                            <i data-feather="life-buoy"></i>
                                            <div class="media-content">
                                                <h3>Support</h3>
                                                <small>Reach our support team.</small>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <a class="chat-nav-item is-icon close-chat">
                            <i data-feather="x"></i>
                        </a>
                    </div>
                </div>

                <!-- Chat sidebar -->
                <div id="chat-sidebar" class="users-sidebar">
                    <!-- Header -->
                    <div class="header-item">
                        <img class="light-image" src="assets/img/vector/logo/friendkit-bold.svg" alt="" />
                        <img class="dark-image" src="assets/img/vector/logo/friendkit-white.svg" alt="" />
                    </div>
                    <!-- User list -->
                    <div class="conversations-list has-slimscroll-xs">
                        <!-- User -->
                        <div class="user-item is-active" data-chat-user="dan" data-full-name="Dan Walker" data-status="Online">
                            <div class="avatar-container">
                                <img class="user-avatar" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/dan.jpg" alt="" />
                                <div class="user-status is-online"></div>
                            </div>
                        </div>
                        <!-- User -->
                        <div class="user-item" data-chat-user="stella" data-full-name="Stella Bergmann" data-status="Busy">
                            <div class="avatar-container">
                                <img class="user-avatar" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/stella.jpg" alt="" />
                                <div class="user-status is-busy"></div>
                            </div>
                        </div>
                        <!-- User -->
                        <div class="user-item" data-chat-user="daniel" data-full-name="Daniel Wellington" data-status="Away">
                            <div class="avatar-container">
                                <img class="user-avatar" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/daniel.jpg" alt="" />
                                <div class="user-status is-away"></div>
                            </div>
                        </div>
                        <!-- User -->
                        <div class="user-item" data-chat-user="david" data-full-name="David Kim" data-status="Busy">
                            <div class="avatar-container">
                                <img class="user-avatar" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/david.jpg" alt="" />
                                <div class="user-status is-busy"></div>
                            </div>
                        </div>
                        <!-- User -->
                        <div class="user-item" data-chat-user="edward" data-full-name="Edward Mayers" data-status="Online">
                            <div class="avatar-container">
                                <img class="user-avatar" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/edward.jpeg" alt="" />
                                <div class="user-status is-online"></div>
                            </div>
                        </div>
                        <!-- User -->
                        <div class="user-item" data-chat-user="elise" data-full-name="Elise Walker" data-status="Away">
                            <div class="avatar-container">
                                <img class="user-avatar" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" alt="" />
                                <div class="user-status is-away"></div>
                            </div>
                        </div>
                        <!-- User -->
                        <div class="user-item" data-chat-user="nelly" data-full-name="Nelly Schwartz" data-status="Busy">
                            <div class="avatar-container">
                                <img class="user-avatar" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/nelly.png" alt="" />
                                <div class="user-status is-busy"></div>
                            </div>
                        </div>
                        <!-- User -->
                        <div class="user-item" data-chat-user="milly" data-full-name="Milly Augustine" data-status="Busy">
                            <div class="avatar-container">
                                <img class="user-avatar" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/milly.jpg" alt="" />
                                <div class="user-status is-busy"></div>
                            </div>
                        </div>
                    </div>
                    <!-- Add Conversation -->
                    <div class="footer-item">
                        <div class="add-button modal-trigger" data-modal="add-conversation-modal">
                            <i data-feather="user"></i>
                        </div>
                    </div>
                </div>

                <!-- Chat body -->
                <div id="chat-body" class="chat-body is-opened">
                    <!-- Conversation with Dan -->
                    <div id="dan-conversation" class="chat-body-inner has-slimscroll">
                        <div class="date-divider">
                            <hr class="date-divider-line" />
                            <span class="date-divider-text">Today</span>
                        </div>

                        <div class="chat-message is-received">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/dan.jpg" alt="" />
                            <div class="message-block">
                                <span>8:03am</span>
                                <div class="message-text">
                                    Hi Jenna! I made a new design, and i wanted to show it to you.
                                </div>
                            </div>
                        </div>

                        <div class="chat-message is-received">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/dan.jpg" alt="" />
                            <div class="message-block">
                                <span>8:03am</span>
                                <div class="message-text">
                                    It's quite clean and it's inspired from Bulkit.
                                </div>
                            </div>
                        </div>

                        <div class="chat-message is-sent">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="" />
                            <div class="message-block">
                                <span>8:12am</span>
                                <div class="message-text">Oh really??! I want to see that.</div>
                            </div>
                        </div>

                        <div class="chat-message is-received">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/dan.jpg" alt="" />
                            <div class="message-block">
                                <span>8:13am</span>
                                <div class="message-text">FYI it was done in less than a day.</div>
                            </div>
                        </div>

                        <div class="chat-message is-sent">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="" />
                            <div class="message-block">
                                <span>8:17am</span>
                                <div class="message-text">
                                    Great to hear it. Just send me the PSD files so i can have a look at it.
                                </div>
                            </div>
                        </div>

                        <div class="chat-message is-sent">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="" />
                            <div class="message-block">
                                <span>8:18am</span>
                                <div class="message-text">
                                    And if you have a prototype, you can also send me the link to it.
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Conversation with Stella -->
                    <div id="stella-conversation" class="chat-body-inner has-slimscroll is-hidden">
                        <div class="date-divider">
                            <hr class="date-divider-line" />
                            <span class="date-divider-text">Today</span>
                        </div>

                        <div class="chat-message is-sent">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="" />
                            <div class="message-block">
                                <span>10:34am</span>
                                <div class="message-text">
                                    Hey Stella! Aren't we supposed to go the theatre after work?.
                                </div>
                            </div>
                        </div>

                        <div class="chat-message is-sent">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="" />
                            <div class="message-block">
                                <span>10:37am</span>
                                <div class="message-text">Just remembered it.</div>
                            </div>
                        </div>

                        <div class="chat-message is-received">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/stella.jpg" alt="" />
                            <div class="message-block">
                                <span>11:22am</span>
                                <div class="message-text">
                                    Yeah you always do that, forget about everything.
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Conversation with Daniel -->
                    <div id="daniel-conversation" class="chat-body-inner has-slimscroll is-hidden">
                        <div class="date-divider">
                            <hr class="date-divider-line" />
                            <span class="date-divider-text">Yesterday</span>
                        </div>

                        <div class="chat-message is-sent">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="" />
                            <div class="message-block">
                                <span>3:24pm</span>
                                <div class="message-text">
                                    Daniel, Amanda told me about your issue, how can I help?
                                </div>
                            </div>
                        </div>

                        <div class="chat-message is-received">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/daniel.jpg" alt="" />
                            <div class="message-block">
                                <span>3:42pm</span>
                                <div class="message-text">
                                    Hey Jenna, thanks for answering so quickly. Iam stuck, i need a car.
                                </div>
                            </div>
                        </div>

                        <div class="chat-message is-received">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/daniel.jpg" alt="" />
                            <div class="message-block">
                                <span>3:43pm</span>
                                <div class="message-text">
                                    Can i borrow your car for a quick ride to San Fransisco? Iam running
                                    behind and there' no train in sight.
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Conversation with David -->
                    <div id="david-conversation" class="chat-body-inner has-slimscroll is-hidden">
                        <div class="date-divider">
                            <hr class="date-divider-line" />
                            <span class="date-divider-text">Today</span>
                        </div>

                        <div class="chat-message is-sent">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="" />
                            <div class="message-block">
                                <span>12:34pm</span>
                                <div class="message-text">
                                    Damn you! Why would you even implement this in the game?.
                                </div>
                            </div>
                        </div>

                        <div class="chat-message is-sent">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="" />
                            <div class="message-block">
                                <span>12:32pm</span>
                                <div class="message-text">I just HATE aliens.</div>
                            </div>
                        </div>

                        <div class="chat-message is-received">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/david.jpg" alt="" />
                            <div class="message-block">
                                <span>13:09pm</span>
                                <div class="message-text">
                                    C'mon, you just gotta learn the tricks. You can't expect aliens to
                                    behave like humans. I mean that's how the mechanics are.
                                </div>
                            </div>
                        </div>
                        <div class="chat-message is-received">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/david.jpg" alt="" />
                            <div class="message-block">
                                <span>13:11pm</span>
                                <div class="message-text">
                                    I checked the replay and for example, you always get supply blocked.
                                    That's not the right thing to do.
                                </div>
                            </div>
                        </div>
                        <div class="chat-message is-sent">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="" />
                            <div class="message-block">
                                <span>13:12pm</span>
                                <div class="message-text">
                                    I know but i struggle when i have to decide what to make from larvas.
                                </div>
                            </div>
                        </div>
                        <div class="chat-message is-received">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/david.jpg" alt="" />
                            <div class="message-block">
                                <span>13:17pm</span>
                                <div class="message-text">Join me in game, i'll show you.</div>
                            </div>
                        </div>
                    </div>

                    <!-- Conversation with Edward -->
                    <div id="edward-conversation" class="chat-body-inner has-slimscroll">
                        <div class="date-divider">
                            <hr class="date-divider-line" />
                            <span class="date-divider-text">Monday</span>
                        </div>

                        <div class="chat-message is-received">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/edward.jpeg" alt="" />
                            <div class="message-block">
                                <span>4:55pm</span>
                                <div class="message-text">Hey Jenna, what's up?</div>
                            </div>
                        </div>

                        <div class="chat-message is-received">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/edward.jpeg" alt="" />
                            <div class="message-block">
                                <span>4:56pm</span>
                                <div class="message-text">
                                    Iam coming to LA tomorrow. Interested in having lunch?
                                </div>
                            </div>
                        </div>

                        <div class="chat-message is-sent">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="" />
                            <div class="message-block">
                                <span>5:21pm</span>
                                <div class="message-text">
                                    Hey mate, it's been a while. Sure I would love to.
                                </div>
                            </div>
                        </div>

                        <div class="chat-message is-received">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/edward.jpeg" alt="" />
                            <div class="message-block">
                                <span>5:27pm</span>
                                <div class="message-text">
                                    Ok. Let's say i pick you up at 12:30 at work, works?
                                </div>
                            </div>
                        </div>

                        <div class="chat-message is-sent">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="" />
                            <div class="message-block">
                                <span>5:43pm</span>
                                <div class="message-text">Yup, that works great.</div>
                            </div>
                        </div>

                        <div class="chat-message is-sent">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="" />
                            <div class="message-block">
                                <span>5:44pm</span>
                                <div class="message-text">
                                    And yeah, don't forget to bring some of my favourite cheese cake.
                                </div>
                            </div>
                        </div>

                        <div class="chat-message is-received">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/edward.jpeg" alt="" />
                            <div class="message-block">
                                <span>5:27pm</span>
                                <div class="message-text">No worries</div>
                            </div>
                        </div>
                    </div>

                    <!-- Conversation with Edward -->
                    <div id="elise-conversation" class="chat-body-inner has-slimscroll is-hidden">
                        <div class="date-divider">
                            <hr class="date-divider-line" />
                            <span class="date-divider-text">September 28</span>
                        </div>

                        <div class="chat-message is-sent">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="" />
                            <div class="message-block">
                                <span>11:53am</span>
                                <div class="message-text">
                                    Elise, i forgot my folder at your place yesterday.
                                </div>
                            </div>
                        </div>

                        <div class="chat-message is-sent">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="" />
                            <div class="message-block">
                                <span>11:53am</span>
                                <div class="message-text">I need it badly, it's work stuff.</div>
                            </div>
                        </div>

                        <div class="chat-message is-received">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" alt="" />
                            <div class="message-block">
                                <span>12:19pm</span>
                                <div class="message-text">
                                    Yeah i noticed. I'll drop it in half an hour at your office.
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Conversation with Nelly -->
                    <div id="nelly-conversation" class="chat-body-inner has-slimscroll is-hidden">
                        <div class="date-divider">
                            <hr class="date-divider-line" />
                            <span class="date-divider-text">September 17</span>
                        </div>

                        <div class="chat-message is-sent">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="" />
                            <div class="message-block">
                                <span>8:22pm</span>
                                <div class="message-text">So you watched the movie?</div>
                            </div>
                        </div>

                        <div class="chat-message is-sent">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="" />
                            <div class="message-block">
                                <span>8:22pm</span>
                                <div class="message-text">Was it scary?</div>
                            </div>
                        </div>

                        <div class="chat-message is-received">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/nelly.png" alt="" />
                            <div class="message-block">
                                <span>9:03pm</span>
                                <div class="message-text">
                                    It was so frightening, i felt my heart was about to blow inside my
                                    chest.
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Conversation with Milly -->
                    <div id="milly-conversation" class="chat-body-inner has-slimscroll">
                        <div class="date-divider">
                            <hr class="date-divider-line" />
                            <span class="date-divider-text">Today</span>
                        </div>

                        <div class="chat-message is-received">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/milly.jpg" alt="" />
                            <div class="message-block">
                                <span>2:01pm</span>
                                <div class="message-text">Hello Jenna, did you read my proposal?</div>
                            </div>
                        </div>

                        <div class="chat-message is-received">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/milly.jpg" alt="" />
                            <div class="message-block">
                                <span>2:01pm</span>
                                <div class="message-text">Didn't hear from you since i sent it.</div>
                            </div>
                        </div>

                        <div class="chat-message is-sent">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="" />
                            <div class="message-block">
                                <span>2:02pm</span>
                                <div class="message-text">
                                    Hello Milly, Iam really sorry, Iam so busy recently, but i had the time
                                    to read it.
                                </div>
                            </div>
                        </div>

                        <div class="chat-message is-received">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/milly.jpg" alt="" />
                            <div class="message-block">
                                <span>2:04pm</span>
                                <div class="message-text">And what did you think about it?</div>
                            </div>
                        </div>

                        <div class="chat-message is-sent">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="" />
                            <div class="message-block">
                                <span>2:05pm</span>
                                <div class="message-text">
                                    Actually it's quite good, there might be some small changes but overall
                                    it's great.
                                </div>
                            </div>
                        </div>

                        <div class="chat-message is-sent">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="" />
                            <div class="message-block">
                                <span>2:07pm</span>
                                <div class="message-text">
                                    I think that i can give it to my boss at this stage.
                                </div>
                            </div>
                        </div>

                        <div class="chat-message is-received">
                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/milly.jpg" alt="" />
                            <div class="message-block">
                                <span>2:09pm</span>
                                <div class="message-text">Crossing fingers then</div>
                            </div>
                        </div>
                    </div>

                    <!-- Compose message area -->
                    <div class="chat-action">
                        <div class="chat-action-inner">
                            <div class="control">
                                <textarea class="textarea comment-textarea" rows="1"></textarea>
                                <div class="dropdown compose-dropdown is-spaced is-accent is-up dropdown-trigger">
                                    <div>
                                        <div class="add-button">
                                            <div class="button-inner">
                                                <i data-feather="plus"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="dropdown-menu" role="menu">
                                        <div class="dropdown-content">
                                            <a href="#" class="dropdown-item">
                                                <div class="media">
                                                    <i data-feather="code"></i>
                                                    <div class="media-content">
                                                        <h3>Code snippet</h3>
                                                        <small>Add and paste a code snippet.</small>
                                                    </div>
                                                </div>
                                            </a>
                                            <a class="dropdown-item">
                                                <div class="media">
                                                    <i data-feather="file-text"></i>
                                                    <div class="media-content">
                                                        <h3>Note</h3>
                                                        <small>Add and paste a note.</small>
                                                    </div>
                                                </div>
                                            </a>
                                            <hr class="dropdown-divider" />
                                            <a class="dropdown-item">
                                                <div class="media">
                                                    <i data-feather="server"></i>
                                                    <div class="media-content">
                                                        <h3>Remote file</h3>
                                                        <small>Add a file from a remote drive.</small>
                                                    </div>
                                                </div>
                                            </a>
                                            <a class="dropdown-item">
                                                <div class="media">
                                                    <i data-feather="monitor"></i>
                                                    <div class="media-content">
                                                        <h3>Local file</h3>
                                                        <small>Add a file from your computer.</small>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="chat-panel" class="chat-panel is-opened">
                    <div class="panel-inner">
                        <div class="panel-header">
                            <h3>Details</h3>
                            <div class="panel-close">
                                <i data-feather="x"></i>
                            </div>
                        </div>

                        <!-- Dan details -->
                        <div id="dan-details" class="panel-body is-user-details">
                            <div class="panel-body-inner">
                                <div class="subheader">
                                    <div class="action-icon">
                                        <i class="mdi mdi-video"></i>
                                    </div>
                                    <div class="action-icon">
                                        <i class="mdi mdi-camera"></i>
                                    </div>
                                    <div class="action-icon">
                                        <i class="mdi mdi-microphone"></i>
                                    </div>
                                    <div class="dropdown details-dropdown is-spaced is-neutral is-right dropdown-trigger ml-auto">
                                        <div>
                                            <div class="action-icon">
                                                <i class="mdi mdi-dots-vertical"></i>
                                            </div>
                                        </div>
                                        <div class="dropdown-menu" role="menu">
                                            <div class="dropdown-content">
                                                <a href="#" class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="user"></i>
                                                        <div class="media-content">
                                                            <h3>View profile</h3>
                                                            <small>View this user's profile.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="mail"></i>
                                                        <div class="media-content">
                                                            <h3>Send message</h3>
                                                            <small>Send a message to the user's inbox.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <hr class="dropdown-divider" />
                                                <a class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="share-2"></i>
                                                        <div class="media-content">
                                                            <h3>Share profile</h3>
                                                            <small>Share this user's profile.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="x"></i>
                                                        <div class="media-content">
                                                            <h3>Block user</h3>
                                                            <small>Block this user permanently.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="details-avatar">
                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/dan.jpg" alt="" />
                                    <div class="call-me">
                                        <i class="mdi mdi-phone"></i>
                                    </div>
                                </div>

                                <div class="user-meta has-text-centered">
                                    <h3>Dan Walker</h3>
                                    <h4>IOS Developer</h4>
                                </div>

                                <div class="user-badges">
                                    <div class="hexagon is-red">
                                        <div>
                                            <i class="mdi mdi-heart"></i>
                                        </div>
                                    </div>
                                    <div class="hexagon is-green">
                                        <div>
                                            <i class="mdi mdi-dog"></i>
                                        </div>
                                    </div>
                                    <div class="hexagon is-accent">
                                        <div>
                                            <i class="mdi mdi-flash"></i>
                                        </div>
                                    </div>
                                    <div class="hexagon is-blue">
                                        <div>
                                            <i class="mdi mdi-briefcase"></i>
                                        </div>
                                    </div>
                                </div>

                                <div class="user-about">
                                    <label>About Me</label>
                                    <div class="about-block">
                                        <i class="mdi mdi-domain"></i>
                                        <div class="about-text">
                                            <span>Works at</span>
                                            <span><a class="is-inverted" href="#">WebSmash Inc.</a></span>
                                        </div>
                                    </div>
                                    <div class="about-block">
                                        <i class="mdi mdi-school"></i>
                                        <div class="about-text">
                                            <span>Studied at</span>
                                            <span><a class="is-inverted" href="#">Riverdale University</a></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Stella details -->
                        <div id="stella-details" class="panel-body is-user-details is-hidden">
                            <div class="panel-body-inner">
                                <div class="subheader">
                                    <div class="action-icon">
                                        <i class="mdi mdi-video"></i>
                                    </div>
                                    <div class="action-icon">
                                        <i class="mdi mdi-camera"></i>
                                    </div>
                                    <div class="action-icon">
                                        <i class="mdi mdi-microphone"></i>
                                    </div>
                                    <div class="dropdown details-dropdown is-spaced is-neutral is-right dropdown-trigger ml-auto">
                                        <div>
                                            <div class="action-icon">
                                                <i class="mdi mdi-dots-vertical"></i>
                                            </div>
                                        </div>
                                        <div class="dropdown-menu" role="menu">
                                            <div class="dropdown-content">
                                                <a href="#" class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="user"></i>
                                                        <div class="media-content">
                                                            <h3>View profile</h3>
                                                            <small>View this user's profile.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="mail"></i>
                                                        <div class="media-content">
                                                            <h3>Send message</h3>
                                                            <small>Send a message to the user's inbox.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <hr class="dropdown-divider" />
                                                <a class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="share-2"></i>
                                                        <div class="media-content">
                                                            <h3>Share profile</h3>
                                                            <small>Share this user's profile.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="x"></i>
                                                        <div class="media-content">
                                                            <h3>Block user</h3>
                                                            <small>Block this user permanently.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="details-avatar">
                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/stella.jpg" alt="" />
                                    <div class="call-me">
                                        <i class="mdi mdi-phone"></i>
                                    </div>
                                </div>

                                <div class="user-meta has-text-centered">
                                    <h3>Stella Bergmann</h3>
                                    <h4>Shop Owner</h4>
                                </div>

                                <div class="user-badges">
                                    <div class="hexagon is-purple">
                                        <div>
                                            <i class="mdi mdi-bomb"></i>
                                        </div>
                                    </div>
                                    <div class="hexagon is-red">
                                        <div>
                                            <i class="mdi mdi-check-decagram"></i>
                                        </div>
                                    </div>
                                    <div class="hexagon is-accent">
                                        <div>
                                            <i class="mdi mdi-flash"></i>
                                        </div>
                                    </div>
                                </div>

                                <div class="user-about">
                                    <label>About Me</label>
                                    <div class="about-block">
                                        <i class="mdi mdi-domain"></i>
                                        <div class="about-text">
                                            <span>Works at</span>
                                            <span><a class="is-inverted" href="#">Trending Fashions</a></span>
                                        </div>
                                    </div>
                                    <div class="about-block">
                                        <i class="mdi mdi-map-marker"></i>
                                        <div class="about-text">
                                            <span>From</span>
                                            <span><a class="is-inverted" href="#">Oklahoma City</a></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Daniel details -->
                        <div id="daniel-details" class="panel-body is-user-details is-hidden">
                            <div class="panel-body-inner">
                                <div class="subheader">
                                    <div class="action-icon">
                                        <i class="mdi mdi-video"></i>
                                    </div>
                                    <div class="action-icon">
                                        <i class="mdi mdi-camera"></i>
                                    </div>
                                    <div class="action-icon">
                                        <i class="mdi mdi-microphone"></i>
                                    </div>
                                    <div class="dropdown details-dropdown is-spaced is-neutral is-right dropdown-trigger ml-auto">
                                        <div>
                                            <div class="action-icon">
                                                <i class="mdi mdi-dots-vertical"></i>
                                            </div>
                                        </div>
                                        <div class="dropdown-menu" role="menu">
                                            <div class="dropdown-content">
                                                <a href="#" class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="user"></i>
                                                        <div class="media-content">
                                                            <h3>View profile</h3>
                                                            <small>View this user's profile.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="mail"></i>
                                                        <div class="media-content">
                                                            <h3>Send message</h3>
                                                            <small>Send a message to the user's inbox.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <hr class="dropdown-divider" />
                                                <a class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="share-2"></i>
                                                        <div class="media-content">
                                                            <h3>Share profile</h3>
                                                            <small>Share this user's profile.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="x"></i>
                                                        <div class="media-content">
                                                            <h3>Block user</h3>
                                                            <small>Block this user permanently.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="details-avatar">
                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/daniel.jpg" alt="" />
                                    <div class="call-me">
                                        <i class="mdi mdi-phone"></i>
                                    </div>
                                </div>

                                <div class="user-meta has-text-centered">
                                    <h3>Daniel Wellington</h3>
                                    <h4>Senior Executive</h4>
                                </div>

                                <div class="user-badges">
                                    <div class="hexagon is-accent">
                                        <div>
                                            <i class="mdi mdi-google-cardboard"></i>
                                        </div>
                                    </div>
                                    <div class="hexagon is-blue">
                                        <div>
                                            <i class="mdi mdi-pizza"></i>
                                        </div>
                                    </div>
                                    <div class="hexagon is-accent">
                                        <div>
                                            <i class="mdi mdi-linux"></i>
                                        </div>
                                    </div>
                                    <div class="hexagon is-red">
                                        <div>
                                            <i class="mdi mdi-puzzle"></i>
                                        </div>
                                    </div>
                                </div>

                                <div class="user-about">
                                    <label>About Me</label>
                                    <div class="about-block">
                                        <i class="mdi mdi-domain"></i>
                                        <div class="about-text">
                                            <span>Works at</span>
                                            <span><a class="is-inverted" href="#">Peelman & Sons</a></span>
                                        </div>
                                    </div>
                                    <div class="about-block">
                                        <i class="mdi mdi-map-marker"></i>
                                        <div class="about-text">
                                            <span>From</span>
                                            <span><a class="is-inverted" href="#">Los Angeles</a></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- David details -->
                        <div id="david-details" class="panel-body is-user-details is-hidden">
                            <div class="panel-body-inner">
                                <div class="subheader">
                                    <div class="action-icon">
                                        <i class="mdi mdi-video"></i>
                                    </div>
                                    <div class="action-icon">
                                        <i class="mdi mdi-camera"></i>
                                    </div>
                                    <div class="action-icon">
                                        <i class="mdi mdi-microphone"></i>
                                    </div>
                                    <div class="dropdown details-dropdown is-spaced is-neutral is-right dropdown-trigger ml-auto">
                                        <div>
                                            <div class="action-icon">
                                                <i class="mdi mdi-dots-vertical"></i>
                                            </div>
                                        </div>
                                        <div class="dropdown-menu" role="menu">
                                            <div class="dropdown-content">
                                                <a href="#" class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="user"></i>
                                                        <div class="media-content">
                                                            <h3>View profile</h3>
                                                            <small>View this user's profile.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="mail"></i>
                                                        <div class="media-content">
                                                            <h3>Send message</h3>
                                                            <small>Send a message to the user's inbox.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <hr class="dropdown-divider" />
                                                <a class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="share-2"></i>
                                                        <div class="media-content">
                                                            <h3>Share profile</h3>
                                                            <small>Share this user's profile.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="x"></i>
                                                        <div class="media-content">
                                                            <h3>Block user</h3>
                                                            <small>Block this user permanently.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="details-avatar">
                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/david.jpg" alt="" />
                                    <div class="call-me">
                                        <i class="mdi mdi-phone"></i>
                                    </div>
                                </div>

                                <div class="user-meta has-text-centered">
                                    <h3>David Kim</h3>
                                    <h4>Senior Developer</h4>
                                </div>

                                <div class="user-badges">
                                    <div class="hexagon is-red">
                                        <div>
                                            <i class="mdi mdi-heart"></i>
                                        </div>
                                    </div>
                                    <div class="hexagon is-green">
                                        <div>
                                            <i class="mdi mdi-dog"></i>
                                        </div>
                                    </div>
                                    <div class="hexagon is-accent">
                                        <div>
                                            <i class="mdi mdi-flash"></i>
                                        </div>
                                    </div>
                                    <div class="hexagon is-blue">
                                        <div>
                                            <i class="mdi mdi-briefcase"></i>
                                        </div>
                                    </div>
                                </div>

                                <div class="user-about">
                                    <label>About Me</label>
                                    <div class="about-block">
                                        <i class="mdi mdi-domain"></i>
                                        <div class="about-text">
                                            <span>Works at</span>
                                            <span><a class="is-inverted" href="#">Frost Entertainment</a></span>
                                        </div>
                                    </div>
                                    <div class="about-block">
                                        <i class="mdi mdi-map-marker"></i>
                                        <div class="about-text">
                                            <span>From</span>
                                            <span><a class="is-inverted" href="#">Chicago</a></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Edward details -->
                        <div id="edward-details" class="panel-body is-user-details is-hidden">
                            <div class="panel-body-inner">
                                <div class="subheader">
                                    <div class="action-icon">
                                        <i class="mdi mdi-video"></i>
                                    </div>
                                    <div class="action-icon">
                                        <i class="mdi mdi-camera"></i>
                                    </div>
                                    <div class="action-icon">
                                        <i class="mdi mdi-microphone"></i>
                                    </div>
                                    <div class="dropdown details-dropdown is-spaced is-neutral is-right dropdown-trigger ml-auto">
                                        <div>
                                            <div class="action-icon">
                                                <i class="mdi mdi-dots-vertical"></i>
                                            </div>
                                        </div>
                                        <div class="dropdown-menu" role="menu">
                                            <div class="dropdown-content">
                                                <a href="#" class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="user"></i>
                                                        <div class="media-content">
                                                            <h3>View profile</h3>
                                                            <small>View this user's profile.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="mail"></i>
                                                        <div class="media-content">
                                                            <h3>Send message</h3>
                                                            <small>Send a message to the user's inbox.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <hr class="dropdown-divider" />
                                                <a class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="share-2"></i>
                                                        <div class="media-content">
                                                            <h3>Share profile</h3>
                                                            <small>Share this user's profile.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="x"></i>
                                                        <div class="media-content">
                                                            <h3>Block user</h3>
                                                            <small>Block this user permanently.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="details-avatar">
                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/edward.jpeg" alt="" />
                                    <div class="call-me">
                                        <i class="mdi mdi-phone"></i>
                                    </div>
                                </div>

                                <div class="user-meta has-text-centered">
                                    <h3>Edward Mayers</h3>
                                    <h4>Financial analyst</h4>
                                </div>

                                <div class="user-badges">
                                    <div class="hexagon is-red">
                                        <div>
                                            <i class="mdi mdi-heart"></i>
                                        </div>
                                    </div>
                                    <div class="hexagon is-green">
                                        <div>
                                            <i class="mdi mdi-dog"></i>
                                        </div>
                                    </div>
                                    <div class="hexagon is-accent">
                                        <div>
                                            <i class="mdi mdi-flash"></i>
                                        </div>
                                    </div>
                                </div>

                                <div class="user-about">
                                    <label>About Me</label>
                                    <div class="about-block">
                                        <i class="mdi mdi-domain"></i>
                                        <div class="about-text">
                                            <span>Works at</span>
                                            <span><a class="is-inverted" href="#">Brettmann Bank</a></span>
                                        </div>
                                    </div>
                                    <div class="about-block">
                                        <i class="mdi mdi-map-marker"></i>
                                        <div class="about-text">
                                            <span>From</span>
                                            <span><a class="is-inverted" href="#">Santa Fe</a></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Elise details -->
                        <div id="elise-details" class="panel-body is-user-details is-hidden">
                            <div class="panel-body-inner">
                                <div class="subheader">
                                    <div class="action-icon">
                                        <i class="mdi mdi-video"></i>
                                    </div>
                                    <div class="action-icon">
                                        <i class="mdi mdi-camera"></i>
                                    </div>
                                    <div class="action-icon">
                                        <i class="mdi mdi-microphone"></i>
                                    </div>
                                    <div class="dropdown details-dropdown is-spaced is-neutral is-right dropdown-trigger ml-auto">
                                        <div>
                                            <div class="action-icon">
                                                <i class="mdi mdi-dots-vertical"></i>
                                            </div>
                                        </div>
                                        <div class="dropdown-menu" role="menu">
                                            <div class="dropdown-content">
                                                <a href="#" class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="user"></i>
                                                        <div class="media-content">
                                                            <h3>View profile</h3>
                                                            <small>View this user's profile.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="mail"></i>
                                                        <div class="media-content">
                                                            <h3>Send message</h3>
                                                            <small>Send a message to the user's inbox.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <hr class="dropdown-divider" />
                                                <a class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="share-2"></i>
                                                        <div class="media-content">
                                                            <h3>Share profile</h3>
                                                            <small>Share this user's profile.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="x"></i>
                                                        <div class="media-content">
                                                            <h3>Block user</h3>
                                                            <small>Block this user permanently.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="details-avatar">
                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" alt="" />
                                    <div class="call-me">
                                        <i class="mdi mdi-phone"></i>
                                    </div>
                                </div>

                                <div class="user-meta has-text-centered">
                                    <h3>Elise Walker</h3>
                                    <h4>Social influencer</h4>
                                </div>

                                <div class="user-badges">
                                    <div class="hexagon is-red">
                                        <div>
                                            <i class="mdi mdi-heart"></i>
                                        </div>
                                    </div>
                                    <div class="hexagon is-accent">
                                        <div>
                                            <i class="mdi mdi-flash"></i>
                                        </div>
                                    </div>
                                </div>

                                <div class="user-about">
                                    <label>About Me</label>
                                    <div class="about-block">
                                        <i class="mdi mdi-domain"></i>
                                        <div class="about-text">
                                            <span>Works at</span>
                                            <span><a class="is-inverted" href="#">Social Media</a></span>
                                        </div>
                                    </div>
                                    <div class="about-block">
                                        <i class="mdi mdi-map-marker"></i>
                                        <div class="about-text">
                                            <span>From</span>
                                            <span><a class="is-inverted" href="#">London</a></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Nelly details -->
                        <div id="nelly-details" class="panel-body is-user-details is-hidden">
                            <div class="panel-body-inner">
                                <div class="subheader">
                                    <div class="action-icon">
                                        <i class="mdi mdi-video"></i>
                                    </div>
                                    <div class="action-icon">
                                        <i class="mdi mdi-camera"></i>
                                    </div>
                                    <div class="action-icon">
                                        <i class="mdi mdi-microphone"></i>
                                    </div>
                                    <div class="dropdown details-dropdown is-spaced is-neutral is-right dropdown-trigger ml-auto">
                                        <div>
                                            <div class="action-icon">
                                                <i class="mdi mdi-dots-vertical"></i>
                                            </div>
                                        </div>
                                        <div class="dropdown-menu" role="menu">
                                            <div class="dropdown-content">
                                                <a href="#" class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="user"></i>
                                                        <div class="media-content">
                                                            <h3>View profile</h3>
                                                            <small>View this user's profile.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="mail"></i>
                                                        <div class="media-content">
                                                            <h3>Send message</h3>
                                                            <small>Send a message to the user's inbox.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <hr class="dropdown-divider" />
                                                <a class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="share-2"></i>
                                                        <div class="media-content">
                                                            <h3>Share profile</h3>
                                                            <small>Share this user's profile.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="x"></i>
                                                        <div class="media-content">
                                                            <h3>Block user</h3>
                                                            <small>Block this user permanently.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="details-avatar">
                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/nelly.png" alt="" />
                                    <div class="call-me">
                                        <i class="mdi mdi-phone"></i>
                                    </div>
                                </div>

                                <div class="user-meta has-text-centered">
                                    <h3>Nelly Schwartz</h3>
                                    <h4>HR Manager</h4>
                                </div>

                                <div class="user-badges">
                                    <div class="hexagon is-red">
                                        <div>
                                            <i class="mdi mdi-heart"></i>
                                        </div>
                                    </div>
                                    <div class="hexagon is-green">
                                        <div>
                                            <i class="mdi mdi-dog"></i>
                                        </div>
                                    </div>
                                    <div class="hexagon is-accent">
                                        <div>
                                            <i class="mdi mdi-flash"></i>
                                        </div>
                                    </div>
                                    <div class="hexagon is-blue">
                                        <div>
                                            <i class="mdi mdi-briefcase"></i>
                                        </div>
                                    </div>
                                </div>

                                <div class="user-about">
                                    <label>About Me</label>
                                    <div class="about-block">
                                        <i class="mdi mdi-domain"></i>
                                        <div class="about-text">
                                            <span>Works at</span>
                                            <span><a class="is-inverted" href="#">Carrefour</a></span>
                                        </div>
                                    </div>
                                    <div class="about-block">
                                        <i class="mdi mdi-map-marker"></i>
                                        <div class="about-text">
                                            <span>From</span>
                                            <span><a class="is-inverted" href="#">Melbourne</a></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Milly details -->
                        <div id="milly-details" class="panel-body is-user-details is-hidden">
                            <div class="panel-body-inner">
                                <div class="subheader">
                                    <div class="action-icon">
                                        <i class="mdi mdi-video"></i>
                                    </div>
                                    <div class="action-icon">
                                        <i class="mdi mdi-camera"></i>
                                    </div>
                                    <div class="action-icon">
                                        <i class="mdi mdi-microphone"></i>
                                    </div>
                                    <div class="dropdown details-dropdown is-spaced is-neutral is-right dropdown-trigger ml-auto">
                                        <div>
                                            <div class="action-icon">
                                                <i class="mdi mdi-dots-vertical"></i>
                                            </div>
                                        </div>
                                        <div class="dropdown-menu" role="menu">
                                            <div class="dropdown-content">
                                                <a href="#" class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="user"></i>
                                                        <div class="media-content">
                                                            <h3>View profile</h3>
                                                            <small>View this user's profile.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="mail"></i>
                                                        <div class="media-content">
                                                            <h3>Send message</h3>
                                                            <small>Send a message to the user's inbox.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <hr class="dropdown-divider" />
                                                <a class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="share-2"></i>
                                                        <div class="media-content">
                                                            <h3>Share profile</h3>
                                                            <small>Share this user's profile.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a class="dropdown-item">
                                                    <div class="media">
                                                        <i data-feather="x"></i>
                                                        <div class="media-content">
                                                            <h3>Block user</h3>
                                                            <small>Block this user permanently.</small>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="details-avatar">
                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/milly.jpg" alt="" />
                                    <div class="call-me">
                                        <i class="mdi mdi-phone"></i>
                                    </div>
                                </div>

                                <div class="user-meta has-text-centered">
                                    <h3>Milly Augustine</h3>
                                    <h4>Sales Manager</h4>
                                </div>

                                <div class="user-badges">
                                    <div class="hexagon is-red">
                                        <div>
                                            <i class="mdi mdi-heart"></i>
                                        </div>
                                    </div>
                                    <div class="hexagon is-green">
                                        <div>
                                            <i class="mdi mdi-dog"></i>
                                        </div>
                                    </div>
                                    <div class="hexagon is-accent">
                                        <div>
                                            <i class="mdi mdi-flash"></i>
                                        </div>
                                    </div>
                                    <div class="hexagon is-blue">
                                        <div>
                                            <i class="mdi mdi-briefcase"></i>
                                        </div>
                                    </div>
                                </div>

                                <div class="user-about">
                                    <label>About Me</label>
                                    <div class="about-block">
                                        <i class="mdi mdi-domain"></i>
                                        <div class="about-text">
                                            <span>Works at</span>
                                            <span><a class="is-inverted" href="#">Salesforce</a></span>
                                        </div>
                                    </div>
                                    <div class="about-block">
                                        <i class="mdi mdi-map-marker"></i>
                                        <div class="about-text">
                                            <span>From</span>
                                            <span><a class="is-inverted" href="#">Seattle</a></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="add-conversation-modal" class="modal add-conversation-modal is-xsmall has-light-bg">
            <div class="modal-background"></div>
            <div class="modal-content">
                <div class="card">
                    <div class="card-heading">
                        <h3>New Conversation</h3>
                        <!-- Close X button -->
                        <div class="close-wrap">
                            <span class="close-modal">
                                <i data-feather="x"></i>
                            </span>
                        </div>
                    </div>
                    <div class="card-body">
                        <img src="assets/img/icons/chat/bubbles.svg" alt="" />

                        <div class="field is-autocomplete">
                            <div class="control has-icon">
                                <input type="text" class="input simple-users-autocpl" placeholder="Search a user" />
                                <div class="form-icon">
                                    <i data-feather="search"></i>
                                </div>
                            </div>
                        </div>

                        <div class="help-text">
                            Select a user to start a new conversation. You'll be able to add other
                            users later.
                        </div>

                        <div class="action has-text-centered">
                            <button type="button" class="button is-solid accent-button raised">
                                Start conversation
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="explorer-menu">
            <div class="explorer-inner">
                <div class="explorer-container">
                    <!--Header-->
                    <div class="explorer-header">
                        <h3>Explore</h3>
                        <div class="control">
                            <input type="text" class="input is-rounded is-fade" placeholder="Filter" />
                            <div class="form-icon">
                                <i data-feather="filter"></i>
                            </div>
                        </div>
                    </div>
                    <!--List-->
                    <div class="explore-list has-slimscroll">
                        <!--item-->
                        <a href="navbar-v1-feed.html" class="explore-item">
                            <img src="assets/img/icons/explore/clover.svg" alt="" />
                            <h4>Feed</h4>
                        </a>
                        <!--item-->
                        <a href="navbar-v1-profile-friends.html" class="explore-item">
                            <img src="assets/img/icons/explore/friends.svg" alt="" />
                            <h4>Friends</h4>
                        </a>
                        <!--item-->
                        <a href="navbar-v1-videos-home.html" class="explore-item">
                            <img src="assets/img/icons/explore/videos.svg" alt="" />
                            <h4>Videos</h4>
                        </a>
                        <!--item-->
                        <a href="navbar-v1-pages-main.html" class="explore-item">
                            <img src="assets/img/icons/explore/tag-euro.svg" alt="" />
                            <h4>Pages</h4>
                        </a>
                        <!--item-->
                        <a href="navbar-v1-ecommerce-products.html" class="explore-item">
                            <img src="assets/img/icons/explore/cart.svg" alt="" />
                            <h4>Commerce</h4>
                        </a>
                        <!--item-->
                        <a href="navbar-v1-groups.html" class="explore-item">
                            <img src="assets/img/icons/explore/house.svg" alt="" />
                            <h4>Interests</h4>
                        </a>
                        <!--item-->
                        <a href="navbar-v1-stories-main.html" class="explore-item">
                            <img src="assets/img/icons/explore/chrono.svg" alt="" />
                            <h4>Stories</h4>
                        </a>
                        <!--item-->
                        <a href="navbar-v1-questions-home.html" class="explore-item">
                            <img src="assets/img/icons/explore/question.svg" alt="" />
                            <h4>Questions</h4>
                        </a>
                        <!--item-->
                        <a href="news.html" class="explore-item">
                            <img src="assets/img/icons/explore/news.svg" alt="" />
                            <h4>News</h4>
                        </a>
                        <!--item-->
                        <a href="navbar-v1-groups.html" class="explore-item">
                            <img src="assets/img/icons/explore/cake.svg" alt="" />
                            <h4>Groups</h4>
                        </a>
                        <!--item-->
                        <a href="https://envato.com/" class="explore-item">
                            <img src="assets/img/icons/explore/envato.svg" alt="" />
                            <h4>Envato</h4>
                        </a>
                        <!--item-->
                        <a href="navbar-v1-events.html" class="explore-item">
                            <img src="assets/img/icons/explore/calendar.svg" alt="" />
                            <h4>Events</h4>
                        </a>
                        <!--item-->
                        <a href="https://cssninja.io/" target="_blank" class="explore-item">
                            <img src="assets/img/icons/explore/pin.svg" alt="" />
                            <h4>Css Ninja</h4>
                        </a>
                        <!--item-->
                        <a href="elements.html" class="explore-item">
                            <img src="assets/img/icons/explore/idea.svg" alt="" />
                            <h4>Elements</h4>
                        </a>
                        <!--item-->
                        <a href="navbar-v1-settings.html" class="explore-item">
                            <img src="assets/img/icons/explore/settings.svg" alt="" />
                            <h4>Settings</h4>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div id="end-tour-modal" class="modal end-tour-modal is-xsmall has-light-bg">
            <div class="modal-background"></div>
            <div class="modal-content">
                <div class="card">
                    <div class="card-heading">
                        <h3></h3>
                        <!-- Close X button -->
                        <div class="close-wrap">
                            <span class="close-modal">
                                <i data-feather="x"></i>
                            </span>
                        </div>
                    </div>
                    <div class="card-body has-text-centered">
                        <div class="image-wrap">
                            <img src="assets/img/vector/logo/friendkit.svg" alt="" />
                        </div>

                        <h3>That's all folks!</h3>
                        <p>
                            Thanks for taking the friendkit tour. There are still tons of other
                            features for you to discover!
                        </p>

                        <div class="action">
                            <a href="index.html#demos-section" class="button is-solid accent-button raised is-fullwidth">Explore</a>
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
        <script src="assets/js/widgets2.js"></script>
        <script src="assets/js/modal-uploader.js"></script>
        <script src="assets/js/popovers-users.js"></script>
        <script src="assets/js/popovers-pages.js"></script>
        <script src="assets/js/lightbox.js"></script>

        <!-- Landing page js -->

        <!-- Signup page js -->

        <!-- Feed pages js -->
        <script src="assets/js/feed.js"></script>

        <script src="assets/js/webcam.js"></script>
        <script src="assets/js/compose.js"></script>
        <script src="assets/js/autocompletes.js"></script>

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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>


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

                                    function simulateEvent(element, eventName) {
                                        var event = new Event(eventName);
                                        element.dispatchEvent(event);
                                    }



                                    $(document).ready(function () {
                                        $("#create-post").on("submit", function (event) {
                                            event.preventDefault(); 
                                            $.ajax({
                                                url: 'CreatePost',
                                                type: 'POST',
                                                data: $(this).serialize(),
                                                success: function (response) {
                                                    const modal = document.getElementById('create-post-modal');
                                                    modal.classList.remove('is-active');
                                                    var form = document.getElementById('create-post');
                                                    form.reset();
                                                        iziToast.show({
                                                            maxWidth: "280px",
                                                            class: "success-toast",
                                                            icon: "mdi mdi-check",
                                                            title: "",
                                                            message: "Create post successfully",
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
                                                                                                            
                                                                                                            
                                                },
                                                error: function (jqXHR, textStatus, errorThrown) {
                                                    console.error('Error:', errorThrown);
                                                }
                                            });
                                        });
                                    });

        </script>
    </body>


    <!-- Mirrored from friendkit.cssninja.io/navbar-v1-feed.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 May 2024 06:36:11 GMT -->
</html>
