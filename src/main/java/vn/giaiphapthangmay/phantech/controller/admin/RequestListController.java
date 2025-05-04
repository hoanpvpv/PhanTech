package vn.giaiphapthangmay.phantech.controller.admin;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import vn.giaiphapthangmay.phantech.domain.ElevatorType;
import vn.giaiphapthangmay.phantech.domain.Manufacturer;
import vn.giaiphapthangmay.phantech.domain.Product;
import vn.giaiphapthangmay.phantech.domain.Service;
import vn.giaiphapthangmay.phantech.domain.RequestItem;
import vn.giaiphapthangmay.phantech.domain.RequestList;
import vn.giaiphapthangmay.phantech.repository.ElevatorTypeRepository;
import vn.giaiphapthangmay.phantech.repository.ManufacturerRepository;
import vn.giaiphapthangmay.phantech.service.ProductService;
import vn.giaiphapthangmay.phantech.service.RequestListService;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
@RequestMapping("/admin/request-list")
public class RequestListController {
    private final RequestListService requestListService;

    public RequestListController(RequestListService requestListService) {
        this.requestListService = requestListService;
    }

    @GetMapping("")
    public String getRequestListPage(Model model,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size) {
        Pageable pageable = PageRequest.of(page - 1, size, Sort.by("create_at").descending());
        Page<RequestList> requestListPage = requestListService.getAllRequestLists(pageable);

        model.addAttribute("requestLists", requestListPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", requestListPage.getTotalPages());
        model.addAttribute("totalItems", requestListPage.getTotalElements());
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
        RequestList requestList = requestListService.getRequestListById(id);
        if (requestList != null) {
            requestList.setStatus(status);
            requestList.setMessage(message);
            requestList.setUpdateStatusdAt(LocalDateTime.now());
            requestListService.saveRequestList(requestList);
        }
        return "redirect:/admin/request-list";
    }

    @PostMapping("/allow-to-review")
    public String allowToReview(@RequestParam("RequestItemId") long id) {
        RequestItem requestItem = requestListService.getRequestItemById(id);
        if (requestItem != null) {
            requestItem.setCanReview(true);
            requestListService.saveRequestItem(requestItem);
        }
        return "redirect:/admin/request-list";
    }
}