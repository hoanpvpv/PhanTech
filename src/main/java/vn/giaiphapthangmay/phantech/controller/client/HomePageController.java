package vn.giaiphapthangmay.phantech.controller.client;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.net.http.HttpRequest;
import java.time.LocalDateTime;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import vn.giaiphapthangmay.phantech.domain.Product;
import vn.giaiphapthangmay.phantech.domain.Project;
import vn.giaiphapthangmay.phantech.domain.User;
import vn.giaiphapthangmay.phantech.domain.dto.RegisterDTO;
import vn.giaiphapthangmay.phantech.service.ProductService;
import vn.giaiphapthangmay.phantech.service.ProjectService;
import vn.giaiphapthangmay.phantech.service.UserService;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestBody;;

@Controller
public class HomePageController {
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final ProductService productService;
    private final ProjectService projectService;

    public HomePageController(UserService userService, PasswordEncoder passwordEncoder,
            ProductService productService, ProjectService projectService) {
        this.userService = userService;
        this.projectService = projectService;
        this.productService = productService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerDTO", new RegisterDTO());
        return "client/auth/register"; // Trả về trang đăng ký
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
        this.userService.handleSaveUser(user);
        return "redirect:/login";

    }

    @GetMapping("")
    public String getHomePage(Model model) {
        List<Product> products = productService.getAllProducts();
        model.addAttribute("products", products);
        List<Project> projects = projectService.getAllProjects();
        model.addAttribute("projects", projects);
        return "client/auth/index"; // Trả về trang chính
    }

    @GetMapping("/product/{id}")
    public String getProductDetail(@PathVariable("id") long id, Model model) {
        Product product = productService.getProductById(id).get();
        List<Project> projects = projectService.getAllProjectsByProductId(id);
        model.addAttribute("product", product);
        model.addAttribute("projects", projects);
        return "client/product/detail"; // Trả về trang chi tiết sản phẩm
    }

    @GetMapping("/project")
    public String getListProject(Model model) {
        List<Project> projects = projectService.getAllProjects();
        model.addAttribute("projects", projects);
        return "client/project/show";
    }

    @GetMapping("/project/{id}")
    public String getProjectDetail(@PathVariable("id") long id, Model model) {
        Project project = projectService.getProjectById(id);
        model.addAttribute("project", project);
        return "client/project/detail";

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

}