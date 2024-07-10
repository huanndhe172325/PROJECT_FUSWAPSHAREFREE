<%-- 
    Document   : HomePage
    Created on : May 20, 2024, 10:37:57 PM
    Author     : FPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="en">


    <!-- Mirrored from friendkit.cssninja.io/navbar-v1-feed.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 May 2024 06:35:55 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />

        <title>FUSSF</title>
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

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:600,700,800,900" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet" />
        <link href="../cdn.jsdelivr.net/npm/fontisto%40v3.0.4/css/fontisto/fontisto-brands.min.css" rel="stylesheet" />
        <!-- Core CSS -->
        <link rel="stylesheet" href="assets/css/app.css" />
        <link rel="stylesheet" href="assets/css/core.css" />
        <link rel="stylesheet" href="assets/css/mainstyle.css" /> 
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
            #btn-quality,
            #btn-post-of-friends{
                background-color: #007bff;
                color: white;
                border-color: #007bff;
            }

            /* Thiết lập màu khi di chuột qua */
            #btn-all:hover,
            #btn-newest:hover,
            #btn-exchange:hover,
            #btn-free:hover,
            #btn-quality:hover,
            #btn-post-of-friends:hover{
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
            .user-post-image img {
                width: 500px;
                height: 300px; /* Điều chỉnh chiều cao của ảnh */
                object-fit: cover; /* Đảm bảo ảnh không bị bóp méo */
            }

            /* CSS cho nút điều hướng */
            .user-image-btn button {
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
            #user-near-me-post-container {
                max-width: 600px;
                margin: auto;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                overflow: hidden;
                background-color: #f5f5f5;
                padding: 15px;
            }

            /* Phần tiêu đề */
            #user-near-me-post-container h4 {
                margin: 0;
                font-size: 20px;
                color: #333;
                text-align: center;
            }

            /* Card của sản phẩm */
            .user-product-card {
                margin-top: 15px;
            }

            /* Hình ảnh bài đăng */
            .user-post-image {
                position: relative;
                height: 300px;
                overflow: hidden;
            }

            /* Nút điều hướng hình ảnh */
            .user-image-btn {
                position: absolute;
                top: 50%;
                left: 0;
                right: 0;
                transform: translateY(-50%);
                display: flex;
                justify-content: space-between;
                padding: 0 10px;
            }

            .user-image-btn button {
                background: rgba(255, 255, 255, 0.7);
                border: none;
                border-radius: 50%;
                padding: 10px;
                cursor: pointer;
            }

            /* Thông tin sản phẩm */
            .user-product-info {
                padding: 15px;
                background-color: #fff;
                border-radius: 8px;
                margin-top: -10px;
            }

            /* Tiêu đề bài đăng */
            #user-post-title {
                margin: 0 0 10px;
                font-size: 18px;
                color: #6ba4e9;
                font-weight: bold;
            }

            /* Mô tả bài đăng */
            #user-post-description {
                margin: 0;
                font-size: 14px;
                color: #666;
            }

            /* Các thông tin nhỏ bên dưới */
            .user-product-info p {
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
        <!-- End Google Tag Manager -->


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
                    <a href="HomePage" class="navbar-item">
                        <img class="logo light-image" src="assets/img/vector/logo/friendkit-bold.svg" width="112" height="28" alt="" />
                        <img class="logo dark-image" src="assets/img/vector/logo/friendkit-white.svg" width="112" height="28" alt="" />
                    </a>
                </div>
                <div class="navbar-menu">
                    <div class="navbar-start">
                        <!-- Navbar Search -->

                        <div class="navbar-item is-icon drop-trigger">
                            <a class="icon-link is-friends" href="javascript:void(0);">
                                <i data-feather="user"></i>
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
                                        <c:forEach var="frirq" items="${listFriendsRq}">
                                            <!-- Friend request -->
                                            <div class="media">
                                                <figure class="media-left">
                                                    <p class="image" onclick="window.location.href = 'otherprofile?id=${frirq.senderUserId}'">
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="${frirq.getAvatarOwner()}" alt="" />
                                                    </p>
                                                </figure>
                                                <div class="media-content">
                                                    <a href="otherprofile?id=${frirq.senderUserId}">${frirq.getFullNameOwner()}</a>
                                                    <span>đã gửi lời mời kết bạn cho bạn</span>
                                                </div>
                                                <div class="media-right">
                                                    <button class="button icon-button is-solid grey-button raised accept-request"  data-request-id="${frirq.requestId}" data-sender-id="${frirq.senderUserId}" data-receiver-id="${frirq.receiverUserId}">
                                                        <i data-feather="user-plus"></i>
                                                    </button>
                                                    <button class="button icon-button is-solid grey-button raised reject-request"  data-request-id="${frirq.requestId}" data-sender-id="${frirq.senderUserId}" 
                                                            data-receiver-id="${frirq.receiverUserId}">
                                                        <i data-feather="user-minus"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </c:forEach>                                    
                                    </div>
                                    <div class="nav-drop-footer">
                                        <a href="#">View All</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="navbar-item is-icon drop-trigger fetch-notifycation">
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
                                        <c:forEach var="noti" items="${listNoti}">
                                            <!-- Notification -->
                                            <div class="media" onclick="window.location.href = 'detailPost?idpost=${noti.postID}'" style="cursor: pointer;">
                                                <figure class="media-left">
                                                    <p class="image">
                                                        <img src="https://via.placeholder.com/300x300" onclick="window.location.href = 'otherprofile?id=${noti.getUserSent().userID}'" data-demo-src="${noti.getAvatarUserSent()}" alt="" style="cursor: pointer;" />
                                                    </p>
                                                </figure>
                                                <div class="media-content">
                                                    <span><a href="otherprofile?id=${noti.getUserSent().userID}">${noti.getFullNameUserSent()}</a> ${noti.descripton}
                                                        <a href="detailPost?idpost=${noti.postID}">post</a>.</span>
                                                    <span class="time">${noti.getCreateTime()}</span>
                                                </div>
                                                <div class="media-right">
                                                    <div class="added-icon">
                                                        <i data-feather="message-square"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <div class="nav-drop-footer">
                                        <a href="#">View All</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="navbar-item is-icon drop-trigger">
                            <a class="icon-link is-active" href="javascript:void(0);">
                                <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"><path fill="white" d="m18 4l-4 4h3v7c0 1.1-.9 2-2 2s-2-.9-2-2V8c0-2.21-1.79-4-4-4S5 5.79 5 8v7H2l4 4l4-4H7V8c0-1.1.9-2 2-2s2 .9 2 2v7c0 2.21 1.79 4 4 4s4-1.79 4-4V8h3z"/></svg>
                                <span class="indicator"></span>
                            </a>

                            <div class="nav-drop">
                                <div class="inner">
                                    <div class="nav-drop-header">
                                        <span>My post pick-up arrange</span>
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
                                </div>
                            </div>
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
                                    <i data-feather="search" style="margin-top: 10px;"></i>
                                </span>

                                <div id="tipue_drop_content" class="tipue-drop-content"></div>
                            </div>
                        </div>
                        <div id="account-dropdown" class="navbar-item is-account drop-trigger has-caret">
                            <div class="user-image">
                                <img src="https://via.placeholder.com/400x400" data-demo-src="${user.avatarUrl}" alt="" />
                                <span class="indicator"></span>
                            </div>

                            <div class="nav-drop is-account-dropdown">
                                <div class="inner">
                                    <div class="nav-drop-body account-items">
                                        <a id="profile-link" href="profile" class="account-item">
                                            <div class="media">
                                                <div class="media-left">
                                                    <div class="image">
                                                        <img src="https://via.placeholder.com/400x400" data-demo-src="${user.avatarUrl}" alt="" />
                                                    </div>
                                                </div>
                                                <div class="media-content">
                                                    <h3>${user.full_Name}</h3>
                                                    <small>Main account</small>
                                                </div>
                                                <div class="media-right">
                                                    <i data-feather="check"></i>
                                                </div>
                                            </div>
                                        </a>
                                        <hr class="account-divider" />
                                        <a href="#" class="account-item">
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
                                        <a href="#" class="account-item">
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
                                        <form action="logout" method="POST" >
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
                <div class="navbar-item is-icon drop-trigger fetch-notifycation">
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
                                <c:forEach var="noti" items="${listNoti}">
                                    <!-- Notification -->
                                    <div class="media" onclick="window.location.href = 'detailPost?idpost=${noti.postID}'" style="cursor: pointer;">
                                        <figure class="media-left">
                                            <p class="image">
                                                <img src="https://via.placeholder.com/300x300" onclick="window.location.href = 'otherprofile?id=${noti.getUserSent().userID}'" data-demo-src="${noti.getAvatarUserSent()}" alt="" style="cursor: pointer;" />
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <span><a href="otherprofile?id=${noti.getUserSent().userID}">${noti.getFullNameUserSent()}</a> ${noti.descripton}
                                                <a href="detailPost?idpost=${noti.postID}">post</a>.</span>
                                            <span class="time">${noti.getCreateTime()}</span>
                                        </div>
                                        <div class="media-right">
                                            <div class="added-icon">
                                                <i data-feather="message-square"></i>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
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
                        <div class="column is-3 is-hidden-mobile is-hidden-tablet-only">
                            <!-- Weather widget -->
                            <!-- /partials/widgets/weather-widget.html -->

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
                                <div class="card-body no-padding scrollable-content">
                                    <!-- Recommended Page -->
                                    <c:forEach var="user" items="${requestScope.listPoint}">
                                        <div class="page-block">
                                            <img src="https://via.placeholder.com/300x300" style="cursor: pointer;" onclick="window.location.href = 'otherprofile?id=${user.userID}'" data-demo-src="${user.avatarUrl}" data-page-popover="5" alt="" />
                                            <div class="page-meta">
                                                <a href="otherprofile?id=${user.userID}"><span>${user.full_Name}</span></a>
                                                <span>${user.point}</span>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>

                        <!-- Add some CSS for the scrollable content -->
                        <style>
                            .scrollable-content {
                                max-height: 400px; /* Set the maximum height for the scrollable content */
                                overflow-y: auto;  /* Enable vertical scrolling */
                            }
                            .page-block {
                                display: flex;
                                align-items: center;
                                justify-content: space-between;
                                padding: 10px;
                                border-bottom: 1px solid #ddd; /* Optional: add a bottom border for separation */
                            }
                            .page-block img {
                                border-radius: 50%;
                                width: 50px;
                                height: 50px;
                                object-fit: cover;
                            }
                            .page-meta {
                                margin-left: 10px;
                            }
                            .add-page {
                                cursor: pointer;
                            }
                        </style>

                        <!-- /Left side column -->

                        <!-- Middle column -->
                        <div class="column is-6 is-12-tablet is-12-touch is-6-widescreen is-6-desktop is-12">
                            <div id="profile-timeline-posts" class="box-heading" style="margin-bottom: 24px;">
                                <h4>Posts</h4>
                                <div class="button-wrap">
                                    <button type="button" id="btn-all" class="button is-active" data-filter="all" onclick="filterPosts('all')">All</button>
                                    <button type="button" id="btn-newest" class="button" data-filter="newest" onclick="filterPosts('newest')">Newest</button>
                                    <button type="button" id="btn-exchange" class="button" data-filter="exchange" onclick="filterPosts('exchange')">Exchange</button>
                                    <button type="button" id="btn-free" class="button" data-filter="free" onclick="filterPosts('free')">Free</button>
                                    <div class="quality-button">
                                        <button type="button" id="btn-quality" class="button" onclick="toggleQualityOptions()">Quality</button>
                                        <div id="quality-options" class="quality-options" style="display: none;">
                                            <button type="button" class="button" data-filter="used" onclick="filterPosts('used')">Used</button>
                                            <button type="button" class="button" data-filter="needsrepair" onclick="filterPosts('needsrepair')">Needs Repair</button>
                                            <button type="button" class="button" data-filter="new" onclick="filterPosts('new')">New</button>
                                        </div>
                                    </div>
                                    <a id="btn-post-of-friends" class="button" href="HomePageFriend">Post of friends</a>
                                </div>
                            </div>
                            <!-- Post 1 -->
                            <div class="post-container" data-category="listPost">
                                <c:forEach var="post" items="${listPost}"> 
                                    <div id="feed-post-1" class="card is-post post" data-post-id="${post.postID}" data-avaiable-request="${post.avaiAbleRequest(user.getUserID())}"  data-status="${post.getStatusName()}" data-create-time="${post.createTime}" data-status="${post.getStatusName()}" data-type="${post.getTypeName()}" data-quality="${post.getQuanlityName()}" data-user-id="${user.getUserID()}">
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
                                                        <a class="post-name-owner"  href="otherprofile?id=${post.userID}">${post.getFullNameOwner()}</a>
                                                        <span class="time" style="display: inline-block">${post.createTime}</span>
                                                        <span class="status-post-name" style="display: inline-block; padding: 0 10px; float: right;">${post.getStatusName()}</span>
                                                        <span class="type-post-name" style="display: inline-block; float: right;">${post.getTypeName()}</span>
                                                        <span class="quanlity-post" style="display: none; float: right;">${post.getQuanlityName()}</span>
                                                        <span class="addres-post" style="display: none; float: right;">${post.getAddress()}</span>
                                                        <span class="intrucstion-post" style="display: none; float: right;">${post.intructions}</span>
                                                        <span class="desire-post" style="display: none; float: right;">${post.desire}</span>
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
                                                            <a class="dropdown-item flag-link" post-id="${post.postID}">
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
                                            <div class="like-wrapper" style="position: absolute; right: 10px;">
                                                <a class="like-button ${post.isLikedByUser(user.getUserID()) ? 'is-active' : ''}">
                                                    <i class="mdi mdi-heart not-liked bouncy"></i>
                                                    <i class="mdi mdi-heart is-liked bouncy"></i>
                                                    <span class="like-overlay"></span>
                                                </a>
                                            </div>
                                            <div class="card-footer">
                                                <div class="social-count" style="margin-left: 0px;">
                                                    <div class="likes-count">
                                                        <i data-feather="heart"></i>
                                                        <span id="likeCountSpan">${post.getCountLikeOfPost()}</span>
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




                            <!-- Load more posts -->
                            <div class="load-more-wrap narrow-top has-text-centered">
                                <a href="#" class="load-more-button">Load More</a>
                            </div>
                            <!-- /Load more posts -->
                        </div>
                        <script>
                            document.addEventListener("DOMContentLoaded", function() {
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
                            loadMoreButton.addEventListener("click", function(e) {
                            e.preventDefault();
                            handleLoadMore();
                            });
                            });
                        </script>
                        <!-- /Middle column -->

                        <!-- Right side column -->
                        <div class="column is-3 is-hidden-mobile is-hidden-tablet-only">
                            <!-- Birthday widget -->
                            <!-- /partials/widgets/birthday-widget.html -->

                            <!-- Suggested friends widget -->
                            <!-- /partials/widgets/suggested-friends-1-widget.html -->
                            <div class="card">
                                <div class="card-heading is-bordered">
                                    <h4>User near me</h4>
                                    <div class="dropdown is-spaced is-right dropdown-trigger">
                                        <div>

                                        </div>
                                        <div class="dropdown-menu" role="menu">
                                            <div class="dropdown-content">

                                                <hr class="dropdown-divider" />

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body no-padding scrollable-content">
                                    <c:forEach var="user" items="${requestScope.listUserDistrict}">
                                        <div class="add-friend-block transition-block">
                                            <img src="https://via.placeholder.com/300x300" style="cursor: pointer;" onclick="window.location.href = 'otherprofile?id=${user.userID}'" data-demo-src="${user.avatarUrl}" data-user-popover="9" alt="" />
                                            <div class="page-meta">
                                                <a href="otherprofile?id=${user.userID}"><span>${user.full_Name}</span></a>
                                                <span>${user.district}</span>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>


                            <div id="user-near-me-post-container" style="max-width: 600px; margin: auto; box-shadow: 0 2px 4px rgba(0,0,0,0.1); border-radius: 8px; overflow: hidden; background-color: #f5f5f5; padding: 15px;">
                                <h4 style="margin: 0; font-size: 20px; color: #333; text-align: center;">Posts Near You</h4>

                                <div id="current-user-post" class="user-product-card" style="margin-top: 15px;">
                                    <div class="user-post-image" style="position: relative; height: 300px; overflow: hidden;">
                                        <img id="user-post-image" src="" alt="Post image" style="width: 100%; height: 100%; object-fit: cover; display: block;">
                                        <div class="user-image-btn" style="position: absolute; top: 50%; left: 0; right: 0; transform: translateY(-50%); display: flex; justify-content: space-between; padding: 0 10px;">
                                            <button onclick="prevUserImage()" style="background: rgba(255,255,255,0.7); border: none; border-radius: 50%; padding: 10px; cursor: pointer;">◀</button>
                                            <button onclick="nextUserImage()" style="background: rgba(255,255,255,0.7); border: none; border-radius: 50%; padding: 10px; cursor: pointer;">▶</button>
                                        </div>
                                    </div>
                                    <div class="user-product-info" style="padding: 15px; background-color: #fff; border-radius: 8px; margin-top: -10px;">
                                        <h3 id="user-post-title" style="margin: 0 0 10px; font-size: 18px; color: #6ba4e9; font-weight: bold;"></h3>
                                        <p id="user-post-description" style="margin: 0; font-size: 14px; color: #666;"></p>
                                        <p><strong>Date:</strong> <span id="user-post-date"></span></p>
                                        <p><strong>Type:</strong> <span id="user-post-type"></span></p>
                                        <p><strong>Quanlity:</strong> <span id="user-post-quanlity"></span></p>
                                        <p><strong>Instructions:</strong> <span id="user-post-instructions"></span></p>                                       
                                        <p><strong>Owner:</strong> <a id="user-post-owner-link" href="#" onclick="viewUserProfile()">View profile</a></p>
                                    </div>
                                </div>

                                <div class="user-navigation-buttons" style="display: flex; justify-content: space-between; margin-top: 15px;">
                                    <button id="user-prev-button" onclick="prevUserPost()" style="padding: 10px 20px; background-color: #4267B2; color: white; border: none; border-radius: 4px; cursor: pointer;">Previous</button>
                                    <button id="user-next-button" onclick="nextUserPost()" style="padding: 10px 20px; background-color: #4267B2; color: white; border: none; border-radius: 4px; cursor: pointer;">Next</button>
                                </div>
                            </div>










                        </div>

                        <!-- Add some CSS for the scrollable content -->
                        <style>
                            .scrollable-content {
                                max-height: 400px; /* Set the maximum height for the scrollable content */
                                overflow-y: auto;  /* Enable vertical scrolling */
                                padding: 10px;
                                border: 1px solid #ddd; /* Optional: add a border for better visibility */
                            }
                            .add-friend-block {
                                display: flex;
                                align-items: center;
                                justify-content: space-between;
                                padding: 10px;
                                border-bottom: 1px solid #ddd; /* Optional: add a bottom border */
                            }
                            .add-friend-block img {
                                border-radius: 50%;
                                width: 50px;
                                height: 50px;
                                object-fit: cover;
                            }
                            .page-meta {
                                margin-left: 10px;
                            }
                            .add-friend {
                                cursor: pointer;
                            }
                        </style>


                        <!-- New job widget -->
                    </div>
                    <!-- /Right side column -->
                </div>
            </div>
            <!-- /Feed page main wrapper -->
        </div>
        <!-- /Container -->


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
                                    <h2 style="font-weight: 500;">Address:</h2>
                                    <p id="share-modal-address">-</p>
                                </div>
                                <div class="detail-row">
                                    <h2 style="font-weight: 500;">Instructions:</h2>
                                    <p id="share-modal-intruc">-</p>
                                </div>
                                <div class="detail-row" id="share-modal-desire-block">
                                    <h2 style="font-weight: 500;">Desire:</h2>
                                    <p id="share-modal-desire">-</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer" style="width: 100%;">
                        <div class="button-wrap" style="width: 100%;">
                            <button id="requestThis" style="width: 100%;" type="button" class="open-modal-request button is-solid primary-button">
                                Request This
                            </button>
                            <button id="swapThis" style="width: 100%;" type="button" class="open-modal-swap button is-solid primary-button">
                                Swap This
                            </button>
                            <button id="requested" style="width: 100%;" type="button" class="button is-solid primary-button">
                                Requested
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <div id="create-post-modal" class="modal share-modal is-xsmall has-light-bg">
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
                            <form enctype="multipart/form-data" action="CreatePost2" id="create-post" method="post">
                                <label for="Title">Title:</label>
                                <input type="text" id="title" name="title" required="">
                                <span id="title-error" class="error-message" style="display: none; color: red;">Please input title!!!</span>
                                <label for="Title">Description: </label>
                                <textarea id="description" required class="textarea comment-textarea" name="description" rows="5" placeholder="e.g 2 x bottles of shampoo, almost full">Món đồ này đã có một vài năm sử dụng nhưng vẫn đáp ứng tốt nhu cầu sử dụng hàng ngày.</textarea>
                                <span id="title-error-desc" class="error-message" style="display: none; color: red;">Please input description!!!</span>

                                <label for="imgPath">Image:</label>
                                <input type="file" id="imgPath" name="imgPath" accept="image/*" required="" multiple>
                                <div class="post-image preview-img" style="display: none;">
                                    <div class="style-img-post">
                                    </div>
                                    <div class="image-btn" style="display: none;">
                                        <div class="btn-image-next btn-image" style="font-size: 26px;">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                                            <path stroke-width="1" stroke="black" fill="currentColor" d="M5.536 21.886a1.004 1.004 0 0 0 1.033-.064l13-9a1 1 0 0 0 0-1.644l-13-9A1 1 0 0 0 5 3v18a1 1 0 0 0 .536.886"/>
                                            </svg>
                                        </div>
                                        <div class="btn-image-pre btn-image" style="font-size: 26px;">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                                            <path stroke-width="1" stroke="black" fill="currentColor" d="m4.431 12.822l13 9A1 1 0 0 0 19 21V3a1 1 0 0 0-1.569-.823l-13 9a1.003 1.003 0 0 0 0 1.645"/>
                                            </svg>
                                        </div>
                                    </div>
                                </div> 


                                <table style="margin-top: 15px;">
                                    <tr>
                                        <td style="padding: 5px;">
                                            <label for="quality">Quanlity:</label>
                                        </td>
                                        <td style="padding: 5px;">
                                            <label><input type="radio" name="quality" value="1" required checked> Used</label>
                                        </td>
                                        <td style="padding: 5px;">
                                            <label><input type="radio" name="quality" value="2" required> Needs Repair</label>
                                        </td>
                                        <td style="padding: 5px;">
                                            <label><input type="radio" name="quality" value="3" required> New</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px;">
                                            <label for="typePost">Type:</label>
                                        </td>
                                        <td style="padding: 5px;">
                                            <label><input type="radio" name="typePost" value="1" required> Exchange</label>
                                        </td>
                                        <td style="padding: 5px;">
                                            <label><input type="radio" name="typePost" value="2" checked required> Free</label>
                                        </td>
                                        <td></td>
                                    </tr>
                                </table>

                                <label for="desire" id="titleDesire" style="display: none;">Desire:</label>
                                <input style="display: none;" type="text" id="desire" name="desire" value="Tôi muốn đổi lấy 1 chiếc điện thoại cũ nhưng vẫn sử dụng được." required>

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
                                        <input name="newAddress" id="Order_name" type="text" maxlength="255" value="Số nhà ...." required="">
                                        <span id="title-error-add" class="error-message" style="display: none; color: red;">Please input street number!!!</span>
                                    </div>
                                </div>
                                <label>Expires Date<span class="required">*</span></label>
                                <select name="expiresDate" class="form-select form-select-sm" id="expiresDate" aria-label=".form-select-sm" required="">
                                    <option value="1">1 Day</option>
                                    <option value="3">3 Days</option>
                                    <option value="7">7 Days</option>
                                    <option value="15" selected>15 Days</option>
                                </select>

                                <label for="instructions">Pick-up instructions</label>
                                <input type="text" value="4-6pm khi tới nơi hãy gọi cho tôi" id="instructions" name="instructions" required="" placeholder="Pick up today from 4 - 6pm. Please ring doorbell when here">
                                <span id="title-error-inst" class="error-message" style="display: none; color: red;">Please input instructions!!!</span>




                                <input type="submit" id="submit-create-post" style="display : none;" value="Submit">
                            </form>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="button-wrap" style="width: 98%;">
                            <button type="button" id="postButton" class="button is-solid primary-button" style="width: 100%;">
                                Post
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- report form -->
    <div id="report-post-modal" class="modal share-modal is-xsmall has-light-bg">
        <div class="modal-background"></div>
        <div class="modal-content">
            <div class="card">
                <div class="card-heading">
                    <div class="close-wrap">
                        <span class="close-modal">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x">
                            <line x1="18" y1="6" x2="6" y2="18"></line>
                            <line x1="6" y1="6" x2="18" y2="18"></line>
                            </svg>
                        </span>
                    </div>
                </div>
                <div class="card-body">
                    <form id="report-post-form">
                        <div class="control">
                            <label for="report_reason">Select a reason for reporting:</label><br>
                            <input type="radio" id="reason_spam" name="report_reason" value="Spam">
                            <label for="reason_spam">Spam</label><br>
                            <input type="radio" id="reason_inappropriate" name="report_reason" value="Inappropriate content">
                            <label for="reason_inappropriate">Inappropriate content</label><br>
                            <input type="radio" id="reason_abuse" name="report_reason" value="Abuse">
                            <label for="reason_abuse">Abuse</label><br>
                            <input type="radio" id="reason_other" name="report_reason" value="Other">
                            <label for="reason_other">Other</label><br>
                            <textarea id="report_reason_others" name="report_reason_other" class="textarea" rows="5" placeholder="Enter additional details (if 'Other' selected)" style="display:none;"></textarea>
                            <input type="hidden" id="post_id_value" name="post_id"> <!-- Hidden input to store post_id -->
                            <input type="submit" id="submit-report-form" style="display: none;" value="Submit">
                        </div>
                    </form>
                </div>
                <div class="card-footer">
                    <div class="close-modal-report" style="width: 98%;">
                        <button type="button" class="button is-solid primary-button" style="width: 95%; padding: 0 5px; background-color: #bfbfbf; border: none; color: #000;">
                            Cancel
                        </button>
                    </div>
                    <div class="button-wrap" style="width: 98%;">
                        <button type="button" class="button is-solid primary-button" id="reportButton" style="width: 95%; padding: 0 5px;">
                            Report 
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="sent-swap-modal" class="modal share-modal is-xsmall has-light-bg" style="z-index: 1100;">
        <div class="modal-background"></div>
        <div class="modal-content">
            <div class="card">
                <div class="card-heading">
                    <div class="close-wrap">
                        <span class="close-modal" onclick="document.getElementById('sent-swap-form').reset();">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                        </span>
                    </div>
                </div>
                <div class="card-body">
                    <div class="control">
                        <form enctype="multipart/form-data" action="requestSwap" id="sent-swap-form" method="POST">   
                            <input type="text" id="idPostSwap" name="idPostSwap" style="display: none;">
                            <label for="imgPath">Image:</label>
                            <input required type="file" id="imgPathSwap" name="imgPathSwap" accept="image/*" multiple>
                            <span id="img-error-swap" class="error-message-swap" style="display: none; color: red;">Please input image!!!</span>
                            <div class="post-image preview-img preview-swap" style="display: none;">
                                <div class="style-img-post block-img-swap">
                                </div>
                                <div class="image-btn image-btn-swap-preview" style="display: none;">
                                    <div class="btn-image-next btn-image" style="font-size: 26px;">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                                        <path stroke-width="1" stroke="black" fill="currentColor" d="M5.536 21.886a1.004 1.004 0 0 0 1.033-.064l13-9a1 1 0 0 0 0-1.644l-13-9A1 1 0 0 0 5 3v18a1 1 0 0 0 .536.886"/>
                                        </svg>
                                    </div>
                                    <div class="btn-image-pre btn-image" style="font-size: 26px;">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                                        <path stroke-width="1" stroke="black" fill="currentColor" d="m4.431 12.822l13 9A1 1 0 0 0 19 21V3a1 1 0 0 0-1.569-.823l-13 9a1.003 1.003 0 0 0 0 1.645"/>
                                        </svg>
                                    </div>
                                </div>
                            </div> 
                            <label for="Title">Description: </label>
                            <textarea id="descriptionSwap" required class="textarea comment-textarea" name="descriptionSwap" rows="5" placeholder="Message the message you want to send to the owner"></textarea>
                            <span id="message-error-swap" class="error-message-swap" style="display: none; color: red;">Please input description!!!</span>

                            <input type="submit" id="submit-swap" style="display : none;" value="Submit">
                        </form>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="button-wrap" style="width: 98%;">
                        <button type="button" id="swapButton" class="button is-solid primary-button" style="width: 100%;">
                            Swap
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="sent-request-modal" class="modal share-modal is-xsmall has-light-bg" style="z-index: 1100;">
        <div class="modal-background"></div>
        <div class="modal-content">
            <div class="card">
                <div class="card-heading">
                    <div class="close-wrap">
                        <span class="close-modal" onclick="document.getElementById('sent-request-form').reset();">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                        </span>
                    </div>
                </div>
                <div class="card-body">
                    <div class="control">
                        <form enctype="multipart/form-data" id="sent-request-form" method="post">   
                            <input type="text" name="idPostRequest" style="display: none;">
                            <label for="Title">Message: </label>
                            <textarea id="messageRequest" required class="textarea comment-textarea" name="messageRequest" rows="5" placeholder="Message the message you want to send to the owner"></textarea>
                            <span id="message-error-request" class="error-message" style="display: none; color: red;">Please input message!!!</span>
                            <input type="submit" id="submit-request" style="display : none;" value="Submit">
                        </form>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="button-wrap" style="width: 98%;">
                        <button type="button" id="requestButton" class="button is-solid primary-button" style="width: 100%;">
                            Sent
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
    <script src="assets/js/jsslideimage.js"></script>
    <script src="assets/js/ReportPost.js" ></script>
    <script src="assets/js/createpost.js" ></script>
    <script src="assets/js/swapPost.js" ></script>
    <script src="assets/js/fetchNotifycation.js" ></script>

    <script>
                            document.addEventListener('DOMContentLoaded', function () {
                            // Thêm sự kiện click cho các nút accept
                            document.querySelectorAll('.accept-request').forEach(function (button) {
                            button.addEventListener('click', function () {
                            var requestId = this.getAttribute('data-request-id');
                            var senderUserId = this.getAttribute('data-sender-id');
                            var receiverUserId = this.getAttribute('data-receiver-id');
                            updateFriendRequestStatus(requestId, 'accepted', senderUserId, receiverUserId, this);
                            });
                            });
                            // Thêm sự kiện click cho các nút reject
                            document.querySelectorAll('.reject-request').forEach(function (button) {
                            button.addEventListener('click', function () {
                            var requestId = this.getAttribute('data-request-id');
                            var senderUserId = this.getAttribute('data-sender-id');
                            var receiverUserId = this.getAttribute('data-receiver-id');
                            updateFriendRequestStatus(requestId, 'rejected', senderUserId, receiverUserId, this);
                            });
                            });
                            function updateFriendRequestStatus(requestId, status, senderUserId, receiverUserId, button) {
                            var xhr = new XMLHttpRequest();
                            xhr.open('POST', '/FUSWAPSHAREFREE/AddFriend', true);
                            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                            xhr.onreadystatechange = function () {
                            if (xhr.readyState === 4 && xhr.status === 200) {
                            iziToast.show({
                            message: 'Friend request ' + status,
                                    position: 'bottomRight'
                            });
                            var parentDiv = button.closest('.media');
                            if (status === 'accepted') {
                            parentDiv.querySelector('.media-content').innerHTML += '<span class="tag is-success">Accepted</span>';
                            } else if (status === 'rejected') {
                            parentDiv.querySelector('.media-content').innerHTML += '<span class="tag is-danger">Rejected</span>';
                            }

                            parentDiv.querySelectorAll('.accept-request, .reject-request').forEach(function (btn) {
                            btn.style.display = 'none';
                            });
                            }
                            };
                            var params = 'request_id=' + requestId + '&status=' + status;
                            if (senderUserId && receiverUserId) {
                            params += '&sender_user_id=' + senderUserId + '&receiver_user_id=' + receiverUserId;
                            }
                            xhr.send(params);
                            }
                            });
    </script>


    <script>
        document.addEventListener('DOMContentLoaded', function () {
        document.querySelectorAll('.like-button').forEach(button => {
        button.addEventListener('click', function () {
        const postElement = this.closest('.post');
        const postId = postElement.getAttribute('data-post-id');
        const userId = postElement.getAttribute('data-user-id');
        const isLiked = this.classList.contains('is-active');
        const likeCountElement = postElement.querySelector('.likes-count span');
        const params = 'postId=' + encodeURIComponent(postId) +
                '&userId=' + encodeURIComponent(userId) +
                '&action=' + encodeURIComponent(isLiked ? 'unlike' : 'like');
        const xhr = new XMLHttpRequest();
        xhr.open('POST', '/FUSWAPSHAREFREE/LikePost', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {

        if (!isLiked) {
        button.classList.add('is-active');
        likeCountElement.textContent = parseInt(likeCountElement.textContent) + 1;
        } else {
        button.classList.remove('is-active');
        likeCountElement.textContent = parseInt(likeCountElement.textContent) - 1;
        }
        } else {
        console.error('Request failed. Status:', xhr.status);
        }
        };
        xhr.send(params);
        });
        });
        });
    </script>








    <script>
        var posts = [
        <c:forEach var="p" items="${listPostUserNearMe}" varStatus="status">
        {
        title: "${p.title}",
                description: "${p.description}",
                images: [
            <c:forEach var="img" items="${p.getListImg()}" varStatus="imgStatus">
                "${img}"${!imgStatus.last ? ',' : ''}
            </c:forEach>
                ],
                createTime: "${p.createTime}",
                typeName: "${p.getTypeName()}",
                quanlityName: "${p.getQuanlityName()}",
                intructions: "${p.intructions}",
                ownerName: "${p.getFullNameOwner()}",
                userID: "${p.userID}"
        }${!status.last ? ',' : ''}
        </c:forEach>
        ];
        var currentPostIndex = 0;
        var currentImageIndex = 0;
        function displayUserPost(postIndex) {
        var post = posts[postIndex];
        document.getElementById('user-post-image').src = post.images[currentImageIndex];
        document.getElementById('user-post-title').textContent = post.title;
        document.getElementById('user-post-description').textContent = post.description;
        document.getElementById('user-post-date').textContent = post.createTime;
        document.getElementById('user-post-type').textContent = post.typeName;
        document.getElementById('user-post-quanlity').textContent = post.quanlityName;
        document.getElementById('user-post-instructions').textContent = post.intructions;
        var typeElement = document.getElementById('user-post-type');
        typeElement.style.color = (post.typeName === 'Free') ? '#1a936f' : (post.typeName === 'Exchange') ? '#d32f2f' : '#333';
        document.getElementById('user-post-owner-link').textContent = "View profile of " + post.ownerName;
        document.getElementById('user-post-owner-link').onclick = function() {
        viewUserProfile(post.userID);
        return false;
        };
        }

        function nextUserPost() {
        if (currentPostIndex < posts.length - 1) {
        currentPostIndex++;
        currentImageIndex = 0;
        displayUserPost(currentPostIndex);
        }
        }

        function prevUserPost() {
        if (currentPostIndex > 0) {
        currentPostIndex--;
        currentImageIndex = 0;
        displayUserPost(currentPostIndex);
        }
        }

        function nextUserImage() {
        if (currentImageIndex < posts[currentPostIndex].images.length - 1) {
        currentImageIndex++;
        document.getElementById('user-post-image').src = posts[currentPostIndex].images[currentImageIndex];
        }
        }

        function prevUserImage() {
        if (currentImageIndex > 0) {
        currentImageIndex--;
        document.getElementById('user-post-image').src = posts[currentPostIndex].images[currentImageIndex];
        }
        }
        function viewUserProfile(userID) {

        window.location.href = 'otherprofile?id=' + userID;
        }
        displayUserPost(currentPostIndex);
    </script>




    <script>
        document.getElementById("tipue_drop_input").addEventListener("keyup", function (event) {
        if (event.key === "Enter") {
        var keyword = document.getElementById("tipue_drop_input").value.trim();
        if (keyword !== "") {
        var url = "/FUSWAPSHAREFREE/SearchHomePage?keyword=" + encodeURIComponent(keyword);
        window.location.href = url;
        } else {
        alert("Please enter a keyword to search.");
        }
        }
        });
    </script>
    <script>
        let originalPostsOrder = [];
        function filterPosts(filter) {
        const posts = document.querySelectorAll('.post');
        const buttons = document.querySelectorAll('.button-wrap .button');
        // Remove 'is-active' class from all buttons
        buttons.forEach(btn => btn.classList.remove('is-active'));
        // Add 'is-active' class to clicked button
        const activeButton = document.querySelector(`.button[data-filter="${filter}"]`);
        if (activeButton) {
        activeButton.classList.add('is-active');
        }
        if (filter === 'all') {
        // Reset to original order
        resetPostsOrder();
        } else {
        posts.forEach(post => {
        switch (filter) {
        case 'all':
                post.style.display = 'block';
        break;
        case 'newest':
                post.style.display = 'block';
        break;
        case 'exchange':
                post.style.display = post.dataset.type.toLowerCase() === 'exchange' ? 'block' : 'none';
        break;
        case 'free':
                post.style.display = post.dataset.type.toLowerCase() === 'free' ? 'block' : 'none';
        break;
        case 'used':
                post.style.display = post.dataset.quality.toLowerCase() === 'used' ? 'block' : 'none';
        break;
        case 'needsrepair':
                post.style.display = post.dataset.quality.toLowerCase() === 'needs repair' ? 'block' : 'none';
        break;
        case 'new':
                post.style.display = post.dataset.quality.toLowerCase() === 'new' ? 'block' : 'none';
        break;
        }
        });
        if (filter === 'newest' || filter === 'exchange' || filter === 'free' || filter === 'used' || filter === 'free' || filter === 'needsrepair' || filter === 'new') {
        sortPostsByNewest();
        }

        }
        }
        function sortPostsByNewest() {
        const postContainer = document.querySelector('.post-container');
        const posts = Array.from(postContainer.querySelectorAll('.post'));
        posts.sort((a, b) => {
        return new Date(b.dataset.createTime) - new Date(a.dataset.createTime);
        });
        posts.forEach(post => postContainer.appendChild(post));
        }
        function toggleQualityOptions() {
        const qualityOptions = document.getElementById('quality-options');
        qualityOptions.style.display = qualityOptions.style.display === 'none' ? 'block' : 'none';
        }
        function resetPostsOrder() {
        const postContainer = document.querySelector('.post-container');
        postContainer.innerHTML = ''; // Clear existing posts

        // Append posts in original order
        originalPostsOrder.forEach(post => postContainer.appendChild(post));
        }
        window.addEventListener('load', () => {
        originalPostsOrder = Array.from(document.querySelectorAll('.post'));
        filterPosts('all');
        });
    </script>

    <script>
        document.getElementById('postButton').addEventListener('click', function () {
        if (validateForm()) {
        document.getElementById('submit-create-post').click();
        }
        });
        const titleInput = document.getElementById('title');
        const errorMessage = document.getElementById('title-error');
        titleInput.addEventListener('input', function () {
        const inputValue = titleInput.value.trim();
        if (inputValue.length > 0) {
        errorMessage.style.display = 'none';
        } else {
        errorMessage.style.display = 'block';
        }
        });
        const descInput = document.getElementById('description');
        const errorMessageDesc = document.getElementById('title-error-desc');
        descInput.addEventListener('input', function () {
        var inputValueDesc = descInput.value.trim();
        if (inputValueDesc.length > 0) {
        errorMessageDesc.style.display = 'none';
        } else {
        errorMessageDesc.style.display = 'block';
        }
        });
        const addInput = document.getElementById('Order_name');
        const errorMessageAdd = document.getElementById('title-error-add');
        addInput.addEventListener('input', function () {
        const inputValueAdd = addInput.value.trim();
        if (inputValueAdd.length > 0) {
        errorMessageAdd.style.display = 'none';
        } else {
        errorMessageAdd.style.display = 'block';
        }
        });
        const instInput = document.getElementById('instructions');
        const errorMessageInst = document.getElementById('title-error-inst');
        instInput.addEventListener('input', function () {
        const inputValueInst = instInput.value.trim();
        if (inputValueInst.length > 0) {
        errorMessageInst.style.display = 'none';
        } else {
        errorMessageInst.style.display = 'block';
        }
        });
        function validateForm() {
        var title = document.getElementById('title').value.trim();
        var description = document.querySelector('textarea[name="description"]').value.trim();
        var newAddress = document.getElementById('Order_name').value.trim();
        var instructions = document.getElementById('instructions').value.trim();
        if (title === '') {
        var titleError = document.getElementById('title-error');
        titleError.style.display = 'block';
        return false;
        }

        if (description === '') {
        var titleError = document.getElementById('title-error-desc');
        titleError.style.display = 'block';
        return false;
        }

        if (newAddress === '') {
        var titleError = document.getElementById('title-error-add');
        titleError.style.display = 'block';
        return false;
        }

        if (instructions === '') {
        var titleError = document.getElementById('title-error-inst');
        titleError.style.display = 'block';
        return false;
        }
        return true;
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

        var form = document.getElementById('create-post');
        form.addEventListener('submit', function (event) {
        event.preventDefault();
        var formData = new FormData(form);
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'CreatePost2', true);
        xhr.onload = function () {
        if (xhr.responseText === "success") {
        const modal = document.getElementById('create-post-modal');
        modal.classList.remove('is-active');
        document.getElementById('create-post').reset();
        var form2 = document.getElementById('create-post');
        form2.querySelector('.post-image.preview-img').style.display = 'none';
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
        } else {
        const modal = document.getElementById('create-post-modal');
        modal.classList.remove('is-active');
        var form = document.getElementById('create-post');
        iziToast.show({
        maxWidth: "280px",
                class: "success-toast",
                icon: "mdi mdi-error",
                title: "",
                message: "Create post failed",
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
        document.getElementById('imgPath').addEventListener('change', function (event) {
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
        document.addEventListener("DOMContentLoaded", function () {
        var openModalRequest = document.querySelectorAll('.open-modal-request');
        const modalRequest = document.getElementById('sent-request-modal');
        const requestButton = document.getElementById('requestButton');
        let currentPostRequest = null;
        openModalRequest.forEach(openModalArchive => {
        openModalArchive.addEventListener('click', () => {
        const postIdRequest = openModalArchive.getAttribute('data-post-id');
        currentPostRequest = postIdRequest;
        modalRequest.setAttribute('data-post-id', postIdRequest);
        modalRequest.querySelector('input[name="idPostRequest"]').value = postIdRequest;
        modalRequest.classList.add('is-active');
        });
        });
        document.getElementById('requestButton').addEventListener('click', function () {
        if (validateFormRequest()) {
        document.getElementById('submit-request').click();
        }
        });
        const inputMessage = document.getElementById('messageRequest');
        const errorMessageRequest = document.getElementById('message-error-request');
        inputMessage.addEventListener('input', function () {
        const inputValueRequest = inputMessage.value.trim();
        if (inputValueRequest.length > 0) {
        errorMessageRequest.style.display = 'none';
        } else {
        errorMessageRequest.style.display = 'block';
        }
        });
        function validateFormRequest() {
        var messageRequestInput = document.getElementById('messageRequest').value.trim();
        if (messageRequestInput === '') {
        var titleErrorRequest = document.getElementById('message-error-request');
        titleErrorRequest.style.display = 'block';
        return false;
        }
        return true;
        }

        document.getElementById('sent-request-form').addEventListener('submit', (event) => {
        var mesageSent = document.getElementById('sent-request-form').querySelector('textarea[name="messageRequest"]').value;
        event.preventDefault();
        const xhr = new XMLHttpRequest();
        xhr.open('POST', 'requestPost', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onload = function () {
        console.log(xhr.responseText);
        if (xhr.responseText == 1) {
        document.getElementById('sent-request-form').reset();
        iziToast.show({
        maxWidth: "280px",
                class: "success-toast",
                icon: "mdi mdi-check",
                title: "",
                message: "Request successfully",
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
        modalRequest.classList.remove('is-active');
        } else if (xhr.responseText == 2) {
        document.getElementById('sent-request-form').reset();
        iziToast.show({
        maxWidth: "280px",
                class: "success-toast",
                icon: "mdi mdi-check",
                title: "",
                message: "You have requested, cannot request again",
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
        modalRequest.classList.remove('is-active');
        }
        };
        xhr.send('id=' + currentPostRequest + '&mesage=' + mesageSent);
        });
        });
    </script>



</body>


<!-- Mirrored from friendkit.cssninja.io/navbar-v1-feed.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 May 2024 06:36:11 GMT -->
</html>
