package pl.coderslab.charity.Donation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.Category.CategoryRepository;
import pl.coderslab.charity.Institution.InstitutionRepository;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class DonationController {
    private final DonationRepository donationRepository;
    private final CategoryRepository categoryRepository;
    private final InstitutionRepository institutionRepository;

    public DonationController(DonationRepository donationRepository, CategoryRepository categoryRepository, InstitutionRepository institutionRepository) {
        this.donationRepository = donationRepository;
        this.categoryRepository = categoryRepository;
        this.institutionRepository = institutionRepository;
    }

    //spring.thymeleaf.prefix=/WEB-INF/views/
    //spring.thymeleaf.suffix=.jsp
    //spring.thymeleaf.mode=TEXT

    @GetMapping("/form")
    public String giveDonationsFormGet(Model model, HttpSession sess) {
        model.addAttribute("donation", new DonationEntity());
        sess.setAttribute("categories", categoryRepository.findAll());
        System.out.println(model.asMap().get("categories"));
        sess.setAttribute("institutions", institutionRepository.findAll());

        return "form";
    }

    @PostMapping("/addDonation")
    public String giveDonationFormPost(@Valid @ModelAttribute("donation") DonationEntity donation, BindingResult result) {
        System.out.println(result);
        if (result.hasErrors()) {
            return "form";
        }
        donationRepository.save(donation);
        return "form-confirmation";
    }
}
