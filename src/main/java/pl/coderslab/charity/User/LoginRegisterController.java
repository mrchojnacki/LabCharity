package pl.coderslab.charity.User;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.Role.RoleEntity;

import javax.validation.Valid;
import java.util.HashSet;

@Controller
public class LoginRegisterController {

    private final UserServiceImpl userService;
    private final PasswordEncoder bCryptPasswordEncoder;

    public LoginRegisterController(UserServiceImpl userService, PasswordEncoder bCryptPasswordEncoder) {
        this.userService = userService;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @GetMapping("/create-user")
    @ResponseBody
    public String createUser() {
        UserEntity user = new UserEntity();
        user.setUsername("admin");
        user.setPassword("admin");
        userService.saveUser(user);
        return "admin";
    }

    @GetMapping(value = "/register")
    public String register(Model model){
        model.addAttribute("register", new UserEntity());
        return "register";
    }

    @PostMapping("/register")
    public String registerSuccessfully(@Valid @ModelAttribute("register") UserEntity register,
                                       BindingResult result,
                                       @RequestParam("password2") String password2,
                                       Model model) {
        if (!register.getPassword().equals(password2)) {
            model.addAttribute("passwordError", "Wpisane hasła różnią się");
            model.addAttribute("username", register.getUsername());
            model.addAttribute("email", register.getEmail());
            model.addAttribute("register", new UserEntity());
            return "register";
        }
        RoleEntity roleEntity = new RoleEntity(1, "ROLE_USER");
        HashSet<RoleEntity> roleEntities = new HashSet<>();
        roleEntities.add(roleEntity);
        register.setRoles(roleEntities);
        userService.saveUser(register);
        return "index";
    }


}
