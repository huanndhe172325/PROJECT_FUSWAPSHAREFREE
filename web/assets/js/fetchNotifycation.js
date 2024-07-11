function fetchNotifications() {
    const xhr = new XMLHttpRequest();
    xhr.open('GET', 'fetchNotifycation', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                var notifyList = document.querySelector('.nav-drop-body.is-notifications');
                notifyList.innerHTML = xhr.responseText;
            } else {
                console.error('Yêu cầu thất bại:', xhr.statusText);
            }
        }
    };
    xhr.send();
}
const buttonNoti = document.querySelectorAll('.navbar-item.is-icon.drop-trigger.fetch-notifycation');
buttonNoti.forEach(noti => {
    noti.addEventListener('click', () => {
        console.log("fetch noti");
        fetchNotifications();
    });
});
