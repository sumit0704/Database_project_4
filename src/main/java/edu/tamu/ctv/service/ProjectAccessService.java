package edu.tamu.ctv.service;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.tamu.ctv.entity.Projects;
import edu.tamu.ctv.repository.ProjectsRepository;
import edu.tamu.ctv.utils.session.ProjectAuthentication;

@Service("projectAccessService")
public class ProjectAccessService
{
	private final Logger logger = LoggerFactory.getLogger(ProjectAccessService.class);
	
	@Autowired
	private ProjectsRepository projectRepository;

	
	
	public Projects findByCode(String code)
	{
		return projectRepository.findTopByCode(code);
	}
	
	public void save(Projects entity)
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
			projectRepository.save(entity);
		}
		catch (Exception e)
		{
			logger.error(e.getMessage(), e);
		}
	}
	
	private void InitDefaultValues(Projects entity)
	{
		
	}
	
	private Projects updateEntry(Projects entity)
	{
		Projects oldEntity = projectRepository.findOne(entity.getId());
		
		oldEntity.setName(entity.getName());
		oldEntity.setAccess(entity.getAccess());
		oldEntity.setStatus(entity.getStatus());
		oldEntity.setNotes(entity.getNotes());
		oldEntity.setStarts(entity.getStarts());
		oldEntity.setEnds(entity.getEnds());
		oldEntity.setProjectmanagerses(entity.getProjectmanagerses());
		oldEntity.setProjectreviewerses(entity.getProjectreviewerses());
		oldEntity.setProjectmemberses(entity.getProjectmemberses());
		
		oldEntity.setLastupdatedt(ProjectAuthentication.getCurrentDate());

		return oldEntity;
	}
	
}