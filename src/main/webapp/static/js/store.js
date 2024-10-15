// 等待文档加载完毕
document.addEventListener('DOMContentLoaded', function () {
    // 获取价格排序下拉菜单
    var priceSortSelect = document.getElementById('priceSort');
    console.log(priceSortSelect);
    // 添加事件监听器
    priceSortSelect.addEventListener('change', function () {
        // 获取当前选中的排序方式
        var sortType = this.value;
        console.log("排序方式：" + sortType);
        // 获取产品列表的容器
        var productList = document.querySelector('.col-md-9 >.row');
        console.log("列表：" + productList);
        if (!productList) {
            console.error('产品列表容器不存在');
            return;
        }

        // 获取所有的产品元素
        var products = Array.from(productList.querySelectorAll('.col-md-4'));
        // 根据价格进行排序
        products.sort(function (a, b) {
            var priceA = parseFloat(a.querySelector('.product-price').textContent.replace('￥', ''));
            var priceB = parseFloat(b.querySelector('.product-price').textContent.replace('￥', ''));

            console.log("价格：" + priceA + " " + priceB);
            if (sortType === '1') { // 从高到低
                return priceB - priceA;
            } else if (sortType === '2') { // 从低到高
                return priceA - priceB;
            }
            return 0; // 默认排序（通常是按照添加顺序）
        });

        // 清空产品列表容器
        productList.innerHTML = '';

        // 将排序后的产品元素重新添加到容器中
        products.forEach(function (product) {
            productList.appendChild(product);
        });
    });
});