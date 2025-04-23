package vn.giaiphapthangmay.phantech.controller.client;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import java.time.LocalDateTime;
import jakarta.validation.Valid;
import vn.giaiphapthangmay.phantech.domain.User;
import vn.giaiphapthangmay.phantech.domain.dto.RegisterDTO;
import vn.giaiphapthangmay.phantech.service.ProductService;
import vn.giaiphapthangmay.phantech.service.UserService;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

@Controller
public class HomePageController {
    // private final ProductService productService; // Khai báo biến productService
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    public HomePageController(UserService userService, PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder; // Khởi tạo passwordEncoder từ BCryptPasswordEncoder
        this.userService = userService;
        // this.productService = productService; // Khởi tạo productService từ
        // ProductService
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
            // Kiểm tra số điện thoại chỉ chứa chữ số
            if (!phone.matches("^[0-9]+$")) {
                bindingResult.rejectValue("phone", "error.phone", "Số điện thoại chỉ được chứa các chữ số!");
            }
            // Kiểm tra số điện thoại có ít nhất 10 chữ số
            else if (phone.length() < 10) {
                bindingResult.rejectValue("phone", "error.phone", "Số điện thoại phải có ít nhất 10 chữ số!");
            }
        }
        // Kiểm tra lỗi validation từ RegisterDTO
        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }
        User user = this.userService.registerDTOtoUser(registerDTO);
        user.setPassword(this.passwordEncoder.encode(user.getPassword()));
        user.setRole(this.userService.getRoleByName("USER"));
        user.setCreatedAt(LocalDateTime.now());
        // Lưu user vào cơ sở dữ liệu
        this.userService.handleSaveUser(user);
        return "redirect:/login";

    }
}