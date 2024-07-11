document.addEventListener('DOMContentLoaded', function () {
    // Function to initialize the event listeners
    function initializeReportButtons() {
        document.querySelectorAll('.chat-pop').forEach(function (flagLink1) {
            flagLink1.addEventListener('click', function (e) {
                e.preventDefault();
                var emailId = this.getAttribute('update-email-otp');
                document.getElementById('edit-email-modal').classList.add('is-active');
            });
        });
    }

    // Email validation function
    function validateEmail() {
        var email = document.getElementById('update-email-otp').value.trim();
        var errorEmail = document.getElementById('errorEmail');
        var reGexEmail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        if (email === "") {
            errorEmail.textContent = "Email is required";
            return false;
        } else if (!reGexEmail.test(email)) {
            errorEmail.textContent = "Please enter a valid email address";
            return false;
        } else {
            errorEmail.textContent = "";
            return true;
        }
    }

    // Initialize the event listeners for the first load
    initializeReportButtons();

    document.getElementById('submit-edit-email-button').addEventListener('click', function () {
        if (validateEmail()) {
            document.getElementById('submit-edit-email-form').click();
        }
    });

    document.querySelectorAll('.cancel-report-user-button, .close-report-user-modal').forEach(function (closeButton) {
        closeButton.addEventListener('click', function () {
            document.getElementById('edit-email-modal').classList.remove('is-active');
        });
    });

    document.getElementById('edit-email-form').addEventListener('submit', function (event) {
        event.preventDefault();
        if (!validateEmail()) {
            return;
        }
        var emailId = document.getElementById('update-email-otp').value;
        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/FUSWAPSHAREFREE/UpdateEmailServlet', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        console.log(emailId);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    iziToast.show({
                        maxWidth: "280px",
                        class: "success-toast",
                        icon: "mdi mdi-check",
                        title: "",
                        message: "Update email successfully",
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
                    document.getElementById('edit-email-modal').classList.remove('is-active');
                    document.getElementById('edit-email-form').reset();
                } else {
                    iziToast.show({
                        maxWidth: "280px",
                        class: "error-toast",
                        icon: "mdi mdi-close",
                        title: "",
                        message: "Failed to update email",
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
                    document.getElementById('edit-email-modal').classList.remove('is-active');
                    document.getElementById('edit-email-form').reset();
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
        var params = 'emailId=' + encodeURIComponent(emailId);
        xhr.send(params);
    });

    // Add event listener for real-time validation
    document.getElementById('update-email-otp').addEventListener('input', validateEmail);
});