package vn.giaiphapthangmay.phantech.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;
import vn.giaiphapthangmay.phantech.domain.RequestList;

@Repository
public interface RequestListRepository extends JpaRepository<RequestList, Long>, JpaSpecificationExecutor {

    List<RequestList> findByUserId(long userId);

    Page<RequestList> findAll(Specification specification, Pageable pageable);
}
