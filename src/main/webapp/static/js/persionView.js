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
});
