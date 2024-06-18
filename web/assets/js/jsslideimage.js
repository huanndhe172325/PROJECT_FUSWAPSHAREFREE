function initSlider(container) {
    const btnLeft = container.querySelector('.btn-image-pre');
    const btnRight = container.querySelector('.btn-image-next');
    const listImage = container.querySelector('.style-img-post');

    // Ensure that the required elements exist
    if (!btnLeft || !btnRight || !listImage) {
        console.error('Required elements not found in container:', container);
        return;
    }

    const images = listImage.querySelectorAll('a img');
    var length = listImage.children.length;

    let current = 0;

    btnLeft.addEventListener('click', () => {
        let width = listImage.children[0].offsetWidth;
        if (current == 0) {
            current = length - 1;
        } else {
            current--;
        }
        console.log(listImage);
        console.log(length);
        console.log(-width * current);
        listImage.style.transform = `translateX(${-width * current}px)`;
        length = listImage.children.length;
    });

    btnRight.addEventListener('click', () => {
        let width = listImage.children[0].offsetWidth;
        if (current == length - 1) {
            current = 0;
        } else {
            current++;
        }
        console.log(listImage);
        console.log(length);
        console.log(-width * current);
        listImage.style.transform = `translateX(${-width * current}px)`;
        length = listImage.children.length;
    });
}

function initializeSliders() {
    var sliders = document.querySelectorAll('.post-image');
    sliders.forEach(initSlider);
}

initializeSliders();

const observer = new MutationObserver((mutations) => {
    mutations.forEach((mutation) => {
        if (mutation.addedNodes.length > 0) {
            mutation.addedNodes.forEach((node) => {
                if (node.classList && node.classList.contains('post-image')) {
                    initSlider(node);
                } else if (node.querySelectorAll) {
                    node.querySelectorAll('.post-image').forEach(initSlider);
                }
            });
        }
    });
});

observer.observe(document.body, {
    childList: true,
    subtree: true
});
