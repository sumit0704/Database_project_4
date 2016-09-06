package edu.tamu.ctv.service;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.tamu.ctv.entity.Chemicals;
import edu.tamu.ctv.repository.ChemicalsRepository;


@Service
public class ChemicalsService {

	private final Logger logger = LoggerFactory.getLogger(ChemicalsService.class);
	
	
	@Autowired
	private ChemicalsRepository chemicalsRepository;
	
	public Chemicals getAll()
	{
		logger.debug("\n\n-------------------\n\n Reached ChemicalsService\n\n");
		Chemicals chemicals = null;
		List<Chemicals> list = chemicalsRepository.findAll();
		if(list.size() > 0)
		{
			chemicals = list.get(0);
		}
		return chemicals;
	}
	
	public ChemicalsRepository getChemicalRepository()
	{
		return chemicalsRepository;
	}
	
	
}
