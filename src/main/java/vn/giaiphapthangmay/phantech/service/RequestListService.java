package vn.giaiphapthangmay.phantech.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import vn.giaiphapthangmay.phantech.domain.RequestItem;
import vn.giaiphapthangmay.phantech.domain.RequestList;
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

    public void updateRequestList(RequestList requestList) {
        // Logic to update the request list
    }

    public RequestList getRequestListById(long id) {
        return requestListRepository.findById(id).orElse(null);
    }

    public void deleteRequestList(long id) {
        // Logic to delete a request list by ID
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
}