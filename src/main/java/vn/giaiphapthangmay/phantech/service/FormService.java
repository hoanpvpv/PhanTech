package vn.giaiphapthangmay.phantech.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import vn.giaiphapthangmay.phantech.domain.Form;
import vn.giaiphapthangmay.phantech.domain.Form_;
import vn.giaiphapthangmay.phantech.repository.FormRepository;

@Service
public class FormService {
    private final FormRepository formRepository;

    public FormService(FormRepository formRepository) {
        this.formRepository = formRepository;
    }

    public void deleteForm(Long id) {
        this.formRepository.deleteById(id);
    }

    public void markAsRead(Long id) {
        Form form = this.formRepository.findById(id).orElse(null);
        if (form != null) {
            form.setRead(true);
            saveForm(form);
        }
    }

    public void saveForm(Form form) {
        this.formRepository.save(form);
    }

    public Form getFormById(Long id) {
        return this.formRepository.findById(id).orElse(null);
    }

    private Specification<Form> dateRangeBetween(LocalDate fromDate, LocalDate toDate) {
        return (root, query, criteriaBuilder) -> {
            // Nếu cả hai tham số đều null, trả về điều kiện luôn đúng
            if (fromDate == null && toDate == null) {
                return criteriaBuilder.conjunction();
            }

            // Xử lý các trường hợp
            if (fromDate != null && toDate != null) {
                // Cả hai đều có giá trị - lọc khoảng giữa hai ngày
                LocalDateTime fromDateTime = fromDate.atStartOfDay(); // 00:00:00
                LocalDateTime toDateTime = toDate.atTime(LocalTime.MAX); // 23:59:59

                return criteriaBuilder.between(
                        root.get(Form_.CREATED_AT), // Điều chỉnh theo tên trường thực tế
                        fromDateTime,
                        toDateTime);
            } else if (fromDate != null) {
                // Chỉ có fromDate - lọc từ ngày này trở đi
                LocalDateTime fromDateTime = fromDate.atStartOfDay();
                return criteriaBuilder.greaterThanOrEqualTo(
                        root.get(Form_.CREATED_AT),
                        fromDateTime);
            } else {
                // Chỉ có toDate - lọc đến ngày này
                LocalDateTime toDateTime = toDate.atTime(LocalTime.MAX);
                return criteriaBuilder.lessThanOrEqualTo(
                        root.get(Form_.CREATED_AT),
                        toDateTime);
            }
        };
    }

    public Page<Form> findByDateRange(LocalDate fromDate, LocalDate toDate, Pageable pageable) {
        return this.formRepository.findAll(dateRangeBetween(fromDate, toDate), pageable);
    }

    public Page<Form> getAllForm(Pageable pageable) {
        return this.formRepository.findAll(pageable);
    }

}
