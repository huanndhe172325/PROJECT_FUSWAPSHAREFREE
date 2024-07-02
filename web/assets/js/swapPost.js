
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

    