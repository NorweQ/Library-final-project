package pl.coderslab.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.book.BookRepository;
import pl.coderslab.categries.CategoryRepository;


@Controller
@RequestMapping("/app/user")
public class UserController {
    private final UserRepository userRepository;
    private final BookRepository bookRepository;
    private final CategoryRepository categoryRepository;

    public UserController(UserRepository userRepository, BookRepository bookRepository, CategoryRepository categoryRepository) {
        this.userRepository = userRepository;
        this.bookRepository = bookRepository;
        this.categoryRepository = categoryRepository;
    }

    @RequestMapping("/user")
    public String userIn(Model model){
        model.addAttribute("users", userRepository.findAllById(1L));
        return "user/appUserIn";
    }

    @RequestMapping("/edit")
    public String userEdit(Model model){
        model.addAttribute("users", userRepository.findAllById(1L));
        return "user/appEditor";
    }
    @RequestMapping("/book/list/category/{categoryId}")
    public String userCategoryBook(@PathVariable Long categoryId, Model model){
        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("books", bookRepository.findBookByCategoryId(categoryId));
        model.addAttribute("admins", userRepository.findAllById(1L));
        return "user/appUserBookCategoryList";
    }
    @PostMapping("/edit/firstName")
    public String updateFirstName(@RequestParam("firstName") String firstName){
        User user = userRepository.findUserById(1L);
        user.setFirstName(firstName);
        userRepository.save(user);
        return "redirect:/app/user/edit";
    }
    @PostMapping("/edit/password")
    public String updatePassword(@RequestParam("password") String password, @RequestParam("repassword") String repassword){
        User user = userRepository.findUserById(1L);
        if (password.equals(repassword)){
            user.setPassword(password);
            userRepository.save(user);
        }

        return "redirect:/app/user/edit";
    }
    @PostMapping("/edit/lastName")
    public String updateLastName(@RequestParam("lastName") String lastName){
        User user = userRepository.findUserById(1L);
        user.setLastName(lastName);
        userRepository.save(user);
        return "redirect:/app/user/edit";
    }
    @PostMapping("/edit/email")
    public String updateEmail(@RequestParam("email") String email){
        User user = userRepository.findUserById(1L);
        user.setEmail(email);
        userRepository.save(user);
        return "redirect:/app/user/edit";
    }

}
