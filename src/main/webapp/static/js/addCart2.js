document.addEventListener('DOMContentLoaded', function () {
    // 获取所有具有 'add-to-cart-btn' 类的元素
    var addToCartButtons = document.getElementsByClassName('add-to-cart-btn');

    Array.from(addToCartButtons).forEach(function (button) {
        button.addEventListener('click', function () {
            // 获取当前按钮的父元素，即 '.add-to-cart' 容器
            var cartContainer = this.closest('.add-to-cart');
            // 在父元素中查找数量输入框
            var numberInput = cartContainer.querySelector('.input-number input[type="number"]');
            // 获取数量输入框的值
            var number = numberInput.value;

            var productId = this.getAttribute('data-id');
            var xhr = new XMLHttpRequest();
            // 构建请求URL，包含产品ID和数量
            var url = 'http://localhost:8080/website/addCart?productId=' + productId + '&number=' + number;
            xhr.open('POST', url, true);

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
