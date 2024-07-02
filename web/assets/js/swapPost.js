
document.getElementById('imgPathSwap').addEventListener('change', function (event) {
    const filesSwap = event.target.files;
    const blockImgSwap = document.querySelector('.post-image.preview-img.preview-swap');
    const imageContainerSwap = blockImgSwap.querySelector('.style-img-post.block-img-swap');
    console.log(blockImgSwap);
    console.log(imageContainerSwap);
    imageContainerSwap.innerHTML = '';
    for (let i = 0; i < filesSwap.length; i++) {
        const file = filesSwap[i];
        const imageURL = URL.createObjectURL(file);
        const imgElement = document.createElement('img');
        imgElement.classList.add('element-img-post');
        imgElement.src = imageURL;
        imageContainerSwap.appendChild(imgElement);
        imgElement.onload = function () {
            URL.revokeObjectURL(imageURL);
        };
    }
    if (filesSwap.length >= 2) {
        blockImgSwap.querySelector('.image-btn.image-btn-swap-preview').style.display = 'block';
    } else {
        blockImgSwap.querySelector('.image-btn.image-btn-swap-preview').style.display = 'none';
    }
    blockImgSwap.style.display = 'block';
    imageContainerSwap.style.transform = 'translateX(0px)';
});



document.addEventListener("DOMContentLoaded", function () {
    var openModalSwap = document.querySelectorAll('.open-modal-swap');
    const modalSwap = document.getElementById('sent-swap-modal');
    const swapButton = document.getElementById('swapButton');
    let currentPostSwap = null;
    openModalSwap.forEach(openModalArchive => {
        openModalArchive.addEventListener('click', () => {
            const postIdSwap = openModalArchive.getAttribute('data-post-id');
            currentPostSwap = postIdSwap;
            modalSwap.setAttribute('data-post-id', postIdSwap);
            modalSwap.querySelector('input[name="idPostSwap"]').value = postIdSwap;
            modalSwap.classList.add('is-active');
        });
    });
    document.getElementById('swapButton').addEventListener('click', function () {
        if (validateFormSwap()) {
            console.log("submit");
//            document.getElementById('submit-swap').click();
        }
    });
    const inputMessage = document.getElementById('messageSwap');
    const errorMessageSwap = document.getElementById('message-error-swap');
    inputMessage.addEventListener('input', function () {
        const inputValueSwap = inputMessage.value.trim();
        if (inputValueSwap.length > 0) {
            errorMessageSwap.style.display = 'none';
        } else {
            errorMessageSwap.style.display = 'block';
        }
    });
    function validateFormSwap() {
        var messageSwapInput = document.getElementById('messageSwap').value.trim();
        if (messageSwapInput === '') {
            var titleErrorSwap = document.getElementById('message-error-swap');
            titleErrorSwap.style.display = 'block';
            return false;
        }
        return true;
    }
});