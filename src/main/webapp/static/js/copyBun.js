// 函数用于复制文本到剪切板
function copyTextToClipboard(text) {
    if (!navigator.clipboard) {
        // 如果浏览器不支持clipboard API，使用旧的方法
        var textArea = document.createElement("textarea");
        textArea.value = text;
        document.body.appendChild(textArea);
        textArea.focus();
        textArea.select();
        try {
            var successful = document.execCommand('copy');
            var msg = successful ? 'successful' : 'unsuccessful';
            console.log('Fallback: Copying text command was ' + msg);
        } catch (err) {
            console.error('Fallback: Oops, unable to copy', err);
        }
        document.body.removeChild(textArea);
    } else {
        // 使用clipboard API
        navigator.clipboard.writeText(text).then(function () {
            console.log('Async: Copying to clipboard was successful!');
        }, function (err) {
            console.error('Async: Could not copy text: ', err);
        });
    }
}

// 获取当前页面的URL
var currentUrl = window.location.href;

// 为所有带有 'share-btn' 类的按钮添加点击事件
document.querySelectorAll('.share-btn').forEach(function (button) {
    button.addEventListener('click', function () {
        copyTextToClipboard(currentUrl);
        // 可以在这里添加用户反馈，比如一个弹窗提示"链接已复制"
        alert('链接已复制到剪切板');
    });
});