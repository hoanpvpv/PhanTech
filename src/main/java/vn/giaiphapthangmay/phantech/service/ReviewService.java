package vn.giaiphapthangmay.phantech.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.data.domain.Pageable;
import org.apache.catalina.connector.Request;
import org.springframework.context.annotation.Lazy;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.persistence.criteria.Predicate;

import org.springframework.data.domain.Sort;
import vn.giaiphapthangmay.phantech.domain.Product;
import vn.giaiphapthangmay.phantech.domain.RequestItem;
import vn.giaiphapthangmay.phantech.domain.Review;
import vn.giaiphapthangmay.phantech.domain.User;
import vn.giaiphapthangmay.phantech.repository.ProductRepository;
import vn.giaiphapthangmay.phantech.repository.RequestItemRepository;
import vn.giaiphapthangmay.phantech.repository.ReviewRepository;
import vn.giaiphapthangmay.phantech.repository.ServiceRepository;
import org.springframework.data.jpa.domain.Specification;

@Service
public class ReviewService {
    private final ReviewRepository reviewRepository;
    private final UploadService uploadService;
    private final ProductRepository productRepository;
    private final ServiceRepository serviceRepository;
    private final RequestListService requestListService;

    public ReviewService(ReviewRepository reviewRepository, UploadService uploadService,
            ProductRepository productRepository, ServiceRepository serviceRepository,
            RequestListService requestListService, RequestItemRepository requestItemRepository) {
        this.reviewRepository = reviewRepository;
        this.uploadService = uploadService;
        this.productRepository = productRepository;
        this.serviceRepository = serviceRepository;
        this.requestListService = requestListService;

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

    public boolean saveReview(User user, RequestItem requestItem, String content, int rating,
            MultipartFile imageFile1, MultipartFile imageFile2, MultipartFile imageFile3) {
        Review review = new Review();
        review.setUser(user);
        review.setContent(content);
        review.setRating(rating);
        review.setCreatedAt(LocalDateTime.now());
        requestItem.setCanReview("DONE");
        if (!imageFile1.isEmpty()) {
            review.setImage1(this.uploadService.handleSaveUploadFile(imageFile1, "public"));
        }
        if (!imageFile2.isEmpty()) {
            review.setImage2(this.uploadService.handleSaveUploadFile(imageFile2, "public"));
        }
        if (!imageFile3.isEmpty()) {
            review.setImage3(this.uploadService.handleSaveUploadFile(imageFile3, "public"));
        }

        Product product = requestItem.getProduct();
        vn.giaiphapthangmay.phantech.domain.Service service = requestItem.getService();
        if (product != null) {
            review.setProduct(product);
            List<Review> reviews = product.getReviews();

            // Kiểm tra null và tính toán rating mới
            if (reviews == null || reviews.isEmpty()) {
                product.setRating(rating);
            } else {
                double sum = 0;
                for (Review r : reviews) {
                    sum += r.getRating();
                }
                // Làm tròn rating đến 1 chữ số thập phân
                double newRating = Math.round(((sum + rating) / (reviews.size() + 1)) * 10.0) / 10.0;
                product.setRating(newRating);
            }
            product.setReviewCount(product.getReviewCount() + 1);
            this.productRepository.save(product);
            this.reviewRepository.save(review);
            return true;
        } else {
            review.setService(service);
            List<Review> reviews = service.getReviews();

            // Kiểm tra null và tính toán rating mới
            if (reviews == null || reviews.isEmpty()) {
                service.setRating(rating);
            } else {
                double sum = 0;
                for (Review r : reviews) {
                    sum += r.getRating();
                }
                double newRating = Math.round(((sum + rating) / (reviews.size() + 1)) * 10.0) / 10.0;
                service.setRating(newRating);
            }
            service.setReviewCount(service.getReviewCount() + 1);
            this.serviceRepository.save(service);
            this.requestListService.saveRequestItem(requestItem);
            this.reviewRepository.save(review);
            return false;
        }

    }

    public Specification<Review> buildReviewFilterSpecification(
            String productName,
            String serviceName,
            Integer rating,
            LocalDateTime fromDate,
            LocalDateTime toDate) {

        return (root, query, criteriaBuilder) -> {
            List<Predicate> predicates = new ArrayList<>();

            // 1. Lọc theo tên sản phẩm (nếu có)
            if (productName != null && !productName.isEmpty()) {
                predicates.add(
                        criteriaBuilder.like(
                                criteriaBuilder.lower(root.get("product").get("name")),
                                "%" + productName.toLowerCase() + "%"));
            }

            // 2. Lọc theo tên dịch vụ (nếu có)
            if (serviceName != null && !serviceName.isEmpty()) {
                predicates.add(
                        criteriaBuilder.like(
                                criteriaBuilder.lower(root.get("service").get("name")),
                                "%" + serviceName.toLowerCase() + "%"));
            }

            // 3. Lọc theo số sao đánh giá (nếu có)
            if (rating != null) {
                predicates.add(criteriaBuilder.equal(root.get("rating"), rating));
            }

            // 4. Lọc theo khoảng thời gian
            if (fromDate != null) {
                predicates.add(
                        criteriaBuilder.greaterThanOrEqualTo(root.get("createdAt"), fromDate));
            }

            if (toDate != null) {

                predicates.add(
                        criteriaBuilder.lessThanOrEqualTo(root.get("createdAt"), toDate));
            }

            return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
        };
    }

    public Page<Review> findReviews(
            String productName,
            String serviceName,
            Integer rating,
            LocalDate fromDate,
            LocalDate toDate,
            int page,
            int size,
            String sortField,
            String sortDirection) {

        LocalDateTime fromDateTime = fromDate != null ? fromDate.atStartOfDay() : null;
        LocalDateTime toDateTime = toDate != null ? toDate.plusDays(1).atStartOfDay().minusSeconds(1) : null;

        Sort sort;
        if ("asc".equalsIgnoreCase(sortDirection)) {
            sort = Sort.by(sortField).ascending();
        } else {
            sort = Sort.by(sortField).descending();
        }

        Pageable pageable = PageRequest.of(page, size, sort);

        Specification<Review> spec = buildReviewFilterSpecification(
                productName, serviceName, rating, fromDateTime, toDateTime);

        return reviewRepository.findAll(spec, pageable);
    }
}
