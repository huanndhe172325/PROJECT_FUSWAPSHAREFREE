function ajaxSwapPost() {
    var swapPostForm = document.getElementById('sent-swap-form');
    swapPostForm.addEventListener('submit', function (event) {
        event.preventDefault();
        var formDataForSwapPost = new FormData(swapPostForm);
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'requestSwap', true);
        xhr.onload = function () {
            console.log('Response:', xhr.responseText);
            if (xhr.responseText === "successfull") {
                document.getElementById('sent-swap-modal').classList.remove('is-active');
                swapPostForm.reset();
                iziToast.show({
                    maxWidth: "280px",
                    class: "success-toast",
                    icon: "mdi mdi-check",
                    title: "",
                    message: "Request swap successfully",
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
            }
        };
        xhr.onerror = function () {
            console.error('Request failed');
        };
        xhr.send(formDataForSwapPost);
    });
}

document.addEventListener("DOMContentLoaded", function () {
    ajaxSwapPost();
});

document.addEventListener("DOMContentLoaded", function () {
    const openModalResponseSwap = document.querySelectorAll('.open-response-swap-model');
    const modalResponseSwap = document.getElementById('response-swap-modal');
    openModalResponseSwap.forEach(openModalArchive => {
        openModalArchive.addEventListener('click', () => {
            modalResponseSwap.classList.add('is-active');
        });
    });
});