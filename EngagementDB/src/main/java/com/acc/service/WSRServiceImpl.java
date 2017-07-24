package com.acc.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acc.dao.WSRDaoFacade;
import com.acc.entity.ResourceTaskAndVocation;
import com.acc.entity.ResourceTaskHelper;
import com.acc.entity.WeeklyStatus;

@Service
public class WSRServiceImpl implements WSRServiceFacade {
	@Autowired
	WSRDaoFacade wsrDaoImpl;

	@Transactional
	public int addResourceTask( WeeklyStatus weeklyStatus, ResourceTaskHelper resourceTask, String ProjectName) {
		int count = 0;
		count = wsrDaoImpl.addResourceTask(weeklyStatus, resourceTask,ProjectName);
		return count;

	}
	
	@Transactional
	public int addWeeklyStatus(WeeklyStatus weeklyResource, String projectName) {
		int count = 0;
		count = wsrDaoImpl.addWeeklyStatus(weeklyResource, projectName);
		return count;

	}
	@Transactional
	public List<WeeklyStatus> getWSRRecordsByProject(String projectName) {
		// TODO Auto-generated method stub
		
		List<WeeklyStatus> wsrRecords = new ArrayList<WeeklyStatus>();
		wsrRecords = wsrDaoImpl.getWSRRecordsByProject(projectName);
		return wsrRecords;

	}
	@Transactional
	public List<ResourceTaskAndVocation> getVacationdetailsByWorkID(int workid) {
	
		List<ResourceTaskAndVocation> WorkRecords = new ArrayList<ResourceTaskAndVocation>();
		WorkRecords = wsrDaoImpl.getVacationdetailsByWorkID(workid);
		return WorkRecords;
	}

	@Transactional
	public WeeklyStatus getWSRRecordsByWorkID(int workid) {
		
		WeeklyStatus wsrWorkRecords = new WeeklyStatus();
		wsrWorkRecords = wsrDaoImpl.getWSRRecordsByWorkID(workid);
		return wsrWorkRecords;
	}
	
	
	

	

}
