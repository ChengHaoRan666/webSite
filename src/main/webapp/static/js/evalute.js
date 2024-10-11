// 去评价
document.addEventListener('DOMContentLoaded', function () {
    // 为所有“去评价”按钮添加点击事件监听器
    document.querySelectorAll('.evaluateButton').forEach(function (button) {
        button.addEventListener('click', function () {
            // 获取当前按钮所在的行
            var row = this.closest('tr');
            // 从行中获取订单ID
            var orderId = row.getAttribute('data-order-id');

            window.open('/website/evaluateSingle?orderId=' + orderId, '_blank');
        });
    });
});