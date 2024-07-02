document.addEventListener("DOMContentLoaded", function () {
    var openModalRequest = document.querySelectorAll('.open-modal-request');
    const modalRequest = document.getElementById('sent-request-modal');
    const requestButton = document.getElementById('requestButton');
    let currentPostRequest = null;
    openModalRequest.forEach(openModalArchive => {
        openModalArchive.addEventListener('click', () => {
            const postIdRequest = openModalArchive.getAttribute('data-post-id');
            currentPostRequest = postIdRequest;
            modalRequest.setAttribute('data-post-id', postIdRequest);
            modalRequest.querySelector('input[name="idPostRequest"]').value = postIdRequest;
            modalRequest.classList.add('is-active');
        });
    });
    document.getElementById('requestButton').addEventListener('click', function () {
        if (validateFormRequest()) {
            document.getElementById('submit-request').click();
        }
    });
    const inputMessage = document.getElementById('messageRequest');
    const errorMessageRequest = document.getElementById('message-error-request');
    inputMessage.addEventListener('input', function () {
        const inputValueRequest = inputMessage.value.trim();
        if (inputValueRequest.length > 0) {
            errorMessageRequest.style.display = 'none';
        } else {
            errorMessageRequest.style.display = 'block';
        }
    });
    function validateFormRequest() {
        var messageRequestInput = document.getElementById('messageRequest').value.trim();
        if (messageRequestInput === '') {
            var titleErrorRequest = document.getElementById('message-error-request');
            titleErrorRequest.style.display = 'block';
            return false;
        }
        return true;
    }

    document.getElementById('sent-request-form').addEventListener('submit', (event) => {
        var mesageSent = document.getElementById('sent-request-form').querySelector('textarea[name="messageRequest"]').value;
        event.preventDefault();
        const xhr = new XMLHttpRequest();
        xhr.open('POST', 'requestPost', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onload = function () {
            console.log(xhr.responseText);
            if (xhr.responseText == 1) {
                document.getElementById('sent-request-form').reset();
                iziToast.show({
                    maxWidth: "280px",
                    class: "success-toast",
                    icon: "mdi mdi-check",
                    title: "",
                    message: "Request successfully",
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
                modalRequest.classList.remove('is-active');
            } else if (xhr.responseText == 2) {
                document.getElementById('sent-request-form').reset();
                iziToast.show({
                    maxWidth: "280px",
                    class: "success-toast",
                    icon: "mdi mdi-check",
                    title: "",
                    message: "You have requested, cannot request again",
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
                modalRequest.classList.remove('is-active');
            }
        };
        xhr.send('id=' + currentPostRequest + '&mesage=' + mesageSent);
    });
});