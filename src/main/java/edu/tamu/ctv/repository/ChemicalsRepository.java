package edu.tamu.ctv.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.tamu.ctv.entity.Chemicals;

@Repository
public interface ChemicalsRepository extends CrudRepository<Chemicals, Long>
{
	// System.out.println("\n\nLogin @ home: ");
	// System.out.println("test");
	 List<Chemicals> findAll();
	// List<Users> findUserByFirstnameLikeOrLastnameLikeOrLoginLike(String firstname, String lastname, String login);


}
