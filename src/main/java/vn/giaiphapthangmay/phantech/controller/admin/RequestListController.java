package vn.giaiphapthangmay.phantech.controller.admin;

import java.time.LocalDateTime;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import vn.giaiphapthangmay.phantech.domain.RequestItem;
import vn.giaiphapthangmay.phantech.domain.RequestList;
import vn.giaiphapthangmay.phantech.service.RequestListService;

@Controller
@RequestMapping("/admin/request-list")
public class RequestListController {
    private final RequestListService requestListService;

    public RequestListController(RequestListService requestListService) {
        this.requestListService = requestListService;
    }

    @GetMapping("")
    public String getRequestLists(
            Model model,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime fromDate,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime toDate,
            @RequestParam(required = false) String status,
            @RequestParam(required = false) String userEmail,
            @RequestParam(defaultValue = "1") int page) {

        Pageable pageable = PageRequest.of(page - 1, 10, Sort.by("createdAt").descending());

        Page<RequestList> requests = requestListService.findRequestListsByFilters(
                fromDate, toDate, status, userEmail, pageable);

        model.addAttribute("requests", requests.getContent());
        model.addAttribute("fromDate", fromDate);
        model.addAttribute("toDate", toDate);
        model.addAttribute("status", status);
        model.addAttribute("userEmail", userEmail);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", requests.getTotalPages());
        model.addAttribute("totalItems", requests.getTotalElements());
        model.addAttribute("totalElements", requests.getTotalElements());
        System.out.println("Total elements: " + requests.getTotalElements());
        return "admin/request-list/show";
    }

    @GetMapping("/{id}")
    public String getRequestListDetailPage(@PathVariable("id") long id, Model model) {
        RequestList requestList = requestListService.getRequestListById(id);
        if (requestList == null) {
            return "redirect:/admin/request-list";
        }
        List<RequestItem> requestItems = requestList.getRequestItems();
        model.addAttribute("Items", requestItems);
        model.addAttribute("requestList", requestList);
        return "admin/request-list/detail";
    }

    @PostMapping("/update-status")
    public String updateStateOfRequestList(@RequestParam("requestListId") long id,
            @RequestParam("status") String status, @RequestParam("message") String message) {
        this.requestListService.updateStatusOfRequestList(id, status, message);
        return "redirect:/admin/request-list/" + id;
    }

    @PostMapping("/allow-to-review")
    public String allowToReview(@RequestParam("RequestItemId") long id) {
        this.requestListService.allowToReview(id);
        long requestListId = this.requestListService.getRequestItemById(id).getRequestList().getId();
        return "redirect:/admin/request-list/" + requestListId;
    }
}