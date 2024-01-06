package pl.coderslab.author;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AuthorRepository extends JpaRepository<Author, Long> {
    @Query("select a.fullName from Author a where a.fullName like %?1%")
    List<Author> findByFullName(String fullName);

    Author findAuthorByFullName(String fullName);
    Author findAuthorById(Long id);
    @Modifying
    @Query(value = "DELETE FROM book_author WHERE author_id = ? AND book_id = ?", nativeQuery = true)
    void deleteAuthorInBookById(Long authorId, Long bookId);
}
