package edu.tamu.ctv.controller;

import java.beans.PropertyEditorSupport;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.tamu.ctv.entity.FileUpload;
import edu.tamu.ctv.entity.ProjectAccess;
import edu.tamu.ctv.entity.ProjectUserMapping;
import edu.tamu.ctv.entity.Projects;
import edu.tamu.ctv.entity.Projecttypes;
import edu.tamu.ctv.entity.Users;
import edu.tamu.ctv.entity.enums.Access;
import edu.tamu.ctv.entity.enums.Status;
import edu.tamu.ctv.repository.FileUploadRepository;
import edu.tamu.ctv.repository.ProjectAccessRepository;
import edu.tamu.ctv.repository.ProjectTypesRepository;
import edu.tamu.ctv.repository.ProjectUserMappingRepository;
import edu.tamu.ctv.repository.ProjectsRepository;
import edu.tamu.ctv.repository.UsersRepository;
import edu.tamu.ctv.service.ProjectService;
import edu.tamu.ctv.service.ProjectUserMappingService;
import edu.tamu.ctv.service.validator.ProjectFormValidator;
import edu.tamu.ctv.utils.session.ProjectAuthentication;

@Controller
public class ProjectController
{
	private final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	@Autowired
	ProjectFormValidator projectFormValidator;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private ProjectsRepository projectRepository;

	@Autowired
	private ProjectTypesRepository projectTypesRepository;
	
	@Autowired
	private ProjectAccessRepository projectAccessRepository;
	
	@Autowired
	private ProjectUserMappingRepository mappingRepository;

	@Autowired
	private UsersRepository userRepository;
	@Autowired
	private FileUploadRepository uploadRepository;
	
	@Autowired
	private ProjectUserMappingService mappingservice;
	
	@Autowired
	private ProjectAuthentication projectAuthentication;
	
	@Autowired
	private FileUploadRepository fileuploadrepository;
	
	@RequestMapping(value = "/projects", method = RequestMethod.GET)
	public String requestProjects(Model model)
	{
		logger.debug("showAllProjects()");
		model.addAttribute("projects", projectRepository.findAll());
		model.addAttribute("user_id", projectAuthentication.getCurrentUser().getId());
		return "projects/viewProject";
	}
	@RequestMapping(value = "/projects/request", method = RequestMethod.GET)
	public String showAllProjects(Model model)
	{
		logger.debug("showAllProjects()");
		model.addAttribute("projects", projectRepository.findAll());
		model.addAttribute("user_id", projectAuthentication.getCurrentUser().getLogin());
		return "projects/projectRequest";
	}
	
	@RequestMapping(value = "/projects/requested", method = RequestMethod.GET)
	public String showRequestedProjects(Model model)
	{
		logger.debug("showRequestedProjects()");
		model.addAttribute("projects", projectRepository.findAll());
		model.addAttribute("user_id", projectAuthentication.getCurrentUser().getLogin());
		return "projects/requestedProject";
	}

	@RequestMapping(value = "/projects", method = RequestMethod.POST)
	public String saveOrUpdateProject(@ModelAttribute("projectForm") @Validated Projects project, BindingResult result, Model model, final RedirectAttributes redirectAttributes)
	{
		logger.debug("saveOrUpdateProject() : {}", project);
		
		if (result.hasErrors())
		{
			populateDefaultModel(model, project);
			return "projects/projectform";
		}
		else
		{
			redirectAttributes.addFlashAttribute("css", "success");
			if (project.isNew())
			{
				redirectAttributes.addFlashAttribute("msg", "Project added successfully!");
			}
			else
			{
				redirectAttributes.addFlashAttribute("msg", "Project updated successfully!");
			}
		
			projectService.save(project);
			Set<Users>lListofProjectReviewers=new HashSet<Users>(0);
			if(project.getProjectreviewerses()!=null){
				lListofProjectReviewers=project.getProjectreviewerses();
			}
			Iterator<Users> iter =lListofProjectReviewers.iterator();
			while(iter.hasNext()){
				ProjectUserMapping projectmapentity = new ProjectUserMapping();
				projectmapentity.setProject_id(project.getId().intValue());
				projectmapentity.setRole(3);
				projectmapentity.setIs_active('Y');
				projectmapentity.setUser_id(iter.next().getId().intValue());
				mappingservice.save(projectmapentity);
			}
			Set<Users>lListofProjectMembers=new HashSet<Users>(0);
			if(project.getProjectmemberses()!=null){
				lListofProjectMembers=project.getProjectmemberses();
			}
			Iterator<Users> iter1 =lListofProjectMembers.iterator();
			while(iter1.hasNext()){
				ProjectUserMapping projectmapentity = new ProjectUserMapping();
				projectmapentity.setProject_id(project.getId().intValue());
				projectmapentity.setRole(2);
				projectmapentity.setIs_active('Y');
				projectmapentity.setUser_id(iter1.next().getId().intValue());
				mappingservice.save(projectmapentity);
			}
			
			ProjectUserMapping projectmapentity = new ProjectUserMapping();
			projectmapentity.setProject_id(project.getId().intValue());
			projectmapentity.setRole(1);
			projectmapentity.setIs_active('Y');
			mappingservice.save(projectmapentity);

			return "redirect:/projects/" + project.getId();
		}
	}

