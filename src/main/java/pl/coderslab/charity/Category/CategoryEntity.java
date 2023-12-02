package pl.coderslab.charity.Category;

import pl.coderslab.charity.Donation.DonationEntity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "Category")
public class CategoryEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @ManyToMany
    @JoinTable (name = "donations_categories",
            joinColumns = @JoinColumn(name = "donation_id"),
            inverseJoinColumns = @JoinColumn(name = "category_id"))
    private List<DonationEntity> donations = new ArrayList<>();

    @Override
    public String toString() {
        return name;
    }

    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<DonationEntity> getDonations() {
        return donations;
    }

    public void setDonations(List<DonationEntity> donations) {
        this.donations = donations;
    }
}
