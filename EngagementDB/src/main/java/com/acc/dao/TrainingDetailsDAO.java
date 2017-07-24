package com.acc.dao;

public interface TrainingDetailsDAO {

	public int trainingDetails(String enterpriseID);
	public int getSlideNumber(String enterpriseId, Long topicId);
	public int updateSlideNumber(String enterpriseId, Long topicId, int slideNumber);
	public int completeStatus(String enterpriseId, Long topicId);
}
