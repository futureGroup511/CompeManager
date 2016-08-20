package com.future.service;

import com.future.domain.Notification;
import com.future.utils.Page_S;

public interface NotificationService {
	public void saveOrUpdate(Notification notification);
	
	public Page_S queryAllNotification(Page_S s);
	
	public Notification findNotiById(Integer id);
}
