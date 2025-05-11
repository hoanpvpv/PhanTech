package vn.giaiphapthangmay.phantech.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.giaiphapthangmay.phantech.domain.Role;
import vn.giaiphapthangmay.phantech.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);

    List<User> findAllByRole(Role role);

    void deleteById(long id);

    boolean existsByEmail(String email);

    User save(User newUser);

    Page<User> findByEmailContaining(String email, Pageable pageable);

    Page<User> findAll(Pageable pageable);
}
