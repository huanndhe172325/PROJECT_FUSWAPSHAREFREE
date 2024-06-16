document.addEventListener("DOMContentLoaded", function () {
    const openReportLinks = document.querySelectorAll('.flag-link');
    const modalReport = document.getElementById('report-post-modal');
    const reportPostForm = document.getElementById('report-post-form');
//    const reportButton = document.getElementById('reportButton');
    const reportReasonOther = document.getElementById('report_reason_others');
//    let currentID = null;
//
//    // Sự kiện khi click vào các liên kết "Report"
    openReportLinks.forEach(openReportLink => {
        openReportLink.addEventListener('click', (event) => {
            event.preventDefault(); // Ngăn chặn hành động mặc định của liên kết

            const postId = openReportLink.getAttribute('post-id');
            currentID = postId;

            // Cập nhật giá trị của post_id trong form
            document.getElementById('post_id_value').value = postId;

            // Đặt lựa chọn radio về Spam mặc định khi mở modal
            document.getElementById('reason_spam').checked = true;

            // Ẩn textarea nếu lý do 'Other' chưa được chọn
            reportReasonOther.style.display = 'none';

            // Hiển thị modal
            modalReport.classList.add('is-active');
        });
    });

//    reportPostForm.addEventListener('submit', function (event) {
//        event.preventDefault();
//
//        const  formReport = new FormData(reportPostForm);
//        console.log("Post ID:", formReport.get('post_id'));
//        console.log("Report Reason:", formReport.get('report_reason'));
//        console.log("Report Reason Other:", formReport.get('report_reason_other'));
//
//        var xhr = new XMLHttpRequest();
//
//        xhr.open('POST', 'ReportPost', true);
//
//        xhr.onload = function () {
//            if (xhr.status >= 200 && xhr.status < 300) {
//                modalReport.classList.remove('is-active');
//                iziToast.show({
//                    maxWidth: "280px",
//                    class: "success-toast",
//                    icon: "mdi mdi-error",
//                    title: "",
//                    message: "Edit profile successfully",
//                    titleColor: "#fff",
//                    messageColor: "#fff",
//                    iconColor: "#fff",
//                    backgroundColor: "#60c032",
//                    progressBarColor: "#0062ff",
//                    position: "bottomRight",
//                    transitionIn: "fadeInUp",
//                    close: false,
//                    timeout: 1800,
//                    zindex: 99999
//                });
//            } else {
//                modalReport.classList.remove('is-active');
//                console.log('Success', xhr.responseText);
//                iziToast.show({
//                    maxWidth: "280px",
//                    class: "success-toast",
//                    icon: "mdi mdi-error",
//                    title: "",
//                    message: "Edit profile failed",
//                    titleColor: "#fff",
//                    messageColor: "#fff",
//                    iconColor: "#fff",
//                    backgroundColor: "#FF0000",
//                    progressBarColor: "#0062ff",
//                    position: "bottomRight",
//                    transitionIn: "fadeInUp",
//                    close: false,
//                    timeout: 1800,
//                    zindex: 99999
//                });
//            }
//        };
//
//        xhr.onerror = function () {
//            console.error('Request failed');
//        };
//
//        xhr.send(formReport);
//
//    });
//    // Hiển thị textarea khi chọn 'Other'
    reportPostForm.querySelectorAll('input[name="report_reason"]').forEach(radio => {
        radio.addEventListener('change', (event) => {
            if (event.target.value === 'Other') {
                reportReasonOther.style.display = 'block';
            } else {
                reportReasonOther.style.display = 'none';
            }
        });
    });

    document.querySelector('.close-modal-report').addEventListener('click', () => {
        modalReport.classList.remove('is-active');
    });
});

