// 假设后端接口URL为 '/comments?page=' 加上页码
function fetchComments(page) {
    // 发起请求获取评论数据
    fetch(`/comments?page=${page}`)
        .then(response => response.json())
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
        .catch(error => console.error('Error fetching comments:', error));
}

// 绑定分页点击事件
document.addEventListener('DOMContentLoaded', function() {
    const pagination = document.querySelector('.reviews-pagination');
    pagination.addEventListener('click', function(event) {
        const target = event.target;
        if (target.tagName === 'A') {
            event.preventDefault();
            const page = target.textContent; // 假设页码直接显示在链接文本中
            fetchComments(page);
        }
    });
});
