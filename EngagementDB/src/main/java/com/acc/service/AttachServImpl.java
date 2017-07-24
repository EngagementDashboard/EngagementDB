package com.acc.service;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acc.dao.AttachmentsDaoFacade;
import com.acc.entity.Attachment;
@Service
public class AttachServImpl implements AttachmentService {
	@Autowired
	AttachmentsDaoFacade attachDao;
	@Transactional
	public int uploadFile(Attachment attachment) {
		int count = 0;
		count = attachDao.uploadFile(attachment);
		return count;
	}
	@Transactional
	public List<Attachment> searchAttachment(Attachment attachment, Date startDate, Date endDate) {
		List<Attachment> attachmentData = attachDao.searchAttachment(attachment, startDate, endDate);
		return attachmentData;
	}
	@Transactional
	public byte[] downloadAttachment(String attachmentName) {
		byte[] fileContent = attachDao.downloadAttachment(attachmentName);
		return fileContent;
	}


}
