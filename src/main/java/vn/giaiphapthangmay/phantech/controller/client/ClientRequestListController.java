package vn.giaiphapthangmay.phantech.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import vn.giaiphapthangmay.phantech.domain.Product;
import vn.giaiphapthangmay.phantech.domain.RequestItem;
import vn.giaiphapthangmay.phantech.domain.RequestList;
import vn.giaiphapthangmay.phantech.domain.Service;
import vn.giaiphapthangmay.phantech.domain.User;
import vn.giaiphapthangmay.phantech.domain.RequestList;
import vn.giaiphapthangmay.phantech.domain.ClientRequestItem;
import vn.giaiphapthangmay.phantech.domain.ClientRequestList;
import vn.giaiphapthangmay.phantech.service.ClientRequestListService;
import vn.giaiphapthangmay.phantech.service.ProductService;
import vn.giaiphapthangmay.phantech.service.RequestListService;
import vn.giaiphapthangmay.phantech.service.ServiceService;
import vn.giaiphapthangmay.phantech.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ClientRequestListController {
    private final ClientRequestListService clientRequestListService;
    private final UserService userService;
    private final ProductService productService;
    private final ServiceService serviceService;
    private final RequestListService requestListService;

    public ClientRequestListController(ClientRequestListService clientRequestListService,
            UserService userService, ProductService productService, ServiceService serviceService,
            RequestListService requestListService) {
        this.requestListService = requestListService;
        this.clientRequestListService = clientRequestListService;
        this.userService = userService;
        this.productService = productService;
        this.serviceService = serviceService;
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
        User currentUser = userService.getUserById((long) session.getAttribute("id"));
        ClientRequestList clientRequestList = currentUser.getClientRequestList();
        List<ClientRequestItem> clientRequestItems = clientRequestList.getClientRequestItems();
        for (ClientRequestItem item : clientRequestItems) {
            if (item.getProduct() != null && item.getProduct().getId() == id) {
                return "redirect:/request-list";
            }
        }
        Product product = this.productService.getProductById(id).get();
        ClientRequestItem clientRequestItem = new ClientRequestItem();
        clientRequestItem.setProduct(product);
        clientRequestItem.setClientRequestList(clientRequestList);
        this.clientRequestListService.addClientRequestItem(clientRequestItem);
        return "redirect:/request-list";
    }

    @PostMapping("/add-service-to-request-list/{id}")
    public String addServiceToRequestList(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        User currentUser = userService.getUserById((long) session.getAttribute("id"));
        ClientRequestList clientRequestList = currentUser.getClientRequestList();
        List<ClientRequestItem> clientRequestItems = clientRequestList.getClientRequestItems();
        for (ClientRequestItem item : clientRequestItems) {
            if (item.getService() != null && item.getService().getId() == id) {
                return "redirect:/request-list";
            }
        }
        Service service = this.serviceService.getServiceById(id);
        ClientRequestItem clientRequestItem = new ClientRequestItem();
        clientRequestItem.setService(service);
        clientRequestItem.setClientRequestList(clientRequestList);
        this.clientRequestListService.addClientRequestItem(clientRequestItem);
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
    public String submitRequestList(HttpServletRequest request, @RequestParam("fullNameInfo") String fullNameInfo,
            @RequestParam("phoneInfo") String phoneInfo, @RequestParam("emailInfo") String emailInfo,
            @RequestParam("addressInfo") String addressInfo,
            @RequestParam("noteInfo") String noteInfo) {
        HttpSession session = request.getSession(false);
        User currentUser = userService.getUserById((long) session.getAttribute("id"));
        ClientRequestList clientRequestList = currentUser.getClientRequestList();
        List<ClientRequestItem> clientRequestItems = clientRequestList.getClientRequestItems();
        if (clientRequestItems.isEmpty()) {
            return "redirect:/request-list";
        }

        RequestList requestList = new RequestList();
        requestList.setStatus("PENDING");
        requestList.setAddressInfo(addressInfo);
        requestList.setEmailInfo(emailInfo);
        requestList.setFullNameInfo(fullNameInfo);
        requestList.setPhoneInfo(phoneInfo);
        requestList.setNoteInfo(noteInfo);
        requestList.setUser(currentUser);
        requestList.setCreatedAt(java.time.LocalDateTime.now());
        this.requestListService.saveRequestList(requestList);
        for (ClientRequestItem item : clientRequestItems) {
            RequestItem requestItem = new RequestItem();
            requestItem.setProduct(item.getProduct());
            requestItem.setService(item.getService());
            requestItem.setRequestList(requestList);
            requestItem.setCanReview(false);
            this.requestListService.saveRequestItem(requestItem);
            this.clientRequestListService.deleteClientRequestItem(item.getId());
        }

        return "redirect:/request-list";
    }

}