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
        errorEmail.classList.add("error");
        return false;
    } else if (!email.match(emailFormat)) {
        errorEmail.innerHTML = "Invalid email format.";
        errorEmail.classList.add("error");
        return false;
    } else {
        errorEmail.innerHTML = '';
        errorEmail.classList.remove("error");
        return true;
    }
}
function checkUserName() {
    var username = document.getElementById('username').value.trim();
    var errorUserName = document.getElementById('username-error');
    if (username === '' || username === null) {
        errorUserName.innerHTML = "User name is a required field.";
        return false;
    } else {
        errorUserName.innerHTML = '';
        return true;
    }
}
function checkPassword() {
    var password = document.getElementById('password').value;
    var passwordError = document.getElementById('password-error');

    var regexLength = /^.{8,32}$/;
    var regexUpper = /^(?=.*[A-Z])/;
    var regexSpecial = /^(?=.*[@$!%*?&])/;

    if (password.trim() === '') {
        passwordError.innerHTML = "Password is required.";
        return false;
    } else if (!regexLength.test(password)) {
        passwordError.innerHTML = "Password must be between 8 and 32 characters.";
        return false;
    } else if (!regexUpper.test(password)) {
        passwordError.innerHTML = "Password must contain at least one uppercase letter.";
        return false;
    } else if (!regexSpecial.test(password)) {
        passwordError.innerHTML = "Password must contain at least one special character.";
        return false;
    } else {
        passwordError.innerHTML = "";
        return true;
    }
}

function checkRepeatPassword() {
    var password = document.getElementById('password').value;
    var repeatPassword = document.getElementById('repeatpassword').value;
    var repeatPasswordError = document.getElementById('repeatpassword-error');

    if (repeatPassword.trim() === '') {
        repeatPasswordError.innerHTML = "Repeat password is required.";
        return false;
    } else if (repeatPassword !== password) {
        repeatPasswordError.innerHTML = "Passwords do not match.";
        return false;
    } else {
        repeatPasswordError.innerHTML = "";
        return true;
    }
}
function validateForm() {
    var emailValid = checkEmail();
    var usernameValid = checkUserName();
    var passwordValid = checkPassword();
    var repeatPasswordValid = checkRepeatPassword();


    if (emailValid && usernameValid && passwordValid && repeatPasswordValid) {
        return true;
    } else {
        return false;
    }
}












