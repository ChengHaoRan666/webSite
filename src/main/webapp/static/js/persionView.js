document.addEventListener('DOMContentLoaded', function () {
    // 事件监听器，用于处理复选框变化
    function updateSelectedItems() {
        var checkboxes = document.querySelectorAll('.selectItem');
        var totalItems = 0;
        var totalPrice = 0.0;

        // 遍历所有复选框
        checkboxes.forEach(function (checkbox) {
            if (checkbox.checked) {
                // 假设每个复选框旁边有一个隐藏的元素，存储了单价和数量
                var price = parseFloat(checkbox.getAttribute('data-price'));
                var quantity = parseInt(checkbox.getAttribute('data-quantity'), 10);

                // 累加数量和金额
                totalItems += quantity;
                totalPrice += price * quantity;
            }
        });

        // 更新显示
        document.querySelector('div > span:first-child').textContent = totalItems;
        document.querySelector('div > span:last-child').textContent = totalPrice.toFixed(2);

        // 更新全选按钮的文本
        updateSelectAllButtonText();
    }

    // 为每个删除按钮添加事件监听器
    document.querySelectorAll('.deleteButton').forEach(function (button) {
        button.addEventListener('click', function () {
            // 获取商品ID
            var itemId = this.getAttribute('data-id');
            // 获取表名，通过自定义属性data-table-name
            var tableName = this.closest('.table').getAttribute('data-table-name');

            // 发起AJAX请求到后端
            fetch('/website/delete-item', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({itemId: itemId, tableName: tableName})
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    // 处理响应，例如显示一个消息
                    console.log(data.message);
                    // 删除前端表格行
                    var row = this.parentNode.parentNode;
                    row.parentNode.removeChild(row);
                    // 更新选中商品数量和金额
                    updateSelectedItems();
                })
                .catch((error) => {
                    console.error('Error:', error);
                });
        });
    });

    // 更新全选按钮的文本
    function updateSelectAllButtonText() {
        var checkboxes = document.querySelectorAll('.selectItem');
        var allChecked = Array.from(checkboxes).every(checkbox => checkbox.checked);
        var selectAllButton = document.querySelector('.selectAllButton');
        if (allChecked) {
            selectAllButton.textContent = '全不选';
        } else {
            selectAllButton.textContent = '全选';
        }
    }

    // 为每个复选框添加事件监听器
    document.querySelectorAll('.selectItem').forEach(function (checkbox) {
        checkbox.addEventListener('change', updateSelectedItems);
    });

    // 全选/全不选按钮的事件监听器
    var selectAllButton = document.querySelector('.selectAllButton');
    selectAllButton.addEventListener('click', function () {
        // 获取所有复选框
        var checkboxes = document.querySelectorAll('.selectItem');
        var allChecked = Array.from(checkboxes).every(checkbox => checkbox.checked);

        // 遍历并将所有复选框设置为相反的选中状态
        checkboxes.forEach(function (checkbox) {
            checkbox.checked = !allChecked;
        });

        // 更新显示选中的商品数量和金额
        updateSelectedItems();
    });


    // 为“删除”按钮添加事件监听器
    var deleteSelectedButton = document.querySelector('.deleteMore'); // 假设这是删除按钮
    deleteSelectedButton.addEventListener('click', function () {
        var checkboxes = document.querySelectorAll('.selectItem:checked'); // 获取所有选中的复选框
        var tableName = document.querySelector('.table').getAttribute('data-table-name'); // 获取表名

        // 遍历所有选中的复选框并删除对应的行
        checkboxes.forEach(function (checkbox) {
            var itemId = checkbox.value; // 获取商品ID

            // 发起AJAX请求到后端
            fetch('/website/delete-item', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({itemId: itemId, tableName: tableName})
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    // 处理响应，例如显示一个消息
                    console.log(data.message);
                    // 删除前端表格行
                    var row = checkbox.parentNode.parentNode;
                    row.parentNode.removeChild(row);
                    // 更新选中商品数量和金额
                    updateSelectedItems();
                })
                .catch((error) => {
                    console.error('Error:', error);
                });
        });
    });
});
