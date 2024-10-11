document.addEventListener('DOMContentLoaded', function () {
    // 获取所有具有 'add-to-cart-btn' 类的元素
    var addToCartButtons = document.getElementsByClassName('add-to-cart-btn');

    Array.from(addToCartButtons).forEach(function (button) {
        button.addEventListener('click', function () {
            var productId = this.getAttribute('data-id');
            var quantityInput = this.parentElement.querySelector('.quantity-input'); // 查找相邻的数量输入框
            var quantity = quantityInput ? quantityInput.value : 1; // 如果存在输入框，则读取其值，否则默认为1
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'http://localhost:8080/website/addCart?productId=' + productId + '&number=' + quantity, true);

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
