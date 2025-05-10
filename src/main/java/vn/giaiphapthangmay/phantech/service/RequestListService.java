package vn.giaiphapthangmay.phantech.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import jakarta.persistence.criteria.Predicate;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import vn.giaiphapthangmay.phantech.domain.RequestItem;
import vn.giaiphapthangmay.phantech.domain.RequestList;
import vn.giaiphapthangmay.phantech.domain.RequestList_;
import vn.giaiphapthangmay.phantech.repository.RequestListRepository;
import vn.giaiphapthangmay.phantech.repository.RequestItemRepository;

@Service
public class RequestListService {
    private final RequestListRepository requestListRepository;
    private final RequestItemRepository requestItemRepository;

    public RequestListService(RequestListRepository requestListRepository,
            RequestItemRepository requestItemRepository) {
        this.requestItemRepository = requestItemRepository;
        this.requestListRepository = requestListRepository;
    }

    public void saveRequestList(RequestList requestList) {
        this.requestListRepository.save(requestList);
    }

    public void updateStatusOfRequestList(long id, String status, String message) {
        RequestList requestList = this.requestListRepository.findById(id).orElse(null);
        if (requestList != null) {
            requestList.setStatus(status);
            requestList.setMessage(message);
            requestList.setUpdateStatusdAt(LocalDateTime.now());
            saveRequestList(requestList);
        }

    }

    public void allowToReview(long id) {
        RequestItem requestItem = this.requestItemRepository.findById(id).orElse(null);
        if (requestItem != null) {
            requestItem.setCanReview("YES");
            this.requestItemRepository.save(requestItem);
            saveRequestItem(requestItem);
        }
    }

    public RequestList getRequestListById(long id) {
        return requestListRepository.findById(id).orElse(null);
    }

    public void saveRequestItem(RequestItem requestItem) {
        this.requestItemRepository.save(requestItem);
    }

    public Page<RequestList> getAllRequestLists(Pageable pageable) {
        return requestListRepository.findAll(pageable);
    }

    public RequestItem getRequestItemById(long id) {
        return requestItemRepository.findById(id).orElse(null);
    }

    public List<RequestList> getRequestListByUserId(long userId) {
        return requestListRepository.findByUserId(userId);
    }

    public Specification<RequestList> buildFilterSpecification(
            LocalDateTime fromDate,
            LocalDateTime toDate,
            String status,
            String userEmail) { // Đổi tên tham số để phản ánh đúng mục đích

        return (root, query, criteriaBuilder) -> {
            // Danh sách các điều kiện sẽ được AND lại với nhau
            List<Predicate> predicates = new ArrayList<>();

            // 1. Lọc theo khoảng thời gian
            if (fromDate != null && toDate != null) {
                predicates.add(criteriaBuilder.between(root.get(RequestList_.CREATED_AT), fromDate, toDate));
            } else if (fromDate != null) {
                predicates.add(criteriaBuilder.greaterThanOrEqualTo(root.get(RequestList_.CREATED_AT), fromDate));
            } else if (toDate != null) {
                predicates.add(criteriaBuilder.lessThanOrEqualTo(root.get(RequestList_.CREATED_AT), toDate));
            }

            // 2. Lọc theo trạng thái
            if (status != null && !status.isEmpty()) {
                predicates.add(criteriaBuilder.equal(root.get(RequestList_.STATUS), status));
            }

            // 3. Lọc theo email người tạo thay vì tên
            if (userEmail != null && !userEmail.isEmpty()) {
                // Tìm kiếm theo email
                predicates.add(criteriaBuilder.like(
                        criteriaBuilder.lower(root.get(RequestList_.EMAIL_INFO)),
                        "%" + userEmail.toLowerCase() + "%"));
            }

            // Kết hợp tất cả các điều kiện bằng AND
            return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
        };
    }

    public Page<RequestList> findRequestListsByFilters(
            LocalDateTime fromDate,
            LocalDateTime toDate,
            String status,
            String userEmail,
            Pageable pageable) {

        return this.requestListRepository.findAll(
                buildFilterSpecification(fromDate, toDate, status, userEmail),
                pageable);
    }
}