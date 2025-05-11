package vn.giaiphapthangmay.phantech.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.security.access.method.P;
import org.springframework.stereotype.Repository;

import vn.giaiphapthangmay.phantech.domain.ClientRequestList;

@Repository
public interface ClientRequestListRepository extends JpaRepository<ClientRequestList, Long>, JpaSpecificationExecutor {
    Page<ClientRequestList> findAll(Specification specification, Pageable pageable);

}