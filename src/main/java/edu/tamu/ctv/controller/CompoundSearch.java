package edu.tamu.ctv.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.tamu.ctv.utils.session.ProjectAuthentication;

@Controller
public class CompoundSearch {

private final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired		// This a few lines were added by LD.
	private ProjectAuthentication projectAuthentication;
	
	
	@RequestMapping(value = "/compoundSearch", method = RequestMethod.GET)
	public String compoundSearchStart(Model model,HttpServletRequest request)
	{
		System.out.println("\n\nLogin @ home: " + projectAuthentication.getCurrentUser().getLogin() + "\n\n");
		//String id = projectAuthentication.getCurrentUser().getLogin();
		model.addAttribute("user_id", projectAuthentication.getCurrentUser().getLogin());
		
		
		logger.debug("index()");
		return "/Open/compoundSearch";
		// return "home";
	}
}
