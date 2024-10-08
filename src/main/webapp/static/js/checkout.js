document.addEventListener('DOMContentLoaded', function () {
    var orderSubmitBtn = document.getElementById('checkOutBtn'); // 提交订单按钮
    var termsCheckbox = document.getElementById('terms'); // 接收条款按钮
    var termsError = document.getElementById('termsError');
    var input_name = document.getElementById('input_name'); // 收件人姓名
    var input_phone = document.getElementById('input_phone'); // 收件人电话号码
    var input_address = document.getElementById('input_address'); // 收件人地址
    var input_notes = document.getElementById('input_notes'); // 备注
    var WeChatPay = document.getElementById('WeChatPay'); // 微信支付
    var AlipayPay = document.getElementById('AlipayPay'); // 支付宝支付
    var PayError = document.getElementById('PayError'); // 选择支付方式提醒按钮

    orderSubmitBtn.addEventListener('click', function (event) {
        event.preventDefault(); // 阻止按钮的默认行为

        // 检查复选框是否被选中
        if (!termsCheckbox.checked) {
            // 如果没有被选中，显示错误消息并退出函数
            termsError.style.display = 'block';
            return;
        } else {
            // 如果被选中，隐藏错误消息
            termsError.style.display = 'none';
        }

        // 检查是否选择支付方式
        if (!WeChatPay.checked && !AlipayPay.checked) {
            PayError.style.display = 'block';
            return;
        } else {
            PayError.style.display = 'none';
        }

        // 创建商品Map
        var productsMap = {};
        document.querySelectorAll('.order-products .order-col').forEach(function (productDiv) {
            var productId = productDiv.getAttribute('data-product-id'); // 假设每个商品div有一个'data-product-id'属性
            var quantity = productDiv.querySelector('.product-quantity').value; // 假设每个商品div内部有一个'.product-quantity'的隐藏输入字段
            productsMap[productId] = parseInt(quantity, 10);
        });

        // 使用fetch API发送数据到后端
        fetch('/website/CreateOrder', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                name: input_name.value,
                phone: input_phone.value,
                address: input_address.value,
                notes: input_notes.value,
                products: productsMap
            })
        }).then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
            .then(data => {
                // 处理响应转到评价页
                window.location.href = '/website/view?id=1';
                // alert('订单创建成功');
            })
            .catch((error) => {
                alert('发生错误');
            });
    });
});
