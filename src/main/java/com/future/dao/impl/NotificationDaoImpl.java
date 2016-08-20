package com.future.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.NotificationDao;
import com.future.domain.Notification;
import com.future.utils.Page_S;

@Repository
public class NotificationDaoImpl extends BaseDao implements NotificationDao {

	@Override
	public void saveOrUpdate(Notification notification) {
		getsession().save(notification);
	}

	@Override
	public Page_S queryAllNotification(Page_S s) {
		Criteria criteria=getsession().createCriteria(Notification.class);
		Long totalNum =(Long) criteria.setProjection(Projections.rowCount()).uniqueResult();
		criteria.setProjection(null);
		criteria.setFirstResult((s.getCurrentPage()-1)*s.getPageSize());
		criteria.setMaxResults(s.getPageSize());
		criteria.addOrder(Order.desc("noti_time"));
		List<Notification> nos=criteria.list();
		Integer num=Integer.valueOf(totalNum.toString());
		Page_S p=new Page_S(s.getCurrentPage(), s.getPageSize(),num , nos);
		return p;
	}

	@Override
	public Notification findNotiById(Integer id) {
		String hql="From Notification n where n.noti_id=?";
		Notification noti=(Notification) getsession().createQuery(hql).setInteger(0, id).uniqueResult();
		return noti;
	}

}
