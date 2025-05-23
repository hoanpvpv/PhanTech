package vn.giaiphapthangmay.phantech.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import vn.giaiphapthangmay.phantech.domain.Manufacturer;

@Repository
public interface ManufacturerRepository extends JpaRepository<Manufacturer, Long>, JpaSpecificationExecutor {
    // Có thể thêm các phương thức truy vấn tùy chỉnh ở đây
}