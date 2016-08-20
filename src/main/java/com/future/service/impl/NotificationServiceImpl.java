package com.future.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.NotificationDao;
import com.future.domain.Notification;
import com.future.service.NotificationService;
import com.future.utils.Page_S;

@Service
@Transactional
public class NotificationServiceImpl implements NotificationService{

	@Resource
	private NotificationDao notificationDao;

	@Override
	public void saveOrUpdate(Notification notification) {
		notificationDao.saveOrUpdate(notification);
	}

	@Override
	public Page_S queryAllNotification(Page_S s) {
		return notificationDao.queryAllNotification(s);
	}

	@Override
	public Notification findNotiById(Integer id) {
		return notificationDao.findNotiById(id);
	}
}
