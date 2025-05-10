package vn.giaiphapthangmay.phantech.repository;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import java.util.List;

import org.springframework.data.domain.Page;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import vn.giaiphapthangmay.phantech.domain.ElevatorType;

@Repository
public interface ElevatorTypeRepository extends JpaRepository<ElevatorType, Long>, JpaSpecificationExecutor {
    Page<ElevatorType> findAll(Specification specification, Pageable pageable);

    List<ElevatorType> findAll();
}