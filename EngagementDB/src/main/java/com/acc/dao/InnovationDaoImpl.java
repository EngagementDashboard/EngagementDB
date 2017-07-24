package com.acc.dao;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.acc.entity.Authority;
import com.acc.entity.IdeaDevelopers;
import com.acc.entity.IdeaProgress;
import com.acc.entity.IdeaStatus;
import com.acc.entity.Innovation;

@Repository
public class InnovationDaoImpl extends AbstractDao implements InnovationDaoFacade{

	public Integer addIdea(Innovation idea) {
		int count = 0;
		Session session = getSession();
		Innovation innovation = new Innovation();
		innovation.setEnterpriseId(idea.getEnterpriseId());
		innovation.setIdeaDescription(idea.getIdeaDescription());
		innovation.setCategory(idea.getCategory());
		innovation.setSubCategory(idea.getSubCategory());
		session.save(innovation);
		count = 1;
		return count;
	}

	public List<Innovation> allIdeas() {
		List<Innovation> ideas = new ArrayList<Innovation>();
		Session session = getSession();
		Query query = session.createQuery("select e from Innovation e");
		ideas = query.list();
		return ideas;
	}

	public IdeaStatus getIdeaStatus(Integer ideaId) {
		List<IdeaStatus> ideaStatus = new ArrayList<IdeaStatus>();
		IdeaStatus status = new IdeaStatus();
		Session session = getSession();
		Query query = session.createQuery("select e from IdeaStatus e where e.ideaId=:ideaId");
		query.setParameter("ideaId", ideaId);
		ideaStatus = query.list();
		for(IdeaStatus stat : ideaStatus)
			status = stat;
		return status;
	}

	public Integer setStatusOfIdea(Integer ideaId, String comments, String status, String reviewer) {
		List<IdeaStatus> ideaStatusList = new ArrayList<IdeaStatus>();
		Session session = getSession();
		int count = 0;
		Query query = session.createQuery("select e from IdeaStatus e where e.ideaId=:ideaId");
		query.setParameter("ideaId", ideaId);
		ideaStatusList = query.list();
		if(ideaStatusList.isEmpty())
		{
			IdeaStatus ideaStatus = new IdeaStatus();
			ideaStatus.setIdeaId(ideaId);
			ideaStatus.setEnterpriseId(reviewer);
			ideaStatus.setComments(comments);
			ideaStatus.setStatus(status);
			session.save(ideaStatus);
			count = 1;
		}
		else
		{
			Query query1 = session.createQuery("update IdeaStatus e set e.status=:status,e.comments=:comments,e.enterpriseId=:enterpriseId where e.ideaId=:ideaId");
			query1.setParameter("status",status);
			query1.setParameter("comments",comments);
			query1.setParameter("enterpriseId",reviewer);
			query1.setParameter("ideaId", ideaId);
			count = query1.executeUpdate();
		}
		return count;
	}

	public List<Innovation> myIdeas(String enterpriseId) {
		List<Innovation> ideas = new ArrayList<Innovation>();
		Session session = getSession();
		Query query = session.createQuery("select e from Innovation e where e.enterpriseId=:enterpriseId");
		query.setParameter("enterpriseId", enterpriseId);
		ideas = query.list();
		return ideas;
	}

	public int addDevelopers(Integer ideaId, String developer) {
		int count = 0;
		Session session = getSession();
		IdeaDevelopers developers = new IdeaDevelopers();
		developers.setIdeaId(ideaId);
		developers.setEnterpriseId(developer);
		session.save(developers);
		count = 1;
		return count;
	}

	public List<Innovation> getIdeasUnderDevelopment(String developer) {
		List<Innovation> ideas= new ArrayList<Innovation>();
		Session session = getSession();
		Query query = session.createQuery("select e from Innovation e where e.ideaId in(select x.ideaId from IdeaDevelopers x where x.enterpriseId=:enterpriseId)");
		query.setParameter("enterpriseId", developer);
		ideas = query.list();
		return ideas;
	}

	public int addNote(IdeaProgress ideaProgress, String developer) {
		int count = 0;
		Session session = getSession();
		IdeaProgress progress = new IdeaProgress();
		progress.setIdeaId(ideaProgress.getIdeaId());
		progress.setEnterpriseId(developer);
		progress.setProgress(ideaProgress.getProgress());
		session.save(progress);
		count = 1;
		return count;
	}

	public boolean isReviewer(Long employeeId) {
		Session session = getSession();
		String empId = employeeId.toString();
		Query query = session.createQuery("select a from Authority a where a.employeeId=:employeeId and a.authority=:authority");
		query.setParameter("employeeId", empId);
		query.setParameter("authority", "IDEA_REVIEW");
		List<Authority> authorities = query.list();
		if(authorities.size() > 0)
			return true;
		else
			return false;
	}

}
