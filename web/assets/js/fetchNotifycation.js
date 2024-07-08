function fetchNotifications() {
    const xhr = new XMLHttpRequest();
    xhr.open('GET', 'fetchNotifycation', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                var notifyList = document.querySelector('.nav-drop-body.is-notifications');
                console.log("fetchnoti");
                notifyList.innerHTML = xhr.responseText;
            } else {
                console.error('Yêu cầu thất bại:', xhr.statusText);
            }
        }
    };
    xhr.send();
}

setInterval(fetchNotifications, 3000);
