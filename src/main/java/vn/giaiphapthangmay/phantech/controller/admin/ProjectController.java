package vn.giaiphapthangmay.phantech.controller.admin;

import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;

import vn.giaiphapthangmay.phantech.domain.Product;
import vn.giaiphapthangmay.phantech.domain.Project;
import vn.giaiphapthangmay.phantech.domain.Service;
import vn.giaiphapthangmay.phantech.repository.ServiceRepository;
import vn.giaiphapthangmay.phantech.service.ProductService;
import vn.giaiphapthangmay.phantech.service.ProjectService;

@Controller
@RequestMapping("/admin/project")
public class ProjectController {

    private final ProjectService projectService;
    private final ServiceRepository serviceRepository;
    private final ProductService productService;

    public ProjectController(ProjectService projectService, ServiceRepository serviceRepository,
            ProductService productService) {
        this.projectService = projectService;
        this.serviceRepository = serviceRepository;
        this.productService = productService;

    }

    @GetMapping("")
    public String getProjectPage(Model model,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size) {
        Pageable pageable = PageRequest.of(page - 1, size, Sort.by("id").descending());
        Page<Project> projectPage = projectService.getAllProjects(page, size);

        model.addAttribute("projects", projectPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", projectPage.getTotalPages());
        model.addAttribute("totalItems", projectPage.getTotalElements());

        return "admin/project/show";
    }

    @GetMapping("/create")
    public String getCreateProjectPage(Model model) {
        model.addAttribute("project", new Project());
        List<Service> services = serviceRepository.findAll();
        model.addAttribute("services", services);
        return "admin/project/create";
    }

    @PostMapping("/create")
    public String createProject(@ModelAttribute Project project,
            @RequestParam(value = "product.id", required = false) Long productId,
            @RequestParam("imageFile") MultipartFile imageFile) throws IOException {

        // Gán productId trực tiếp vào product nếu có
        Product productUse = new Product();
        Optional<Product> productOpt = productService.getProductById(productId);
        productUse = productOpt.get();
        project.setProduct(productUse);
        projectService.createProject(project, imageFile);
        return "redirect:/admin/project";
    }

    @GetMapping("/edit/{id}")
    public String getEditProjectPage(@PathVariable long id, Model model) {
        Project project = projectService.getProjectById(id);
        if (project == null) {
            return "redirect:/admin/project";
        }
        model.addAttribute("project", project);
        List<Service> services = serviceRepository.findAll();
        model.addAttribute("services", services);

        return "admin/project/edit";
    }

    @PostMapping("/edit/{id}")
    public String updateProject(@PathVariable long id,
            @ModelAttribute Project project,
            @RequestParam(value = "product.id", required = false) Long productId,
            @RequestParam("imageFile") MultipartFile imageFile) throws IOException {

        Product productUse = new Product();
        Optional<Product> productOpt = productService.getProductById(productId);
        productUse = productOpt.get();
        project.setProduct(productUse);

        projectService.updatedProject(id, project, imageFile);
        return "redirect:/admin/project";

    }

    @GetMapping("/delete/{id}")
    public String deleteProject(@PathVariable long id) {
        projectService.deleteProject(id);
        return "redirect:/admin/project";
    }

    @PostMapping("/upload-image-project")
    public ResponseEntity<Map<String, String>> uploadImageForTinyMCE(@RequestParam("file") MultipartFile file)
            throws IOException {
        Map<String, String> response = projectService.uploadImageForTinyMCE(file);
        return ResponseEntity.ok(response);
    }
}