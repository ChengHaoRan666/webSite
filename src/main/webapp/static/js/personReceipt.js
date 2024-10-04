// 定义一个函数，用于发送商品ID列表到后端
function settleItems(itemIds) {
    fetch('/website/receipt', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({itemIds: itemIds})
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            // 处理响应，例如显示一个消息
            window.location.href = '/website/evaluate';
            // alert('商品结算成功');
        })
        .catch((error) => {
            console.error('Error:', error);
            alert('发生错误');
        });
}

// 单个商品确认收货
document.querySelectorAll('.evaluateButton').forEach(function (button) {
    button.addEventListener('click', function () {
        // 获取商品ID
        var itemId = this.closest('tr').querySelector('.selectItem').value;
        // 调用settleItems函数，传递单个商品ID的数组
        settleItems([itemId]);
    });
});


// 为一起结算按钮添加事件监听器
var settlementAllButton = document.querySelector('.evaluateMoreButton');
settlementAllButton.addEventListener('click', function () {
    // 收集所有选中的商品ID
    var itemIds = Array.from(document.querySelectorAll('.selectItem:checked')).map(function (checkbox) {
        return checkbox.value;
    });
    // 调用settleItems函数，传递商品ID列表
    settleItems(itemIds);
});
