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
         <form action="CreatePost" method="post" enctype="multipart/form-data">
            <select id="type" name="listType" required>
                <c:forEach items="${listType}" var="type">
                    <option value="${type.typeID}">${type.name}</option>
                </c:forEach>
            </select>
            <label for="imgPath">Image:</label>
            <input type="file" id="imgPath" name="imgPath" accept="image/*" multiple required>

            <label for="Title">Title</label>
            <input type="text" id="title" name="title" required>

            <label for="Description">Description:</label>
            <input type="text" id="description" name="description" required>

            <label for="quanlity">Quanlity</label>
            <select id="quanlity" name="listQuanlity" required>
                <c:forEach items="${listQuanlity}" var="quan">
                    <option value="${quan.quanlityID}">${quan.name}</option>
                </c:forEach>
            </select>

            <label for="instructions">Pick-up instructions</label>
            <input type="text" id="instructions" name="instructions" required>

            
            <div id="addNewSnippet" style="display: block;">
                <p>Pick-up location</p><br>
                <div class="input-container">
                    <label>District<span class="required">*</span></label>
                    <select name="district"  class="form-select form-select-sm mb-3" id="district" aria-label=".form-select-sm">
                        <option value="" selected>Select district</option>
                    </select>
                </div>
                <div class="input-container">
                    <label>Commune  <span class="required">*</span></label>
                    <select name="ward" class="form-select form-select-sm" id="ward" aria-label=".form-select-sm">
                        <option value="" selected>Select commune</option>
                    </select>
                </div>
                <div class="input-container">
                    <label>StreetNumber</label>
                    <input name="newAddress" id="Order_name" type="text" maxlength="255" value="${address}">
                </div>
            </div>

            <input type="submit" value="Submit">
        </form>
                
    </body>
    <script>
        var cities = document.getElementById("city");
        var districts = document.getElementById("district");
        var wards = document.getElementById("ward");

        var Parameter = {
            url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
            method: "GET",
            responseType: "application/json",
        };

        axios(Parameter).then(function (result) {
            renderDistricts(result.data);
        });

        function renderDistricts(data) {
            const hanoi = data.find(city => city.Name === "Thành phố Hà Nội");
            if (hanoi) {
                for (const district of hanoi.Districts) {
                    districts.options[districts.options.length] = new Option(district.Name, district.Name);
                }
                
                districts.onchange = function () {
                    wards.length = 1; // Clear previous ward options
                    const selectedDistrict = hanoi.Districts.find(district => district.Name === this.value);
                    
                    if (selectedDistrict) {
                        for (const ward of selectedDistrict.Wards) {
                            wards.options[wards.options.length] = new Option(ward.Name, ward.Name);
                        }
                    }
                };
            }
        }
    </script>
</html>
