package edu.tamu.ctv.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import edu.tamu.ctv.entity.Chemicals;
import edu.tamu.ctv.repository.ChemicalsRepository;
import edu.tamu.ctv.service.ChemicalsService;



import javax.servlet.http.HttpServletRequest;


@Controller
public class ChemicalsController {

	@Autowired
	private ChemicalsRepository chemicalsRepository;
	
	@Autowired
	private ChemicalsService chemicalsService;
	
	
	private final Logger logger = LoggerFactory.getLogger(ChemicalsController.class);
	
	@RequestMapping(value = "/Open/Publ2016", method = RequestMethod.GET)
	public String showChemicals(Model model)
	{
		logger.debug("\n\n-----------------------\nShow Chemicals Controller Reached");
		model.addAttribute("chemicals", chemicalsRepository.findAll());
		// System.out.println("\n..\n\n...");
		// System.out.println(chemicalsRepository.findAll().toString());
		// System.out.println("\n...\n\n...");
		// System.out.println(chemicalsRepository.findAll());
		// System.out.println("\n..\n\n..");
		List<Chemicals> chemicals = chemicalsRepository.findAll();
		
		System.out.println(chemicals.get(0).getCas());
		return "Open/Publ2016";
		
	}
	

}
