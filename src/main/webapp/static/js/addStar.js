document.addEventListener('DOMContentLoaded', function () {
    // 获取所有具有 'add-to-wishlist' 类的元素
    var wishlistButtons = document.getElementsByClassName('add-to-wishlist');

    Array.from(wishlistButtons).forEach(function (button) {
        button.addEventListener('click', function () {
            var productId = this.getAttribute('data-id')
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'http://localhost:8080/website/addStar?productId=' + productId, true);

            xhr.onload = function () {
                if (xhr.status === 401) {
                    // 用户未登录，重定向到登录页面
                    window.location.href = '/website/login';
                } else if (xhr.status === 200) {
                    // 收藏成功，可以在这里更新UI
                    alert('收藏成功');
                } else {
                    // 其他错误处理
                    alert('发生错误：' + xhr.statusText);
                }
            };

            xhr.send();
        });
    });
});
