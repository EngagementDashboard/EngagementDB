package com.acc.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

//import com.acc.dao.DaoFacade;
import com.acc.dao.ProjectDao;
import com.acc.entity.EmployeeProject;
import com.acc.entity.Program;
import com.acc.entity.Project;
import com.acc.entity.ProjectLocation;
@Service
public class ProjectServiceImplementation implements ProjectServiceFacade{
	@Autowired
	ProjectDao projectdao;
	@Transactional
	public int addNewProject(String projectName,String projectDescription,String creatorName,Integer programId) {
		int count = 0;
		try
		{
		 count = projectdao.addNewProject(projectName, projectDescription, creatorName,programId);
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return count;
	}
	@Transactional
	public List<Project> getAllProjects() {
		List<Project> allProjectsData = new ArrayList<Project>();
		try{
			allProjectsData =projectdao.getAllProjects();
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return allProjectsData;
	}
	@Transactional
	public String getProjectName(Integer projectId) {
		String projectName = null;
		try
		{
			projectName = projectdao.getProjectName(projectId);
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return projectName;
		
	}
	@Transactional
	public int UpdateProjectDetails(Project project) {
		int count = 0;
		try
		{
			count = projectdao.UpdateProjectDetails(project);
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return count;

}
	@Transactional
	public Project getProject(Integer id) {
		// TODO Auto-generated method stubint count = 0;
		
		
			Project project=new Project();
			try{
				project = projectdao.getProject(id);
				
			}
			catch(ClassNotFoundException e)
			{
				e.printStackTrace();
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			return project;
		}

	/*@Transactional
	public List<Program> getAllProjectPrograms() {
		List<Program> programs = new ArrayList<Program>();
		try{
			programs = projectdao.getAllProjectPrograms();
			
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return programs;
	}*/
	@Transactional
	public EmployeeProject getEmployeeProjectRoleDetails(Long employeeId) {
		EmployeeProject employeeProject=new EmployeeProject();
		try{
			employeeProject =projectdao.getEmployeeProjectRoleDetails(employeeId);
			
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return employeeProject;
	}
	@Transactional
	public EmployeeProject getEmployeeRoleOffDetails(Long employeeId) {
		EmployeeProject employeeProject=new EmployeeProject();
		try{
			employeeProject =projectdao.getEmployeeRoleOffDetails(employeeId);
			
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return employeeProject;
		
	}
	@Transactional
	public int deleteProject(Integer id) {
		// TODO Auto-generated method stub
		int count = 0;
		try{
			count = projectdao.deleteProject(id);
			
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return count;
	}
	@Transactional
	public List<ProjectLocation> getAllProjectLocationDetails() {
		List<ProjectLocation> projectLocationDetails = projectdao.getAllProjectLocationDetails();
		return projectLocationDetails;
	}
	@Transactional
	public int assignProject(EmployeeProject employeeProject,String creatorName,Integer locationId) {
		int count = 0;
		count = projectdao.assignProject(employeeProject,creatorName,locationId);
		return count;
	
	}
	
}
