package com.future.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.AdminDao;
import com.future.domain.Admin;
import com.future.domain.Competition;
import com.future.utils.PageBean;

@Repository
public class AdminDaoImpl extends BaseDao implements AdminDao
{

	//查询所有待审核项目
	@Override
	public List<Competition> findAllNoCheckProject() {
		String hql="from Competition c where c.compe_status=1";
		return getsession().createQuery(hql).list();
	}

	//查看审核成功项目
	@Override
	public List<Competition> findAllSuccessCheckProject() {
		String hql="from Competition c where c.compe_status = 2";
		return getsession().createQuery(hql).list();
	}

	//审核成功
	@Override
	public void pass(Integer id) {
		//System.out.println("到了dao层：" + id);
		//先根据当前id拿到对象
		Competition competition = findById(id);
		System.out.println(competition);
		//设置对象的状态为2
		competition.setCompe_status(2);
		//保存
		getsession().save(competition);	
	}
	
	

	//审核不通过
	@Override
	public void noPass(Integer id) {
		//先根据当前id拿到对象
		Competition competition = findById(id);
		//System.out.println(competition);
		//设置对象的状态为0
		competition.setCompe_status(0);
		//保存
		getsession().save(competition);	
	}
	
	
	
	//根据id得到一个对象
	public Competition findById(Integer id){
		String hql="from Competition c where c.compe_id = ?";
		Competition competition = (Competition) getsession().createQuery(hql).setParameter(0,id).uniqueResult();
		return competition;
	}

	//查看未通过审核项目
	@Override
	public List<Competition> findNoPassCheck() {
		String hql="from Competition c where c.compe_status=0";
		return getsession().createQuery(hql).list();
	}

	//分页
	@Override
	public PageBean getPageBean(int pageNum, int pageSize) {
		//查询列表
		//String hql="from Competition c where c.compe_status=2";
		List list = getsession().createQuery("from Competition c where c.compe_status=2")
				.setFirstResult((pageNum - 1 ) * pageSize)
				.setMaxResults(pageSize)
				.list();
		
		Long count =  (Long) getsession().createQuery("select count (*) from Competition c  where c.compe_status=2")
				.uniqueResult();
		
		return new PageBean(pageNum, pageSize, count.intValue(), list);
	}

	//分页查询所有待审核项目
	@Override
	public PageBean getPageBeanFindAllNoCheckProject(int pageNum, int pageSize) {
		List list = getsession().createQuery("from Competition c where c.compe_status=1")
				.setFirstResult((pageNum - 1 ) * pageSize)
				.setMaxResults(pageSize)
				.list();
		
		Long count =  (Long) getsession().createQuery("select count (*) from Competition c  where c.compe_status = 1")
				.uniqueResult();
		
		return new PageBean(pageNum, pageSize, count.intValue(), list);
	}

	//分页查看未通过审核项目
	@Override
	public PageBean getPageBeanNoPassCheck(int pageNum, int pageSize) {
		List list = getsession().createQuery("from Competition c where c.compe_status=0")
				.setFirstResult((pageNum - 1 ) * pageSize)
				.setMaxResults(pageSize)
				.list();
		
		Long count =  (Long) getsession().createQuery("select count (*) from Competition c  where c.compe_status = 0")
				.uniqueResult();
		
		return new PageBean(pageNum, pageSize, count.intValue(), list);
	}


	@Override
	public Admin jugeByNumAndPassword(String num, String password) {
		String hql="From Admin a where a.ad_num=:num and a.ad_password=:password";
		Admin admin=(Admin) getsession().createQuery(hql).setParameter("num", num).setParameter("password", password).uniqueResult();
		return admin;
	}

	//准备数据，查询状态=3（结果录入完毕）所有竞赛项目
	@Override
	public List<Competition> findAllHaveResultProject() {
		String hql="from Competition c where c.compe_status = 3";
		return getsession().createQuery(hql).list();
	}

	//查询当前院系申报了那些竞赛
	@Override
	public List<Competition> findDeCompe(Integer department) {
		String hql = "from Competition c where c.compe_department.de_id = :department";
		return getsession().createQuery(hql).setParameter("department", department).list();
	}
}