	@RequestMapping(value = "/projects/delete/{id}", method = RequestMethod.POST)
	public String deleteProject(@PathVariable("id") Long id, final RedirectAttributes redirectAttributes)
	{
		logger.debug("deleteProject() : {}", id);

		projectRepository.delete(id);
		redirectAttributes.addFlashAttribute("css", "success");
		redirectAttributes.addFlashAttribute("msg", "Project is deleted!");

		return "redirect:/projects";

	}

	@RequestMapping(value = "/projects/{id}", method = RequestMethod.GET)
	public String showProject(@PathVariable("id") Long id, Model model)
	{

		logger.debug("showProject() id: {}", id);

		Projects project = projectRepository.findOne(id);
		if (project == null)
		{
			model.addAttribute("css", "danger");
			model.addAttribute("msg", "Project not found");
		}
		model.addAttribute("project", project);
		model.addAttribute("user_id", projectAuthentication.getCurrentUser().getId());

		return "projects/show";

	}

	@ExceptionHandler(EmptyResultDataAccessException.class)
	public ModelAndView handleEmptyData(HttpServletRequest req, Exception ex)
	{

		logger.debug("handleEmptyData()");
		logger.error("Request: {}, error ", req.getRequestURL(), ex);

		ModelAndView model = new ModelAndView();
		model.setViewName("project/show");
		model.addObject("msg", "project not found");

		return model;
	}

	@RequestMapping(value = "/projects/add", method = RequestMethod.GET)
	public String showAddProjectForm(Model model)
	{
		logger.debug("showAddProjectForm()");
		Projects project = new Projects();
		// set default value
		model.addAttribute("projectForm", project);
		populateDefaultModel(model, project);
		return "projects/projectform";

	}

	@RequestMapping(value = "/projects/update/{id}", method = RequestMethod.GET)
	public String showUpdateProjectForm(@PathVariable("id") Long id, Model model)
	{

		logger.debug("showUpdateProjectForm() : {}", id);

		Projects project = projectRepository.findOne(id);
		model.addAttribute("projectForm", project);

		populateDefaultModel(model, project);

		return "projects/projectform";

	}

	@RequestMapping(value = "/projects/select", method = RequestMethod.GET)
	public String selectProject(Model model, @RequestParam(value = "todoaction", required = false) String TODOAction, HttpServletRequest request)
	{
		model.addAttribute("todoaction", TODOAction);
		model.addAttribute("projects", projectRepository.findAll());
	    return "projects/select";
	}
	
	@RequestMapping(value = "/projects/select/{id}", method = RequestMethod.GET)
	public String selectProject(@PathVariable("id") Long id, @RequestParam(value = "todoaction", required = false) String TODOAction, Model model, HttpServletRequest request)
	{
		Projects project = projectRepository.findOne(id);

		HttpSession session = request.getSession();
		session.setAttribute("projectId", id);
		session.setAttribute("currentProjectCode", project.getCode());

		model.addAttribute("projectForm", project);
		model.addAttribute("select",true);
		populateDefaultModel(model, project);
		if (TODOAction != null)
		{
			if (TODOAction.equals("import"))
			{
				return "redirect:/upload?projectId=" + id;
			}
			else if (TODOAction.equals("export"))
			{
				return "redirect:/export/" + id;
			}
		}
		return "projects/projectform";
	}
	
