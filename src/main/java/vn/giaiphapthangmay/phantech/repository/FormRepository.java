package vn.giaiphapthangmay.phantech.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.giaiphapthangmay.phantech.domain.Form;

public interface FormRepository extends JpaRepository<Form, Long> {
    Form findByName(String name); // Tìm kiếm theo tên form

    Form findById(long id); // Tìm kiếm theo id form

}
