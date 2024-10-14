function fetchComments(productId, page) {
    // 发起请求获取评论数据
    fetch(`/website/comments?productId=${productId}&page=${page}`)
        .then(response => {
            // 获取自定义响应头
            const customHeaderValue = response.headers.get('X-Current-Page');
            console.log('要跳转的页面:', customHeaderValue);

            // 继续处理响应体
            return response.json();
        })
        .then(data => {
            // 假设返回的数据是JSON格式，包含评论列表
            // 更新页面上的评论内容
            const commentsContainer = document.getElementById('comments-container');
            commentsContainer.innerHTML = ''; // 清空当前评论
            data.comments.forEach(comment => {
                // 创建评论元素并添加到页面
                const commentElement = document.createElement('div');
                commentElement.textContent = comment.content; // 假设评论内容在comment.content字段
                commentsContainer.appendChild(commentElement);
            });
        })
        .catch(error => console.error('错误:', error));
}


// 绑定分页点击事件
document.addEventListener('DOMContentLoaded', function () {
    const pagination = document.querySelector('.reviews-pagination');
    const productId = pagination.dataset.productId; // 获取productId

    pagination.addEventListener('click', function (event) {
        const target = event.target;
        const pageLink = target.closest('a[data-page]'); // 查找包含data-page属性的<a>元素
        if (pageLink) {
            event.preventDefault();
            const page = parseInt(pageLink.dataset.page, 10); // 从data-page属性中获取页码并转换为整数
            fetchComments(productId, page);
        }
    });
});