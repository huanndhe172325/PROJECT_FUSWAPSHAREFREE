/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function FormValidate() {
    let checkemail = false;
    let checkfname = false;
    let checkphone = false;
    let checkdistrict = false;
    let checkcommune = false;
    let checksnumber = false;

    var email = document.getElementById('email').value.trim();
    var fname = document.getElementById('fname').value.trim();
    var district = document.getElementById('district').value.trim();
    var phone = document.getElementById('phoneNum').value.trim();
    var commune = document.getElementById('commnue').value.trim();
    var snumber = document.getElementById('snumber').value.trim();

    var eEmail = document.getElementById('errorEmail');
    var ePhone = document.getElementById('errorPhone');
    var eFullname = document.getElementById('errorFname');
    var eDistrict = document.getElementById('errorDistrict');
    var eCommune = document.getElementById('errorCommune');
    var eSnumber = document.getElementById('errorSnumber');

    var reGexPass = /^(?=.[0-9])(?=.[A-Z])(?=.*[a-z])[a-zA-Z0-9]{6,16}$/;
    var reGexPhone = /(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\b/;
    var reGexEmail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    



    //check phone
    if (phone === null || phone === '') {
        ePhone.innerHTML = 'Please Input Your Phone!';
    } else if (!reGexPhone.test(phone)) {
        ePhone.innerHTML = 'Phone number is worng format!';
    } else {
        checkphone = true;
        ePhone.innerHTML = '';
    }

    //check email
    if (email === null || email === '') {
        eEmail.innerHTML = 'Please Input your Email!';
    } else if (!reGexEmail.test(email)) {
        eEmail.innerHTML = 'Email is wrong format!';
    } else {
        eEmail.innerHTML = '';
        checkemail = true;

    }



    //check full name
    if (fname === null || fname === '') {
        eFullname.innerHTML = "Please Input Your Full Name!";
    } else {
        checkfname = true;
        eFullname.innerHTML = '';
    }



    //check district name
    if (district === null || district === '') {
        eDistrict.innerHTML = "Please Select Your District!";
    } else {
        checkdistrict = true;
        eDistrict.innerHTML = '';
    }

    //check commune name
    if (commune === null || commune === '') {
        eCommune.innerHTML = "Please Select Your Commune!";
    } else {
        checkcommune = true;
        eCommune.innerHTML = '';
    }


    //check snumber name
    if (snumber === null || snumber === '') {
        eSnumber.innerHTML = "Please Input Your Street Number!";
    } else {
        checksnumber = true;
        eSnumber.innerHTML = '';
    }



    if (checkemail && checkfname && checkphone && checkdistrict && checkcommune && checksnumber) {
        return true;
    } else {
        return false;
    }
}
