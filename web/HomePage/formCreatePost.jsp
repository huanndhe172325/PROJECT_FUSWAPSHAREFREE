<%-- 
    Document   : formCreatePost
    Created on : May 22, 2024, 12:25:07 AM
    Author     : FPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
            <form action="/submit-post" method="post" enctype="multipart/form-data">
                <label for="title">Title:</label><br>
                <input type="text" id="title" name="title" required><br><br>

                <label for="description">Description:</label><br>
                <textarea id="description" name="description" rows="4" cols="50" required></textarea><br><br>

                <label for="instruction">Instruction:</label><br>
                <textarea id="instruction" name="instruction" rows="4" cols="50" required></textarea><br><br>

                <label for="expireDate">Expire Date:</label><br>
                <input type="date" id="expireDate" name="expireDate" required><br><br>

                <label for="img">Upload Image:</label><br>
                <input type="file" id="img" name="img" accept="image/*" required><br><br>

                <input type="submit" value="Submit">
            </form>
        </h1>
    </body>
</html>
