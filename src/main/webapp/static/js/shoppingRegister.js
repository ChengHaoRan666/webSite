document.addEventListener('DOMContentLoaded', function() {
    var shoppingRegisterSubmitBtn = document.getElementById('shoppingRegisterSubmitBtn'); // 修改变量名以匹配HTML中的按钮ID
    var shoppingRegisterForm = document.getElementById('shoppingRegisterForm'); // 修改变量名以匹配HTML中的表单ID
    var termsCheckbox = document.getElementById('terms');
    var termsError = document.getElementById('termsError');

    shoppingRegisterSubmitBtn.addEventListener('click', function(event) {
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
        shoppingRegisterForm.submit();
    });
});