	@RequestMapping(value = "/projects/view/{id}", method = RequestMethod.GET)
	public String grantViewAccess(@PathVariable("id") Long id, @RequestParam(value = "todoaction", required = false) String TODOAction, Model model, HttpServletRequest request,final RedirectAttributes redirectAttributes)
	{
		Projects project = projectRepository.findOne(id);
		ProjectUserMapping lMapping =mappingRepository.findmapbyProjectandUserID(id.intValue(),projectAuthentication.getCurrentUser().getId().intValue());
		HttpSession session = request.getSession();
		session.setAttribute("projectId", id);
		session.setAttribute("currentProjectCode", project.getCode());
		if(lMapping.getId()!=null){
			ProjectAccess lProjAccess =new ProjectAccess();
			lProjAccess=projectAccessRepository.findAccess(id.intValue(),projectAuthentication.getCurrentUser().getId().intValue());
			if(lProjAccess!=null && lProjAccess.getId()!=null && lProjAccess.getRead()!=' ' && lProjAccess.getRead()=='Y' ){
				redirectAttributes.addFlashAttribute("Access Granted Successfully");
			}
			if(lProjAccess!=null){
				
			}else{
				lProjAccess =new ProjectAccess();
				
			}
			lProjAccess.setProject_id(id.intValue());
			lProjAccess.setUser_id(projectAuthentication.getCurrentUser().getId().intValue());
			lProjAccess.setRead('Y');
			lProjAccess.setWrite('N');
			lProjAccess.setIs_Active('Y');
//			//lProjAccess.setCreateddt(ProjectAuthentication.getCurrentDate());
			projectAccessRepository.save(lProjAccess);
			redirectAttributes.addFlashAttribute("css", "success");
			redirectAttributes.addFlashAttribute("msg","Access Granted Successfully");
		}
		return "redirect:/projects/"+id;
	}
	@RequestMapping(value = "/projects/approve/{id}", method = RequestMethod.GET)
	public String approveRequest(@PathVariable("id") Long id, @RequestParam(value = "todoaction", required = false) String TODOAction, Model model, HttpServletRequest request,final RedirectAttributes redirectAttributes)
	{
		Projects project = projectRepository.findOne(id);
		ProjectUserMapping lMapping =mappingRepository.findmapbyProjectandUserIDapprove(id.intValue());
		HttpSession session = request.getSession();
		session.setAttribute("projectId", id);
		session.setAttribute("currentProjectCode", project.getCode());
		if(lMapping.getId()!=null){
			lMapping.setApproved('Y');
			lMapping.setApprovaldat(ProjectAuthentication.getCurrentDate());
//			//lProjAccess.setCreateddt(ProjectAuthentication.getCurrentDate());
			mappingRepository.save(lMapping);
			redirectAttributes.addFlashAttribute("css", "success");
			redirectAttributes.addFlashAttribute("msg","Request approved successfully.");
		}
		return "redirect:/projects/"+id;
	}
	@RequestMapping(value = "/projects/reject/{id}", method = RequestMethod.GET)
	public String rejectRequest(@PathVariable("id") Long id, @RequestParam(value = "todoaction", required = false) String TODOAction, Model model, HttpServletRequest request,final RedirectAttributes redirectAttributes)
	{
		Projects project = projectRepository.findOne(id);
		ProjectUserMapping lMapping =mappingRepository.findmapbyProjectandUserIDapprove(id.intValue());
		HttpSession session = request.getSession();
		session.setAttribute("projectId", id);
		session.setAttribute("currentProjectCode", project.getCode());
		if(lMapping.getId()!=null){
			lMapping.setApproved('N');
			lMapping.setApprovaldat(ProjectAuthentication.getCurrentDate());
//			//lProjAccess.setCreateddt(ProjectAuthentication.getCurrentDate());
			mappingRepository.save(lMapping);
			redirectAttributes.addFlashAttribute("css", "success");
			redirectAttributes.addFlashAttribute("msg","Request rejected successfully.");
		}
		return "redirect:/projects/"+id;
	}
	@RequestMapping(value = "/projects/updateaccess/{id}", method = RequestMethod.GET)
	public String grantUpdateAccess(@PathVariable("id") Long id, @RequestParam(value = "todoaction", required = false) String TODOAction, Model model, HttpServletRequest request,final RedirectAttributes redirectAttributes)
	{
		Projects project = projectRepository.findOne(id);
		ProjectUserMapping lMapping =mappingRepository.findmapbyProjectandUserID(id.intValue(),projectAuthentication.getCurrentUser().getId().intValue());
		HttpSession session = request.getSession();
		session.setAttribute("projectId", id);
		session.setAttribute("currentProjectCode", project.getCode());
		if(lMapping.getId()!=null){
			
			ProjectAccess lProjAccess =new ProjectAccess();
			lProjAccess=projectAccessRepository.findAccess(id.intValue(),projectAuthentication.getCurrentUser().getId().intValue());
			if(lProjAccess!=null && lProjAccess.getId()!=null && lProjAccess.getWrite()!=' ' && lProjAccess.getWrite()=='Y'){
				redirectAttributes.addFlashAttribute("Access Granted Successfully");
			}
			if(lProjAccess!=null){
				
			}else{
				lProjAccess =new ProjectAccess();
				
			}
			lProjAccess.setProject_id(id.intValue());
			lProjAccess.setUser_id(projectAuthentication.getCurrentUser().getId().intValue());
			lProjAccess.setRead('Y');
			lProjAccess.setWrite('Y');
			lProjAccess.setIs_Active('Y');
//			//lProjAccess.setCreateddt(ProjectAuthentication.getCurrentDate());
			projectAccessRepository.save(lProjAccess);
			redirectAttributes.addFlashAttribute("css", "success");
			redirectAttributes.addFlashAttribute("msg","Access Granted Successfully");
		}
		return "redirect:/projects/"+id;
	}
	@RequestMapping(value = "/projects/revokeaccess/{id}", method = RequestMethod.GET)
	public String revokeAccess(@PathVariable("id") Long id, @RequestParam(value = "todoaction", required = false) String TODOAction, Model model, HttpServletRequest request)
	{
		
		ProjectAccess lAccess =projectAccessRepository.findAccess(id.intValue(), projectAuthentication.getCurrentUser().getId().intValue());
		lAccess.setIs_Active('N');
			projectAccessRepository.save(lAccess);
		
		return "Access Revoked Successfully";
	}
	
