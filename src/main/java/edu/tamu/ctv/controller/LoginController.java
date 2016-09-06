package edu.tamu.ctv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import edu.tamu.ctv.utils.session.ProjectAuthentication;

@Controller
public class LoginController
{
	@Autowired
	// public ProjectAuthentication projectAuthentication;
	private ProjectAuthentication projectAuthentication;
	
	// @RequestMapping(value = "/login", method = RequestMethod.POST) 
	@RequestMapping(value = {"/login", "/Open/login"}, method = RequestMethod.GET) 
	public ModelAndView login(@RequestParam(value = "error", required = false) String error, @RequestParam(value = "logout", required = false) String logout)
	{
		System.out.println("\n\nPost is here.\n\n");
		System.out.println("\n\nLogin: " + projectAuthentication.getCurrentUser().getLogin() + "\n\n");
		ModelAndView model = new ModelAndView();
		if (error != null)
		{
			model.addObject("error", "Invalid username and password!");
		}
		if (logout != null)
		{
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("/Open/login");

		return model;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	// public String logout()
	public String index(Model model)
	{
		return "/Open/login";
	}
	
	@RequestMapping(value = "/currentuser", method = RequestMethod.GET)
	public @ResponseBody String currentUser(ModelMap model)
	{
		System.out.println("\n\nLogin is: ." + projectAuthentication.getCurrentUser().getLogin() + "\n\n");
		return projectAuthentication.getCurrentUser().getLogin();

	}
}
