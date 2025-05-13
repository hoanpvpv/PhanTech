package vn.giaiphapthangmay.phantech.controller.client;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import vn.giaiphapthangmay.phantech.domain.RequestList;
import vn.giaiphapthangmay.phantech.domain.User;
import vn.giaiphapthangmay.phantech.domain.ClientRequestItem;
import vn.giaiphapthangmay.phantech.domain.ClientRequestList;
import vn.giaiphapthangmay.phantech.service.ClientRequestListService;
import vn.giaiphapthangmay.phantech.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ClientRequestListController {
    private final ClientRequestListService clientRequestListService;
    private final UserService userService;

    public ClientRequestListController(ClientRequestListService clientRequestListService,
            UserService userService) {

        this.clientRequestListService = clientRequestListService;
        this.userService = userService;
    }

    @GetMapping("/request-list")
    public String getClientRequestListPage(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession(false);
        User currentUser = userService.getUserById((long) session.getAttribute("id"));
        if (currentUser == null) {
            return "redirect:/login";
        }

        ClientRequestList clientRequestList = currentUser.getClientRequestList();
        if (clientRequestList == null) {
            clientRequestList = new ClientRequestList();
            clientRequestList.setUser(currentUser);
            this.clientRequestListService.saveClientRequestList(clientRequestList);
        }
        List<ClientRequestItem> clientRequestItems = clientRequestList.getClientRequestItems();
        model.addAttribute("Items", clientRequestItems);
        model.addAttribute("user", currentUser);
        return "client/request-list/show";
    }

    @PostMapping("/add-product-to-request-list/{id}")
    public String addProductToRequestList(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        this.clientRequestListService.addProduct(id, (long) session.getAttribute("id"));
        return "redirect:/request-list";
    }

    @PostMapping("/add-service-to-request-list/{id}")
    public String addServiceToRequestList(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        this.clientRequestListService.addService(id, (long) session.getAttribute("id"));
        return "redirect:/request-list";
    }

    @PostMapping("/remove-request-item")
    public String removeItemFromRequestList(@RequestParam("itemId") long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        User currentUser = userService.getUserById((long) session.getAttribute("id"));
        ClientRequestList clientRequestList = currentUser.getClientRequestList();
        List<ClientRequestItem> clientRequestItems = clientRequestList.getClientRequestItems();
        for (ClientRequestItem item : clientRequestItems) {
            if (item.getId() == id) {
                this.clientRequestListService.deleteClientRequestItem(id);
                break;
            }
        }
        return "redirect:/request-list";
    }

    @PostMapping("/submit-request-list")
    public String submitRequestList(HttpServletRequest request, @ModelAttribute RequestList requestList) {
        HttpSession session = request.getSession(false);
        requestList.setStatus("PENDING");
        requestList.setCreatedAt(java.time.LocalDateTime.now());
        this.clientRequestListService.createRequestList(requestList,
                (long) session.getAttribute("id"));
        return "redirect:/history";
    }
}