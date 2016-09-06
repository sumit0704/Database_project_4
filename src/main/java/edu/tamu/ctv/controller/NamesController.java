package edu.tamu.ctv.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class NamesController {
	
	private final Logger logger = LoggerFactory.getLogger(NamesController.class);
	
	@RequestMapping(value="/names", method = RequestMethod.GET)
	public String getNames(Model model) {
		
		logger.debug("getNames()");
		
		return "/inputPage";
	}
	
	@RequestMapping(value="/names", method = RequestMethod.POST)
	public String postNames(@RequestParam(value = "name") String name, Model model) {
		
		model.addAttribute("lastInputedName", name);
		
		logger.debug("postNames() " + name);
		
		return "/inputPage";
	}

}
