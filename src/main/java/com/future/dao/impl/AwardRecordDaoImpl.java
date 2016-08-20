package com.future.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.AwardRecordDao;
import com.future.domain.AwardRecord;
import com.future.domain.Student;
import com.future.utils.Page_S;

@Repository
public class AwardRecordDaoImpl extends BaseDao implements AwardRecordDao {

	@Override
	public Page_S findAwardByStudent(Student s, Page_S ps) {
		Criteria criteria=getsession().createCriteria(AwardRecord.class);
		criteria.add(Restrictions.eq("awardRecor_student", s));
		Long totalnum=(Long)criteria.setProjection(Projections.rowCount()).uniqueResult();
		criteria.setProjection(null);
		criteria.setFirstResult((ps.getCurrentPage()-1)*ps.getPageSize());
		criteria.setMaxResults(ps.getPageSize());
		criteria.addOrder(Order.desc("awardRecor_time"));
		List<AwardRecord> awardRecords=criteria.list();
		Integer num=Integer.valueOf(totalnum.toString());
		Page_S p=new Page_S(ps.getCurrentPage(), ps.getPageSize(),num , awardRecords);
		return p;
	}

	@Override
	public AwardRecord findAwardRecordById(Integer id) {
		String hql="From AwardRecord a where a.awardRecor_id=?";
		AwardRecord ar=(AwardRecord) getsession().createQuery(hql).setInteger(0, id).uniqueResult();
		return ar;
	}

	@Override
	public void saveOrUpdaAward(AwardRecord ar) {
		getsession().saveOrUpdate(ar);
	}
		/**
	 * 保存获奖记录
	 */
	@Override
	public void saveAwardRecord(AwardRecord awardRecord) {
		getsession().save(awardRecord);
	}


}
