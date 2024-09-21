document.addEventListener('DOMContentLoaded', function() {
    // 获取所有具有 'add-to-wishlist' 类的元素
    var wishlistButtons = document.getElementsByClassName('add-to-wishlist');

    Array.from(wishlistButtons).forEach(function(button) {
        button.addEventListener('click', function() {
            var productId = this.getAttribute('data-id')
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'http://localhost:8080/website/add?productId='+productId, true);

            xhr.send();
        });
    });
});
