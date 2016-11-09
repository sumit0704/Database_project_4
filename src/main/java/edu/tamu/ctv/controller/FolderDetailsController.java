package edu.tamu.ctv.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FolderDetailsController {


	// private final Logger logger = LoggerFactory.getLogger(DogsController.class);
	
	@RequestMapping(value="/requestedProject/files", method = RequestMethod.GET)			
		//value="/dog_input" indicate you wanted address, 
		//here it is http://localhost:8080/database_project/dog_input
	public String getNames(Model model) {
		
		// logger.debug("getNames()");
		
		return "/projects/folderDetails";				// put the jsp file path here.
	}
	
	@RequestMapping(value="/requestedProject/backToFolderView", method = RequestMethod.GET)			
	
	public String backToFolder(Model model) {
	
	// logger.debug("getNames()");
	
	return "/projects/requestedProject";				// put the jsp file path here.
}
	@RequestMapping(value="/requestedProject/backToProject", method = RequestMethod.GET)			
	
	public String backToProject(Model model) {
	
	// logger.debug("getNames()");
	
	return "/projects/viewProject";				// put the jsp file path here.
}

}

