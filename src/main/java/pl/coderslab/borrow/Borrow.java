package pl.coderslab.borrow;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;
import pl.coderslab.book.Book;
import pl.coderslab.user.User;

import java.util.List;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Borrow {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String borrowDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String pickUpDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String returnDate;
    private int received;
    @ManyToMany
    private List<Book> book;
    @ManyToOne
    private User user;

    @Override
    public String toString() {
        return ""+ book;
    }
}
