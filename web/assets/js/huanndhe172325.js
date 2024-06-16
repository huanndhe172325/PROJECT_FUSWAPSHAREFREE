document.getElementById('saveEditButton').addEventListener('click', function () {
    if (validateForm()) {
        document.getElementById('submit-edit-post').click();
    }
});
const titleInput = document.getElementById('title');
const errorMessage = document.getElementById('title-error');

titleInput.addEventListener('input', function () {
    const inputValue = titleInput.value.trim();

    if (inputValue.length > 0) {
        errorMessage.style.display = 'none';
    } else {
        errorMessage.style.display = 'block';
    }
});

const descInput = document.getElementById('description');
const errorMessageDesc = document.getElementById('title-error-desc');

descInput.addEventListener('input', function () {
    var inputValueDesc = descInput.value.trim();

    if (inputValueDesc.length > 0) {
        errorMessageDesc.style.display = 'none';
    } else {
        errorMessageDesc.style.display = 'block';
    }
});


const addInput = document.getElementById('Order_name');
const errorMessageAdd = document.getElementById('title-error-add');
addInput.addEventListener('input', function () {
    const inputValueAdd = addInput.value.trim();

    if (inputValueAdd.length > 0) {
        errorMessageAdd.style.display = 'none';
    } else {
        errorMessageAdd.style.display = 'block';
    }
});

const instInput = document.getElementById('instructions');
const errorMessageInst = document.getElementById('title-error-inst');
instInput.addEventListener('input', function () {
    const inputValueInst = instInput.value.trim();

    if (inputValueInst.length > 0) {
        errorMessageInst.style.display = 'none';
    } else {
        errorMessageInst.style.display = 'block';
    }
});
function validateForm() {
    var title = document.getElementById('title').value.trim();
    var description = document.querySelector('textarea[name="description"]').value.trim();
    var newAddress = document.getElementById('Order_name').value.trim();
    var instructions = document.getElementById('instructions').value.trim();

    if (title === '') {
        var titleError = document.getElementById('title-error');
        titleError.style.display = 'block';
        return false;
    }

    if (description === '') {
        var titleError = document.getElementById('title-error-desc');
        titleError.style.display = 'block';
        return false;
    }

    if (newAddress === '') {
        var titleError = document.getElementById('title-error-add');
        titleError.style.display = 'block';
        return false;
    }

    if (instructions === '') {
        var titleError = document.getElementById('title-error-inst');
        titleError.style.display = 'block';
        return false;
    }
    return true;
}
//var formEditPost = document.getElementById('edit-post');
//    var formDataEditPost = new FormData(formEditPost);
//    console.log(formDataEditPost);

var formEditPost = document.getElementById('edit-post');
console.log(formEditPost);
formEditPost.addEventListener('submit', function (event) {
    event.preventDefault();

    var formDataEditPost = new FormData(formEditPost);
    console.log(formDataEditPost);
    if(formDataEditPost.has("title")){
        console.log("has tittle");
    }
    var xhr = new XMLHttpRequest();

    xhr.open('POST', 'editPost', true);

    xhr.onload = function () {
        if (xhr.status >= 200 && xhr.status < 300) {
            console.log(xhr.responseText);
            if (xhr.responseText.trim() === "successful") {
                const modal = document.getElementById('edit-post-modal');
                modal.classList.remove('is-active');
                formEditPost.reset();
                formEditPost.querySelector('.post-image.preview-img').style.display = 'none';
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
            } else {
                console.log("failed1");
            }
        } else {
            console.log("failed 2");
        }
    };

    xhr.onerror = function () {
        console.error('Request failed 3');
    };

    xhr.send(formDataEditPost);
});