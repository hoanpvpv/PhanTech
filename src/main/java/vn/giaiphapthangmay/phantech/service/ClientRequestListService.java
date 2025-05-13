package vn.giaiphapthangmay.phantech.service;

import java.util.List;

import org.apache.catalina.connector.Request;
import org.springframework.stereotype.Service;
import vn.giaiphapthangmay.phantech.domain.ClientRequestItem;
import vn.giaiphapthangmay.phantech.domain.ClientRequestList;
import vn.giaiphapthangmay.phantech.domain.Product;
import vn.giaiphapthangmay.phantech.domain.RequestItem;
import vn.giaiphapthangmay.phantech.domain.RequestList;
import vn.giaiphapthangmay.phantech.domain.User;
import vn.giaiphapthangmay.phantech.repository.*;

@Service
public class ClientRequestListService {

    private final RequestItemRepository requestItemRepository;
    private final RequestListRepository requestListRepository;
    private final ClientRequestItemRepository clientRequestItemRepository;
    private final ClientRequestListRepository clientRequestListRepository;
    private final UserRepository userRepository;
    private final ProductRepository productRepository;
    private final ServiceRepository serviceRepository;

    public ClientRequestListService(ClientRequestItemRepository clientRequestItemRepository,
            ClientRequestListRepository clientRequestListRepository, UserRepository userRepository,
            ServiceRepository serviceRepository,
            ProductRepository productRepository, RequestListRepository requestListRepository,
            RequestItemRepository requestItemRepository) {
        this.userRepository = userRepository;
        this.clientRequestItemRepository = clientRequestItemRepository;
        this.clientRequestListRepository = clientRequestListRepository;
        this.productRepository = productRepository;
        this.serviceRepository = serviceRepository;
        this.requestListRepository = requestListRepository;
        this.requestItemRepository = requestItemRepository;

    }

    public void addProduct(long productId, long userId) {
        User currUser = this.userRepository.findById(userId).get();
        ClientRequestList clientRequestList = currUser.getClientRequestList();
        if (clientRequestList == null) {
            clientRequestList = new ClientRequestList();
            clientRequestList.setUser(currUser);
            this.clientRequestListRepository.save(clientRequestList);
        }

        List<ClientRequestItem> clientRequestItems = clientRequestList.getClientRequestItems();
        for (ClientRequestItem item : clientRequestItems) {
            if (item.getProduct() != null && item.getProduct().getId() == productId) {
                return;
            }
        }
        Product product = this.productRepository.findById(productId).get();
        ClientRequestItem clientRequestItem = new ClientRequestItem();
        clientRequestItem.setProduct(product);
        clientRequestItem.setClientRequestList(clientRequestList);
        this.clientRequestItemRepository.save(clientRequestItem);
    }

    public void addService(long serviceId, long userId) {
        User currentUser = this.userRepository.findById(userId).get();
        ClientRequestList clientRequestList = currentUser.getClientRequestList();
        if (clientRequestList == null) {
            clientRequestList = new ClientRequestList();
            clientRequestList.setUser(currentUser);
            this.clientRequestListRepository.save(clientRequestList);
        }
        List<ClientRequestItem> clientRequestItems = clientRequestList.getClientRequestItems();
        for (ClientRequestItem item : clientRequestItems) {
            if (item.getService() != null && item.getService().getId() == serviceId) {
                return;
            }
        }
        vn.giaiphapthangmay.phantech.domain.Service service = this.serviceRepository.findById(serviceId).get();
        ClientRequestItem clientRequestItem = new ClientRequestItem();
        clientRequestItem.setService(service);
        clientRequestItem.setClientRequestList(clientRequestList);
        this.clientRequestItemRepository.save(clientRequestItem);
    }

    public void createRequestList(RequestList requestList, long userId) {
        User currentUser = this.userRepository.findById(userId).get();
        ClientRequestList clientRequestList = currentUser.getClientRequestList();
        List<ClientRequestItem> clientRequestItems = clientRequestList.getClientRequestItems();
        requestList.setUser(currentUser);
        this.requestListRepository.save(requestList);

        for (ClientRequestItem item : clientRequestItems) {
            RequestItem requestItem = new RequestItem();
            requestItem.setProduct(item.getProduct());
            requestItem.setService(item.getService());
            requestItem.setRequestList(requestList);
            requestItem.setCanReview("NOT");
            this.requestItemRepository.save(requestItem);
            this.clientRequestItemRepository.delete(item);
        }

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
