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

            <label for="Title">Title:</label>
            <input type="text" id="title" name="title" required>

            <label for="Description">Description:</label>
            <textarea id="description" name="description" required placeholder="e.g 2 x bottles of shampoo, almost full">
                
            </textarea>


            <label for="quanlity">Quanlity</label>
            <select id="quanlity" name="listQuanlity" required>
                <c:forEach items="${listQuanlity}" var="quan">
                    <option value="${quan.quanlityID}">${quan.name}</option>
                </c:forEach>
            </select>
            
            <br><br><br>

            <div id="addNewSnippet" style="display: block;">
                <p>Pick-up location</p>
                <div class="input-container">
                    <label>City<span class="required">*</span></label>
                    <select  name="city" class="form-select form-select-sm mb-3" id="city" aria-label=".form-select-sm" required>
                        <option value=""  selected>Select city</option>           
                    </select> </div>
                <div class="input-container">
                    <label>District<span class="required">*</span></label>

                    <select name="district"  class="form-select form-select-sm mb-3" id="district" aria-label=".form-select-sm" required>
                        <option value="" selected>Select district</option>
                    </select>  </div>
                <div class="input-container">
                    <label>Ward<span class="required">*</span></label>
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

            
            <input type="submit" value="Submit">
        </form>

    </body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>


    <script>
        var cities = document.getElementById("city");
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
            renderCity(result.data);
            selectCityOption(result.data);
            selectDistrictOption(result.data);
            selectWardOption(result.data);
        });

        function selectCityOption(data) {
            for (let i = 0; i < cities.options.length; i++) {
                if (cities.options[i].value === selectedCityValue) {
                    cities.options[i].selected = true;
                    // Trigger change event to populate districts and wards
                    simulateEvent(cities, 'change');
                    break;
                }
            }
        }
        function selectDistrictOption(data) {
            const selectedCity = data.find((city) => city.Name === selectedCityValue);
            for (let i = 0; i < selectedCity.Districts.length; i++) {
                if (selectedCity.Districts[i].Name === '${district}') {
                    districts.options[i + 1].selected = true; // Plus 1 to account for the initial "Chọn quận huyện" option
                    simulateEvent(districts, 'change');
                    break;
                }
            }
        }

        function selectWardOption(data) {
            const selectedCity = data.find((city) => city.Name === selectedCityValue);
            const selectedDistrict = selectedCity.Districts.find((district) => district.Name === '${district}');
            for (let i = 0; i < selectedDistrict.Wards.length; i++) {
                if (selectedDistrict.Wards[i].Name === '${ward}') {
                    wards.options[i + 1].selected = true; // Plus 1 to account for the initial "Chọn phường xã" option
                    simulateEvent(wards, 'change');
                    break;
                }
            }
        }
        function renderCity(data) {
            for (const city of data) {
                cities.options[cities.options.length] = new Option(city.Name, city.Name); // Use "Name" as both value and text.
            }

            cities.onchange = function () {
                districts.length = 1;
                wards.length = 1;

                if (this.value !== "") {
                    const selectedCity = data.find((city) => city.Name === this.value);

                    for (const district of selectedCity.Districts) {
                        districts.options[districts.options.length] = new Option(district.Name, district.Name); // Use "Name" as both value and text.
                    }
                }
            };

            districts.onchange = function () {
                wards.length = 1;
                const selectedCity = data.find((city) => city.Name === cities.value);
                const selectedDistrict = selectedCity.Districts.find((district) => district.Name === this.value);

                if (this.value !== "") {
                    for (const ward of selectedDistrict.Wards) {
                        wards.options[wards.options.length] = new Option(ward.Name, ward.Name); // Use "Name" as both value and text.
                    }
                }
            };
        }

        // Function to simulate change event
        function simulateEvent(element, eventName) {
            var event = new Event(eventName);
            element.dispatchEvent(event);
        }

    </script>
</html>
