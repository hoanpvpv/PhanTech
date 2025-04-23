package vn.giaiphapthangmay.phantech.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.giaiphapthangmay.phantech.domain.Role;
import vn.giaiphapthangmay.phantech.domain.User;
import vn.giaiphapthangmay.phantech.service.UserService;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequestMapping("/admin/user")
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();
        List<Role> roles = this.userService.getAllRoles();
        model.addAttribute("roles", roles);
        model.addAttribute("users", users);
        return "admin/user/show";
    }

    @PostMapping("/update-role")
    public String updateRole(@RequestParam Long userId, @RequestParam Long roleId) {
        User user = userService.getUserById(userId);
        Role role = userService.getRoleById(roleId); // Thay đổi phương thức để lấy role bằng ID

        if (user != null && role != null) {
            user.setRole(role);
            userService.handleSaveUser(user);
        }
        return "redirect:/admin/user";
    }

    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable Long id) {
        // Gọi service để xóa user
        userService.deleteUser(id);
        return "redirect:/admin/user";
    }

}
