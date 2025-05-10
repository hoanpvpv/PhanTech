package vn.giaiphapthangmay.phantech.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import vn.giaiphapthangmay.phantech.domain.Project;
import vn.giaiphapthangmay.phantech.domain.Review;

@Repository
public interface ProjectRepository extends JpaRepository<Project, Long>, JpaSpecificationExecutor {
    Page<Project> findAll(Pageable pageable);

    List<Project> findByProductId(long productId);

    Page<Project> findByProductId(long productId, Pageable pageable);

    Page<Project> findByServiceId(long productId, Pageable pageable);

    Page<Project> findAll(Specification specification, Pageable pageable);
}