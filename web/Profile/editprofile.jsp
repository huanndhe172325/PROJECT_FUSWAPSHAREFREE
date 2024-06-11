<%-- 
    Document   : editprofile
    Created on : May 26, 2024, 7:25:14 PM
    Author     : haoto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <html lang="en">

        <!-- Mirrored from friendkit.cssninja.io/navbar-v2-profile-main.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 May 2024 06:39:09 GMT -->
        <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->

        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />

        <title>Friendkit | Profile</title>
        <script src="cdn-cgi/apps/head/lmplkzhV3pH6fdNUw6kpmpBQ68Q.js"></script><link rel="icon" type="image/png" href="assets/img/favicon.png" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">



        <style>
            html, body {
                height: 100%;
                margin: 0;
            }
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                background: linear-gradient(rgba(15, 23, 43, .9), rgba(15, 23, 43, .9)), url('img/bg-hero.jpg') no-repeat center center fixed;
                background-size: cover;
            }

            .form-control:focus {
                box-shadow: none;
                border-color: #BA68C8
            }

            .profile-button {
                background: rgb(99, 39, 120);
                box-shadow: none;
                border: none
            }

            .profile-button:hover {
                background: #682773
            }

            .profile-button:focus {
                background: #682773;
                box-shadow: none
            }

            .profile-button:active {
                background: #682773;
                box-shadow: none
            }

            .back:hover {
                color: #682773;
                cursor: pointer
            }

            .labels {
                font-size: 11px
            }

            .add-experience:hover {
                background: #BA68C8;
                color: #fff;
                cursor: pointer;
                border: solid 1px #BA68C8
            }
        </style>

    </head>
    <body>
        <div class="container rounded bg-white mt-5 mb-5">
            <div class="row">
                <div class="col-md-3 border-right">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px"  src="${profile.getAvatarUrl()}"><span class="font-weight-bold">${listAcc.name}</span><span class="text-black-50">${listAcc.email}</span><span> </span></div>
                </div>

                <div class="col-md-9 border-right">
                    <div class="p-3 py-5"> 
                        <form action="editprofile" method="post" onsubmit="return FormValidate();" >
                            <input type="hidden" name="avtUrl" value="${profile.getAvatarUrl()}">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Profile Settings</h4>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12"><label hidden="" class="labels">Points</label><input hidden="" name="points" type="text" class="form-control" readonly value="${profile.getPoint()}"></div>
                                <div class="col-md-12"><label hidden="" class="labels">ID</label><input hidden="" name="id" type="text" class="form-control" readonly value="${profile.getUserID()}"></div>
                                <div class="col-md-12"><label hidden="" class="labels">Username</label><input hidden="" name="user" type="text" class="form-control" readonly value="${profile.getUserName()}"></div>                          
                                <div class="col-md-12"><label class="labels">Full Name</label><input id="fname" name="name" type="text" class="form-control"  value="${profile.getFull_Name()}"> <div style="color: red" id="errorFname"> </div>
                                </div>
                                <div class="col-md-12"><label class="labels">Email</label><input id="email"  name="email" type="text" class="form-control"  value="${profile.getEmail()}"> <div style="color: red" id="errorEmail"></div> </div>
                                <div class="col-md-12"><label class="labels">Phone Number</label><input id="phoneNum" name="phone" type="text" class="form-control" value="${profile.getPhone()}"> <div style="color: red" id="errorPhone"></div>  </div>
                                <div class="col-md-12"><label hidden="" class="labels">District</label><input hidden="" id="district" name="district" type="text" class="form-control" value="${profile.getDistrict()}"> <div style="color: red" id="errorDistrict"></div> </div>                 
                                <div class="col-md-12"><label hidden="" class="labels">Commune</label><input hidden="" id="commnue" name="commune" type="text" class="form-control" value="${profile.getCommune()}"> <div style="color: red" id="errorCommune"></div> </div>                 
                                <div class="col-md-12"><label hidden="" class="labels">StreetNumber</label><input hidden="" id="snumber" name="snumber" type="text" class="form-control" value="${profile.getStreetNumber()}"> <div style="color: red" id="errorSnumber"></div> </div>             
                            </div>
                            <p>${msg}</p>
                            <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit">Save Profile</button></div>
                        </form>
                    </div>

                </div>

            </div>
        </div>

        <<script src="assets/js/checkValidateProfile.js" type="text/javascript"></script>
    </body>
</html>