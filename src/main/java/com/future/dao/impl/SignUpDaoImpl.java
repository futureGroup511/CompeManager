package com.future.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.SignUpDao;
import com.future.domain.Competition;
import com.future.domain.SignUp;
import com.future.domain.Student;
import com.future.utils.PageBean;

@Repository
public class SignUpDaoImpl extends BaseDao implements SignUpDao {

	@Override
	public List<SignUp> getAllSignUp(PageBean pageBean) {
		String sql = "from SignUp order by signUP_time desc, signUP_team asc";
		List<SignUp> signUpList = getsession().createQuery(sql)
												.setFirstResult((pageBean.getCurrentPage()-1)*pageBean.getPageSize())
												.setMaxResults(pageBean.getPageSize()).list();
		return signUpList;
	}

	@Override
	public SignUp getById(Integer id) {
		String sql = "from SignUP signUp where signUp.signUp_id = :signUp_id";
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
		return null;
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
						.setParameter("signUp_id", signId)
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
		criteria.add(Restrictions.eq("signUP_type", sup_type));
		List<SignUp> sups=criteria.list();
		if(sups.size()==0){
			return null;
		}
		SignUp sup= sups.get(0);
		return sup;
	}

	@Override
	public String jugeTeamexist(String team_name) {
		String hql="select count(signUp_team) FROM SignUp s where s.signUp_team=?";
		Query query=getsession().createQuery(hql).setString(0, team_name);
		Integer count=((Number)query.iterate().next()).intValue();
		if(count>0){
			return "exist";
		}
			return "notexist";
		
		
	}

}
