package vn.giaiphapthangmay.phantech.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

import vn.giaiphapthangmay.phantech.domain.ElevatorType;
import vn.giaiphapthangmay.phantech.domain.Product;
import vn.giaiphapthangmay.phantech.domain.Project;
import vn.giaiphapthangmay.phantech.domain.Review;
import vn.giaiphapthangmay.phantech.domain.Form;
import vn.giaiphapthangmay.phantech.service.ElevatorTypeService;
import vn.giaiphapthangmay.phantech.service.FormService;
import vn.giaiphapthangmay.phantech.service.ProductService;
import vn.giaiphapthangmay.phantech.service.ProjectService;
import vn.giaiphapthangmay.phantech.service.ReviewService;
import vn.giaiphapthangmay.phantech.service.ServiceService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomePageController {

    private final ProductService productService;
    private final ProjectService projectService;
    private final FormService formService;
    private final ServiceService serviceService;
    private final ElevatorTypeService elevatorTypeService;
    private final ReviewService reviewService;

    public HomePageController(ElevatorTypeService elevatorTypeService,
            ProductService productService, ProjectService projectService,
            FormService formService,
            ServiceService serviceService, ReviewService reviewService) {
        this.reviewService = reviewService;
        this.projectService = projectService;
        this.productService = productService;
        this.formService = formService;
        this.serviceService = serviceService;
        this.elevatorTypeService = elevatorTypeService;
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

    @GetMapping("/contact")
    public String getContactPage() {
        return "client/auth/contact";
    }

    @PostMapping("/submit-form-contact")
    public String handleContactForm(@RequestParam("name") String name, @RequestParam("address") String address,
            @RequestParam("email") String email, @RequestParam("phone") String phone,
            @RequestParam("message") String message) {
        this.formService.saveForm((new Form(name, phone, email, address, message)));
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