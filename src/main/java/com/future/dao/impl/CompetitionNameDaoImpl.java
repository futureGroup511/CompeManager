package com.future.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.CompetitionNameDao;
import com.future.domain.Competition;
import com.future.domain.CompetitionName;
import com.future.utils.PageBean;
import java.util.List;
import org.springframework.stereotype.Repository;


@Repository
public class CompetitionNameDaoImpl extends BaseDao implements CompetitionNameDao{
	
	@Override
	public List<CompetitionName> getAllCompeNames() {
		String sql = "from CompetitionName";
		List<CompetitionName> competitionNames = getsession().createQuery(sql).list();
		return competitionNames;
	}
	
	////查询待审核竞赛名称立标
	@Override
	public List<CompetitionName> findAllCheckNoName() {
		String hql="from CompetitionName cn where cn.compeName_status = 1";
		return getsession().createQuery(hql).list();
	}

	//1、调用service查询审核成功项目名称
	@Override
	public List<CompetitionName> checkSuccessName() {
		String hql="from CompetitionName cn where cn.compeName_status = 2";
		return getsession().createQuery(hql).list();
	}

	//查看未通过审核竞赛名称
	@Override
	public List<CompetitionName> noPassCheck() {
		String hql="from CompetitionName cn where cn.compeName_status = 0";
		return getsession().createQuery(hql).list();
	}

	//通过
	@Override
	public void pass(Integer id) {
		//先根据当前id拿到对象
		CompetitionName competitionName = findById(id);
		//设置对象的状态为2
		competitionName.setCompeName_status("2");
		//保存
		getsession().save(competitionName);	
	}
	

	//未通过
	@Override
	public void noPass(Integer id) {
		//先根据当前id拿到对象
		CompetitionName competitionName = findById(id);
		//设置对象的状态为2
		competitionName.setCompeName_status("0");
		//保存
		getsession().save(competitionName);	
	}
	

	//根据id得到一个对象
	public CompetitionName findById(Integer id){
		String hql="from CompetitionName c where c.compeName_id = ?";
		String idd = id+"";
		CompetitionName competitionName = (CompetitionName) getsession().createQuery(hql).setParameter(0,id).uniqueResult();
		return competitionName;
	}

	//保存
	@Override
	public void save(CompetitionName competitionName) {
		getsession().save(competitionName);
	}

	//分页查看审核成功竞赛名称
	@Override
	public PageBean getPageBeanCheckSuccessName(int pageNum, int pageSize) {
		List list = getsession().createQuery("from CompetitionName cn where cn.compeName_status = 2")
				.setFirstResult((pageNum - 1 ) * pageSize)
				.setMaxResults(pageSize)
				.list();
		
		Long count =  (Long) getsession().createQuery("select count (*) from CompetitionName cn  where cn.compeName_status = 2")
				.uniqueResult();
		
		return new PageBean(pageNum, pageSize, count.intValue(), list);
	}

	//分页查看待审核竞赛名称
	@Override
	public PageBean getPageBeanCheckNoName(int pageNum, int pageSize) {
		List list = getsession().createQuery("from CompetitionName cn where cn.compeName_status = 1")
				.setFirstResult((pageNum - 1 ) * pageSize)
				.setMaxResults(pageSize)
				.list();
		
		Long count =  (Long) getsession().createQuery("select count (*) from CompetitionName cn  where cn.compeName_status = 1")
				.uniqueResult();
		
		return new PageBean(pageNum, pageSize, count.intValue(), list);
	}
	@Override
	public List<CompetitionName> getAvailableCompeNames() {
		String sql = "from CompetitionName where compeName_status = 2";
		List<CompetitionName> competitionNames = getsession().createQuery(sql).list();
		return competitionNames;
	}
	//分页查看未通过审核竞赛名称
	@Override
	public PageBean getPageBeanNoPassCheck(int pageNum, int pageSize) {
		List list = getsession().createQuery("from CompetitionName cn where cn.compeName_status = 0")
				.setFirstResult((pageNum - 1 ) * pageSize)
				.setMaxResults(pageSize)
				.list();
		
		Long count =  (Long) getsession().createQuery("select count (*) from CompetitionName cn  where cn.compeName_status = 0")
				.uniqueResult();
		
		return new PageBean(pageNum, pageSize, count.intValue(), list);
	}

	@Override
	public List<CompetitionName> getCompeNamesByPageBean(PageBean pageBean) {
		String sql = "from CompetitionName compeName order by compeName.compeName_status desc";
		List<CompetitionName> compeNameList = getsession().createQuery(sql)
				.setFirstResult((pageBean.getCurrentPage() - 1 ) * pageBean.getPageSize())
				.setMaxResults(pageBean.getPageSize())
				.list();
		return compeNameList;
	}
}
