package vn.giaiphapthangmay.phantech.controller.client;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import java.security.Provider.Service;
import java.util.List;

import vn.giaiphapthangmay.phantech.domain.Product;
import vn.giaiphapthangmay.phantech.domain.Project;
import vn.giaiphapthangmay.phantech.domain.Review;
import vn.giaiphapthangmay.phantech.service.ProductService;
import vn.giaiphapthangmay.phantech.service.ProjectService;
import vn.giaiphapthangmay.phantech.service.ReviewService;
import vn.giaiphapthangmay.phantech.service.ServiceService;
import org.springframework.ui.Model;

@Controller
public class ClientProductAndProjectAndServiceController {
    private final ProductService productService;
    private final ProjectService projectService;

    private final ReviewService reviewService;
    private final ServiceService serviceService;

    public ClientProductAndProjectAndServiceController(ServiceService serviceService, ReviewService reviewService,
            PasswordEncoder passwordEncoder,
            ProductService productService, ProjectService projectService) {

        this.projectService = projectService;
        this.productService = productService;
        this.reviewService = reviewService;
        this.serviceService = serviceService;

    }

    @GetMapping("/product/{id}")
    public String getProductDetail(@PathVariable("id") long id, Model model) {
        Product product = productService.getProductById(id).get();
        List<Project> projects = projectService.getNewProjectsByProductId(id);
        List<Review> reviews = reviewService.getNewReviewsOfProduct(id);
        model.addAttribute("product", product);
        model.addAttribute("projects", projects);
        model.addAttribute("reviews", reviews);
        return "client/product/detail";
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
