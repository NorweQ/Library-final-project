package pl.coderslab.publisher;

import org.springframework.data.jpa.repository.JpaRepository;

public interface PublisherRepository extends JpaRepository<Publisher, Long> {
    Publisher findByName(String name);
    Publisher findPublisherById(Long id);
}
