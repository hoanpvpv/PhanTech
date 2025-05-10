package vn.giaiphapthangmay.phantech.controller.admin;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.format.annotation.DateTimeFormat;
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
import vn.giaiphapthangmay.phantech.service.ProductService;
import vn.giaiphapthangmay.phantech.service.ProjectService;
import vn.giaiphapthangmay.phantech.service.ServiceService;

@Controller
@RequestMapping("/admin/project")
public class ProjectController {

    private final ProjectService projectService;
    private final ServiceService serviceService;
    private final ProductService productService;

    public ProjectController(ProjectService projectService, ServiceService serviceService,
            ProductService productService) {
        this.projectService = projectService;
        this.serviceService = serviceService;
        this.productService = productService;

    }

    @GetMapping("")
    public String getProjectListPage(Model model,
            @RequestParam(required = false) String name,
            @RequestParam(required = false) String address,
            @RequestParam(required = false) String productName,
            @RequestParam(required = false) Long serviceId, // Thay đổi từ serviceName thành serviceId
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate fromDate,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate toDate,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "date") String sort) {

        Pageable pageable = PageRequest.of(page - 1, 10, Sort.by(sort).descending());

        // Cập nhật gọi service để dùng serviceId thay vì serviceName
        Page<Project> projectPage = projectService.getProjectsByPage(
                name, address, productName, serviceId, fromDate, toDate, pageable);

        model.addAttribute("projects", projectPage.getContent());

        // Thêm danh sách dịch vụ cho dropdown
        List<Service> services = serviceService.getAllServices();
        model.addAttribute("services", services);

        model.addAttribute("name", name);
        model.addAttribute("address", address);
        model.addAttribute("productName", productName);
        model.addAttribute("serviceId", serviceId); // Thay đổi từ serviceName thành serviceId
        model.addAttribute("fromDate", fromDate);
        model.addAttribute("toDate", toDate);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", projectPage.getTotalPages());
        model.addAttribute("totalItems", projectPage.getTotalElements());
        model.addAttribute("sort", sort);

        return "admin/project/show";
    }

    @GetMapping("/create")
    public String getCreateProjectPage(Model model) {
        model.addAttribute("project", new Project());
        List<Service> services = this.serviceService.getAllServices();
        model.addAttribute("services", services);
        return "admin/project/create";
    }

    @PostMapping("/create")
    public String createProject(@ModelAttribute Project project,
            @RequestParam(value = "product.id", required = false) Long productId,
            @RequestParam("imageFile") MultipartFile imageFile) throws IOException {

        Product productUse = new Product();
        Optional<Product> productOpt = productService.getProductById(productId);
        productUse = productOpt.get();
        project.setProduct(productUse);
        this.projectService.createProject(project, imageFile);
        return "redirect:/admin/project";
    }

    @GetMapping("/edit/{id}")
    public String getEditProjectPage(@PathVariable long id, Model model) {
        Project project = projectService.getProjectById(id);
        if (project == null) {
            return "redirect:/admin/project";
        }
        model.addAttribute("project", project);
        List<Service> services = this.serviceService.getAllServices();
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