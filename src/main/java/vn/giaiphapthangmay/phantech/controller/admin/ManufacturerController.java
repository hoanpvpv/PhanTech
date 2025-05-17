package vn.giaiphapthangmay.phantech.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.giaiphapthangmay.phantech.domain.Manufacturer;
import vn.giaiphapthangmay.phantech.service.ManufacturerService;
import vn.giaiphapthangmay.phantech.service.UploadService;

@Controller
@RequestMapping("/admin/manufacturer")
public class ManufacturerController {
    private final ManufacturerService manufacturerService;
    private final UploadService uploadService;

    public ManufacturerController(ManufacturerService manufacturerService, UploadService uploadService) {
        this.manufacturerService = manufacturerService;
        this.uploadService = uploadService;
    }

    @GetMapping("")
    public String getManufacturerPage(Model model) {
        List<Manufacturer> manufacturers = manufacturerService.getAllManufacturers();
        model.addAttribute("manufacturers", manufacturers);
        return "admin/manufacturer/show";
    }

    @GetMapping("/create")
    public String getCreateManufacturerPage(Model model) {
        model.addAttribute("manufacturer", new Manufacturer());
        return "admin/manufacturer/create";
    }

    @PostMapping("/create")
    public String createManufacturer(@ModelAttribute Manufacturer manufacturer,
            @RequestParam("logoFile") MultipartFile logoFile) throws IOException {
        if (!logoFile.isEmpty()) {
            String logoPath = uploadService.handleSaveUploadFile(logoFile, "public");
            manufacturer.setLogo(logoPath);
        }
        this.manufacturerService.saveManufacturer(manufacturer);
        return "redirect:/admin/manufacturer";
    }

    @GetMapping("/edit/{id}")
    public String getEditManufacturerPage(@PathVariable long id, Model model) {
        Manufacturer manufacturer = manufacturerService.getManufacturerById(id);
        if (manufacturer != null) {
            model.addAttribute("manufacturer", manufacturer);
            return "admin/manufacturer/edit";
        }
        return "redirect:/admin/manufacturer";
    }

    @PostMapping("/edit/{id}")
    public String updateManufacturer(@PathVariable long id,
            @ModelAttribute Manufacturer manufacturer,
            @RequestParam("logoFile") MultipartFile logoFile) throws IOException {
        Manufacturer existing = manufacturerService.getManufacturerById(id);
        if (existing != null) {
            existing.setName(manufacturer.getName());
            existing.setOrigin(manufacturer.getOrigin());

            if (!logoFile.isEmpty()) {
                String logoPath = uploadService.handleSaveUploadFile(logoFile, "public");
                existing.setLogo(logoPath);
            }
            manufacturerService.saveManufacturer(existing);
        }
        return "redirect:/admin/manufacturer";
    }

    @GetMapping("/delete/{id}")
    public String deleteManufacturer(@PathVariable long id) {
        this.manufacturerService.deleteManufacturer(id);
        return "redirect:/admin/manufacturer";
    }
}