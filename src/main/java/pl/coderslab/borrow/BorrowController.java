package pl.coderslab.borrow;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.book.Book;
import pl.coderslab.book.BookRepository;
import pl.coderslab.user.UserRepository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import static javax.print.attribute.Size2DSyntax.MM;

@Controller
@RequestMapping("/app/borrow")
public class BorrowController {
    private final BorrowRepository borrowRepository;
    private final BookRepository bookRepository;
    private final UserRepository userRepository;
    private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    public BorrowController(BorrowRepository borrowRepository, BookRepository bookRepository, UserRepository userRepository) {
        this.borrowRepository = borrowRepository;
        this.bookRepository = bookRepository;
        this.userRepository = userRepository;
    }
    @PostMapping("/reserved")
    public String reserve(@RequestParam("bookId") Long bookId){
        Borrow borrow = new Borrow();
        borrow.setBook(bookRepository.findFirstById(bookId));
        borrow.setUser(userRepository.findUserById(1L));
        borrow.setBorrowDate(LocalDateTime.now().format(formatter));
        borrow.setPickUpDate(LocalDateTime.now().plusDays(3).format(formatter));
        borrow.setReturnDate(LocalDateTime.now().plusDays(31).format(formatter));
        borrowRepository.save(borrow);
        return "redirect:/app/book/list";
    }
    @RequestMapping("/list")
    public String userIn(Model model){
        List<Borrow> borrows = borrowRepository.findAllByUserId(1L);
        List<Borrow> received = new ArrayList<>();
        List<Borrow> notReceived = new ArrayList<>();
        for (Borrow borrow : borrows) {
            if (borrow.getReceived() == 1){
                received.add(borrow);
            }else {
                notReceived.add(borrow);
            }
        }
        model.addAttribute("users", userRepository.findAllById(1L));
        model.addAttribute("received", received);
        model.addAttribute("notReceived", notReceived);
        return "user/appBorrowedBooks";
    }
    @RequestMapping("/delete/{value}/{borrowId}")
    public String userDeleteReservation(@PathVariable String value, @PathVariable Long borrowId){
        System.out.println("Value: " + value);
        System.out.println("Borrow ID: " + borrowId);
        if(value.equals("ok")){
            borrowRepository.deleteById(borrowId);
        }
        return "redirect:/app/borrow/list";
    }


}
