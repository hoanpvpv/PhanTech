package vn.giaiphapthangmay.phantech.controller.admin;

import java.io.IOException;
import java.util.List;

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
    public String getReviewPage(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
        List<Review> reviews = reviewService.getPageReviews(page);
        model.addAttribute("reviews", reviews);
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
