document.addEventListener('DOMContentLoaded', function () {
    // Function to initialize the event listeners
    function initializeReportButtons() {
        document.querySelectorAll('.chat-pop').forEach(function (flagLink1) {
            flagLink1.addEventListener('click', function (e) {
                e.preventDefault();
                var userId = this.getAttribute('report_user_target_id');
                document.getElementById('report_user_target_id_f').value = userId;
                document.getElementById('report-user-modal-container').classList.add('is-active');
            });
        });
    }

    // Initialize the event listeners for the first load
    initializeReportButtons();

    // Event listeners for other elements remain unchanged
    document.querySelectorAll('input[name="report_user_reason"]').forEach(function (radio) {
        radio.addEventListener('change', function () {
            if (document.getElementById('report_user_reason_other').checked) {
                document.getElementById('report_user_message').style.display = 'block';
            } else {
                document.getElementById('report_user_message').style.display = 'none';
            }
        });
    });

    document.getElementById('submit-report-user-button').addEventListener('click', function () {
        document.getElementById('submit-report-user-form').click();
    });

    document.querySelectorAll('.cancel-report-user-button, .close-report-user-modal').forEach(function (closeButton) {
        closeButton.addEventListener('click', function () {
            document.getElementById('report-user-modal-container').classList.remove('is-active');
        });
    });

    document.getElementById('report-user-form-content').addEventListener('submit', function (event) {
        event.preventDefault();

        var userId = document.getElementById('report_user_target_id_f').value;
        var reportReason = document.querySelector('input[name="report_user_reason"]:checked').value;
        var reportReasonOther = document.getElementById('report_user_message').value;

        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/FUSWAPSHAREFREE/ReportUserServlet', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    iziToast.show({
                        maxWidth: "280px",
                        class: "success-toast",
                        icon: "mdi mdi-check",
                        title: "",
                        message: "Report user successfully",
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
                    document.getElementById('report-user-modal-container').classList.remove('is-active');
                    document.getElementById('report-user-form-content').reset();
                    document.getElementById('report_user_message').style.display = 'none';
                } else {
                    iziToast.show({
                        maxWidth: "280px",
                        class: "error-toast",
                        icon: "mdi mdi-close",
                        title: "",
                        message: "Failed to report user",
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
                    document.getElementById('report-user-modal-container').classList.remove('is-active');
                    document.getElementById('report-user-form-content').reset();
                    document.getElementById('report_user_message').style.display = 'none';
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

        var params = 'user_id=' + encodeURIComponent(userId) +
            '&report_reason=' + encodeURIComponent(reportReason) +
            '&report_reason_other=' + encodeURIComponent(reportReasonOther);
        xhr.send(params);
    });
});


