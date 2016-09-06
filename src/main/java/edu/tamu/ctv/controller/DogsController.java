package edu.tamu.ctv.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DogsController {
	// private final Logger logger = LoggerFactory.getLogger(DogsController.class);
	
	@RequestMapping(value="/dog_input", method = RequestMethod.GET)			
		//value="/dog_input" indicate you wanted address, 
		//here it is http://localhost:8080/database_project/dog_input
	public String getNames(Model model) {
		
		//logger.debug("getNames()");
		
		return "/dog_input";				// put the jsp file path here.
	}
	

	@RequestMapping(value="/dog_test", method=RequestMethod.POST)
	public String dogTest(@RequestParam("dog_name") String dogName, Model model) {
		
		System.out.println("\n\n\n\n\n"+dogName+"\n\n\n\n\n");
		
		
		model.addAttribute("dog_name", dogName);	
		// the value of dog_name can be accessed from jsp file. 

		return "/display_post";
	}
	
	@RequestMapping(value="/display_post", method = RequestMethod.GET)
	public String displayPost(Model model) {	
		return "/display_post";
	}

}
