function getEndOfWeek() {
    var now = new Date();
    var dayOfWeek = now.getDay();
    var endOfWeek = new Date(now);
    endOfWeek.setDate(now.getDate() + (7 - dayOfWeek));
    endOfWeek.setHours(23, 59, 59, 999); 
    return endOfWeek;
}

function getCurrentTime() {
    return new Date().getTime();
}

var endTime = getEndOfWeek().getTime();
var currentTime = getCurrentTime();

function updateCountdown() {
    var now = getCurrentTime();
    var timeleft = endTime - now;

    // 计算天、时、分、秒
    var days = Math.floor(timeleft / (1000 * 60 * 60 * 24));
    var hours = Math.floor((timeleft % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((timeleft % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((timeleft % (1000 * 60)) / 1000);

    // 获取所有倒计时元素
    var countdownElements = document.querySelectorAll('.hot-deal-countdown h3');

    // 更新页面上的时间
    countdownElements[0].textContent = days;
    countdownElements[1].textContent = hours;
    countdownElements[2].textContent = minutes;
    countdownElements[3].textContent = seconds;

    // 如果时间已经到了，停止倒计时
    if (timeleft < 0) {
        clearInterval(interval);
        document.querySelector('.hot-deal-countdown').innerHTML = "EXPIRED";
    }
}

// 每秒更新一次倒计时
var interval = setInterval(updateCountdown, 1000);
