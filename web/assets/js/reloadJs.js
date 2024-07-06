function initializeEditPostModal() {
    const openModalEditPost = document.querySelectorAll('.open-modal-edit');
    const modalEditPost = document.getElementById('edit-post-modal');
    const saveEditPostButton = document.getElementById('saveEditButton');

    openModalEditPost.forEach(openModalEdit => {
        openModalEdit.addEventListener('click', () => {
            modalEditPost.setAttribute('data-post-id', openModalEdit.getAttribute('data-post-id'));
            modalEditPost.querySelector('input[name="postIdEdit"]').value = openModalEdit.getAttribute('data-post-id');
            modalEditPost.querySelector('input[name="titleEdit"]').value = openModalEdit.getAttribute('data-post-title');
            const selectQuanlity = modalEditPost.querySelectorAll('input[name="qualityEdit"]');
            selectQuanlity.forEach(option => {
                if (option.value === openModalEdit.getAttribute('data-post-quanlity')) {
                    option.checked = true;
                } else {
                    option.checked = false;
                }
            });
            modalEditPost.querySelector('textarea[name="descriptionEdit"]').value = openModalEdit.getAttribute('data-post-desc');
            const selectDistrict = modalEditPost.querySelector('select[name="districtEdit"]');
            const optionDistrict = selectDistrict.querySelectorAll('option');

            optionDistrict.forEach(option => {
                if (option.value === openModalEdit.getAttribute('data-post-district')) {
                    option.selected = true;
                } else {
                    option.selected = false;
                }
            });
            console.log(openModalEdit.getAttribute('data-post-district'));
            const selectWard = modalEditPost.querySelector('select[name="wardEdit"]');
            const optionWard = selectWard.querySelectorAll('option');
            optionWard.forEach(option => {
                if (option.value === openModalEdit.getAttribute('data-post-commune')) {
                    option.selected = true;
                } else {
                    option.selected = false;
                }
            });
            modalEditPost.querySelector('input[name="newAddressEdit"]').value = openModalEdit.getAttribute('data-post-street_Number');
            modalEditPost.querySelector('input[name="instructionsEdit"]').value = openModalEdit.getAttribute('data-post-intr');
            var allImg = openModalEdit.getAttribute('data-all-img');
            const {styleImgPostDiv, imageBtnDiv} = createImageContainer(allImg);
            var modalBody = modalEditPost.querySelector('.post-image.preview-img');
            modalBody.innerHTML = '';
            modalBody.appendChild(styleImgPostDiv);
            modalBody.appendChild(imageBtnDiv);
            initializeSliders();
            modalEditPost.classList.add('is-active');
        });
    });
}

function applyColorStyles() {
    const statusElements = document.querySelectorAll('.status-post-name');
    const typeElements = document.querySelectorAll('.type-post-name');

    statusElements.forEach(function (element) {
        const statusName = element.textContent.trim().toLowerCase();

        if (statusName === 'available') {
            element.style.color = '#36a955';
        } else {
            element.style.color = 'red';
        }
    });

    typeElements.forEach(function (element) {
        const typeName = element.textContent.trim().toLowerCase();

        if (typeName === 'free') {
            element.style.color = '#6ba4e9';
        } else {
            element.style.color = 'red';
        }
    });
}

