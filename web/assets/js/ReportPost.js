document.addEventListener("DOMContentLoaded", function () {
    const openReportLinks = document.querySelectorAll('.flag-link');
    const modalReport = document.getElementById('report-post-modal');
    const reportPostButton = document.getElementById('reportButton');
    const reportPostForm = document.getElementById('report-post-form');
    let currentPostId = null;

    // Open modal when clicking the flag link
    openReportLinks.forEach(openReportLink => {
        openReportLink.addEventListener('click', () => {
            const postId = openReportLink.getAttribute('post-id');
            currentPostId = postId;
            document.getElementById('post_id').value = postId; // Set the value of hidden input
            modalReport.classList.add('is-active');
        });
    });

    // Submit form when clicking the Report button
    reportPostButton.addEventListener('click', (event) => {
        event.preventDefault(); // Prevent default button behavior

        if (currentPostId) {
            const formData = new FormData(reportPostForm); // Create form data from form

            const xhr = new XMLHttpRequest();
            xhr.open('POST', 'ReportPost', true);
            xhr.onload = function () {
                if (xhr.status >= 200 && xhr.status < 300) {
                    console.log(xhr.responseText);
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
                    modalReport.classList.remove('is-active');
                } else {
                    console.error('Request failed with status', xhr.status);
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
                }
            };

            xhr.onerror = function () {
                console.error('Request failed');
            };

            xhr.send(formData);
        }
    });

    // Close modal when clicking close buttons
    document.querySelectorAll('.close-modal').forEach(closeModalButton => {
        closeModalButton.addEventListener('click', () => {
            modalReport.classList.remove('is-active');
        });
    });

    // Show or hide textarea when selecting 'Other' as report reason
    const reportReasonOtherTextarea = document.getElementById('report_reason_other');
    const reportReasonRadioButtons = document.querySelectorAll('input[name="report_reason"]');

    reportReasonRadioButtons.forEach(function (radio) {
        radio.addEventListener('change', function () {
            if (radio.value === 'Other') {
                reportReasonOtherTextarea.style.display = 'block';
            } else {
                reportReasonOtherTextarea.style.display = 'none';
            }
        });
    });
});
