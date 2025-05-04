package vn.giaiphapthangmay.phantech.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import vn.giaiphapthangmay.phantech.domain.Product;
import vn.giaiphapthangmay.phantech.domain.User;
import vn.giaiphapthangmay.phantech.domain.ClientRequestItem;
import vn.giaiphapthangmay.phantech.domain.ClientRequestList;
import vn.giaiphapthangmay.phantech.service.ClientRequestListService;
import vn.giaiphapthangmay.phantech.service.ProductService;
import vn.giaiphapthangmay.phantech.service.ServiceService;
import vn.giaiphapthangmay.phantech.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ClientRequestListController {
    private final ClientRequestListService clientRequestListService;
    private final UserService userService;
    private final ProductService productService;
    private final ServiceService serviceService;

    public ClientRequestListController(ClientRequestListService clientRequestListService,
            UserService userService, ProductService productService, ServiceService serviceService) {
        this.clientRequestListService = clientRequestListService;
        this.userService = userService;
        this.productService = productService;
        this.serviceService = serviceService;
    }

    @GetMapping("/request-list")
    public String getClientRequestListPage(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession(false); // Lấy session từ request
        User currentUser = userService.getUserById((long) session.getAttribute("id"));
        if (currentUser == null) {
            return "redirect:/login"; // Nếu không có người dùng, chuyển hướng đến trang đăng nhập
        }
        ClientRequestList clientRequestList = currentUser.getClientRequestList();
        List<ClientRequestItem> clientRequestItems = clientRequestList.getClientRequestItems();
        model.addAttribute("ClientRequestItems", clientRequestItems);
        return "client/request-list"; // Trả về trang danh sách yêu cầu
    }

}
