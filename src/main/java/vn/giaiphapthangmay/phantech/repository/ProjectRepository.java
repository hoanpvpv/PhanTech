package vn.giaiphapthangmay.phantech.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.giaiphapthangmay.phantech.domain.Project;

@Repository
public interface ProjectRepository extends JpaRepository<Project, Long> {
    // Có thể thêm các phương thức truy vấn tùy chỉnh ở đây
    // Ví dụ:
    // List<Project> findByStatus(String status);
    // List<Project> findByCompletionDateBetween(Date startDate, Date endDate);
    // Project findByProjectCode(String projectCode);
}