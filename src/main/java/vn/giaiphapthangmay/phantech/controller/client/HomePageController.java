package vn.giaiphapthangmay.phantech.controller.client;

import org.springframework.boot.autoconfigure.integration.IntegrationProperties.RSocket.Client;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Provider.Service;
import java.time.LocalDateTime;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import vn.giaiphapthangmay.phantech.domain.ClientRequestList;
import vn.giaiphapthangmay.phantech.domain.ElevatorType;
import vn.giaiphapthangmay.phantech.domain.Product;
import vn.giaiphapthangmay.phantech.domain.Project;
import vn.giaiphapthangmay.phantech.domain.Review;
import vn.giaiphapthangmay.phantech.domain.Form;
import vn.giaiphapthangmay.phantech.domain.User;
import vn.giaiphapthangmay.phantech.domain.dto.RegisterDTO;
import vn.giaiphapthangmay.phantech.repository.ElevatorTypeRepository;
import vn.giaiphapthangmay.phantech.repository.FormRepository;
import vn.giaiphapthangmay.phantech.service.ClientRequestListService;
import vn.giaiphapthangmay.phantech.service.ElevatorTypeService;
import vn.giaiphapthangmay.phantech.service.ProductService;
import vn.giaiphapthangmay.phantech.service.ProjectService;
import vn.giaiphapthangmay.phantech.service.ReviewService;
import vn.giaiphapthangmay.phantech.service.ServiceService;
import vn.giaiphapthangmay.phantech.service.UserService;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class HomePageController {
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final ProductService productService;
    private final ProjectService projectService;
    private final ClientRequestListService clientRequestListService;
    private final FormRepository formRepository;
    private final ServiceService serviceService;
    private final ElevatorTypeService elevatorTypeService;
    private final ReviewService reviewService;

    public HomePageController(ElevatorTypeService elevatorTypeService, UserService userService,
            PasswordEncoder passwordEncoder,
            ProductService productService, ProjectService projectService,
            ClientRequestListService clientRequestListService, FormRepository formRepository,
            ServiceService serviceService, ReviewService reviewService) {
        this.reviewService = reviewService;
        this.userService = userService;
        this.projectService = projectService;
        this.productService = productService;
        this.passwordEncoder = passwordEncoder;
        this.clientRequestListService = clientRequestListService;
        this.formRepository = formRepository;
        this.serviceService = serviceService;
        this.elevatorTypeService = elevatorTypeService;
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerDTO", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleRegister(@ModelAttribute("registerDTO") @Valid RegisterDTO registerDTO,
            BindingResult bindingResult, Model model) {
        String phone = registerDTO.getPhone();
        if (phone != null && !phone.isEmpty()) {
            if (!phone.matches("^[0-9]+$")) {
                bindingResult.rejectValue("phone", "error.phone", "Số điện thoại chỉ được chứa các chữ số!");
            } else if (phone.length() < 10) {
                bindingResult.rejectValue("phone", "error.phone", "Số điện thoại phải có ít nhất 10 chữ số!");
            }
        }
        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }
        User user = this.userService.registerDTOtoUser(registerDTO);
        user.setPassword(this.passwordEncoder.encode(user.getPassword()));
        user.setRole(this.userService.getRoleByName("USER"));
        user.setCreatedAt(LocalDateTime.now());
        user.setClientRequestList(new ClientRequestList());
        this.clientRequestListService.saveClientRequestList(user.getClientRequestList());
        this.userService.handleSaveUser(user);
        return "redirect:/login";

    }

    @GetMapping("")
    public String getHomePage(Model model) {
        List<Product> products = this.productService.getPageProductForClient(null, null, null, null, null, null, null,
                null, null, "rating", "desc", 1).getContent();
        model.addAttribute("products", products);
        List<Project> projects = projectService.getAllProjects();
        model.addAttribute("projects", projects);
        List<vn.giaiphapthangmay.phantech.domain.Service> services = serviceService.getAllServices();
        model.addAttribute("services", services);
        List<ElevatorType> elevatorTypes = this.elevatorTypeService.getAllElevatorType();
        model.addAttribute("elevatorTypes", elevatorTypes);
        return "client/auth/index";
    }

    @GetMapping("/login")
    public String getLoginPage() {
        return "client/auth/login";
    }

    @GetMapping("/about")
    public String getAboutPage() {
        return "client/auth/about";
    }

    @GetMapping("/access-denied")
    public String getAccessDeniedPage() {
        return "client/auth/access-denied";
    }

    @GetMapping("/profile")
    public String getUserProfile(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        User user = this.userService.getUserById((Long) session.getAttribute("id"));
        if (user == null) {
            return "redirect:/login";
        }
        model.addAttribute("user", user);
        return "client/auth/profile";
    }

    @PostMapping("/profile")
    public String handlerEditProfile(@RequestParam("fullName") String fullName,
            @RequestParam("phone") String phone,
            @RequestParam("address") String address, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        User user = this.userService.getUserById((Long) session.getAttribute("id"));
        if (user == null) {
            return "redirect:/login";
        }
        user.setFullName(fullName);
        user.setPhone(phone);
        user.setAddress(address);
        this.userService.handleSaveUser(user);
        return "redirect:/profile?edit=success";
    }

    @GetMapping("/edit-password")
    public String getEditPasswordPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        model.addAttribute("email", email);
        return "client/auth/edit-password";
    }

    @PostMapping("/edit-password")
    public String handlerEditPassword(
            @RequestParam("old-password") String oldPassword,
            @RequestParam("new-password") String newPassword,
            @RequestParam("confirm-password") String confirmPassword,
            HttpServletRequest request) {

        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User user = this.userService.getUserByEmail(email);

        // Kiểm tra mật khẩu xác nhận
        if (!newPassword.equals(confirmPassword)) {
            return "redirect:/edit-password?error=confirm-password";
        }

        // Kiểm tra mật khẩu cũ
        if (!passwordEncoder.matches(oldPassword, user.getPassword())) {
            return "redirect:/edit-password?error=old-password";
        }

        // Lưu mật khẩu mới
        user.setPassword(passwordEncoder.encode(newPassword));
        this.userService.handleSaveUser(user);

        return "redirect:/edit-password?success=change-password";
    }

    @GetMapping("/contact")
    public String getContactPage() {
        return "client/auth/contact";
    }

    @PostMapping("/submit-form-contact")
    public String handleContactForm(@RequestParam("name") String name, @RequestParam("address") String address,
            @RequestParam("email") String email, @RequestParam("phone") String phone,
            @RequestParam("message") String message) {
        this.formRepository.save(new Form(name, phone, email, address, message));
        return "redirect:/contact?success=send-message";
    }

    @GetMapping("/service/{id}")
    public String getServiceDetail(@PathVariable("id") long id, Model model) {
        vn.giaiphapthangmay.phantech.domain.Service service = serviceService.getServiceById(id);
        model.addAttribute("service", service);
        List<Review> reviews = reviewService.getNewReviewsOfService(id);
        List<Project> projects = projectService.getNewProjectsByServiceId(id);
        model.addAttribute("projects", projects);
        model.addAttribute("reviews", reviews);
        return "client/service/detail";

    }

}