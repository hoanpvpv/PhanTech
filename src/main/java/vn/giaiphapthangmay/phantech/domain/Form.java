package vn.giaiphapthangmay.phantech.domain;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;

@Entity
public class Form {
    @jakarta.persistence.Id
    @jakarta.persistence.GeneratedValue(strategy = jakarta.persistence.GenerationType.IDENTITY)
    private long id; // ID của form
    private String name;
    private String phone;
    private String email;
    private String address;
    private String message;
    boolean isRead; // Trạng thái đã đọc hay chưa
    private LocalDateTime createdAt; // Thời gian tạo form

    public Form(String name, String phone, String email, String address, String message) {
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.message = message;
        this.isRead = false; // Mặc định là chưa đọc
        this.createdAt = LocalDateTime.now(); // Thời gian tạo form là thời điểm hiện tại

    }

    public Form() {
        this.isRead = false;
        this.createdAt = LocalDateTime.now();
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public boolean isRead() {
        return isRead;
    }

    public void setRead(boolean isRead) {
        this.isRead = isRead;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

}
