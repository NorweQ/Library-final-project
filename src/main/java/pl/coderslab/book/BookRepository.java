package pl.coderslab.book;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface BookRepository extends JpaRepository<Book, Long> {
    @Query("select b.title from Book b where b.title like %?1%")
    List<Book> findByTitle(String title);
    @Query(value = "SELECT * FROM book as b JOIN user_book as u WHERE u.user_id = ?", nativeQuery = true)
    List<Book> findAllBooksByUserId(Long userId);

    @Query(value = "SELECT borrow.book_id FROM borrow WHERE borrow.user_id= ?", nativeQuery = true)
    List<Long> findBooksByUserId(Long userId);

    List<Book> findFirstById(Long id);
    Book findBookById(Long id);
    List<Book> findBookByCategoryId(Long id);




}
