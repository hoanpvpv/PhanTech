package vn.giaiphapthangmay.phantech.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

import jakarta.persistence.Table;

@Entity
@Table(name = "request_item")
public class RequestItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;
    @ManyToOne
    @JoinColumn(name = "service_id")
    private Service service;
    @ManyToOne
    @JoinColumn(name = "request_list_id")
    private RequestList requestList;

    public Product getProduct() {
        return product;
    }

    public long getId() {
        return id;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public RequestList getRequestList() {
        return requestList;
    }

    public void setRequestList(RequestList requestList) {
        this.requestList = requestList;
    }

}
