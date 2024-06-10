function initSlider(container) {
                                    const btnLeft = container.querySelector('.btn-image-pre');
                                    const btnRight = container.querySelector('.btn-image-next');
                                    const listImage = container.querySelector('.style-img-post');
                                    const images = listImage.querySelectorAll('a img');
                                    const length = listImage.children.length;

                                    let current = 0;

                                    btnLeft.addEventListener('click', () => {
                                        let width = listImage.children[0].offsetWidth;
                                        if (current == 0) {
                                            current = length - 1;
                                        } else {
                                            current--;
                                        }
                                        console.log(listImage);
                                        console.log(-width * current);
                                        listImage.style.transform = `translateX(${-width * current}px)`;
                                    });

                                    btnRight.addEventListener('click', () => {
                                        let width = listImage.children[0].offsetWidth;
                                        if (current == length - 1) {
                                            current = 0;
                                        } else {
                                            current++;
                                        }
                                        console.log(listImage);
                                        console.log(-width * current);
                                        listImage.style.transform = `translateX(${-width * current}px)`;
                                    });
                                }

                                const sliders = document.querySelectorAll('.post-image');
                                sliders.forEach(initSlider);