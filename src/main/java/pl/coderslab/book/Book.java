package pl.coderslab.book;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import lombok.*;
import pl.coderslab.author.Author;
import pl.coderslab.categries.Category;
import pl.coderslab.publisher.Publisher;

import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotEmpty(message = "Title cannot be empty")
    private String title;
    @NotEmpty(message = "Description cannot be empty")
    private String description;
    @NotEmpty(message = "ISBN cannot be empty")
    private String isbn;
    @ManyToMany
    private List<Author> author;
    @ManyToOne
    private Publisher publisher;
    @ManyToMany
    private List<Category> category;

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", isbn='" + isbn + '\'' +
                ", author=" + author +
                ", publisher=" + publisher +
                ", category=" + category +
                '}';
    }
}
