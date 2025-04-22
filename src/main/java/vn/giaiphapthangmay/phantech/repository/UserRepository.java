package vn.giaiphapthangmay.phantech.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.boot.autoconfigure.security.SecurityProperties.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.giaiphapthangmay.phantech.domain.Form;
import vn.giaiphapthangmay.phantech.domain.NewsBlogs;
import vn.giaiphapthangmay.phantech.domain.Role;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByUsername(String username);

    Optional<User> findByEmail(String email);

    List<User> findAllByRole(Role role);

    List<User> findAllByForm(Form form);

    List<User> findAllByNewsBlogs(NewsBlogs newsBlogs);
}
