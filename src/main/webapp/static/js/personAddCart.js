// 为每个“加入购物车”按钮添加事件监听器
document.querySelectorAll('.addShoppingCartButton').forEach(function (button) {
    button.addEventListener('click', function () {
        // 获取商品ID
        var itemId = this.closest('tr').querySelector('.selectItem').value;
        // 发起AJAX请求到后端
        fetch('/website/add-to-cart', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({itemId: itemId})
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                // 处理响应，例如显示一个消息
                alert('加入成功');
            })
            .catch((error) => {
                console.error('Error:', error);
            });
    });
});


// 为“多选加入购物车”按钮添加事件监听器
var addMoreToCart = document.querySelector('.addMoreToCart'); // 假设这是删除按钮
addMoreToCart.addEventListener('click', function () {
    var checkboxes = document.querySelectorAll('.selectItem:checked'); // 获取所有选中的复选框
    var requests = []; // 用于存储所有的fetch请求

    // 遍历所有选中的复选框并发起AJAX请求到后端
    checkboxes.forEach(function (checkbox) {
        var itemId = checkbox.value; // 获取商品ID

        // 创建一个fetch请求并添加到requests数组
        var request = fetch('/website/add-to-cart', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({itemId: itemId})
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            });

        requests.push(request);
    });

    // 当所有请求都完成时，显示一次成功消息
    Promise.all(requests)
        .then(() => {
            alert('所有选中的商品已成功加入购物车');
        })
        .catch((error) => {
            console.error('Error:', error);
            alert('加入购物车时发生错误');
        });
});
