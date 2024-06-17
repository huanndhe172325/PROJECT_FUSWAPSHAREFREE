document.addEventListener('DOMContentLoaded', function () {
    // Hiển thị modal khi người dùng bấm vào flag-link và gán giá trị post_id
    document.querySelectorAll('.flag-link').forEach(function (flagLink) {
        flagLink.addEventListener('click', function (e) {
            e.preventDefault();
            var postId = this.getAttribute('post-id');
            document.getElementById('post_id_value').value = postId;
            document.getElementById('report-post-modal').classList.add('is-active');
        });
    });

    // Hiển thị textarea khi chọn lý do khác
    document.querySelectorAll('input[name="report_reason"]').forEach(function (radio) {
        radio.addEventListener('change', function () {
            if (document.getElementById('reason_other').checked) {
                document.getElementById('report_reason_others').style.display = 'block';
            } else {
                document.getElementById('report_reason_others').style.display = 'none';
            }
        });
    });

    // Xử lý khi nhấn nút "Report"
    document.getElementById('reportButton').addEventListener('click', function () {
        document.getElementById('submit-report-form').click();
    });

    // Xử lý khi nhấn nút "Cancel"
    document.querySelectorAll('.close-modal, .close-modal-report').forEach(function (closeButton) {
        closeButton.addEventListener('click', function () {
            document.getElementById('report-post-modal').classList.remove('is-active');
        });
    });

    // Xử lý form khi gửi đi
    document.getElementById('report-post-form').addEventListener('submit', function (event) {
        event.preventDefault(); // Ngăn chặn form gửi mặc định

        // Lấy giá trị các trường trong form
        var postId = document.getElementById('post_id_value').value;
        var reportReason = document.querySelector('input[name="report_reason"]:checked').value;
        var reportReasonOther = document.getElementById('report_reason_others').value;

        // Gửi dữ liệu qua AJAX
        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/FUSWAPSHAREFREE/reportpostbyuser', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    iziToast.show({
                        maxWidth: "280px",
                        class: "success-toast",
                        icon: "mdi mdi-check",
                        title: "",
                        message: "Report post successfully",
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
                    var postElement = document.querySelector(`.post[data-post-id="${postId}"]`);
                    if (postElement) {
                        postElement.style.display = 'none';
                    }
                    document.getElementById('report-post-modal').classList.remove('is-active');
                    // Reset form
                    document.getElementById('report-post-form').reset();
                    // Hide the additional details textarea
                    document.getElementById('report_reason_others').style.display = 'none';
                } else {
                    iziToast.show({
                        maxWidth: "280px",
                        class: "error-toast",
                        icon: "mdi mdi-close",
                        title: "",
                        message: "Failed to report post",
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
                    document.getElementById('report-post-modal').classList.remove('is-active');
                    // Reset form
                    document.getElementById('report-post-form').reset();
                    // Hide the additional details textarea
                    document.getElementById('report_reason_others').style.display = 'none';
                }
            }
        };

        xhr.onerror = function () {
            console.error('Request failed');
            iziToast.error({
                title: 'Error',
                message: 'Failed to send request',
                position: 'bottomRight'
            });
        };

        var params = 'post_id=' + encodeURIComponent(postId) +
                '&report_reason=' + encodeURIComponent(reportReason) +
                '&report_reason_other=' + encodeURIComponent(reportReasonOther);
        xhr.send(params);
    });
});
