package vn.giaiphapthangmay.phantech.controller.client;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

import vn.giaiphapthangmay.phantech.domain.Product;
import vn.giaiphapthangmay.phantech.domain.Project;

import vn.giaiphapthangmay.phantech.service.ProductService;
import vn.giaiphapthangmay.phantech.service.ProjectService;
import vn.giaiphapthangmay.phantech.service.UserService;
import org.springframework.ui.Model;

@Controller
public class ClientProductAndProjectAndServiceController {
    private final ProductService productService;
    private final ProjectService projectService;
    private UserService userService;

    public ClientProductAndProjectAndServiceController(UserService userService, PasswordEncoder passwordEncoder,
            ProductService productService, ProjectService projectService) {
        this.userService = userService;
        this.projectService = projectService;
        this.productService = productService;

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

}
