package vn.giaiphapthangmay.phantech.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.time.LocalDateTime;
import java.util.List;

import vn.giaiphapthangmay.phantech.domain.Form;

import vn.giaiphapthangmay.phantech.repository.FormRepository;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
@RequestMapping("/admin/form")
public class FormController {
    private final FormRepository formRepository;

    public FormController(FormRepository formRepository) {
        this.formRepository = formRepository;
    }

    @GetMapping("")
    public String getFormPage(Model model) {
        List<Form> forms = formRepository.findAll();
        model.addAttribute("forms", forms);
        return "admin/form/show";
    }

    @GetMapping("/{id}")
    public String getFormDetailPage(@PathVariable Long id, Model model) {
        Form form = formRepository.findById(id).orElse(null);
        model.addAttribute("form", form);
        return "admin/form/detail";
    }

    @PostMapping("/delete")
    public String deleteForm(@RequestParam("id") Long id) {
        formRepository.deleteById(id);
        return "redirect:/admin/form";
    }

    @PostMapping("/mark-as-read")
    public String maskAsRead(@RequestParam("id") Long id) {
        Form form = formRepository.findById(id).orElse(null);
        if (form != null) {
            form.setRead(true);
            formRepository.save(form);
        }
        return "redirect:/admin/form";
    }

}