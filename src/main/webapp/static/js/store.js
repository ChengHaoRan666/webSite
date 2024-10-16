// 等待文档加载完毕
document.addEventListener('DOMContentLoaded', function () {
    // 获取价格排序下拉菜单
    var priceSortSelect = document.getElementById('priceSort');
    // 获取商品列表的父
    const reviewsList = document.querySelector('.products');
    // 假设分页导航的类名是 'reviews-pagination'
    const reviewsPagination = document.querySelector('.reviews-pagination');

    // 为价格排序添加事件监听器
    priceSortSelect.addEventListener('change', function () {
        // 获取当前选中的排序方式
        var sortType = this.value;
        // 获取产品列表的容器
        var productList = document.querySelector('.col-md-9 >.row');
        console.log("列表：" + productList);

        // 获取所有的产品元素
        var products = Array.from(productList.querySelectorAll('.col-md-4'));
        // 根据价格进行排序
        products.sort(function (a, b) {
            var priceA = parseFloat(a.querySelector('.product-price').textContent.replace('￥', ''));
            var priceB = parseFloat(b.querySelector('.product-price').textContent.replace('￥', ''));

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

    // 为分页导航绑定点击事件
    reviewsPagination.addEventListener('click', function (event) {
        const pageLink = event.target.closest('a');
        if (pageLink) {
            // 获取查询字符串
            var queryString = window.location.search;
            // 创建一个URLSearchParams对象
            var urlParams = new URLSearchParams(queryString);

            // 获取参数
            var keyWord = urlParams.get('keyWord');
            var CategoryId = urlParams.get('CategoryId');
            const pageNumber = pageLink.getAttribute('data-page');
            var price_min = urlParams.get('price_min');
            var price_max = urlParams.get('price_max');
            // 调用函数加载指定页码的评论
            loadComments(keyWord, CategoryId, pageNumber, price_min, price_max);
            event.preventDefault(); // 阻止链接默认行为
        }
    });

    // 加载评论的函数
    function loadComments(keyWord, CategoryId, pageNumber, price_min, price_max) {
        // 使用 fetch API 或其他方法从服务器获取评论数据
        fetch(`/website/search2?keyWord=${keyWord}&CategoryId=${CategoryId}&pageNumber=${pageNumber}&price_min=${price_min}&price_max=${price_max}`)
            .then(response => response.json())
            .then(data => {
                // 假设服务器返回的数据结构是 { reviewAndUserNameList: [], currentPage: 1 }
                displayComments(data.searchProductList);
                updateNavigation(pageNumber, data.maxPage); // 更新分页导航
            })
            .catch(error => console.error('Error loading comments:', error));
    }

    const categoryMap = {
        '1': '电脑',
        '2': '手机',
        '3': '相机',
        '4': '配件'
    };


    // 更新数据
    function displayComments(searchProductList) {
        // 清空当前的评论列表
        reviewsList.innerHTML = '';

        // 遍历评论列表并添加到页面
        searchProductList.forEach(searchProduct => {
            const bigDiv = document.createElement('div');
            bigDiv.className = "col-md-4 col-xs-6";
            // 创建列表项元素
            const div = document.createElement('div');
            div.className = "product";

            // 创建商品图片
            const productImg = document.createElement('div');
            productImg.className = 'product-img';
            // 创建商品主体div
            const productBodyDiv = document.createElement('div');
            productBodyDiv.className = 'product-body';
            // 创建商品加入购物车
            const addToCartDiv = document.createElement('div');
            addToCartDiv.className = 'add-to-cart';

            const img = document.createElement('img');
            img.alt = "";
            img.src = searchProduct.imageUrl.split(';')[0];
            productImg.appendChild(img);


            // 创建类别元素
            const productCategoryP = document.createElement('p');
            productCategoryP.className = 'product-category';
            productCategoryP.textContent = categoryMap[searchProduct.categoryId];
            productBodyDiv.appendChild(productCategoryP);

            // 创建产品名称元素和链接
            const productNameH3 = document.createElement('h3');
            productNameH3.className = 'product-name';
            const productNameA = document.createElement('a');
            productNameA.href = `/product/${searchProduct.id}`;
            productNameA.textContent = searchProduct.name;
            productNameH3.appendChild(productNameA);
            productBodyDiv.appendChild(productNameH3);

            // 创建价格元素
            const productPriceH4 = document.createElement('h4');
            productPriceH4.className = 'product-price';
            productPriceH4.textContent = searchProduct.price;
            productBodyDiv.appendChild(productPriceH4);

            // 创建按钮容器
            const productBtnsDiv = document.createElement('div');
            productBtnsDiv.className = 'product-btns';

            // 创建收藏按钮
            const addToWishlistBtn = document.createElement('button');
            addToWishlistBtn.className = 'add-to-wishlist';
            addToWishlistBtn.dataset.id = searchProduct.id;
            const addToWishlistIcon = document.createElement('i');
            addToWishlistIcon.className = 'fa fa-heart-o';
            addToWishlistBtn.appendChild(addToWishlistIcon);
            const addToWishlistSpan = document.createElement('span');
            addToWishlistSpan.className = 'tooltipp';
            addToWishlistSpan.textContent = '加入收藏';
            addToWishlistBtn.appendChild(addToWishlistSpan);
            productBtnsDiv.appendChild(addToWishlistBtn);

            // 创建查看按钮
            const quickViewBtn = document.createElement('button');
            quickViewBtn.className = 'quick-view';
            const quickViewA = document.createElement('a');
            quickViewA.href = `/product/${searchProduct.id}`;
            const quickViewIcon = document.createElement('i');
            quickViewIcon.className = 'fa fa-eye';
            quickViewA.appendChild(quickViewIcon);
            quickViewBtn.appendChild(quickViewA);
            const quickViewSpan = document.createElement('span');
            quickViewSpan.className = 'tooltipp';
            quickViewSpan.textContent = '查看';
            quickViewBtn.appendChild(quickViewSpan);
            productBtnsDiv.appendChild(quickViewBtn);
            productBodyDiv.appendChild(productBtnsDiv);


            // 创建加入购物车按钮
            const addToCartBtn = document.createElement('button');
            addToCartBtn.className = 'add-to-cart-btn';
            addToCartBtn.dataset.id = searchProduct.id;
            const addToCartIcon = document.createElement('i');
            addToCartIcon.className = 'fa fa-shopping-cart';
            addToCartBtn.appendChild(addToCartIcon);
            addToCartBtn.textContent = '加入购物车';
            addToCartDiv.appendChild(addToCartBtn);


            div.appendChild(productImg);
            div.appendChild(productBodyDiv);
            div.appendChild(addToCartDiv);
            bigDiv.appendChild(div);
            // 将构建好的评论添加到评论列表中
            const br1 = document.createElement('br');
            const br2 = document.createElement('br');
            bigDiv.appendChild(br1);
            bigDiv.appendChild(br2);
            reviewsList.appendChild(bigDiv);
        });
    }

    // 更新导航框
    function updateNavigation(currentPage, maxPage) {
        const paginationContainer = document.querySelector('.reviews-pagination');
        paginationContainer.innerHTML = '';

        // 添加向前一页的按钮
        if (currentPage > 1) {
            const prevLi = document.createElement('li');
            const prevLink = document.createElement('a');
            prevLink.href = '#';
            prevLink.setAttribute('data-page', (currentPage - 1).toString());
            prevLink.innerHTML = '<i class="fa fa-angle-left"></i>';
            prevLi.appendChild(prevLink);
            paginationContainer.appendChild(prevLi);
        }


        // 计算显示的页码范围
        let startPage = Math.max(1, currentPage - 2);
        let endPage = Math.min(maxPage, parseInt(currentPage, 10) + 2);

        // 如果当前页接近开始页，则调整显示范围
        if (currentPage <= 3) {
            startPage = 1;
            endPage = Math.min(5, maxPage);
        }

        // 如果当前页接近结束页，则调整显示范围
        if (currentPage >= maxPage - 2) {
            endPage = maxPage;
            startPage = Math.max(1, maxPage - 4);
        }

        // 添加页码
        for (let page = startPage; page <= endPage; page++) {
            const pageLi = document.createElement('li');
            pageLi.className = page === parseInt(currentPage, 10) ? 'active' : '';
            const pageLink = document.createElement('a');
            pageLink.href = '#';
            pageLink.setAttribute('data-page', page);
            pageLink.textContent = page;
            pageLi.appendChild(pageLink);
            paginationContainer.appendChild(pageLi);
        }


        // 添加向后一页的按钮
        if (currentPage < maxPage) {
            const nextLi = document.createElement('li');
            const nextLink = document.createElement('a');
            nextLink.href = '#';
            nextLink.setAttribute('data-page', parseInt(currentPage, 10) + 1);
            nextLink.innerHTML = '<i class="fa fa-angle-right"></i>';
            nextLi.appendChild(nextLink);
            paginationContainer.appendChild(nextLi);
        }
    }
});