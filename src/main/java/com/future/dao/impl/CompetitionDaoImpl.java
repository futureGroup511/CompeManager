package com.future.dao.impl;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.CompetitionDao;
import com.future.domain.AwardRecord;
import com.future.domain.Competition;
import com.future.utils.PageBean;
import com.future.utils.Page_S;

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
		/*String  hql="From Competition c where c.compe_status=2";
		Query query=getsession().createQuery(hql);
		query.setFirstResult((ps.getCurrentPage()-1)*ps.getPageSize());
		query.setMaxResults(ps.getPageSize());
		List<Competition> competitions=query.list();
	
		
		Page_S p=new Page_S(ps.getCurrentPage(), ps.getPageSize(), count, competitions);*/
		Date date=new Date();
		java.sql.Date comparetime=new java.sql.Date(date.getTime());
		Criteria criteria=getsession().createCriteria(Competition.class);
		criteria.add(Restrictions.eq("compe_status", 2));
		criteria.add(Restrictions.lt("compe_requestDate",comparetime));
		criteria.add(Restrictions.gt("compe_startTime",comparetime));
		Long  tatolnum=(Long) criteria.setProjection(Projections.rowCount()).uniqueResult();
		criteria.setProjection(null);
		criteria.setFirstResult((ps.getCurrentPage()-1)*ps.getPageSize());
		criteria.setMaxResults(ps.getPageSize());
		List<Competition> competitions=criteria.list();
		Page_S p=new Page_S(ps.getCurrentPage(), ps.getPageSize(), Integer.valueOf(tatolnum.toString()), competitions);
		return p;
	}
	
	@Override
	public Integer getAllCount() {
		String hql="select count(*) from Competition c c.compe_status=2";
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
		String sql = "from Competition compe where compe.compe_requestDate >= YEAR(NOW()) and compe.compe_status = 2";
		List<Competition> compeList = getsession().createQuery(sql)
													.list();
		
		/**
		 * 之前的时候进行查询所有的该竞赛的报名通过的是不是已经全部都录完成绩
		 */
		String sqlStr = "from SignUp signUp where signUp.signUp_status = 2 and signUp.signUp_competition.compe_id=:compeId and signUp.signUp_registerRecord = 0";
		for(int i=0;i<compeList.size();i++){
			Competition compe = compeList.get(i);											
			List list = getsession().createQuery(sqlStr).setParameter("compeId", compe.getCompe_id()).list();
			if(list.isEmpty() || list.size() == 0){
				compeList.remove(i);
				String sqlStr01 = "update Competition compe set compe.compe_status = 3 where compe.compe_id = :compeId";
				getsession().createQuery(sqlStr01)
								.setParameter("compeId", compe.getCompe_id())
									.executeUpdate();
				
				/**
				 * 成绩录完之后，默认提交该学生的最高的奖励
				 */
				String sqlstr02 = "from AwardRecord awardRecord where awardRecord.awardRecor_competition.compe_id = :compeId";//得到对应的
				List<AwardRecord> awardList = getsession().createQuery(sqlstr02).setParameter("compeId", compe.getCompe_id())
																					.list();
				Set<Integer> stuIdSet = new HashSet<Integer>();
				for(AwardRecord awardRecord : awardList){
					stuIdSet.add(awardRecord.getAwardRecor_student().getStu_id());
				}
				
				for(Integer stuId : stuIdSet){
					Integer compeId = compe.getCompe_id();
					
					//更新该学生的该项目的获奖记录为已经获得其他获奖记录
					String sqlStr03 = "update AwardRecord awardRecord set awardRecord.awardRecor_status = 4  where awardRecord.awardRecor_competition.compe_id = :compeId and awardRecord.awardRecor_student.stu_id = :stuId";
					getsession().createQuery(sqlStr03).setParameter("compeId", compeId)
															.setParameter("stuId", stuId)
																.executeUpdate();
					//得到记录中 获奖等级id最小的那个
					String sqlStr04 = "from AwardRecord awardRecord where awardRecord.awardRecor_competition.compe_id = :compeId and awardRecord.awardRecor_student.stu_id = :stuId";
					List<AwardRecord> awardRecordList = getsession().createQuery(sqlStr04).setParameter("compeId", compeId)
																								.setParameter("stuId", stuId)
																									.list();
					Integer minHieId = awardRecordList.get(0).getAwardRecor_awadHie().getAwardHie_id();
					for(AwardRecord record : awardRecordList){
						Integer hieId = record.getAwardRecor_awadHie().getAwardHie_id();
						if(hieId <= minHieId){
							minHieId = hieId;
						}
					}
					//更新该项目该学生中获奖记录的获奖级别最高的提交给教务处负责人 奖励级别 的id 最小的那个奖励记录
					String sqlStr05 = "update AwardRecord awardRecord set awardRecord.awardRecor_status = 1 where awardRecord.awardRecor_awadHie.awardHie_id = "+minHieId;
					getsession().createQuery(sqlStr05)
									.executeUpdate();
					
				}
			}
		}
		return compeList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Competition> getNextClassCompetition() {
		String sql = "from Competition compe where compe.compe_requestDate >= year(NOW()) and compe.compe_status = 3";
		List<Competition> compeList = getsession().createQuery(sql)
												.list();
		return compeList;
	}

	@Override
	public void changeCompetitionStatus(Integer compeId, Integer compeStatus) {
		String sql = "update Competition compe set compe.compe_status = :compeStatus where compe.compe_id = :compeId";
		getsession().createQuery(sql).setParameter("compeStatus", compeStatus)
										.setParameter("compeId", compeId)
						   						.executeUpdate();
	}
 

}