	@RequestMapping(value = "/projects/deletefile/{id}/{filename}", method = RequestMethod.GET)
	public String deleteFile(@PathVariable("id") Long id,@PathVariable("filename") String[] filename, @RequestParam(value = "todoaction", required = false) String TODOAction, Model model, HttpServletRequest request)
	{
		
		List<FileUpload> lUpload =fileuploadrepository.findFilesByIds(id);
		
		for(int i=0;i<filename.length;i++){
			for(int j=0;j<lUpload.size();j++){
				if(lUpload.get(j).equals(filename[i])){
					fileuploadrepository.delete(lUpload.get(j));
				}
			}
		}
		
		return "File Deleted Successfully";
	}


	private void populateDefaultModel(Model model, Projects project)
	{
		model.addAttribute("projectForm", project);
		model.addAttribute("usersCache", (List<Users>) userRepository.findAll());
		model.addAttribute("projectTypesCache", (List<Projecttypes>) projectTypesRepository.findAll());
		model.addAttribute("accessList", Access.values());
		model.addAttribute("statusList", Status.values());
		if(project.getId()!=null){
				model.addAttribute("fileListcache",uploadRepository.findFilesById(project.getId()));
				
			
		}
	}

	@InitBinder
	protected void initBinder(WebDataBinder binder) throws Exception
	{
		binder.setValidator(projectFormValidator);
		
		binder.registerCustomEditor(Projecttypes.class, "projecttypes", new PropertyEditorSupport()
		{
			@Override
			public void setAsText(String text)
			{
				Projecttypes ch = projectTypesRepository.findOne(Long.parseLong(text));
				setValue(ch);
			}
		});
		
		binder.registerCustomEditor(Access.class, new PropertyEditorSupport()
		{
	        @Override
	        public void setAsText(String value) throws IllegalArgumentException
	        {
	            if (StringUtils.isBlank(value)) return;
	            setValue(Access.parse(Integer.valueOf(value)));
	        }

	    });
		
		binder.registerCustomEditor(Status.class, new PropertyEditorSupport()
		{
	        @Override
	        public void setAsText(String value) throws IllegalArgumentException
	        {
	            if (StringUtils.isBlank(value)) return;
	            setValue(Status.parse(Integer.valueOf(value)));
	        }

	    });
	}
}
