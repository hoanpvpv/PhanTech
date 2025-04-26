package vn.giaiphapthangmay.phantech.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.giaiphapthangmay.phantech.domain.Project;

@Repository
public interface ProjectRepository extends JpaRepository<Project, Long> {
    Page<Project> findAll(Pageable pageable);

    List<Project> findByProductId(long productId);

}