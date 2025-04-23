package vn.giaiphapthangmay.phantech.service;

import java.util.List;
import java.util.Optional;

import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.stereotype.Service;

import vn.giaiphapthangmay.phantech.domain.Role;
import vn.giaiphapthangmay.phantech.domain.User;
import vn.giaiphapthangmay.phantech.domain.dto.RegisterDTO;
import vn.giaiphapthangmay.phantech.repository.RoleRepository;
import vn.giaiphapthangmay.phantech.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository; // Khai báo biến userRepository
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.roleRepository = roleRepository; // Khởi tạo rolerRepository từ RoleRepository
        this.userRepository = userRepository; // Khởi tạo userRepository từ UserRepository
    }

    public boolean checkEmailExists(String email) {

        return this.userRepository.existsByEmail(email);
    }

    public List<User> getAllUsers() {

        return this.userRepository.findAll();
    }

    // public Page<User> getAllUsers(Pageable pageable) {
    // return userRepository.findAll(pageable);
    // }

    public User handleSaveUser(User user) {
        User newUser = this.userRepository.save(user);
        System.out.println("User saved: " + newUser); // In thông tin người dùng đã lưu để kiểm tra
        return newUser;
    }

    // Method to get a user by ID
    public User getUserById(Long id) {
        // Implementation to retrieve user from database by ID
        return userRepository.findById(id).orElse(null);
    }

    public List<Role> getAllRoles() {
        return this.roleRepository.findAll();
    }

    public Role getRoleByName(String name) {
        // Implementation to retrieve role from database by name
        return roleRepository.findByName(name);
    }

    public void deleteUser(long id) {
        this.userRepository.deleteById(id); // Xóa người dùng theo ID từ cơ sở dữ liệu
    }

    public User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setFullName(registerDTO.getFullName());
        user.setPassword(registerDTO.getPassword());
        user.setEmail(registerDTO.getEmail());
        user.setPhone(registerDTO.getPhone());
        user.setAddress(registerDTO.getAddress());
        return user;
    }

    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public Role getRoleById(Long id) {
        return roleRepository.findById(id).orElse(null); // Lấy vai trò theo ID từ RoleRepository
    }

    public User getUserById(long id) {
        return userRepository.findById(id).orElse(null); // Lấy người dùng theo ID từ UserRepository
    }
}
