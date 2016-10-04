package com.future.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.type.StandardBasicTypes;
import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.SignUpDao;
import com.future.domain.AwardRecord;
import com.future.domain.Competition;
import com.future.domain.SignUp;
import com.future.domain.Student;
import com.future.utils.PageBean;




@Repository
public class SignUpDaoImpl extends BaseDao implements SignUpDao {
	@SuppressWarnings("unchecked")
	@Override
	public List<SignUp> getAllSignUp(PageBean pageBean) {
		String sql = "from SignUp order by signUP_team asc, signUP_time desc";
		List<SignUp> signUpList = getsession().createQuery(sql)
												.setFirstResult((pageBean.getCurrentPage()-1)*pageBean.getPageSize())
												.setMaxResults(pageBean.getPageSize()).list();
		return signUpList;
	}

	@Override
	public SignUp getById(Integer id) {
		String sql = "from SignUp signUp where signUp.signUp_id = :signUp_id";
		SignUp signUp = (SignUp)getsession().createQuery(sql)
										.setParameter("signUp_id", id)
										.uniqueResult();
		return signUp;
	}

	@Override
	public List<String> getAllGroupName(PageBean pageBean) {
		return null;
	}

	@Override
	public List<SignUp> getSpecialGroupMember(String groupName) {
		String hql="FROM SignUp s where s.signUp_team=?";
		List<SignUp> signUps= getsession().createQuery(hql).setString(0, groupName).list();
		return signUps;
	}

	@Override
	public boolean groupNameExist(String groupName) {
		return false;
	}

	@Override
	public void refreshGroupSignUp(SignUp signUp) {
		
		
	}

	@Override
	public List<SignUp> getPersonalSignUp(PageBean pageBean) {
		return null;
	}

	@Override
	public void refreshSignUp(SignUp signUp) {
		
	}

	@Override
	public Integer getCount() {
		String sql = "select count(*) from SignUp";
		Integer count = ((Long)getsession().createQuery(sql).iterate().next()).intValue();
		return count;
	}

	@Override
	public void changeSignStatus(Integer signId, Integer signStatus) {
		String sql = "update SignUp signUp set signUp.signUp_status = :signUp_status where signUp.signUp_id = :signId";
		getsession().createQuery(sql)
					.setParameter("signUp_status", signStatus)
						.setParameter("signId", signId)
							.executeUpdate();
									
	}
	
	

	@Override
	public void addSignUp(SignUp sup) {
		getsession().saveOrUpdate(sup);
	}


	@Override
	public SignUp jugeStudentuge(Student stu, Competition compe, Integer sup_type) {
		if(stu==null||compe==null||sup_type==0){
			return null;
		}
		Criteria criteria=getsession().createCriteria(SignUp.class);
		criteria.add(Restrictions.eq("signUp_student", stu));
		criteria.add(Restrictions.eq("signUp_competition", compe));
		criteria.add(Restrictions.eq("singnup_type", sup_type));
		List<SignUp> sups=criteria.list();
		if(sups.size()==0){
			return null;
		}
		SignUp sup= sups.get(0);
		return sup;
	}

	@Override
	public String jugeTeamexist(String team_name,Integer compe_id) {
		String hql="select count(signUp_team) FROM SignUp s where s.signUp_team=? and s.signUp_competition.compe_id=?";
		Query query=getsession().createQuery(hql).setString(0, team_name).setInteger(1, compe_id);
		Integer count=((Number)query.iterate().next()).intValue();
		if(count>0){
			return "exist";
		}
			return "notexist";
		
		
	}

	@Override
	public void makeToTeamLeader(String teamName, Integer signId) {
		List<Integer> memberIds = getSpecialTeamMembId(teamName);
		for(Integer memberId:memberIds){
			makeToNotTeamLeader(memberId);
		}
		String sql = "update SignUp signUp set signUp.singUp_manager = 1 where signUp.signUp_id = :signId";
		getsession().createQuery(sql).setParameter("signId", signId)
						.executeUpdate();
		
	}

