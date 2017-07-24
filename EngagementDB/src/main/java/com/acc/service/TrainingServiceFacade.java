package com.acc.service;

public interface TrainingServiceFacade {
	
	public int getSlideNumber(String enterpriseId ,Long topicId);
	public int updateSlideNumber(String enterpriseId, Long topicId, int slideNumber);
	public int completeStatus(String enterpriseId, Long topicId);
}
