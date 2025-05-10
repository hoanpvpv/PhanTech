package vn.giaiphapthangmay.phantech.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import vn.giaiphapthangmay.phantech.domain.Product;
import vn.giaiphapthangmay.phantech.domain.RequestItem;
import vn.giaiphapthangmay.phantech.domain.RequestList;
import vn.giaiphapthangmay.phantech.domain.Review;
import vn.giaiphapthangmay.phantech.domain.Service;
import vn.giaiphapthangmay.phantech.domain.User;
import vn.giaiphapthangmay.phantech.repository.ReviewRepository;
import vn.giaiphapthangmay.phantech.domain.RequestList;
import vn.giaiphapthangmay.phantech.service.ProductService;
import vn.giaiphapthangmay.phantech.service.RequestListService;
import vn.giaiphapthangmay.phantech.service.ServiceService;
import vn.giaiphapthangmay.phantech.service.UploadService;
import vn.giaiphapthangmay.phantech.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class HistoryController {
    private final UserService userService;
    private final ProductService productService;
    private final ServiceService serviceService;
    private final RequestListService requestListService;
    private final UploadService uploadService;
    private final ReviewRepository reviewRepository;

    public HistoryController(
            UserService userService, ProductService productService, ServiceService serviceService,
            RequestListService requestListService, UploadService uploadService, ReviewRepository reviewRepository) {
        this.reviewRepository = reviewRepository;
        this.uploadService = uploadService;
        this.requestListService = requestListService;
        this.userService = userService;
        this.productService = productService;
        this.serviceService = serviceService;
    }

    @GetMapping("/history")
    public String getHistoryRequest(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession(false);
        User currentUser = userService.getUserById((long) session.getAttribute("id"));
        if (currentUser == null) {
            return "redirect:/login";
        }
        List<RequestList> requestLists = this.requestListService.getRequestListByUserId(currentUser.getId());
        model.addAttribute("requestLists", requestLists);
        return "client/history/show";
    }

    @GetMapping("/history/{id}")
    public String getHistoryRequestDetail(@PathVariable("id") long id, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long userId = (long) session.getAttribute("id");
        RequestList requestList = this.requestListService.getRequestListById(id);
        if (requestList == null) {
            return "redirect:/history";
        }
        List<RequestItem> requestItems = requestList.getRequestItems();
        if (requestItems == null) {
            requestItems = new ArrayList<>();
        } else if (requestItems.get(0).getRequestList().getUser().getId() != userId) {
            return "redirect:/access-denied";
        }
        model.addAttribute("Items", requestItems);
        return "client/history/detail";
    }

    @PostMapping("/review")
    public String reviewRequest(@RequestParam("itemId") long itemId,
            @RequestParam("productId") long productId,
            @RequestParam("serviceId") long serviceId,
            @RequestParam("rating") int rating,
            @RequestParam("content") String content,
            @RequestParam("imageFile1") MultipartFile imageFile1,
            @RequestParam("imageFile2") MultipartFile imageFile2, // Sửa tên tham số
            @RequestParam("imageFile3") MultipartFile imageFile3, // Sửa tên tham số
            HttpServletRequest request, RedirectAttributes redirectAttributes) {

        try {
            HttpSession session = request.getSession(false);
            long userId = (long) session.getAttribute("id");
            User user = this.userService.getUserById(userId);

            // Lấy RequestItem và kiểm tra quyền sở hữu
            RequestItem requestItem = this.requestListService.getRequestItemById(itemId);
            if (requestItem == null || userId != requestItem.getRequestList().getUser().getId()) {
                return "redirect:/access-denied";
            }

            // Kiểm tra nếu item đã được đánh giá
            if (requestItem.getCanReview() == "DONE") {
                redirectAttributes.addFlashAttribute("errorMessage", "Sản phẩm/dịch vụ này đã được đánh giá!");
                return "redirect:/history/" + requestItem.getRequestList().getId();
            }

            // Tạo review mới
            Review review = new Review();
            review.setUser(user);
            review.setRating(rating);
            review.setContent(content);
            review.setCreatedAt(java.time.LocalDateTime.now());

            // Xử lý upload hình ảnh
            if (!imageFile1.isEmpty()) {
                review.setImage1(this.uploadService.handleSaveUploadFile(imageFile1, "public"));
            }
            if (!imageFile2.isEmpty()) {
                review.setImage2(this.uploadService.handleSaveUploadFile(imageFile2, "public"));
            }
            if (!imageFile3.isEmpty()) {
                review.setImage3(this.uploadService.handleSaveUploadFile(imageFile3, "public"));
            }

            // Xử lý đánh giá sản phẩm
            if (productId != 0) {
                Product product = this.productService.getProductById(productId).orElse(null);
                if (product == null) {
                    redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy sản phẩm!");
                    return "redirect:/history";
                }

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
                this.productService.saveProduct(product);

            } else if (serviceId != 0) {
                Service service = this.serviceService.getServiceById(serviceId);
                if (service == null) {
                    redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy dịch vụ!");
                    return "redirect:/history";
                }

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
                this.serviceService.saveService(service);
            } else {
                redirectAttributes.addFlashAttribute("errorMessage",
                        "Vui lòng chọn sản phẩm hoặc dịch vụ để đánh giá!");
                return "redirect:/history";
            }

            // Lưu review và cập nhật RequestItem
            this.reviewRepository.save(review);

            // Đánh dấu item đã được review
            requestItem.setCanReview("DONE");
            this.requestListService.saveRequestItem(requestItem);

            redirectAttributes.addFlashAttribute("successMessage", "Đánh giá của bạn đã được gửi thành công!");
            return "redirect:/history";

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Đã xảy ra lỗi khi gửi đánh giá: " + e.getMessage());
            return "redirect:/history";
        }
    }

}