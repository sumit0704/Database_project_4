package edu.tamu.ctv.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.tamu.ctv.entity.Users;

@Repository
public interface UsersRepository extends CrudRepository<Users, Long>
{
	// System.out.println("\n\nLogin @ home: ");
	// System.out.println("test");
	List<Users> findByLogin(String login);
	List<Users> findUserByFirstnameLikeOrLastnameLikeOrLoginLike(String firstname, String lastname, String login);


}