function initOpenModalArcive() {
    const openModalArchives = document.querySelectorAll('.open-modal-archive');
    const modalArchive = document.getElementById('archive-post');
    const archivePostButton = document.getElementById('archivePostButton');
    let currentPostId = null;

    openModalArchives.forEach(openModalArchive => {
        openModalArchive.addEventListener('click', () => {
            const postId = openModalArchive.getAttribute('data-post-id');
            currentPostId = postId;
            modalArchive.setAttribute('data-post-id', postId);
            modalArchive.classList.add('is-active');
        });
    });

    archivePostButton.addEventListener('click', () => {
        if (currentPostId) {
            const xhr = new XMLHttpRequest();
            xhr.open('POST', 'PostArchive', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    console.log(xhr.responseText);
                    iziToast.show({
                        maxWidth: "280px",
                        class: "success-toast",
                        icon: "mdi mdi-check",
                        title: "",
                        message: "Archive post successfully",
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
                    modalArchive.classList.remove('is-active');
                    document.querySelector('.card.is-post[data-post-id="' + currentPostId + '"]').remove();
                }
            };
            xhr.send('id=' + currentPostId);
        }
    });
}

function initReuqest() {
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
}

function initModalEdit() {
    const openModalEditPost = document.querySelectorAll('.open-modal-edit');
    const modalEditPost = document.getElementById('edit-post-modal');
    const saveEditPostButton = document.getElementById('saveEditButton');

    openModalEditPost.forEach(openModalEdit => {
        openModalEdit.addEventListener('click', () => {
            modalEditPost.setAttribute('data-post-id', openModalEdit.getAttribute('data-post-id'));
            modalEditPost.querySelector('input[name="postIdEdit"]').value = openModalEdit.getAttribute('data-post-id');
            modalEditPost.querySelector('input[name="titleEdit"]').value = openModalEdit.getAttribute('data-post-title');
            const selectQuanlity = modalEditPost.querySelectorAll('input[name="qualityEdit"]');
            selectQuanlity.forEach(option => {
                if (option.value === openModalEdit.getAttribute('data-post-quanlity')) {
                    option.checked = true;
                } else {
                    option.checked = false;
                }
            });
            modalEditPost.querySelector('textarea[name="descriptionEdit"]').value = openModalEdit.getAttribute('data-post-desc');
            const selectDistrict = modalEditPost.querySelector('select[name="districtEdit"]');
            const optionDistrict = selectDistrict.querySelectorAll('option');

            optionDistrict.forEach(option => {
                if (option.value === openModalEdit.getAttribute('data-post-district')) {
                    option.selected = true;
                } else {
                    option.selected = false;
                }
            });
            console.log(openModalEdit.getAttribute('data-post-district'));
            const selectWard = modalEditPost.querySelector('select[name="wardEdit"]');
            const optionWard = selectWard.querySelectorAll('option');
            optionWard.forEach(option => {
                if (option.value === openModalEdit.getAttribute('data-post-commune')) {
                    option.selected = true;
                } else {
                    option.selected = false;
                }
            });
            modalEditPost.querySelector('input[name="newAddressEdit"]').value = openModalEdit.getAttribute('data-post-street_Number');
            modalEditPost.querySelector('input[name="instructionsEdit"]').value = openModalEdit.getAttribute('data-post-intr');
            var allImg = openModalEdit.getAttribute('data-all-img');
            const {styleImgPostDiv, imageBtnDiv} = createImageContainer(allImg);
            var modalBody = modalEditPost.querySelector('.post-image.preview-img');
            modalBody.innerHTML = '';
            modalBody.appendChild(styleImgPostDiv);
            modalBody.appendChild(imageBtnDiv);
            initializeSliders();
            modalEditPost.classList.add('is-active');
        });
    });
}
function createImageContainer(imageUrls) {
    const styleImgPostDiv = document.createElement('div');
    styleImgPostDiv.classList.add('style-img-post');

    const imageArray = imageUrls.split(',');

    imageArray.forEach(src => {
        const img = document.createElement('img');
        img.classList.add('element-img-post');
        img.src = src.trim();
        styleImgPostDiv.appendChild(img);
    });

    const imageBtnDiv = document.createElement('div');
    imageBtnDiv.classList.add('image-btn');
    imageBtnDiv.style.display = 'block';

    const btnNextDiv = document.createElement('div');
    btnNextDiv.classList.add('btn-image-next', 'btn-image');
    btnNextDiv.style.fontSize = '26px';
    btnNextDiv.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                                            <path stroke-width="1" stroke="black" fill="currentColor" d="M5.536 21.886a1.004 1.004 0 0 0 1.033-.064l13-9a1 1 0 0 0 0-1.644l-13-9A1 1 0 0 0 5 3v18a1 1 0 0 0 .536.886"/>
                                            </svg>`;

    const btnPreDiv = document.createElement('div');
    btnPreDiv.classList.add('btn-image-pre', 'btn-image');
    btnPreDiv.style.fontSize = '26px';
    btnPreDiv.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                                            <path stroke-width="1" stroke="black" fill="currentColor" d="m4.431 12.822l13 9A1 1 0 0 0 19 21V3a1 1 0 0 0-1.569-.823l-13 9a1.003 1.003 0 0 0 0 1.645"/>
                                            </svg>`;

    imageBtnDiv.appendChild(btnNextDiv);
    imageBtnDiv.appendChild(btnPreDiv);

    return {styleImgPostDiv, imageBtnDiv};
}
function fetchPostData(idpost) {
    const xhr = new XMLHttpRequest();
    xhr.open('POST', 'FetchPost', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                var postNeedUpdate = document.querySelector('.card.is-post[data-post-id="' + idpost + '"]');
                postNeedUpdate.innerHTML = xhr.responseText;
                reloadJs();
            } else {
                console.error('Yêu cầu thất bại:', xhr.responseText);
            }
        }
    };
    xhr.send('idpost=' + encodeURIComponent(idpost));
}

function ajaxEditPost() {
    var editPostForm = document.getElementById('edit-post');
    editPostForm.addEventListener('submit', function (event) {
        event.preventDefault();
        var formDataForEditPost = new FormData(editPostForm);

        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'editPost', true);
        xhr.onload = function () {
            console.log('Response:', xhr.responseText);
            if (xhr.responseText === "successfull") {
                document.getElementById('edit-post-modal').classList.remove('is-active');
                editPostForm.reset();
                iziToast.show({
                    maxWidth: "280px",
                    class: "success-toast",
                    icon: "mdi mdi-check",
                    title: "",
                    message: "Edit post successfully",
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
                fetchPostData(formDataForEditPost.get('postIdEdit'));
            } else if (xhr.responseText === "no change") {
                const modal = document.getElementById('edit-post-modal');
                modal.classList.remove('is-active');
            } else {
                iziToast.show({
                    maxWidth: "280px",
                    class: "success-toast",
                    icon: "mdi mdi-error",
                    title: "",
                    message: "Edit post failed",
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
        xhr.send(formDataForEditPost);
    });
}

document.addEventListener("DOMContentLoaded", function () {
    initializeEditPostModal();
    applyColorStyles();
    initOpenModalArcive();
    initModalEdit();
    initShareModal();
    ajaxEditPost();
    initReuqest();
    initResponseSwapModal();
});

function reloadJs() {
    initShareModal();
    initOpenModalArcive();
    initModalEdit();
    initializeEditPostModal();
    applyColorStyles();
    initDropdowns();
    initNavbar();
    initNavbarV2();
    initSidebarV1();
    linkCheck();
    initResponsiveMenu();
    initNavDropdowns();
    initNavbarCart();
    initDropdowns();
    initTabs();
    initModals();
    initBgImages();
    initEmojiPicker();
    initLightboxEmojis();
    initVideoEmbed();
    initLoadMore();
    initTooltips();
    initLikeButton();
    initSimplePopover();
    initUsersAutocomplete();
    initSuggestionSearch();
}
