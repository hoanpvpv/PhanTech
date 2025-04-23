(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner(0);


    // Fixed Navbar
    $(window).scroll(function () {
        if ($(window).width() < 992) {
            if ($(this).scrollTop() > 55) {
                $('.fixed-top').addClass('shadow');
            } else {
                $('.fixed-top').removeClass('shadow');
            }
        } else {
            if ($(this).scrollTop() > 55) {
                $('.fixed-top').addClass('shadow').css('top', 0);
            } else {
                $('.fixed-top').removeClass('shadow').css('top', 0);
            }
        }
    });


    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({ scrollTop: 0 }, 1500, 'easeInOutExpo');
        return false;
    });


    // Testimonial carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 2000,
        center: false,
        dots: true,
        loop: true,
        margin: 25,
        nav: true,
        navText: [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsiveClass: true,
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 1
            },
            768: {
                items: 1
            },
            992: {
                items: 2
            },
            1200: {
                items: 2
            }
        }
    });


    // vegetable carousel
    $(".vegetable-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1500,
        center: false,
        dots: true,
        loop: true,
        margin: 25,
        nav: true,
        navText: [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsiveClass: true,
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 1
            },
            768: {
                items: 2
            },
            992: {
                items: 3
            },
            1200: {
                items: 4
            }
        }
    });


    // Modal Video
    $(document).ready(function () {
        var $videoSrc;
        $('.btn-play').click(function () {
            $videoSrc = $(this).data("src");
        });
        console.log($videoSrc);

        $('#videoModal').on('shown.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc + "?autoplay=1&amp;modestbranding=1&amp;showinfo=0");
        })

        $('#videoModal').on('hide.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc);
        })
    });




    $(document).ready(function () {
        // Xử lý nút tăng số lượng
        $('.btn-plus').on('click', function () {
            var row = $(this).closest('tr');
            var quantityInput = row.find('.quantity-input');
            var currentQuantity = parseInt(quantityInput.val());

            // Tăng số lượng
            quantityInput.val(currentQuantity + 1);

            // Cập nhật tổng tiền của sản phẩm
            updateProductTotal(row);

            // Cập nhật tổng tiền giỏ hàng
            updateCartTotal();

            // Gửi yêu cầu cập nhật lên server
            updateCartOnServer(row.data('id'), currentQuantity + 1);
        });

        // Xử lý nút giảm số lượng
        $('.btn-minus').on('click', function () {
            var row = $(this).closest('tr');
            var quantityInput = row.find('.quantity-input');
            var currentQuantity = parseInt(quantityInput.val());

            // Không giảm dưới 1
            if (currentQuantity > 1) {
                // Giảm số lượng
                quantityInput.val(currentQuantity - 1);

                // Cập nhật tổng tiền của sản phẩm
                updateProductTotal(row);

                // Cập nhật tổng tiền giỏ hàng
                updateCartTotal();

                // Gửi yêu cầu cập nhật lên server
                updateCartOnServer(row.data('id'), currentQuantity - 1);
            }
        });

        // Xử lý nút xóa sản phẩm
        $('.btn-remove').on('click', function () {
            var row = $(this).closest('tr');
            var cartDetailId = row.data('id');

            // Chuyển hướng đến URL xóa
            window.location.href = "/cart/remove/" + cartDetailId;
        });

        // Hàm cập nhật tổng tiền của một sản phẩm
        function updateProductTotal(row) {
            var price = parseFloat(row.data('price'));
            var quantity = parseInt(row.find('.quantity-input').val());
            var total = price * quantity;

            row.find('.product-total').text('$' + total.toFixed(2));
        }

        // Hàm cập nhật tổng tiền giỏ hàng
        function updateCartTotal() {
            var total = 0;

            // Tính tổng từ tất cả các sản phẩm
            $('tr[data-id]').each(function () {
                var productTotal = $(this).find('.product-total').text();
                total += parseFloat(productTotal.replace('$', ''));
            });

            // Cập nhật tổng tiền giỏ hàng
            $('#cart-total').text('$' + total.toFixed(2));
        }

        // Hàm gửi yêu cầu cập nhật lên server
        function updateCartOnServer(cartDetailId, quantity) {
            $.ajax({
                url: '/cart/update',
                type: 'POST',
                data: {
                    cartDetailId: cartDetailId,
                    quantity: quantity
                },
                success: function (response) {
                    console.log('Cập nhật giỏ hàng thành công');
                },
                error: function (error) {
                    console.error('Lỗi khi cập nhật giỏ hàng:', error);
                }
            });
        }
    })
})(jQuery);
