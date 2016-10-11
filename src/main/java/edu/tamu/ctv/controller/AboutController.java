package edu.tamu.ctv.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AboutController
{
	private final Logger logger = LoggerFactory.getLogger(AboutController.class);
	@RequestMapping(value = {"/about", "/Open/about"}, method = RequestMethod.GET)
	public String showAbout(Model model)
	{
		logger.debug("index()");
		return "/Open/about";
	}
	
	// public ModelAndView about(Model model)
	// {
		// ModelAndView model1 = new ModelAndView();
		// logger.debug("index()");
		// model1.setViewName("/Open/about");
		// return model1;
		// return "/Open/about";
	// }
	
}
