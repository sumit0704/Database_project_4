package edu.tamu.ctv.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CrudeOilController {

	@RequestMapping(value = "/Open/CrudeOil", method = RequestMethod.GET)
	public String showAllUsers(Model model)
	{
		
		return "Open/CrudeOil";
	}
	

}
