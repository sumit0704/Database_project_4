package edu.tamu.ctv.service;


import java.util.Collection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.tamu.ctv.entity.ProjectUserMapping;
import edu.tamu.ctv.repository.ProjectUserMappingRepository;
import edu.tamu.ctv.utils.session.ProjectAuthentication;

@Service("projectusermappingservice")
public class ProjectUserMappingService
{
	private final Logger logger = LoggerFactory.getLogger(ProjectUserMappingService.class);
	
	@Autowired
	private ProjectUserMappingRepository mappingrepository;
	
	@Autowired
	private ProjectAuthentication projectAuthentication;

	
	public ProjectUserMapping findmapbyId(Integer Id)
	{
		return mappingrepository.findmapbyId(Id);
	}
	
	public void save(ProjectUserMapping entity)
	{
		if (entity.isNew())
		{
			InitDefaultValues(entity);
		}
		else
		{
			entity = updateEntry(entity);
		}
		try
		{
			mappingrepository.save(entity);

		}
		catch (Exception e)
		{
			logger.error("Exception is--------->", e);
		}
	}
	
	private void InitDefaultValues(ProjectUserMapping entity)
	{
		try{
			Iterable<ProjectUserMapping> Iter=mappingrepository.findAll();
			Integer maxID=0;
			if(Iter instanceof Collection<?>){
				maxID= ((Collection<?>)Iter).size();
			}
			if(maxID==0){
				entity.setId(1);
			}else{
				maxID=maxID+1;
				entity.setId(maxID);
			}
			if(entity.getUser_id()==null){
				entity.setUser_id(projectAuthentication.getCurrentUser().getId().intValue());
			}
			entity.setRegistereddt(ProjectAuthentication.getCurrentDate());
		}catch(Exception e){
			
		}
		
	}
	
	private ProjectUserMapping updateEntry(ProjectUserMapping entity)
	{
		ProjectUserMapping oldEntity = mappingrepository.findmapbyProjectandUserID(entity.getProject_id().intValue(),entity.getUser_id().intValue());
		return oldEntity;
	}
	
}