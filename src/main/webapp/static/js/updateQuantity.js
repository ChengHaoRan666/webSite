// 更新商品数量和金额
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

    updateTotalPrice(itemId, newQuantity);

    // 发送AJAX请求
    sendUpdateRequest(itemId, newQuantity);
}

// 更新单个商品的总金额
function updateTotalPrice(itemId, newQuantity) {
    // 更新隐藏域中的商品数量，用于多选计算
    // 选择第一个带有.selectItem类的元素
    var checkboxElement = document.querySelector('.selectItem');
    // 更新复选框中的隐藏域中的数据用于更新多选按钮
    checkboxElement.setAttribute('data-quantity', newQuantity.toString());


    var priceElement = document.querySelector(`tr[data-item-id="${itemId}"] .price`);
    var price = parseFloat(priceElement.textContent);
    var totalPriceElement = document.querySelector(`tr[data-item-id="${itemId}"] .total-price`);
    totalPriceElement.textContent = (price * newQuantity).toFixed(2);
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
        success: function (response) {
            // 更新成功后，确保金额正确
            updateTotalPrice(itemId, newQuantity);
        },
        error: function () {
            alert('更新数量失败，请重试！');
        }
    });
}

// 手动输入时更新购物车商品数量和金额
function onQuantityChange(itemId) {
    var quantityInput = document.getElementById('quantity_' + itemId);
    var newQuantity = parseInt(quantityInput.value);
    if (isNaN(newQuantity) || newQuantity < 1) {
        alert('请输入有效的商品数量！');
        quantityInput.value = 1; // 设置默认值或之前的值
        return;
    }

    updateTotalPrice(itemId, newQuantity);
    sendUpdateRequest(itemId, newQuantity);
}

// 页面加载完成后，为所有数量输入框添加change事件监听器
$(document).ready(function () {
    $('input[type="number"]').on('change', function () {
        var itemId = this.id.replace('quantity_', '');
        onQuantityChange(itemId);
    });
});
