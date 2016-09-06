package edu.tamu.ctv.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CellsController {

	@RequestMapping(value = "/Open/Cells", method = RequestMethod.GET)
	public String CellTypes(@RequestParam("Cells") String Cells, @RequestParam("Category") String Category, 
			Model model){
		System.out.println("\n\n\n\n\n"+Cells+"\n\n\n\n\n");
		
		model.addAttribute("Cells", Cells);	
		model.addAttribute("Category", Category);	
		return "Open/Cells";
	}
}
