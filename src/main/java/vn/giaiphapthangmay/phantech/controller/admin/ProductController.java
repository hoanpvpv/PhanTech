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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import vn.giaiphapthangmay.phantech.domain.ElevatorType;
import vn.giaiphapthangmay.phantech.domain.Manufacturer;
import vn.giaiphapthangmay.phantech.domain.Product;
import vn.giaiphapthangmay.phantech.repository.ElevatorTypeRepository;
import vn.giaiphapthangmay.phantech.repository.ManufacturerRepository;
import vn.giaiphapthangmay.phantech.service.ProductService;

@Controller
@RequestMapping("/admin/product")
public class ProductController {

    private final ProductService productService;
    private final ManufacturerRepository manufacturerRepository;
    private final ElevatorTypeRepository elevatorTypeRepository;

    public ProductController(ProductService productService,
            ManufacturerRepository manufacturerRepository,
            ElevatorTypeRepository elevatorTypRepository) {
        this.productService = productService;
        this.manufacturerRepository = manufacturerRepository;
        this.elevatorTypeRepository = elevatorTypRepository;

    }

    @GetMapping("")
    public String getProductPage(Model model,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size) {
        Pageable pageable = PageRequest.of(page - 1, size, Sort.by("id").descending());
        Page<Product> productPage = productService.getAllProducts(pageable);

        model.addAttribute("products", productPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", productPage.getTotalPages());
        model.addAttribute("totalItems", productPage.getTotalElements());

        return "admin/product/show";
    }

    @GetMapping("/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("product", new Product());

        List<Manufacturer> manufacturers = manufacturerRepository.findAll();
        List<ElevatorType> elevatorTypes = elevatorTypeRepository.findAll();

        model.addAttribute("manufacturers", manufacturers);
        model.addAttribute("elevatorTypes", elevatorTypes);

        return "admin/product/create";
    }

    @PostMapping("/create")
    public String createProduct(@ModelAttribute Product product,
            @RequestParam("imageFile1") MultipartFile imageFile1,
            @RequestParam("imageFile2") MultipartFile imageFile2,
            @RequestParam("imageFile3") MultipartFile imageFile3,
            @RequestParam("imageFile4") MultipartFile imageFile4,
            @RequestParam("imageFile5") MultipartFile imageFile5) throws IOException {

        Product newProduct = this.productService.createProduct(product, imageFile1, imageFile2, imageFile3, imageFile4,
                imageFile5);
        return "redirect:/admin/product/edit/" + newProduct.getId();
    }

    @GetMapping("/edit/{id}")
    public String getEditProductPage(@PathVariable long id, Model model) {
        Optional<Product> productOpt = productService.getProductById(id);
        if (productOpt.isPresent()) {
            Product product = productOpt.get();
            model.addAttribute("product", product);

            List<Manufacturer> manufacturers = manufacturerRepository.findAll();
            List<ElevatorType> elevatorTypes = elevatorTypeRepository.findAll();

            model.addAttribute("manufacturers", manufacturers);
            model.addAttribute("elevatorTypes", elevatorTypes);

            return "admin/product/edit";
        }
        return "redirect:/admin/product";
    }

    @PostMapping("/edit/{id}")
    public String updateProduct(@PathVariable long id,
            @ModelAttribute Product product,
            @RequestParam("imageFile1") MultipartFile imageFile1,
            @RequestParam("imageFile2") MultipartFile imageFile2,
            @RequestParam("imageFile3") MultipartFile imageFile3,
            @RequestParam("imageFile4") MultipartFile imageFile4,
            @RequestParam("imageFile5") MultipartFile imageFile5) throws IOException {

        productService.updateProduct(id, product, imageFile1, imageFile2, imageFile3, imageFile4, imageFile5);
        return "redirect:/admin/product";
    }

    @GetMapping("/delete/{id}")
    public String deleteProduct(@PathVariable long id) {
        productService.deleteProduct(id);
        return "redirect:/admin/product";
    }

    @PostMapping("/upload-image-product")
    public ResponseEntity<Map<String, String>> uploadImageForTinyMCE(@RequestParam("file") MultipartFile file)
            throws IOException {
        Map<String, String> response = productService.uploadImageForTinyMCE(file);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/search")
    @ResponseBody
    public List<Map<String, Object>> searchProducts(@RequestParam("query") String query) {
        return productService.searchProductsByName(query);
    }
}