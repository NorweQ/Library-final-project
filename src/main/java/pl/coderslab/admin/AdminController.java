package pl.coderslab.admin;

import jakarta.transaction.Transactional;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.author.Author;
import pl.coderslab.author.AuthorRepository;
import pl.coderslab.book.Book;
import pl.coderslab.book.BookRepository;
import pl.coderslab.categries.Category;
import pl.coderslab.categries.CategoryRepository;
import pl.coderslab.publisher.Publisher;
import pl.coderslab.publisher.PublisherRepository;
import pl.coderslab.user.User;
import pl.coderslab.user.UserRepository;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/app/admin")
public class AdminController {
    private final UserRepository userRepository;
    private final CategoryRepository categoryRepository;
    private final BookRepository bookRepository;
    private final PublisherRepository publisherRepository;
    private final AuthorRepository authorRepository;
    public AdminController(UserRepository userRepository, CategoryRepository categoryRepository, BookRepository bookRepository, PublisherRepository publisherRepository, AuthorRepository authorRepository) {
        this.userRepository = userRepository;
        this.categoryRepository = categoryRepository;
        this.bookRepository = bookRepository;
        this.publisherRepository = publisherRepository;
        this.authorRepository = authorRepository;
    }

    @RequestMapping("/admin")
    public String adminIn(Model model) {
        model.addAttribute("admins", userRepository.findAllById(1L));
        return "admin/appAdminIn";
    }
    @RequestMapping("/add/user")
    public String addUser(Model model) {
        model.addAttribute("admins", userRepository.findAllById(1L));
        return "admin/appAdminAddUser";
    }
    @RequestMapping("/add/book")
    public String addBooks(Model model) {
        model.addAttribute("admins", userRepository.findAllById(1L));
        model.addAttribute("categories", categoryRepository.findAll());
        return "admin/appAdminAddBook";
    }
    @RequestMapping("/user/list")
    public String userList(Model model) {
        model.addAttribute("admins", userRepository.findAllById(1L));
        model.addAttribute("users", userRepository.findAll());
        return "admin/appAdminUserList";
    }
    @RequestMapping("/book/list")
    public String userIn(Model model){
        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("books", bookRepository.findAll());
        model.addAttribute("admins", userRepository.findAllById(1L));
        return "admin/appAdminBookList";
    }

    @RequestMapping("/delete/{value}/{bookId}")
    public String adminDeleteBook(@PathVariable String value, @PathVariable Long bookId){
        if(value.equals("ok")){
            bookRepository.deleteById(bookId);
        }
        return "redirect:/app/admin/book/list";
    }
    @RequestMapping("/delete/user/{value}/{userId}")
    public String adminDeleteUser(@PathVariable String value, @PathVariable Long userId){
        if(value.equals("ok")){
            userRepository.deleteById(userId);
        }
        return "redirect:/app/admin/user/list";
    }
    @RequestMapping("/book/edit/{bookId}")
    public String adminEditBook(@PathVariable Long bookId, Model model){
        model.addAttribute("book", bookRepository.findBookById(bookId));
        model.addAttribute("admins", userRepository.findAllById(1L));
        return "admin/appAdminBookEdit";
    }
    @RequestMapping("/book/list/category/{categoryId}")
    public String adminCategoryBook(@PathVariable Long categoryId, Model model){
        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("books", bookRepository.findBookByCategoryId(categoryId));
        model.addAttribute("admins", userRepository.findAllById(1L));
        return "admin/appAdminBookCategoryList";
    }

    @RequestMapping("/book/edit/delete/ok/{bookId}")
    public String deleteBook(@PathVariable Long bookId){
       bookRepository.deleteById(bookId);
        return "redirect:/app/admin/book/list";
    }
    @Transactional
    @RequestMapping("/delete/author/ok/{authorId}/{bookId}")
    public String deleteAuthor(@PathVariable Long authorId, @PathVariable Long bookId){
        authorRepository.deleteAuthorInBookById(authorId, bookId);
        return "redirect:/app/admin/book/list";
    }
    @Transactional
    @RequestMapping("/delete/category/ok/{categoryId}/{bookId}")
    public String deleteCategory(@PathVariable Long categoryId, @PathVariable Long bookId){
        categoryRepository.deleteCategoryInBookById(categoryId, bookId);
        return "redirect:/app/admin/book/list";
    }

    @PostMapping("/edit/book")
    public String editBook(@ModelAttribute Book book) {
        Book existingBook = bookRepository.findBookById(book.getId());

        existingBook.setTitle(book.getTitle());
        existingBook.setDescription(book.getDescription());
        existingBook.setIsbn(book.getIsbn());
        for (Author author : book.getAuthor()) {
            Author author1 = authorRepository.findAuthorById(author.getId());
            author1.setFullName(author.getFullName());
            authorRepository.save(author1);
        }

        for (Category category : book.getCategory()) {
            Category category1 = categoryRepository.findCategoryById(category.getId());
            category1.setCategoryName(category.getCategoryName());
            categoryRepository.save(category1);
        }
        Publisher publisher = publisherRepository.findPublisherById(book.getPublisher().getId());
        publisher.setName(book.getPublisher().getName());
        publisherRepository.save(publisher);
        bookRepository.save(existingBook);
        return "redirect:/app/admin/book/list";
    }
    @PostMapping("/book/add")
    public String bookAdd(@RequestParam("title") String title,
                          @RequestParam("author") String author,
                          @RequestParam("isbn") String isbn,
                          @RequestParam("publisher.name") String publisherName,
                          @RequestParam("description") String description,
                          @RequestParam("category") List<Long> categories, Model model) {
        Book book = new Book();
        book.setTitle(title);
        book.setIsbn(isbn);
        book.setDescription(description);
        Publisher publisher = new Publisher();
        if (publisherRepository.findByName(publisherName) == null) {
            publisher.setName(publisherName);
            publisherRepository.save(publisher);
            book.setPublisher(publisher);
        } else {
            publisher = publisherRepository.findByName(publisherName);
            book.setPublisher(publisher);
        }
        List<Category> categoryList = new ArrayList<>();
        for (Long categoryId : categories) {
            Category category = categoryRepository.findCategoryById(categoryId);
            categoryList.add(category);
        }
        book.setCategory(categoryList);

        List<Author> authors = new ArrayList<>();
        for (String authorName : author.split(",")) {
            Author author1 = new Author();
            if (authorRepository.findAuthorByFullName(authorName) == null) {
                author1.setFullName(authorName);
                authorRepository.save(author1);
            } else {
                author1 = authorRepository.findAuthorByFullName(authorName);
            }
            authors.add(author1);
        }
          book.setAuthor(authors);
        bookRepository.save(book);
        return "redirect:/app/admin/book/list";
    }
    @PostMapping("/register")
    public String addUserByAdmin(@RequestParam("firstName") String firstName,
                                 @RequestParam("lastName") String lastName,
                                 @RequestParam("email") String email,
                                 @RequestParam("password") String password,
                                 @RequestParam("isAdmin") String isAdmin) {
        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPassword(password);
        user.setIsAdmin(isAdmin);
        userRepository.save(user);
        return "redirect:/app/admin/add/user";
    }
}
