// cart.js
function initCart() {
    // Kiểm tra xem các phần tử DOM đã tồn tại chưa
    const cartIcon = document.getElementById('cart-icon');
    const cartContent = document.getElementById('cart-content');
    const cartItems = document.getElementById('cart-items');
    const cartCount = document.getElementById('cart-count');
    const cartTotalPrice = document.getElementById('cart-total-price');

    if (!cartIcon || !cartContent || !cartItems || !cartCount || !cartTotalPrice) {
        console.error('Các phần tử DOM của giỏ hàng chưa sẵn sàng');
        setTimeout(initCart, 100); // Thử lại sau 100ms
        return;
    }

    let cart = JSON.parse(localStorage.getItem('cart')) || [];

    function updateCartCount() {
        cartCount.textContent = cart.length; // Chỉ đếm số yêu cầu
        cartTotalPrice.textContent = cart.length; // Tổng số yêu cầu
    }

    function updateCartContent() {
        cartItems.innerHTML = '';
        cart.forEach(item => {
            const cartItem = document.createElement('li');
            cartItem.className = 'list-group-item';
            cartItem.innerHTML = `
                <a href="/pages/product-detail.html?title=${encodeURIComponent(item.name)}" class="d-flex align-items-center text-decoration-none text-dark">
                    <img src="${item.image}" alt="${item.name}">
                    <span>${item.name}</span>
                </a>
                <button class="delete-btn">×</button>
            `;
            cartItem.querySelector('.delete-btn').onclick = () => {
                cart = cart.filter(cartItem => cartItem.name !== item.name);
                localStorage.setItem('cart', JSON.stringify(cart));
                updateCartContent();
            };
            cartItems.appendChild(cartItem);
        });
        updateCartCount();
    }

    // Sửa xử lý sự kiện click trên biểu tượng giỏ hàng
    function toggleCartContent(e) {
        e.preventDefault();
        e.stopPropagation(); // Ngăn sự kiện lan truyền
        console.log('Đã click vào biểu tượng giỏ hàng');
        cartContent.classList.toggle('show');
    }

    // Gỡ bỏ tất cả event listeners cũ nếu có
    const newCartIcon = cartIcon.cloneNode(true);
    cartIcon.parentNode.replaceChild(newCartIcon, cartIcon);

    // Thêm lại event listener mới
    newCartIcon.onclick = toggleCartContent;

    // Đảm bảo cả icon bên trong cũng nhận sự kiện click
    const iconElement = newCartIcon.querySelector('i');
    if (iconElement) {
        iconElement.onclick = toggleCartContent;
    }

    // Xử lý sự kiện click bên ngoài để đóng giỏ hàng
    document.addEventListener('click', (e) => {
        const miniCart = document.getElementById('mini-cart');
        if (miniCart && !miniCart.contains(e.target)) {
            cartContent.classList.remove('show');
        }
    });

    window.addToCart = function (product) {
        if (!cart.find(item => item.name === product.name)) {
            cart.push({ name: product.name, image: product.images[0] });
            localStorage.setItem('cart', JSON.stringify(cart));
            updateCartContent();
            alert(`Đã thêm "${product.name}" vào danh sách yêu cầu!`);
        } else {
            alert('Sản phẩm đã có trong danh sách yêu cầu!');
        }
    };

    updateCartContent();
    console.log('Giỏ hàng đã được khởi tạo thành công');

    // Thêm chức năng để hiển thị/ẩn giỏ hàng theo cách thủ công
    window.toggleCart = function () {
        console.log('Gọi toggleCart thủ công');
        cartContent.classList.toggle('show');
    };
}

// Khởi tạo cart khi trang đã tải xong
document.addEventListener('DOMContentLoaded', () => {
    // Chỉ khởi tạo nếu component đã được tải
    if (document.getElementById('mini-cart')) {
        console.log('Tìm thấy mini-cart, khởi tạo cart');
        setTimeout(initCart, 300);
    } else {
        console.log('Không tìm thấy mini-cart, sẽ kiểm tra lại sau');
        setTimeout(() => {
            if (document.getElementById('mini-cart')) {
                console.log('Đã tìm thấy mini-cart sau khi đợi');
                initCart();
            }
        }, 1000);
    }
});