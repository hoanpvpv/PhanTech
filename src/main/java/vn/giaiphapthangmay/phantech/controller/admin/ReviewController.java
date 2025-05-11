package vn.giaiphapthangmay.phantech.controller.admin;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import vn.giaiphapthangmay.phantech.domain.Review;
import vn.giaiphapthangmay.phantech.service.ReviewService;

@Controller
@RequestMapping("/admin/review")
public class ReviewController {
    public final ReviewService reviewService;

    public ReviewController(ReviewService reviewService) {
        this.reviewService = reviewService;
    }

    @GetMapping("")
    public String getListReview(
            Model model,
            @RequestParam(required = false) String productName,
            @RequestParam(required = false) String serviceName,
            @RequestParam(required = false) Integer rating,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate fromDate,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate toDate,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "createdAt") String sort,
            @RequestParam(defaultValue = "desc") String direction) {

        Page<Review> reviews = reviewService.findReviews(
                productName, serviceName, rating, fromDate, toDate,
                page - 1, 20, sort, direction);

        model.addAttribute("reviews", reviews.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", reviews.getTotalPages());
        model.addAttribute("totalItems", reviews.getTotalElements());

        model.addAttribute("productName", productName);
        model.addAttribute("serviceName", serviceName);
        model.addAttribute("rating", rating);
        model.addAttribute("fromDate", fromDate);
        model.addAttribute("toDate", toDate);
        model.addAttribute("sort", sort);
        model.addAttribute("direction", direction);

        return "admin/review/show";
    }

    @GetMapping("/{id}")
    public String getReviewDetailPage(@PathVariable Long id, Model model) {
        Review review = reviewService.getReviewById(id);
        model.addAttribute("review", review);
        return "admin/review/detail";
    }

    @PostMapping("/delete")
    public String deleteReview(@RequestParam("id") Long id) {
        reviewService.deleteReview(id);
        return "redirect:/admin/review";
    }
}
