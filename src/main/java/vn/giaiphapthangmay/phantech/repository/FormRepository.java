package vn.giaiphapthangmay.phantech.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import vn.giaiphapthangmay.phantech.domain.Form;

public interface FormRepository extends JpaRepository<Form, Long>, JpaSpecificationExecutor {
    Form findByName(String name); // Tìm kiếm theo tên form

    Form findById(long id); // Tìm kiếm theo id form

    Page<Form> findAll(Specification specification, Pageable pageable);
}
