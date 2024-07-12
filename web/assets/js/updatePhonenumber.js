document.addEventListener('DOMContentLoaded', function () {
    // Function to initialize the event listeners
    function initializePhoneButton() {
        document.querySelectorAll('.chat-pop-phone').forEach(function (flagLink) {
            flagLink.addEventListener('click', function (e) {
                e.preventDefault();
                var phoneNum = this.getAttribute('update-phone-otp');
                document.getElementById('edit-phone-modal').classList.add('is-active');
            });
        });
    }

    // Phone number validation function
    function validatePhoneNumber() {
        var phoneNum = document.getElementById('update-phone-otp').value.trim();
        var errorPhone = document.getElementById('errorPhone');
        var reGexPhone = /(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\b/;
        if (phoneNum === "") {
            errorPhone.textContent = "Phone Number is required";
            return false;
        } else if (!reGexPhone.test(phoneNum)) {
            errorPhone.textContent = "Please enter a valid phone number";
            return false;
        } else {
            errorPhone.textContent = "";
            return true;
        }
    }

    // Initialize the event listener for the phone button
    initializePhoneButton();

    document.getElementById('submit-edit-phone-button').addEventListener('click', function () {
        if (validatePhoneNumber()) {
            document.getElementById('submit-edit-phone-form').click();
        }
    });

    document.querySelectorAll('.cancel-report-user-button, .close-report-user-modal').forEach(function (closeButton) {
        closeButton.addEventListener('click', function () {
            document.getElementById('edit-phone-modal').classList.remove('is-active');
        });
    });

    document.getElementById('edit-phone-form').addEventListener('submit', function (event) {
        event.preventDefault();
        if (!validatePhoneNumber()) {
            return;
        }
        var phoneNum = document.getElementById('update-phone-otp').value;
        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/FUSWAPSHAREFREE/UpdatePhonenumberServlet', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        console.log(phoneNum);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    iziToast.show({
                        maxWidth: "280px",
                        class: "success-toast",
                        icon: "mdi mdi-check",
                        title: "",
                        message: "Update phone number successfully",
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
                    document.getElementById('edit-phone-modal').classList.remove('is-active');
                    document.getElementById('edit-phone-form').reset();
                } else {
                    iziToast.show({
                        maxWidth: "280px",
                        class: "error-toast",
                        icon: "mdi mdi-close",
                        title: "",
                        message: "Failed to update phone number",
                        titleColor: "#fff",
                        messageColor: "#fff",
                        iconColor: "#fff",
                        backgroundColor: "#FF0000",
                        progressBarColor: "#0062ff",
                        position: "bottomRight",
                        transitionIn: "fadeInUp",
                        close: false,
                        timeout: 1800,
                        zindex: 99999
                    });
                    document.getElementById('edit-phone-modal').classList.remove('is-active');
                    document.getElementById('edit-phone-form').reset();
                }
            }
        };
        xhr.onerror = function () {
            iziToast.error({
                title: 'Error',
                message: 'Failed to send request',
                position: 'bottomRight'
            });
        };
        var params = 'phoneNum=' + encodeURIComponent(phoneNum);
        xhr.send(params);
    });

    // Add event listener for real-time validation
    document.getElementById('update-phone-otp').addEventListener('input', validatePhoneNumber);
});