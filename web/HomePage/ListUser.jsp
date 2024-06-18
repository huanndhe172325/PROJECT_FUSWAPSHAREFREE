<%-- 
    Document   : ListUser
    Created on : Mar 1, 2024, 5:39:19 PM
    Author     : maingocdat
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
        <style>
            .nav-link {
                color: white
            }
            .nav-link:hover {
                background-color: #ccc;
                color: #17a2b8
            }
        </style>
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("are you sure to delete id = " + id)) {
                    window.location = "DeleteUser?id=" + id;
                }
            }
        </script>
    </head>
    <body>
        <form action="ListUser" method="GET">
            <input type="text" placeholder="Search..." name="search">
            <button type="submit">Search</button>
        </form>
        <div class="d-flex">
            <div>
                <%@include file="SideBarAdmin.jsp" %>
            </div>
            <div class="container" style="margin-top: -20px">
                <div>
                    <div class="container">
                        <a href="AddUser" class="btn  p-2" style="background: #58abff; color: white; margin-bottom: 45px;margin-top: 30px "  >Add New User</a>
                    </div>
                </div>
                <div class="container" style="margin-top: -30px">
                    <a href="list-user" style="text-decoration: none; color: #58abff"><h2 style="color: white">List User</h2></a>
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr>
                                <th></th>
                                <th>ID</th>
                                <th>UserName</th>

                                <th>Email</th>
                                <th>Phone</th>
                                <th>Full_Name</th>
                                <th>District</th>
                                <th>Point</th> 
                                <th>Status_ID</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${users}" var="c">
                                <tr>
                                    <th>
                                    <td>${c.userID}</td>
                                    <td>${c.userName}</td>
                                    <td>${c.email}</td>
                                    <td>${c.phone}</td>
                                    <td>${c.full_Name}</td>
                                    <td>${c.commune}-${c.district}</td>
                                    <td>${c.point}</td>
                                    <td>${c.statusID}</td>
                                    </th>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>

            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>
