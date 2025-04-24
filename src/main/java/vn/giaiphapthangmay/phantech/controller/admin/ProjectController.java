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
import vn.giaiphapthangmay.phantech.repository.ProductRepository;
import vn.giaiphapthangmay.phantech.repository.ProjectRepository;
import vn.giaiphapthangmay.phantech.repository.ServiceRepository;
import vn.giaiphapthangmay.phantech.service.UploadService;
import vn.giaiphapthangmay.phantech.service.ProjectService;

@Controller
@RequestMapping("/admin/project")
public class ProjectController {

    private final ProjectService projectService;
    private final ServiceRepository serviceRepository;

    public ProjectController(ProjectService projectService, ServiceRepository serviceRepository) {
        this.projectService = projectService;
        this.serviceRepository = serviceRepository;

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

    // @GetMapping("/create")
    // public String getCreateProjectPage(Model model) {
    // model.addAttribute("project", new Project());

    // List<Product> products =
    // List<Service> services = serviceRepository.findAll();

    // model.addAttribute("products", products);
    // model.addAttribute("services", services);

    // return "admin/project/create";
    // }

    // @PostMapping("/create")
    // public String createProject(@ModelAttribute Project project,
    // @RequestParam("imageFile") MultipartFile imageFile) throws IOException {

    // if (!imageFile.isEmpty()) {
    // String imagePath = uploadService.handleSaveUploadFile(imageFile, "project");
    // project.setImage(imagePath);
    // }

    // projectRepository.save(project);
    // return "redirect:/admin/project";
    // }

    // @GetMapping("/edit/{id}")
    // public String getEditProjectPage(@PathVariable long id, Model model) {
    // Optional<Project> projectOpt = projectRepository.findById(id);
    // if (projectOpt.isPresent()) {
    // Project project = projectOpt.get();
    // model.addAttribute("project", project);

    // List<Product> products = productRepository.findAll();
    // List<Service> services = serviceRepository.findAll();

    // model.addAttribute("products", products);
    // model.addAttribute("services", services);

    // return "admin/project/edit";
    // }
    // return "redirect:/admin/project";
    // }

    // @PostMapping("/edit/{id}")
    // public String updateProject(@PathVariable long id,
    // @ModelAttribute Project project,
    // @RequestParam("imageFile") MultipartFile imageFile) throws IOException {

    // Optional<Project> existingOpt = projectRepository.findById(id);
    // if (existingOpt.isPresent()) {
    // Project existing = existingOpt.get();

    // existing.setName(project.getName());
    // existing.setDescription(project.getDescription());
    // existing.setAddress(project.getAddress());
    // existing.setProduct(project.getProduct());
    // existing.setService(project.getService());

    // if (!imageFile.isEmpty()) {
    // String imagePath = uploadService.handleSaveUploadFile(imageFile, "public");
    // existing.setImage(imagePath);
    // }

    // projectRepository.save(existing);
    // }

    // return "redirect:/admin/project";
    // }

    // @GetMapping("/delete/{id}")
    // public String deleteProject(@PathVariable long id) {
    // projectRepository.deleteById(id);
    // return "redirect:/admin/project";
    // }

    // @PostMapping("/upload-image-product")
    // public ResponseEntity<Map<String, String>>
    // uploadImageForTinyMCE(@RequestParam("file") MultipartFile file)
    // throws IOException {
    // Map<String, String> response = projectService.uploadImageForProject(file);
    // return ResponseEntity.ok(response);
    // }
}