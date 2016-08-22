package com.future.dao.impl;

import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.CompetitionDao;
import com.future.domain.Competition;
import com.future.utils.Page_S;
import java.util.List;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import com.future.utils.PageBean;

@Repository
public class CompetitionDaoImpl extends BaseDao implements CompetitionDao {

	/*@Override
	public Page_S findapplyCompetition(Page_S ps) {
		return null;
	}*/

	//根据id获取对象
	@Override
	public Competition findById(Integer compe_id) {
		String hql="from Competition c where c.compe_id=?";
		return (Competition) getsession().createQuery(hql).setParameter(0, compe_id).uniqueResult();
	}

	//保存修改
	@Override
	public void save(Competition competition) {
		getsession().save(competition);
	}
	

	@Override
	public List<Competition> getCompetitions() {
		String sql = "from Competition";
		return getsession().createQuery(sql).list();
	}

	@Override
	public List<Competition> getCompetitionByPage(PageBean pageBean) {
		String sql = "from Competition order by compe_requestDate desc";
		List<Competition> recoreds = getsession()
				.createQuery(sql)//
				.setFirstResult((pageBean.getCurrentPage()-1)*pageBean.getPageSize())//
				.setMaxResults(pageBean.getPageSize())//
				.list();
		return recoreds;
	}

	@Override
	public Competition getCompetitionById(Integer id) {
		String sql = "from Competition compe where compe.compe_id = :compe_id";
		Competition compe = (Competition)getsession().createQuery(sql).setParameter("compe_id", id)
													.uniqueResult();
		return compe;
	}

	@Override
	public Integer getCompetitionCount() {
		String sql = "select count(*) from Competition";
		Integer count = ((Long)getsession().createQuery(sql).iterate().next()).intValue();
		return count;
	}
	
	@Override
	public Page_S findapplyCompetition(Page_S ps) {
		String  hql="From Competition c where c.compe_status=2";
		Query query=getsession().createQuery(hql);
		query.setFirstResult((ps.getCurrentPage()-1)*ps.getPageSize());
		query.setMaxResults(ps.getPageSize());
		List<Competition> competitions=query.list();
		int count=getAllCount();
		
		Page_S p=new Page_S(ps.getCurrentPage(), ps.getPageSize(), count, competitions);
		return p;
	}
	
	@Override
	public Integer getAllCount() {
		String hql="select count(*) from Competition c";
		Query query=getsession().createQuery(hql);
		Integer count=((Number)query.iterate().next()).intValue();
		return count;
	}
	
	@Override
	public Competition findCompetitionById(Integer id) {
		String hql="From Competition c where c.compe_id=?";
		Competition comp=(Competition) getsession().createQuery(hql).setInteger(0, id).uniqueResult();
		return comp;
	}
	
	@Override
	public void updateCompetition(Competition comp) {
		getsession().update(comp);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Competition> getAvaliableCopetion() {
		String sql = "from Competition compe where compe.compe_requestDate >= YEAR(NOW()) and compe.compe_endTime <= NOW() compe.compe_status != 3";
		List<Competition> compeList = getsession().createQuery(sql)
													.list();
		
		/**
		 * 之前的时候进行查询所有的该竞赛的报名通过的是不是已经全部都录完成绩
		 */
		String sqlStr = "from SignUp signUp where signUp.signUp_status = 2 and signUp.signUp_competition.compe_id =  :compeId and signUp.signUp_registerRecord = 0";
		for(int i=0;i<compeList.size();i++){
			Competition compe = compeList.get(i);
			List list = getsession().createQuery(sqlStr).setParameter("compeId", compe.getCompe_id()).list();
			if(list.isEmpty() || list.size() == 0){
				compeList.remove(i);
				String sqlStr01 = "update Competition compe set compe.compe_status = 3 where compe.compe_id = :compeId";
				getsession().createQuery(sqlStr01)
								.setParameter("compe_id", compe.getCompe_id())
									.executeUpdate();
				
			}
		}
		return compeList;
	}


}
