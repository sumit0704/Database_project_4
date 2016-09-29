package edu.tamu.ctv.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {

	@RequestMapping(value = "/Protected/Admin", method = RequestMethod.GET)
	public String CellTypes(Model model){
		System.out.println("\n\n\n\n\n Admin  \n\n\n\n\n");
		
		// model.addAttribute("Cells", Cells);	
		// model.addAttribute("Category", Category);	
		return "Protected/Admin";
	}
}
