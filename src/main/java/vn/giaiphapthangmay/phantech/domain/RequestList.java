package vn.giaiphapthangmay.phantech.domain;

import java.time.LocalDateTime;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "request_list")
public class RequestList {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String status;
    private String message;
    private LocalDateTime updateStatusdAt;
    @OneToMany(mappedBy = "requestList")
    private List<RequestItem> RequestItems;
    private LocalDateTime createdAt;
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
    private String emailInfo;
    private String phoneInfo;
    private String addressInfo;
    private String fullNameInfo;
    @Column(columnDefinition = "MEDIUMTEXT")
    private String noteInfo;

    public long getId() {
        return id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public LocalDateTime getUpdateStatusdAt() {
        return updateStatusdAt;
    }

    public void setUpdateStatusdAt(LocalDateTime updateStatusdAt) {
        this.updateStatusdAt = updateStatusdAt;
    }

    public List<RequestItem> getRequestItems() {
        return RequestItems;
    }

    public void setRequestItems(List<RequestItem> requestItems) {
        RequestItems = requestItems;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getEmailInfo() {
        return emailInfo;
    }

    public void setEmailInfo(String emailInfo) {
        this.emailInfo = emailInfo;
    }

    public String getPhoneInfo() {
        return phoneInfo;
    }

    public void setPhoneInfo(String phoneInfo) {
        this.phoneInfo = phoneInfo;
    }

    public String getAddressInfo() {
        return addressInfo;
    }

    public void setAddressInfo(String addressInfo) {
        this.addressInfo = addressInfo;
    }

    public String getFullNameInfo() {
        return fullNameInfo;
    }

    public void setFullNameInfo(String fullNameInfo) {
        this.fullNameInfo = fullNameInfo;
    }

    public String getNoteInfo() {
        return noteInfo;
    }

    public void setNoteInfo(String noteInfo) {
        this.noteInfo = noteInfo;
    }

}
