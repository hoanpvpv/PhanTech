package vn.giaiphapthangmay.phantech.controller.client;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import vn.giaiphapthangmay.phantech.domain.Service;
import vn.giaiphapthangmay.phantech.domain.Project;
import vn.giaiphapthangmay.phantech.service.ProductService;
import vn.giaiphapthangmay.phantech.service.ProjectService;
import vn.giaiphapthangmay.phantech.service.ServiceService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/project")
public class ClientProjectController {

    private final ProjectService projectService;
    private final ServiceService serviceService;

    public ClientProjectController(ProjectService projectService, ServiceService serviceService,
            ProductService productService) {
        this.projectService = projectService;
        this.serviceService = serviceService;
    }

    @GetMapping("")
    public String getProjectListPage(Model model, @RequestParam(required = false) String name,
            @RequestParam(required = false) String address,
            @RequestParam(required = false) String productName,
            @RequestParam(required = false) Long serviceId,

            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "date") String sort) {

        List<Service> services = this.serviceService.getAllServices();
        Pageable pageable = PageRequest.of(page - 1, 9, Sort.by(sort).descending());
        Page<Project> projectPage = projectService.getPageProjectForClient(name, address, productName, serviceId,
                pageable);
        model.addAttribute("services", services);
        model.addAttribute("projectPage", projectPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", projectPage.getTotalPages());
        model.addAttribute("totalElements", projectPage.getTotalElements());
        model.addAttribute("name", name);
        model.addAttribute("address", address);
        model.addAttribute("productName", productName);
        model.addAttribute("serviceId", serviceId);
        model.addAttribute("sort", sort);
        return "client/project/show";
    }

    @GetMapping("/{id}")
    public String getProjectDetail(@PathVariable("id") long id, Model model) {
        Project project = projectService.getProjectById(id);
        model.addAttribute("project", project);
        return "client/project/detail";

    }

}
