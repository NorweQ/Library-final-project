package pl.coderslab.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {
    @Query("select u from User u where u.id = ?1")
    List<User> findAllById(long id);
    User findUserById(Long id);
    @Modifying
    @Query("UPDATE User u SET u.firstName = ?1 WHERE u.id = ?2")
    void updateFirstNameById(String firstName, Long userId);
}

