package vn.giaiphapthangmay.phantech.controller.client;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import vn.giaiphapthangmay.phantech.domain.RequestItem;
import vn.giaiphapthangmay.phantech.domain.RequestList;
import vn.giaiphapthangmay.phantech.domain.User;
import vn.giaiphapthangmay.phantech.service.RequestListService;
import vn.giaiphapthangmay.phantech.service.ReviewService;
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
    private final RequestListService requestListService;
    private final ReviewService reviewService;

    public HistoryController(
            UserService userService,
            RequestListService requestListService, ReviewService reviewService) {
        this.requestListService = requestListService;
        this.userService = userService;
        this.reviewService = reviewService;
    }

    @GetMapping("/history")
    public String getHistoryRequest(HttpServletRequest request, Model model,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate fromDate,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate toDate,
            String status,
            @RequestParam(defaultValue = "1") int page) {
        HttpSession session = request.getSession(false);
        User currentUser = userService.getUserById((long) session.getAttribute("id"));
        if (currentUser == null) {
            return "redirect:/login";
        }

        Pageable pageable = PageRequest.of(page - 1, 10, Sort.by("id").descending());
        Page<RequestList> requestLists = this.requestListService.getPageRequestListForClient(currentUser.getId(),
                fromDate, toDate, status, pageable);
        model.addAttribute("requestLists", requestLists.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", requestLists.getTotalPages());
        model.addAttribute("totalItems", requestLists.getTotalElements());
        model.addAttribute("fromDate", fromDate);
        model.addAttribute("toDate", toDate);
        model.addAttribute("status", status);

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
            @RequestParam("rating") int rating,
            @RequestParam("content") String content,
            @RequestParam("imageFile1") MultipartFile imageFile1,
            @RequestParam("imageFile2") MultipartFile imageFile2,
            @RequestParam("imageFile3") MultipartFile imageFile3,
            HttpServletRequest request, RedirectAttributes redirectAttributes) {

        HttpSession session = request.getSession(false);
        long userId = (long) session.getAttribute("id");
        User user = this.userService.getUserById(userId);

        // kiểm tra quyền sở hữu
        RequestItem requestItem = this.requestListService.getRequestItemById(itemId);
        if (requestItem == null || userId != requestItem.getRequestList().getUser().getId()
                || !"YES".equals(requestItem.getCanReview()) || rating < 1 || rating > 5) {
            return "redirect:/access-denied";
        }

        boolean PorS = this.reviewService.saveReview(user, requestItem, content, rating,
                imageFile1, imageFile2, imageFile3);

        if (PorS) {
            return "redirect:/product/" + requestItem.getProduct().getId();
        } else {
            return "redirect:/service/" + requestItem.getService().getId();
        }

    }

}