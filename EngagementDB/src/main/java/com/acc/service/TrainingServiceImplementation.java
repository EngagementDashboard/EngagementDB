package com.acc.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acc.dao.TrainingDetailsDAO;

@Service
public class TrainingServiceImplementation implements TrainingServiceFacade{

	@Autowired
	TrainingDetailsDAO trainingdao;
	
	@Transactional
	public int getSlideNumber(String enterpriseId, Long topicId) {
		// TODO Auto-generated method stub
		int count = 0;
		try{
			count = trainingdao.getSlideNumber(enterpriseId, topicId);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return count;
	}

	@Transactional
	public int updateSlideNumber(String enterpriseId, Long topicId, int slideNumber){
		int count = 0;
		try{
			count = trainingdao.updateSlideNumber(enterpriseId, topicId, slideNumber);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return count;
	}
	

	@Transactional
	public int completeStatus(String enterpriseId, Long topicId) {
		// TODO Auto-generated method stub
		int count = 0;
		try{
			count = trainingdao.completeStatus(enterpriseId, topicId);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return count;
	}
	
}
