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

import vn.giaiphapthangmay.phantech.domain.ElevatorType;
import vn.giaiphapthangmay.phantech.repository.ElevatorTypeRepository;
import vn.giaiphapthangmay.phantech.service.UploadService;

@Controller
@RequestMapping("/admin/elevator-type")
public class ElevatorTypeController {

    private final ElevatorTypeRepository elevatorTypeRepository;
    private final UploadService uploadService;

    public ElevatorTypeController(ElevatorTypeRepository elevatorTypeRepository, UploadService uploadService) {
        this.elevatorTypeRepository = elevatorTypeRepository;
        this.uploadService = uploadService;
    }

    @GetMapping("")
    public String getElevatorTypePage(Model model) {
        List<ElevatorType> elevatorTypes = elevatorTypeRepository.findAll();
        model.addAttribute("elevatorTypes", elevatorTypes);
        model.addAttribute("elevatorType", new ElevatorType());
        return "admin/elevator-type/show";
    }

    @PostMapping("/create")
    public String createElevatorType(@ModelAttribute ElevatorType elevatorType,
            @RequestParam("imageFile") MultipartFile imageFile) throws IOException {
        if (!imageFile.isEmpty()) {
            String imagePath = uploadService.handleSaveUploadFile(imageFile, "public");
            elevatorType.setImage(imagePath);
        }
        elevatorTypeRepository.save(elevatorType);
        return "redirect:/admin/elevator-type";
    }

    @GetMapping("/edit/{id}")
    public String getEditElevatorTypePage(@PathVariable long id, Model model) {
        Optional<ElevatorType> elevatorTypeOpt = elevatorTypeRepository.findById(id);
        if (elevatorTypeOpt.isPresent()) {
            model.addAttribute("elevatorType", elevatorTypeOpt.get());
            return "admin/elevator-type/edit";
        }
        return "redirect:/admin/elevator-type";
    }

    @PostMapping("/edit/{id}")
    public String updateElevatorType(@PathVariable long id,
            @ModelAttribute ElevatorType elevatorType,
            @RequestParam("imageFile") MultipartFile imageFile) throws IOException {
        Optional<ElevatorType> existingOpt = elevatorTypeRepository.findById(id);
        if (existingOpt.isPresent()) {
            ElevatorType existing = existingOpt.get();
            existing.setName(elevatorType.getName());
            existing.setDescription(elevatorType.getDescription());

            if (!imageFile.isEmpty()) {
                String imagePath = uploadService.handleSaveUploadFile(imageFile, "public");
                existing.setImage(imagePath);
            }

            elevatorTypeRepository.save(existing);
        }
        return "redirect:/admin/elevator-type";
    }

    @GetMapping("/delete/{id}")
    public String deleteElevatorType(@PathVariable long id) {
        elevatorTypeRepository.deleteById(id);
        return "redirect:/admin/elevator-type";
    }
}