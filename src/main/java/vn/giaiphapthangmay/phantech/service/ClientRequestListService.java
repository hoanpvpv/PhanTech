package vn.giaiphapthangmay.phantech.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.giaiphapthangmay.phantech.domain.ClientRequestItem;
import vn.giaiphapthangmay.phantech.domain.ClientRequestList;
import vn.giaiphapthangmay.phantech.repository.ClientRequestItemRepository;
import vn.giaiphapthangmay.phantech.repository.ClientRequestListRepository;

@Service
public class ClientRequestListService {
    public final ClientRequestItemRepository clientRequestItemRepository;
    public final ClientRequestListRepository clientRequestListRepository;

    public ClientRequestListService(ClientRequestItemRepository clientRequestItemRepository,
            ClientRequestListRepository clientRequestListRepository) {
        this.clientRequestItemRepository = clientRequestItemRepository;
        this.clientRequestListRepository = clientRequestListRepository;
    }

    public void saveClientRequestList(ClientRequestList clientRequestList) {
        clientRequestListRepository.save(clientRequestList);
    }

    public List<ClientRequestItem> getAllClientRequestItems() {
        return clientRequestItemRepository.findAll();
    }

    public void addClientRequestItem(ClientRequestItem clientRequestItem) {
        clientRequestItemRepository.save(clientRequestItem);
    }

    public void deleteClientRequestItem(long id) {
        clientRequestItemRepository.deleteById(id);
    }
}
