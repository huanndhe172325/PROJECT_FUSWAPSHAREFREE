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
        <title>JSP Page</title>
        <style>
            body {
                background: linear-gradient(rgba(15, 23, 43, .9), rgba(15, 23, 43, .9)), url(img/bg-hero.jpg);
                background-position: center center;
                background-repeat: no-repeat;
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
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="${profile.getAvatarUrl()}"><span class="font-weight-bold">${listAcc.name}</span><span class="text-black-50">${listAcc.email}</span><span> </span></div>
                </div>

                <div class="col-md-9 border-right">
                    <div class="p-3 py-5"> 
                        <form action="editprofile" method="post">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Profile Settings</h4>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12"><label class="labels">Points</label><input name="points" type="text" class="form-control" readonly value="${profile.getPoint()}"></div>
                                <div class="col-md-12"><label class="labels">ID</label><input name="id" type="text" class="form-control" readonly value="${profile.getUserID()}"></div>
                                <div class="col-md-12"><label class="labels">Username</label><input name="user" type="text" class="form-control" readonly value="${profile.getUserName()}"></div>                          
                                <div class="col-md-12"><label class="labels">Name</label><input name="name" type="text" class="form-control"  value="${profile.getFull_Name()}"></div>
                                <div class="col-md-12"><label class="labels">Email</label><input  name="email" type="text" class="form-control"  value="${profile.getEmail()}"></div>
                                <div class="col-md-12"><label class="labels">Phone Number</label><input name="phone" type="text" class="form-control" value="${profile.getPhone()}"></div>
                                <div class="col-md-12"><label class="labels">District</label><input name="district" type="text" class="form-control" value="${profile.getDistrict()}"></div>                 
                                <div class="col-md-12"><label class="labels">Commune</label><input name="commune" type="text" class="form-control" value="${profile.getCommune()}"></div>                 
                                <div class="col-md-12"><label class="labels">StreetNumber</label><input name="snumber" type="text" class="form-control" value="${profile.getStreetNumber()}"></div>                 
                            </div>
                            <p>${msg}</p>
                            <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit">Save Profile</button></div>
                        </form>
                    </div>

                </div>

            </div>
        </div>


    </body>
</html>