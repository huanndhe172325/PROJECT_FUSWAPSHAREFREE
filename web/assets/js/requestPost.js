document.addEventListener("DOMContentLoaded", function () {
            const openModalRequest = document.querySelectorAll('.open-modal-request');
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

            document.getElementById('sent-request-form').addEventListener('submit', (event) => {
                var mesageSent = document.getElementById('sent-request-form').querySelector('textarea[name="messageRequest"]').value;
                event.preventDefault();
                const xhr = new XMLHttpRequest();
                xhr.open('POST', 'requestPost', true);
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                xhr.onload = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        document.getElementById('sent-request-form').reset();
                        console.log(xhr.responseText);
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
                    }
                };
                xhr.send('id=' + currentPostRequest + '&mesage=' + mesageSent);
            });
        });