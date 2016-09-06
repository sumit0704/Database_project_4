package edu.tamu.ctv.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DisplayController {


	// private final Logger logger = LoggerFactory.getLogger(DogsController.class);
	
	@RequestMapping(value="/display", method = RequestMethod.GET)			
		//value="/dog_input" indicate you wanted address, 
		//here it is http://localhost:8080/database_project/dog_input
	public String getNames(Model model) {
		
		// logger.debug("getNames()");
		
		return "/display";				// put the jsp file path here.
	}
	

}

