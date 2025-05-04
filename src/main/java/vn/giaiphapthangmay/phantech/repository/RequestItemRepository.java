package vn.giaiphapthangmay.phantech.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.giaiphapthangmay.phantech.domain.RequestItem;
import vn.giaiphapthangmay.phantech.domain.RequestList;

public interface RequestItemRepository extends JpaRepository<RequestItem, Long> {

    void save(RequestList requestList);

}