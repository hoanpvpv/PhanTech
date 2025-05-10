package vn.giaiphapthangmay.phantech.controller.admin;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.time.LocalDate;

import vn.giaiphapthangmay.phantech.domain.Form;

import vn.giaiphapthangmay.phantech.service.FormService;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/form")
public class FormController {
    private final FormService formService;

    public FormController(FormService formService) {
        this.formService = formService;

    }

    @GetMapping("")
    public String getFormPage(Model model,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate fromDate,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate toDate,
            @RequestParam(defaultValue = "1") int page) {

        Pageable pageable = PageRequest.of(page - 1, 10);
        Page<Form> formPage;
        if (fromDate != null && toDate != null) {
            formPage = this.formService.findByDateRange(fromDate, toDate, pageable);
        } else {
            formPage = this.formService.getAllForm(pageable);
        }
        model.addAttribute("formPage", formPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", formPage.getTotalPages());
        model.addAttribute("totalItems", formPage.getTotalElements());
        model.addAttribute("fromDate", fromDate);
        model.addAttribute("toDate", toDate);
        return "admin/form/show";

    }

    @GetMapping("/{id}")
    public String getFormDetailPage(@PathVariable("id") Long id, Model model) {
        Form form = this.formService.getFormById(id);
        if (form != null) {
            model.addAttribute("form", form);
            return "admin/form/detail";
        } else {
            return "redirect:/admin/form";
        }
    }

    @PostMapping("/delete")
    public String deleteForm(@RequestParam("id") Long id) {
        this.formService.deleteForm(id);
        return "redirect:/admin/form";
    }

    @PostMapping("/mark-as-read")
    public String maskAsRead(@RequestParam("id") Long id) {
        this.formService.markAsRead(id);
        return "redirect:/admin/form";
    }

}