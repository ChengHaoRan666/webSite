// 当文档加载完毕后绑定事件
document.addEventListener('DOMContentLoaded', function() {
    // 假设评论列表的类名是 'reviews'
    const reviewsList = document.querySelector('.reviews');
    // 假设分页导航的类名是 'reviews-pagination'
    const reviewsPagination = document.querySelector('.reviews-pagination');

    // 为分页导航绑定点击事件
    reviewsPagination.addEventListener('click', function(event) {
        const pageLink = event.target.closest('a');
        if (pageLink) {
            const page = pageLink.getAttribute('data-page');
            const productId = reviewsPagination.getAttribute('data-product-id');
            // 调用函数加载指定页码的评论
            loadComments(productId, page);
            event.preventDefault(); // 阻止链接默认行为
        }
    });

    // 加载评论的函数
    function loadComments(productId, page) {
        // 使用 fetch API 或其他方法从服务器获取评论数据
        fetch(`/website/comments?page=${page}&productId=${productId}`)
            .then(response => response.json())
            .then(data => {
                // 假设服务器返回的数据结构是 { reviewAndUserNameList: [], currentPage: 1 }
                displayComments(data.reviewAndUserNameList);
            })
            .catch(error => console.error('Error loading comments:', error));
    }

    // 显示评论的函数
    function displayComments(reviewAndUserNameList) {
        // 清空当前的评论列表
        reviewsList.innerHTML = '';

        // 遍历评论列表并添加到页面
        reviewAndUserNameList.forEach(reviewAndUserName => {
            // 创建列表项元素
            const li = document.createElement('li');

            // 创建评论头部容器
            const reviewHeading = document.createElement('div');
            reviewHeading.className = 'review-heading';

            // 创建用户名字元素
            const nameElement = document.createElement('h5');
            nameElement.className = 'name';
            nameElement.textContent = reviewAndUserName.userName;

            const dateElement = document.createElement('p');
            dateElement.className = 'date';
            // 使用 Date 对象解析 ISO 8601 格式的日期字符串
            const date = new Date(reviewAndUserName.review.reviewTime);
            // 格式化日期
            dateElement.textContent = date.toLocaleDateString() + ' ' + date.toLocaleTimeString();

            // 创建评分容器
            const reviewRating = document.createElement('div');
            reviewRating.className = 'review-rating';

            // 添加星级评分
            for (let i = 1; i <= 5; i++) {
                const starElement = document.createElement('i');
                starElement.className = i <= reviewAndUserName.review.rating ? 'fa fa-star' : 'fa fa-star-o empty';
                reviewRating.appendChild(starElement);
            }

            // 创建评论内容容器
            const reviewBody = document.createElement('div');
            reviewBody.className = 'review-body';

            // 创建评论内容元素
            const commentElement = document.createElement('p');
            commentElement.textContent = reviewAndUserName.review.comment;

            // 构建评论结构
            reviewBody.appendChild(commentElement);
            reviewHeading.appendChild(nameElement);
            reviewHeading.appendChild(dateElement);
            reviewHeading.appendChild(reviewRating);
            li.appendChild(reviewHeading);
            li.appendChild(reviewBody);

            // 将构建好的评论添加到评论列表中
            reviewsList.appendChild(li);
        });

    }
});



