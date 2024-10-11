document.addEventListener('DOMContentLoaded', function () {
    // 获取所有具有 'add-to-cart-btn' 类的元素
    var wishlistButtons = document.getElementsByClassName('add-to-cart-btn');

    Array.from(wishlistButtons).forEach(function (button) {
        button.addEventListener('click', function () {
            var productId = this.getAttribute('data-id')
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'http://localhost:8080/website/addCart?productId=' + productId, true);

            xhr.onload = function () {
                if (xhr.status === 401) {
                    // 用户未登录，重定向到登录页面
                    window.location.href = '/website/login';
                } else if (xhr.status === 200) {
                    alert('加入成功');
                } else {
                    // 其他错误处理
                    alert('发生错误：' + xhr.statusText);
                }
            };
            xhr.send();
        });
    });
});