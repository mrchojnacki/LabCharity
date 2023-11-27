package pl.coderslab.charity.Institution;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
@Transactional
public interface InstitutionRepository extends JpaRepository<InstitutionEntity, Long> {
}
