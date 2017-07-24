package com.acc.dao;

import java.util.List;

import com.acc.entity.IdeaProgress;
import com.acc.entity.IdeaStatus;
import com.acc.entity.Innovation;

public interface InnovationDaoFacade {
	public Integer addIdea(Innovation idea);
	public List<Innovation> allIdeas();
	public List<Innovation> myIdeas(String enterpriseId);
	public IdeaStatus getIdeaStatus(Integer ideaId);
	public Integer setStatusOfIdea(Integer ideaId, String comments, String status , String reviewer);
	public int addDevelopers(Integer ideaId, String developer);
	public List<Innovation> getIdeasUnderDevelopment(String developer);
	public int addNote(IdeaProgress ideaProgress, String developer);
	public boolean isReviewer(Long employeeId);

}
