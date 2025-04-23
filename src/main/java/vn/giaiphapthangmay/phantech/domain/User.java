package vn.giaiphapthangmay.phantech.domain;

import java.time.LocalDateTime;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "`user`")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String email;
    private String password;
    private String fullName;
    private String phone;
    private String address;
    private LocalDateTime createdAt;

    public long getId() {
        return id;
    }

    @ManyToOne
    @JoinColumn(name = "role_id")
    private Role role;

    public List<Review> getReviews() {
        return reviews;
    }

    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }

    public List<RequestList> getRequestLists() {
        return requestLists;
    }

    public void setRequestLists(List<RequestList> requestLists) {
        this.requestLists = requestLists;
    }

    @OneToOne(mappedBy = "user")
    private ClientRequestList clientRequestList;
    @OneToMany(mappedBy = "user")
    private List<RequestList> requestLists;
    @OneToMany(mappedBy = "user")
    private List<Review> reviews;

    public ClientRequestList getClientRequestList() {
        return clientRequestList;
    }

    public void setClientRequestList(ClientRequestList clientRequestList) {
        this.clientRequestList = clientRequestList;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

}
