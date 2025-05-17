package vn.giaiphapthangmay.phantech.controller.client;

import java.time.LocalDateTime;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import vn.giaiphapthangmay.phantech.domain.ClientRequestList;
import vn.giaiphapthangmay.phantech.domain.User;
import vn.giaiphapthangmay.phantech.domain.dto.RegisterDTO;
import vn.giaiphapthangmay.phantech.service.ClientRequestListService;
import vn.giaiphapthangmay.phantech.service.UserService;

@Controller
public class ClientController {
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final ClientRequestListService clientRequestListService;

    public ClientController(UserService userService, PasswordEncoder passwordEncoder,
            ClientRequestListService clientRequestListService) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.clientRequestListService = clientRequestListService;

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
