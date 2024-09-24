document.addEventListener('DOMContentLoaded', function() {
    var loginSubmitBtn = document.getElementById('registerSubmitBtn');
    var loginForm = document.getElementById('registerForm');
    var termsCheckbox = document.getElementById('terms');
    var termsError = document.getElementById('termsError');

    loginSubmitBtn.addEventListener('click', function(event) {
        event.preventDefault(); // 阻止链接默认行为

        // 检查复选框是否被选中
        if (!termsCheckbox.checked) {
            // 如果没有被选中，显示错误消息并退出函数
            termsError.style.display = 'block';
            return;
        } else {
            // 如果被选中，隐藏错误消息
            termsError.style.display = 'none';
        }

        // 提交表单
        loginForm.submit();
    });
});