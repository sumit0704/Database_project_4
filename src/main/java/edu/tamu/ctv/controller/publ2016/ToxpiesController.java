package edu.tamu.ctv.controller.publ2016;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ToxpiesController {
	@RequestMapping(value = "/Open/Publ2016/Toxpies", method = RequestMethod.GET)
	public String CellTypes(@RequestParam("Fig_name") String Fig_name, Model model){
		System.out.println("\n\n\n\n\n"+Fig_name+" Hello \n\n\n\n\n");
		
		model.addAttribute("Fig_name", Fig_name);	

		return "/Open/Publ2016/Toxpies";
	}

}
