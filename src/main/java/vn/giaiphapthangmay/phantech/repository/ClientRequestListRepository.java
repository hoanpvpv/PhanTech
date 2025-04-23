package vn.giaiphapthangmay.phantech.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.giaiphapthangmay.phantech.domain.ClientRequestList;

@Repository
public interface ClientRequestListRepository extends JpaRepository<ClientRequestList, Long> {
    // Có thể thêm các phương thức truy vấn tùy chỉnh ở đây
}