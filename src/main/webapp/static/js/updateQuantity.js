// 修改购物车商品数量
function updateQuantity(itemId, action) {
    var quantityInput = document.getElementById('quantity_' + itemId);
    var currentQuantity = parseInt(quantityInput.value);
    var newQuantity;

    if (action === 'increase') {
        newQuantity = currentQuantity + 1;
    } else if (action === 'decrease') {
        newQuantity = currentQuantity > 1 ? currentQuantity - 1 : 1;
    }

    quantityInput.value = newQuantity;

    // 发送AJAX请求
    sendUpdateRequest(itemId, newQuantity);
}


// 发送更新数量的AJAX请求
function sendUpdateRequest(itemId, newQuantity) {
    $.ajax({
        type: 'POST',
        url: '/website/updateQuantity',
        data: {
            itemId: itemId,
            quantity: newQuantity
        },
    });
}

// 手动输入时更新购物车商品数量
function onQuantityChange(itemId) {
    var quantityInput = document.getElementById('quantity_' + itemId);
    var newQuantity = parseInt(quantityInput.value);

    if (isNaN(newQuantity) || newQuantity < 1) {
        alert('请输入有效的商品数量！');
        quantityInput.value = 1; // 设置默认值或之前的值
        return;
    }

    sendUpdateRequest(itemId, newQuantity);
}

// 页面加载完成后，为所有数量输入框添加change事件监听器
$(document).ready(function() {
    $('input[type="number"]').on('change', function() {
        var itemId = this.id.replace('quantity_', '');
        onQuantityChange(itemId);
    });
});
