function FormValidate() {
    var isValid = true;

    // Validate Full Name
    var fname = document.getElementById('fname').value.trim();
    var errorFname = document.getElementById('errorFname');
    if (fname === "") {
        errorFname.textContent = "Full Name is required";
        isValid = false;
    } else {
        errorFname.textContent = "";
    }

    // Validate Email
    var email = document.getElementById('email').value.trim();
    var errorEmail = document.getElementById('errorEmail');
    var reGexEmail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (email === "") {
        errorEmail.textContent = "Email is required";
        isValid = false;
    } else if (!reGexEmail.test(email)) {
        errorEmail.textContent = "Please enter a valid email address";
        isValid = false;
    } else {
        errorEmail.textContent = "";
    }

    // Validate Phone Number
    var phoneNum = document.getElementById('phoneNum').value.trim();
    var errorPhone = document.getElementById('errorPhone');
    var reGexPhone = /(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\b/;
    if (phoneNum === "") {
        errorPhone.textContent = "Phone Number is required";
        isValid = false;
    } else if (!reGexPhone.test(phoneNum)) {
        errorPhone.textContent = "Please enter a valid phone number";
        isValid = false;
    } else {
        errorPhone.textContent = "";
    }

    return isValid;
}
