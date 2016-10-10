package edu.tamu.ctv.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.tamu.ctv.entity.Users;
import edu.tamu.ctv.repository.UsersRepository;
import edu.tamu.ctv.service.UsersService;
import edu.tamu.ctv.service.validator.UserFormValidator;
import edu.tamu.ctv.utils.session.ProjectAuthentication;

@Controller
public class UserUpdatsController
{
	private final Logger logger = LoggerFactory.getLogger(UserUpdatsController.class);

	
	@Autowired		// This a few lines were added by LD.
	private ProjectAuthentication projectAuthentication;
	
	@Autowired
	private UsersRepository userRepository;
	@Autowired
	private UsersService usersService;
	
	@Autowired
	UserFormValidator userFormValidator;

	@InitBinder
	protected void initBinder(WebDataBinder binder)
	{
		binder.setValidator(userFormValidator);
	    
/*		SimpleDateFormat dateFormat = new SimpleDateFormat("mm/dd/yyyy");
	    dateFormat.setLenient(false);
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));*/
	}

	@RequestMapping(value = "/users-inactive", method = RequestMethod.GET)
	public String showAllUsers(Model model)
	{
		logger.debug("showAllUsers()");
		model.addAttribute("users", userRepository.findAll());		// This line is very important.
		System.out.println("\n\nLogin UserCon: " + projectAuthentication.getCurrentUser().getLogin() + "\n\n");
		model.addAttribute("user_id", projectAuthentication.getCurrentUser().getLogin());
		return "users/list";
	}
	
	@RequestMapping(value = "/Protected/UserUpdates", method = RequestMethod.GET)
	public String UserUpdates(Model model) {
		return "/Protected/UserUpdates";
	}
	

	@RequestMapping(value = "/users-inactive", method = RequestMethod.POST)
	public String saveOrUpdateUser(@ModelAttribute("userForm") @Validated Users user, BindingResult result, Model model, final RedirectAttributes redirectAttributes)
	{
		logger.debug("saveOrUpdateUser() : {}", user);
		

		if (result.hasErrors())
		{
			return "users/userform";
		}
		else
		{
			redirectAttributes.addFlashAttribute("css", "success");
			if (user.isNew())
			{
				redirectAttributes.addFlashAttribute("msg", "User added successfully!");
			}
			else
			{
				redirectAttributes.addFlashAttribute("msg", "User updated successfully!");
			}

			usersService.save(user);

			return "redirect:/users/" + user.getId();
		}
	}

	// delete user
	@RequestMapping(value = "/users/delete/{id}-inactive", method = RequestMethod.POST)
	public String deleteUser(@PathVariable("id") Long id, final RedirectAttributes redirectAttributes)
	{

		logger.debug("deleteUser() : {}", id);

		userRepository.delete(id);

		redirectAttributes.addFlashAttribute("css", "success");
		redirectAttributes.addFlashAttribute("msg", "User is deleted!");

		return "redirect:/users";

	}

	// show update form
	@RequestMapping(value = "/users/update/{id}-inactive", method = RequestMethod.GET)
	public String showUpdateUserForm(@PathVariable("id") Long id, Model model)
	{
		logger.debug("showUpdateUserForm() : {}", id);
		Users user = userRepository.findOne(id);
		model.addAttribute("userForm", user);
	
		return "users/userform";

	}

}
