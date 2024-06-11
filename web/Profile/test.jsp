<%-- 
    Document   : test
    Created on : May 27, 2024, 12:24:56 AM
    Author     : haoto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
Add new Address-->
<div id="addNewSnippet" >
    
    <div class="input-container">
        <label>Tỉnh/Thành Phố    <span class="required">*</span></label>
        <select  name="city" class="form-select form-select-sm mb-3" id="city" aria-label=".form-select-sm">
            <option value=""  selected>Chọn tỉnh thành</option>           
        </select> </div>
    <div class="input-container">
        <label>Quận Huyện    <span class="required">*</span></label>

        <select name="district"  class="form-select form-select-sm mb-3" id="district" aria-label=".form-select-sm">
            <option value="" selected>Chọn quận huyện</option>
        </select>  </div>
    <div class="input-container">
        <label>Phường xã  <span class="required">*</span></label>

        <select name="ward" class="form-select form-select-sm" id="ward" aria-label=".form-select-sm">
            <option value="" selected>Chọn phường xã</option>
        </select>
    </div>
    <div class="input-container">
        <label>Người nhận    </label>
        <input name="newReceiver" id="Order_name" type="text" maxlength="255" value="${receiver}"> </div>
    <div class="input-container">
        <label>Địa chỉ    </label>
        <input name="newAddress" id="Order_name" type="text" maxlength="255" value="${address}"> </div>

    <div class="input-container">   <label>Số Điện thoại </label> 
        <input name="newPhonenumber" id="Order_phone" type="text" maxlength="255" value="${phonenumber}"> <br>

    </div>  
</div>
       

<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
<script>
    var cities = document.getElementById("city");
    var districts = document.getElementById("district");
    var wards = document.getElementById("ward");
    var selectedCityValue = '${city}'; // Replace with the actual value of the selected city

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

<!--  Change Address-->