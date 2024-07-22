<%-- 
    Document   : addAdmin
    Created on : Jul 19, 2024, 2:44:09 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="addAdmin" method="post">
            Enter mail:<input type="text" name="mail"/></br>
            Enter userName:<input type="text" name="user"/></br>
            Enter password:<input type="text" name="pass"/></br>
            Enter FullName:<input type="text" name="fullname"/></br>
            Enter phone:<input type="text" name="phone"/></br>
            Enter commune:<input type="text" name="commune"/></br>
            Enter district:<input type="text" name="district"/></br>
            <input type="submit" value="save"/>
        </form>
    </body>
</html>
