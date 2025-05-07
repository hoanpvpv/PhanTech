package vn.giaiphapthangmay.phantech.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

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

import vn.giaiphapthangmay.phantech.domain.Service;
import vn.giaiphapthangmay.phantech.service.ServiceService;

@Controller
@RequestMapping("/admin/service")
public class ServiceController {
    private final ServiceService serviceService;

    public ServiceController(ServiceService serviceService) {
        this.serviceService = serviceService;
    }

    @GetMapping("")
    public String getServicePage(Model model) {
        List<Service> services = serviceService.getAllServices();
        model.addAttribute("services", services);
        return "admin/service/show";
    }

    @GetMapping("/create")
    public String getCreateServicePage(Model model) {
        model.addAttribute("service", new Service());
        return "admin/service/create";
    }

    @PostMapping("/create")
    public String createService(@ModelAttribute Service service,
            @RequestParam("imageFile") MultipartFile imageFile) throws IOException {
        if (!imageFile.isEmpty()) {
            String imagePath = serviceService.handleSaveUploadFile(imageFile, "public");
            service.setImage(imagePath);
        }
        serviceService.saveService(service);
        return "redirect:/admin/service";
    }

    @GetMapping("/edit/{id}")
    public String getEditServicePage(@PathVariable long id, Model model) {
        Service service = serviceService.getServiceById(id);
        if (service != null) {
            model.addAttribute("service", service);
            return "admin/service/edit";
        }
        return "redirect:/admin/service";
    }

    @PostMapping("/edit/{id}")
    public String updateService(@PathVariable long id,
            @ModelAttribute Service service,
            @RequestParam("imageFile") MultipartFile imageFile) throws IOException {
        Service existingService = serviceService.getServiceById(id);
        if (existingService != null) {
            existingService.setName(service.getName());
            existingService.setShortDesc(service.getShortDesc());
            existingService.setDetailDesc(service.getDetailDesc());

            if (!imageFile.isEmpty()) {
                String imagePath = serviceService.handleSaveUploadFile(imageFile, "public");
                existingService.setImage(imagePath);
            }

            serviceService.saveService(existingService);
        }
        return "redirect:/admin/service";
    }

    @GetMapping("/delete/{id}")
    public String deleteService(@PathVariable long id) {
        serviceService.deleteService(id);
        return "redirect:/admin/service";
    }

    @PostMapping("/upload-image-service")
    public ResponseEntity<Map<String, String>> uploadImageForTinyMCE(@RequestParam("file") MultipartFile file)
            throws IOException {
        Map<String, String> response = serviceService.uploadImageForTinyMCE(file);
        return ResponseEntity.ok(response);
    }
}