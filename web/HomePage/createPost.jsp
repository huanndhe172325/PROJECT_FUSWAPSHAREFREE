<%-- 
    Document   : createPost
    Created on : May 28, 2024, 12:21:58 AM
    Author     : FPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
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
        </style>
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
    <body>
        <form enctype="multipart/form-data" action="CreatePost" id="create-post" method="post" >
            <select id="type" name="typePost" required>
                <c:forEach items="${listType}" var="type">
                    <option value="${type.typeID}" selected>${type.name}</option>
                </c:forEach>
            </select>
            <label for="imgPath">Image:</label>
            <input type="file" id="imgPath" name="imgPath" accept="image/*" required>

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
            <input type="text" id="instructions" name="instructions" required placeholder="Pick up today from 4 - 6pm. Please ring doorbell when here">

            <label>Expires Date<span class="required">*</span></label>
            <select name="expiresDate" class="form-select form-select-sm" id="expiresDate" aria-label=".form-select-sm" required>
                <option value="1" >1 Day</option>
                <option value="3" selected>3 Days</option>
                <option value="7">7 Days</option>
                <option value="15">15 Days</option>
            </select>


            <input type="submit" id="submit-create-post" style="display : block;" value="Submit">
        </form>
    </body>
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
                                                    console.log(response);
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
</html>