	@Override
	public void makeToNotTeamLeader(Integer signId) {
		String sql = "update SignUp signUp set signUp.singUp_manager = 0 where signUp.signUp_id = :signId";
		getsession().createQuery(sql).setParameter("signId", signId)
						.executeUpdate();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> getSpecialTeamMembId(String teamName) {
		String sql = "select signUp_id from cm_signups where signUp_team = :teamName";
		List<Integer> memberIds = getsession().createSQLQuery(sql).addScalar("signUp_id", StandardBasicTypes.INTEGER)
											.setParameter("teamName", teamName)
											.list();
		System.out.println("memberIds =================>"+memberIds);
		return memberIds;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SignUp> getAvaliableGroupSignUp(Integer compeId, PageBean pageBean) {
		String sql = "from SignUp signUp where signUp.signUp_competition.compe_id = :compeId and signUp.singnup_type = 1 and signUp.signUp_registerRecord = 0 and signUp.signUp_status = 2 order by signUp.signUp_team desc";
		List<SignUp> signUpList = getsession().createQuery(sql)
											.setParameter("compeId", compeId)
											.setFirstResult((pageBean.getCurrentPage()-1)*pageBean.getPageSize())
											.setMaxResults(pageBean.getPageSize())
											.list();
		return signUpList;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<SignUp> getAvaliablePersonalSignUp(Integer compeId, PageBean pageBean) {
		String sql = "from SignUp signUp where signUp.signUp_competition.compe_id = :compeId and signUp.singnup_type = 2 and signUp.signUp_registerRecord = 0 and signUp.signUp_status = 2 ";
		List<SignUp> signUpList = getsession().createQuery(sql)
											.setParameter("compeId", compeId)
											.setFirstResult((pageBean.getCurrentPage()-1)*pageBean.getPageSize())
											.setMaxResults(pageBean.getPageSize())
											.list();
		return signUpList;
	}

	@Override
	public void makeSignUpScored(Integer signUpId, Integer signUp_registerRecord) {
		String sql = "update SignUp signUp set signUp.signUp_registerRecord = :signUp_registerRecord where signUp.signUp_id = :signUpId";
		getsession().createQuery(sql).setParameter("signUp_registerRecord", signUp_registerRecord)
										.setParameter("signUpId", signUpId)
										.executeUpdate();
	}

	
	
	
	public void updateSignUpByAwardRecord(AwardRecord aw) {
		String team=aw.getAwardRecor_team();
		Integer type;
		if(team==null ||team.equals("")){
			type=2;
		}else{
			type=1;
		}
		String hql="select signUp_id from cm_signups cs where cs.signUp_student_stu_id = :stu_id and cs.signUp_competition_compe_id =:comp_id and cs.singnup_type=:singnup_type";
		List result=getsession().createSQLQuery(hql).setParameter("stu_id", aw.getAwardRecor_student().getStu_id()).setParameter("comp_id", aw.getAwardRecor_competition().getCompe_id()).setParameter("singnup_type",type).list();
		String hq="update SignUp s set s.signUp_registerRecord=0 s.nextClass=0 where s.signUp_id ="+(Integer)result.get(0);
		getsession().createQuery(hq).executeUpdate();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SignUp> getSpecialCompetitionSignUps(Integer copeId) {
		String sql = "from SignUp signUp where signUp.signUp_competition.compe_id =:compId";
		return getsession().createQuery(sql).setParameter("compId", copeId).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SignUp> getSpecialCompeSignUpsByPage(PageBean pageBean, Integer compeId) {
		String sql = "from SignUp signUp where signUp.signUp_competition.compe_id =:compeId";
		return getsession().createQuery(sql)
				.setParameter("compeId", compeId)
					.setFirstResult((pageBean.getCurrentPage()-1)*pageBean.getPageSize())
						.setMaxResults(pageBean.getPageSize())
							.list();
	}

	@Override
	public Integer getCountByDep(Integer depId) {
		//String sql = "select count(*) from SignUp signUp where signUp.signUp_student.stu_department.de_id = :depId";
		String sql = "select count(*) from SignUp signUp where signUp.signUp_competition.compe_id in (select distinct cmp.compe_id from Competition cmp where cmp.compe_department.de_id = "+depId+" and cmp.compe_status = 2)";
		Integer count = ((Long)getsession().createQuery(sql).iterate().next()).intValue();
		return count;
	}
//TODO
	@Override
	public List<SignUp> getAllSignUpByDep(PageBean pageBean, Integer depId) {
		//String sql = "from SignUp signUp where signUp.signUp_student.stu_department.de_id = :depId order by signUP_team asc, signUP_time desc";
		//String sql = "from SignUp signUp where signUp.signUp_competition.compe_department.de_id in (select cmp.compe_id from cm_competitions cmp where cmp.compe_department_de_id = "+depId+")  order by signUP_team asc, signUP_time desc";
		//String sql = "from SignUp signUp where signUp.signUp_competition.compe_id in (select distinct cmp.compe_id from Competition cmp where cmp.compe_department.de_id = "+depId+" and cmp.compe_status= 2)  order by signUp_status desc, signUP_team asc, signUP_time desc";
		String sql = "from SignUp signUp where signUp.signUp_competition.compe_id in (select distinct cmp.compe_id from Competition cmp where cmp.compe_department.de_id = "+depId+" and cmp.compe_status = 2)  order by signUp_status desc, signUP_team asc, signUP_time desc";
		List<SignUp> signUpList = getsession().createQuery(sql)
												.setFirstResult((pageBean.getCurrentPage()-1)*pageBean.getPageSize())
												.setMaxResults(pageBean.getPageSize()).list();
		return signUpList;
	}

	@Override
	public List<SignUp> getAvaliableGroupSignUpByDep(Integer compeId, PageBean pageBean, Integer depId) {
		//String sql = "from SignUp signUp where signUp.signUp_student.stu_department.de_id = :depId and signUp.signUp_competition.compe_id = :compeId and signUp.singnup_type = 1 and signUp.signUp_registerRecord = 0 and signUp.signUp_status = 2 order by signUp.signUp_team desc";
		String sql = "from SignUp signUp where signUp.signUp_competition.compe_id = :compeId and signUp.singnup_type = 1 and signUp.signUp_registerRecord = 0 and signUp.signUp_status = 2 order by signUp.signUp_team desc";
		List<SignUp> signUpList = null;
		if(pageBean==null){
			signUpList = getsession().createQuery(sql)
					.setParameter("compeId", compeId)
					.list();

		}else{
			signUpList = getsession().createQuery(sql)
					.setParameter("compeId", compeId)
					.setFirstResult((pageBean.getCurrentPage()-1)*pageBean.getPageSize())
					.setMaxResults(pageBean.getPageSize())
					.list();
		}
		return signUpList;
	}

	@Override
	public List<SignUp> getAvaliablePersonalSignUpByDep(Integer compeId, PageBean pageBean, Integer depId) {
		//String sql = "from SignUp signUp where signUp.signUp_student.stu_department.de_id = :depId and signUp.signUp_competition.compe_id = :compeId and signUp.singnup_type = 2 and signUp.signUp_registerRecord = 0 and signUp.signUp_status = 2 ";
		String sql = "from SignUp signUp where signUp.signUp_competition.compe_id = :compeId and signUp.singnup_type = 2 and signUp.signUp_registerRecord = 0 and signUp.signUp_status = 2 ";
		List<SignUp> signUpList = null;
		if(pageBean ==null){
			signUpList = getsession().createQuery(sql)
					.setParameter("compeId", compeId)
					.list();
		}else{
			signUpList = getsession().createQuery(sql)
					.setParameter("compeId", compeId)
					.setFirstResult((pageBean.getCurrentPage()-1)*pageBean.getPageSize())
					.setMaxResults(pageBean.getPageSize())
					.list();
		}
		return signUpList;
	}

	@Override
	public void updateSignUp(SignUp signUp) {
		getsession().update(signUp);
	}

	@Override
	public void changeSignUpStatusByDep(Integer compeId, int i) {
		String sql = "update SignUp signUp set signUp.nextClass = :nextClass where signUp.signUp_competition.compe_id = :compeId and signUp.signUp_status = 2";
		getsession().createQuery(sql).setParameter("nextClass", i)
						.setParameter("compeId", compeId)
						.executeUpdate();
	}
	//查询竞赛状态为2 已经录入过成绩 1 按钮可按下的singup

	@Override 
	public List<SignUp> getSignUpByNextClassAndStudent(Integer stuid) {
		String hql="from SignUp s where s.signUp_competition.compe_status=2 and s.signUp_registerRecord=1  and YEAR(s.signUP_time)=YEAR(now()) and s.signUp_status = 2 and  (select  ca.awardRecor_picturePath from AwardRecord ca where ca.awardRecor_competition.compe_id=s.signUp_competition.compe_id and ca.awardRecor_team=s.signUp_team and ca.awardRecor_student.stu_id="+stuid+" and ca.awardRecor_time=(select MAX(awardRecor_time) from AwardRecord ca where ca.awardRecor_competition.compe_id=s.signUp_competition.compe_id and ca.awardRecor_team=s.signUp_team and ca.awardRecor_student.stu_id="+stuid+" )) IS NOT NULL  and s.signUp_student.stu_id="+stuid;

		

		Session session=getsession();
		List<SignUp> signUps=session.createQuery(hql).list();
		String hql2="from SignUp s where s.signUp_competition.compe_status=2 and s.signUp_registerRecord=1  and YEAR(s.signUP_time)=YEAR(now()) and s.signUp_status = 2 and  (select  ca.awardRecor_picturePath from AwardRecord ca where ca.awardRecor_competition.compe_id=s.signUp_competition.compe_id and ca.awardRecor_team is null and s.signUp_team is null and ca.awardRecor_student.stu_id="+stuid+" and ca.awardRecor_time=(select MAX(awardRecor_time) from AwardRecord ca where ca.awardRecor_competition.compe_id=s.signUp_competition.compe_id and ca.awardRecor_team is null and  s.signUp_team is null and ca.awardRecor_student.stu_id="+stuid+" )) IS NOT NULL  and s.signUp_student.stu_id="+stuid;
		List<SignUp> result=session.createQuery(hql2).list();
		result.addAll(signUps);
		return result;

	}

	//通过队名来修改报名表是否录入记录
	@Override
	public void updateSignUpRecordsByname(String name) {
		String hql="update SignUp s set s.signUp_registerRecord=0,s.nextClass=0 where s.signUp_team=?";
		getsession().createQuery(hql).setParameter(0, name).executeUpdate();
	}

	//查询一个团队的报名人数
	@Override
	public Integer getNumByname(String name) {
		String hql="select count(*) from SignUp s where s.signUp_team=?";
		Integer number=((Long)getsession().createQuery(hql).setParameter(0, name).iterate().next()).intValue();
		return number;
	}

	@Override
	public void updateNextClassAndRecordById(Integer id) {
			String hql="update SignUp set nextClass=0,signUp_registerRecord =0 where signUp_id=? ";
			getsession().createQuery(hql).setParameter(0, id).executeUpdate();
	}
	
	
	
	
	

	
	

}
