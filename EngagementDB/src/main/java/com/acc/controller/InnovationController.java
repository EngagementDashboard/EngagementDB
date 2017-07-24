package com.acc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.acc.entity.IdeaProgress;
import com.acc.entity.IdeaStatus;
import com.acc.entity.Innovation;
import com.acc.entity.ResourceMaster;
import com.acc.service.EmployeeServiceFacade;
import com.acc.service.InnovationServiceFacade;


@Controller
public class InnovationController {
	@Autowired
	InnovationServiceFacade innovationServiceImpl;
	@Autowired
	EmployeeServiceFacade employeeServiceImpl;
	@RequestMapping("/addIdea.htm")
	public ModelAndView addIdea(@ModelAttribute Innovation idea)
	{
		ModelAndView modelAndView = new ModelAndView();
		int count = innovationServiceImpl.addIdea(idea);
		if(count == 1)
			modelAndView.addObject("ideaCode", "success");
		else
			modelAndView.addObject("ideaCode", "failure");
		modelAndView.setViewName("myProfile");
		return modelAndView;
	}
	
	@RequestMapping("/getAllIdeas.htm")
	public ModelAndView allIdeas(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView modelAndView = new ModelAndView();
		List<Innovation> ideas =  innovationServiceImpl.allIdeas();
		HttpSession session=request.getSession();
		ResourceMaster employee = (ResourceMaster) session.getAttribute("resource");
		boolean isReviewer = innovationServiceImpl.isReviewer(employee.getEmployeeId());
		Map<Integer,String> ideaAndTeam = new HashMap<Integer,String>();
		Map<Integer,IdeaStatus> ideaAndStatus = new HashMap<Integer,IdeaStatus>();
		for(Innovation idea : ideas)
		{
			String team = "";
			ResourceMaster resource = employeeServiceImpl.searchEmployee(idea.getEnterpriseId());
			if(resource.getProjectId() != null)
				 team = resource.getProject().getProgram().getProgramName();
			ideaAndTeam.put(idea.getIdeaId(),team );
			IdeaStatus status = innovationServiceImpl.getIdeaStatus(idea.getIdeaId());
			ideaAndStatus.put(idea.getIdeaId(), status);
		}
		modelAndView.addObject("ideas", ideas);
		modelAndView.addObject("ideaAndTeam", ideaAndTeam);
		modelAndView.addObject("ideaAndStatus", ideaAndStatus);
		modelAndView.addObject("isReviewer", isReviewer);
		modelAndView.setViewName("allIdeas");
		return modelAndView;
	}
	@RequestMapping("/reviewIdea.htm")
	public ModelAndView reviewIdea(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session=request.getSession();
		ResourceMaster employee = (ResourceMaster) session.getAttribute("resource");
		Integer ideaId = Integer.valueOf(request.getParameter("ideaId"));
		String comments = request.getParameter("comments");
		String status = request.getParameter("approveOrReject");
		if(status.equalsIgnoreCase("approve"))
			status = "Approved";
		else if(status.equalsIgnoreCase("reject"))
			status = "Rejected";
		else
			status = "On Hold";
		String reviewer = employee.getEnterpriseId();
		int count = innovationServiceImpl.setStatusOfIdea(ideaId, comments, status, reviewer);
		List<Innovation> ideas =  innovationServiceImpl.allIdeas();
		
		Map<Integer,String> ideaAndTeam = new HashMap<Integer,String>();
		Map<Integer,IdeaStatus> ideaAndStatus = new HashMap<Integer,IdeaStatus>();
		for(Innovation idea : ideas)
		{
			String team = "";
			ResourceMaster resource = employeeServiceImpl.searchEmployee(idea.getEnterpriseId());
			if(resource.getProjectId() != null)
				 team = resource.getProject().getProgram().getProgramName();
			ideaAndTeam.put(idea.getIdeaId(),team );
			IdeaStatus ideaStatus = innovationServiceImpl.getIdeaStatus(idea.getIdeaId());
			ideaAndStatus.put(idea.getIdeaId(), ideaStatus);
		}
		modelAndView.addObject("ideas", ideas);
		modelAndView.addObject("ideaAndTeam", ideaAndTeam);
		modelAndView.addObject("ideaAndStatus", ideaAndStatus);
		if(count == 1)
			modelAndView.addObject("reviewCode","success");
		else
			modelAndView.addObject("reviewCode","failure");
		modelAndView.setViewName("allIdeas");
		return modelAndView;
	}
	@RequestMapping("/getMyIdeas.htm")
	public ModelAndView myIdeas(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session=request.getSession();
		ResourceMaster employee = (ResourceMaster) session.getAttribute("resource");
		List<Innovation> ideas =  innovationServiceImpl.myIdeas(employee.getEnterpriseId());		
		Map<Integer,String> ideaAndTeam = new HashMap<Integer,String>();
		Map<Integer,IdeaStatus> ideaAndStatus = new HashMap<Integer,IdeaStatus>();
		for(Innovation idea : ideas)
		{
			String team = "";
			ResourceMaster resource = employeeServiceImpl.searchEmployee(idea.getEnterpriseId());
			if(resource.getProjectId() != null)
				 team = resource.getProject().getProgram().getProgramName();
			ideaAndTeam.put(idea.getIdeaId(),team );
			IdeaStatus status = innovationServiceImpl.getIdeaStatus(idea.getIdeaId());
			ideaAndStatus.put(idea.getIdeaId(), status);
		}
		modelAndView.addObject("page", "myidea");
		modelAndView.addObject("ideas", ideas);
		modelAndView.addObject("ideaAndTeam", ideaAndTeam);
		modelAndView.addObject("ideaAndStatus", ideaAndStatus);
		modelAndView.setViewName("allIdeas");
		return modelAndView;
	}
	@RequestMapping("/addDeveloper.htm")
	public ModelAndView addDevelopers(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView modelAndView = new ModelAndView();
		String[] developers = new String[20];
		Integer ideaId = Integer.valueOf(request.getParameter("ideaId"));
		Integer count = Integer.valueOf(request.getParameter("index"));
		for(int i = 0 ; i < count ; i++)
		{
			String id = "developer" + i;
			String developer = request.getParameter(id);
			developers[i] = developer;
			System.out.println(developers[i]);
			int counter = innovationServiceImpl.addDevelopers(ideaId, developer);
		}
		modelAndView = myIdeas(request,response);
		return modelAndView;
	}
	@RequestMapping("/getMyIdeasUnderDevelopment.htm")
	public ModelAndView getMyIdeasUnderDevelopment(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session=request.getSession();
		ResourceMaster employee = (ResourceMaster) session.getAttribute("resource");
		String develperId = employee.getEnterpriseId();
		List<Innovation> ideas = innovationServiceImpl.getIdeasUnderDevelopment(develperId);
		session.setAttribute("ideasunderdevelopment", ideas);
		modelAndView.setViewName("ideasUnderDevelopment");
		return modelAndView;
	}
	@RequestMapping(value = "/addNote.htm" ,method=RequestMethod.POST)
	public ModelAndView addProgressNote(@ModelAttribute IdeaProgress ideaProgress, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session=request.getSession();
		ResourceMaster employee = (ResourceMaster) session.getAttribute("resource");
		String developerId = employee.getEnterpriseId();
		int count = innovationServiceImpl.addNote(ideaProgress, developerId);
		if(count == 1)
			modelAndView.addObject("code", "success");
		else
			modelAndView.addObject("code", "failure");		
		modelAndView.setViewName("ideasUnderDevelopment");
		return modelAndView;
	}

}
