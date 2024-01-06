package pl.coderslab.borrow;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BorrowRepository extends JpaRepository<Borrow, Long> {
    @Query(value = "SELECT * from borrow where user_id =?", nativeQuery = true)
    List<Borrow> findAllByUserId(Long userId);
}
