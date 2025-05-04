package vn.giaiphapthangmay.phantech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.giaiphapthangmay.phantech.domain.RequestList;

@Repository
public interface RequestListRepository extends JpaRepository<RequestList, Long> {

    List<RequestList> findByUserId(long userId);

}
