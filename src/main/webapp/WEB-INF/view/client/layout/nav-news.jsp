<!-- component/nav-news.html -->
<section id="news" class="container my-5">
    <h2 class="text-center text-primary mb-4 position-relative">
        Tin tức & Blog
        <span class="underline-effect"></span>
    </h2>
    <div class="row" id="news-container">
        <!-- Các tin tức sẽ được tải vào đây -->
    </div>
    <!-- Pagination -->
    <nav aria-label="News pagination">
        <ul class="pagination justify-content-center" id="pagination-container">
            <li class="page-item disabled" id="prev-page"><a class="page-link" href="#"><i class="ti-angle-left"></i>
                    Trước</a></li>
            <!-- Các nút trang sẽ được tạo động -->
            <li class="page-item disabled" id="next-page"><a class="page-link" href="#">Sau <i
                        class="ti-angle-right"></i></a></li>
        </ul>
    </nav>
</section>