package vn.giaiphapthangmay.phantech.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.giaiphapthangmay.phantech.domain.ClientRequestItem;

@Repository
public interface ClientRequestItemRepository extends JpaRepository<ClientRequestItem, Long> {
    // Có thể thêm các phương thức truy vấn tùy chỉnh ở đây
}