package vn.giaiphapthangmay.phantech.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.giaiphapthangmay.phantech.domain.Review;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long> {
    // Có thể thêm các phương thức truy vấn tùy chỉnh ở đây
    List<Review> findAllByProductId(Long productId);

    Page<Review> findAllByServiceId(Long serviceId, Pageable pageable);

    Page<Review> findByProductId(long productId, Pageable pageable);

    Page<Review> findByServiceId(long id, Pageable pageable);
}