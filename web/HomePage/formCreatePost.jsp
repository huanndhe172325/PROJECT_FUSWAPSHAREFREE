<%-- 
    Document   : formCreatePost
    Created on : May 22, 2024, 12:25:07 AM
    Author     : FPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    </head>
    <body>
        <form action="addMovies" method="post" enctype="multipart/form-data">
            <label for="imgPath">Image:</label>
            <input type="file" id="imgPath" name="imgPath" accept="image/*" required>
            
            <label for="Title">Title</label>
            <input type="text" id="title" name="title" required>

            <label for="Description">Description:</label>
            <input type="text" id="description" name="description" required>

            <label for="quanlity">Quanlity</label>
            <select id="quanlity" name="listQuanlity" required>
                <c:forEach items="${listQuanlity}" var="quan">
                    <option value="">${quan.name}</option>
                </c:forEach>
            </select>

            <label for="instructions">Pick-up instructions</label>
            <input type="text" id="instructions" name="instructions" required>


            <input type="submit" value="Add Film">
        </form>
    </body>
</html>
