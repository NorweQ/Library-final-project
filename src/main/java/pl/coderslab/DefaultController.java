package pl.coderslab;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DefaultController {
    @GetMapping("/")
    public String redirectToDefaultPage() {
        return "redirect:/app/user/user";
    }
}
