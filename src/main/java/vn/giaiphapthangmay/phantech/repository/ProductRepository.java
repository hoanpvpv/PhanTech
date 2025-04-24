package vn.giaiphapthangmay.phantech.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.giaiphapthangmay.phantech.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    // Phương thức tìm kiếm sản phẩm theo tên (dạng không phân biệt hoa thường)
    List<Product> findByNameContainingIgnoreCase(String name);

    // Nếu cần thêm phương thức truy vấn đặc biệt, hãy tuân theo quy tắc đặt tên của
    // Spring Data JPA
    // Ví dụ: Tìm sản phẩm theo nhà sản xuất
    // List<Product> findByManufacturerIdOrderByNameAsc(Long manufacturerId);

    // Ví dụ: Tìm sản phẩm theo loại thang máy
    // List<Product> findByElevatorTypeId(Long elevatorTypeId);
}