package vn.giaiphapthangmay.phantech.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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
import vn.giaiphapthangmay.phantech.service.ElevatorTypeService;
import vn.giaiphapthangmay.phantech.service.UploadService;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
@RequestMapping("/admin/elevator-type")
public class ElevatorTypeController {

    private final ElevatorTypeService elevatorTypeService;

    public ElevatorTypeController(ElevatorTypeService elevatorTypeService) {
        this.elevatorTypeService = elevatorTypeService;
    }

    @GetMapping("")
    public String getElevatorTypePage(Model model,
            @RequestParam(required = false) String name,
            @RequestParam(defaultValue = "1") int page) {
        if (page < 1)
            page = 1;

        int pageSize = 10;
        Pageable pageable = PageRequest.of(page - 1, pageSize, Sort.by("id").descending());
        Page<ElevatorType> elevatorTypes;

        if (name != null && !name.isEmpty()) {
            elevatorTypes = this.elevatorTypeService.getPageElevatorTypeByName(name, pageable);

        } else {
            elevatorTypes = this.elevatorTypeService.getAllElevatorType(pageable);
        }

        model.addAttribute("elevatorTypes", elevatorTypes);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", elevatorTypes.getTotalPages());
        model.addAttribute("totalItems", elevatorTypes.getTotalElements());
        model.addAttribute("name", name);
        return "admin/elevator-type/show";
    }

    @PostMapping("/create")
    public String createElevatorType(@ModelAttribute ElevatorType elevatorType,
            @RequestParam("imageFile") MultipartFile imageFile) throws IOException {
        this.elevatorTypeService.saveElevatorType(elevatorType, imageFile);
        return "redirect:/admin/elevator-type";
    }

    @GetMapping("/edit/{id}")
    public String getEditElevatorTypePage(@PathVariable long id, Model model) {
        ElevatorType elevatorType = elevatorTypeService.getElevatorTypeById(id);
        if (elevatorType != null) {
            model.addAttribute("elevatorType", elevatorType);
            return "admin/elevator-type/edit";
        } else {
            return "redirect:/admin/elevator-type";
        }
    }

    @PostMapping("/edit/{id}")
    public String updateElevatorType(@PathVariable long id,
            @ModelAttribute ElevatorType elevatorType,
            @RequestParam("imageFile") MultipartFile imageFile) throws IOException {
        ElevatorType existingElevatorType = elevatorTypeService.getElevatorTypeById(id);
        if (existingElevatorType != null) {
            this.elevatorTypeService.saveElevatorType(elevatorType, imageFile);
        }
        return "redirect:/admin/elevator-type";
    }

    @PostMapping("/delete/{id}")
    public String deleteElevatorType(@PathVariable long id) {
        this.elevatorTypeService.deleteElevatorType(id);
        return "redirect:/admin/elevator-type";
    }

}