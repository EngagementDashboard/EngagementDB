package com.acc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acc.dao.InnovationDaoFacade;
import com.acc.entity.IdeaProgress;
import com.acc.entity.IdeaStatus;
import com.acc.entity.Innovation;
@Service
public class InnovationServiceImpl implements InnovationServiceFacade{
	@Autowired
	InnovationDaoFacade innovationDaoImpl;
	
	@Transactional
	public Integer addIdea(Innovation idea) {
		int count = 0;
		count = innovationDaoImpl.addIdea(idea);
		return count;
	}
	@Transactional
	public List<Innovation> allIdeas() {
		List<Innovation> ideas = innovationDaoImpl.allIdeas();
		return ideas;
	}
	@Transactional
	public IdeaStatus getIdeaStatus(Integer ideaId) {
		IdeaStatus status = innovationDaoImpl.getIdeaStatus(ideaId);
		return status;
	}
	@Transactional
	public Integer setStatusOfIdea(Integer ideaId, String comments, String status, String reviewer) {
		int count = innovationDaoImpl.setStatusOfIdea(ideaId, comments, status, reviewer);
		return count;
	}
	@Transactional
	public List<Innovation> myIdeas(String enterpriseId) {
		List<Innovation> ideas = innovationDaoImpl.myIdeas(enterpriseId);
		return ideas;
	}
	@Transactional
	public int addDevelopers(Integer ideaId, String developer) {
		int count = innovationDaoImpl.addDevelopers(ideaId, developer);
		return count;
	}
	@Transactional
	public List<Innovation> getIdeasUnderDevelopment(String developer) {
		List<Innovation> ideas = innovationDaoImpl.getIdeasUnderDevelopment(developer);
		return ideas;
	}
	@Transactional
	public int addNote(IdeaProgress ideaProgress, String developer) {
		int count = innovationDaoImpl.addNote(ideaProgress, developer);
		return count;
	}
	@Transactional
	public boolean isReviewer(Long employeeId) {
		boolean reviewer = innovationDaoImpl.isReviewer(employeeId);
		return reviewer;
	}

}
