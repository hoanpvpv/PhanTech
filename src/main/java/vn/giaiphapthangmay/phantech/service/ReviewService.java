package vn.giaiphapthangmay.phantech.service;

import java.util.List;
import java.util.stream.Collectors;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.Sort;
import vn.giaiphapthangmay.phantech.domain.Product;
import vn.giaiphapthangmay.phantech.domain.Review;
import vn.giaiphapthangmay.phantech.repository.ReviewRepository;

@Service
public class ReviewService {
    private final ReviewRepository reviewRepository;

    public ReviewService(ReviewRepository reviewRepository) {
        this.reviewRepository = reviewRepository;

    }

    public void saveReview(Review review) {
        reviewRepository.save(review);
    }

    public void deleteReview(Long id) {
        reviewRepository.deleteById(id);
    }

    public Review getReviewById(Long id) {
        return reviewRepository.findById(id).orElse(null);
    }

    public List<Review> getPageReviews(int page) {
        Pageable pageable = PageRequest.of(page - 1, 10);
        return reviewRepository.findAll(pageable).getContent();
    }

    public List<Review> getNewReviewsOfProduct(Long productId) {
        Pageable pageable = PageRequest.of(0, 8, Sort.by("createdAt").descending());
        return reviewRepository.findByProductId(productId, pageable).getContent();

    }

    public List<Review> getNewReviewsOfService(long id) {
        Pageable pageable = PageRequest.of(0, 8, Sort.by("createdAt").descending());
        return this.reviewRepository.findAllByServiceId(id, pageable).getContent();
    }

}
