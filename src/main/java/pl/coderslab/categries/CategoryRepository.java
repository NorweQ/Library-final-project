package pl.coderslab.categries;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {
    Category findByCategoryName(String name);

    Category findCategoryByCategoryName(String name);

    Category findCategoryById(Long id);

    @Modifying
    @Query(value = "DELETE FROM book_category WHERE category_id = ? AND book_id = ?", nativeQuery = true)
    void deleteCategoryInBookById(Long categoryId, Long bookId);
}
