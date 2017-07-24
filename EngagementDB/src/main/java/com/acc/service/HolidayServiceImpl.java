package com.acc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acc.dao.HolidayDaoFacade;
import com.acc.entity.Holiday;

@Service
public class HolidayServiceImpl implements HolidayServiceFacade {
	@Autowired
	HolidayDaoFacade holidayDao;
	@Transactional
	public List<Holiday> getAllHolidayData() {
		List<Holiday> allHolidayData = holidayDao.getAllHolidayData();
		return allHolidayData;
	}

}
