package pl.coderslab.book;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.categries.Category;
import pl.coderslab.categries.CategoryRepository;
import pl.coderslab.user.UserRepository;

@Controller
@RequestMapping("/app/book")
public class BookController {
    private final BookRepository bookRepository;
    private final UserRepository userRepository;
    private final CategoryRepository categoryRepository;

    public BookController(BookRepository bookRepository, UserRepository userRepository, CategoryRepository categoryRepository) {
        this.bookRepository = bookRepository;
        this.userRepository = userRepository;
        this.categoryRepository = categoryRepository;
    }

    @RequestMapping("/list")
    public String userIn(Model model){
        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("books", bookRepository.findAll());
        model.addAttribute("users", userRepository.findAllById(1L));
        return "user/appBookList";
    }

}
