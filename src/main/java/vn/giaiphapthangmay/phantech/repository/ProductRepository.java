package vn.giaiphapthangmay.phantech.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.util.Streamable;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.domain.Specification;
import vn.giaiphapthangmay.phantech.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>, JpaSpecificationExecutor {
    // Phương thức tìm kiếm sản phẩm theo tên (dạng không phân biệt hoa thường)
    List<Product> findByNameContainingIgnoreCase(String name);

    Page<Product> findAll(Specification specification, Pageable pageable);
}