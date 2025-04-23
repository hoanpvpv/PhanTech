package vn.giaiphapthangmay.phantech.domain;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "client_request_list")
public class ClientRequestList {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @OneToMany(mappedBy = "clientRequestList")
    private List<ClientRequestItem> ClientRequestItems;
    @OneToOne()
    @JoinColumn(name = "user_id")
    private User user;

    public List<ClientRequestItem> getClientRequestItems() {
        return ClientRequestItems;
    }

    public void setClientRequestItems(List<ClientRequestItem> clientRequestItems) {
        ClientRequestItems = clientRequestItems;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}
