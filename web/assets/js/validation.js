/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function checkEmail() {
    var email = document.getElementById('email').value.trim();
    var errorEmail = document.getElementById('email-error');
    var emailFormat = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (email === '' || email === null) {
        errorEmail.innerHTML = "Email is required.";
        document.getElementById('email').style.borderColor = "red";
    } else if (!email.match(emailFormat)) {
        errorEmail.innerHTML = "Invalid email format.";
        document.getElementById('email').style.borderColor = "red";
    } else {
        errorEmail.innerHTML = '';
        document.getElementById('email').style.borderColor = "#00FF00";
    }
}
function checkUserName() {
    var username = document.getElementById('username').value.trim();
    var errorUserName = document.getElementById('username-error');
    if (username === '' || username === null) {
        errorUserName.innerHTML = "User name is a required field.";
        document.getElementById('username').style.borderColor = "red";
    } else {
        errorUserName.innerHTML = '';
        document.getElementById('username').style.borderColor = "#00FF00";
    }
}
function checkPassword() {
    var password = document.getElementById('password').value;
    var repeatPassword = document.getElementById('repeatpassword').value;
    var passwordError = document.getElementById('password-error');
    var repeatPasswordError = document.getElementById('repeatpassword-error');

    var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

    if (password.trim() === '') {
        passwordError.innerHTML = "Password is required.";
        document.getElementById('password').style.borderColor = "red";
        isValid = false;
    } else if (!regex.test(password)) {
        passwordError.innerHTML = "Password must contain at least one lowercase letter, one uppercase letter, one digit, one special character, and be 8 characters or longer.";
        document.getElementById('password').style.borderColor = "red";
        isValid = false;
    } else {
        passwordError.innerHTML = "";
        document.getElementById('password').style.borderColor = "#00FF00";
    }

    if (repeatPassword.trim() === '') {
        repeatPasswordError.innerHTML = "Password is required.";
        document.getElementById('repeatpassword').style.borderColor = "red";
        isValid = false;
    } else if (password !== repeatPassword) {
        repeatPasswordError.innerHTML = "Passwords do not match.";
        document.getElementById('repeatpassword').style.borderColor = "red";
        isValid = false;
    } else {
        repeatPasswordError.innerHTML = "";
        document.getElementById('repeatpassword').style.borderColor = "#00FF00";
    }
}

function checkPhoneNumber() {
    var phoneNumber = document.getElementById('phone').value;
    var phoneError = document.getElementById('phone-error');
    if (phoneNumber.trim() === '') {
        phoneError.innerHTML = "Phone number is required.";
        document.getElementById('phone').style.borderColor = "red";
        isValid = false;
    } else if (!/^\d{10}$/.test(phoneNumber)) {
        phoneError.innerHTML = "Please enter a valid phone number.";
        document.getElementById('phone').style.borderColor = "red";
        isValid = false;
    } else {
        phoneError.innerHTML = "";
        document.getElementById('phone').style.borderColor = "#00FF00";
    }
}







