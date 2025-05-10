package vn.giaiphapthangmay.phantech.controller.client;

import java.util.List;

import org.springframework.boot.autoconfigure.integration.IntegrationProperties.RSocket.Client;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.giaiphapthangmay.phantech.domain.ElevatorType;
import vn.giaiphapthangmay.phantech.domain.Manufacturer;
import vn.giaiphapthangmay.phantech.domain.Product;
import vn.giaiphapthangmay.phantech.service.ElevatorTypeService;
import vn.giaiphapthangmay.phantech.service.ManufacturerService;
import vn.giaiphapthangmay.phantech.service.ProductService;

@Controller
@RequestMapping("/product")
public class ClientProductController {
    private final ProductService productService;
    private final ElevatorTypeService elevatorTypeService;
    private final ManufacturerService manufacturerService;

    public ClientProductController(ProductService productService,
            ElevatorTypeService elevatorTypeService,
            ManufacturerService manufacturerService) {
        this.productService = productService;
        this.elevatorTypeService = elevatorTypeService;
        this.manufacturerService = manufacturerService;

    }

    @GetMapping("")
    public String getProductsPage(
            Model model,
            @RequestParam(required = false) String name,
            @RequestParam(required = false) List<Long> elevatorTypes,
            @RequestParam(required = false) List<Long> manufacturers,
            @RequestParam(required = false) Long minPrice,
            @RequestParam(required = false) Long maxPrice,
            @RequestParam(required = false) Double minSpeed,
            @RequestParam(required = false) Double maxSpeed,
            @RequestParam(required = false) Long minLoad,
            @RequestParam(required = false) Long maxLoad,
            @RequestParam(defaultValue = "id") String sortBy,
            @RequestParam(defaultValue = "desc") String sortDir,
            @RequestParam(defaultValue = "1") int page) {
        minPrice = minPrice != null ? minPrice * 1000000 : null;
        maxPrice = maxPrice != null ? maxPrice * 1000000 : null;

        Page<Product> productPage = productService.getPageProductForClient(name, elevatorTypes,
                manufacturers, minPrice, maxPrice,
                minSpeed, maxSpeed, minLoad, maxLoad,
                sortBy, sortDir, page);

        List<ElevatorType> allElevatorTypes = this.elevatorTypeService.getAllElevatorType();
        List<Manufacturer> allManufacturers = this.manufacturerService.getAllManufacturers();

        model.addAttribute("products", productPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", productPage.getTotalPages());
        model.addAttribute("totalItems", productPage.getTotalElements());
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortDir", sortDir);

        model.addAttribute("name", name);
        model.addAttribute("elevatorTypes", elevatorTypes);
        model.addAttribute("manufacturers", manufacturers);
        model.addAttribute("minPrice", minPrice);
        model.addAttribute("maxPrice", maxPrice);
        model.addAttribute("minSpeed", minSpeed);
        model.addAttribute("maxSpeed", maxSpeed);
        model.addAttribute("minLoad", minLoad);
        model.addAttribute("maxLoad", maxLoad);

        model.addAttribute("allElevatorTypes", allElevatorTypes);
        model.addAttribute("allManufacturers", allManufacturers);
        return "client/product/show";
    }

}
