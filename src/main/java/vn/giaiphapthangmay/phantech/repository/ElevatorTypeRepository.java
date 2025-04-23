package vn.giaiphapthangmay.phantech.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.giaiphapthangmay.phantech.domain.ElevatorType;

@Repository
public interface ElevatorTypeRepository extends JpaRepository<ElevatorType, Long> {
    // Có thể thêm các phương thức truy vấn tùy chỉnh ở đây
}