package com.acc.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acc.dao.BatchDaoFacade;

@Service
public class BatchServiceImpl implements BatchServiceFacade {
	@Autowired
	BatchDaoFacade batchDao;
	@Transactional
	public void moveEmployeeToHub() {
		batchDao.moveEmployeeToHub();
		
	}
	@Transactional
	public void setEmployeeStatus() {
		batchDao.setEmployeeStatus();
	}
	@Transactional
	public void roleOffEmployee() {
		batchDao.roleOffEmployee();
		
	}
	@Transactional
	public void setHubStatus() {
		batchDao.setHubStatus();
		
	}
	@Transactional
	public void setProjectStatus() {
		batchDao.setProjectStatus();
		
	}

}
