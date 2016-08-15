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

@Repository
public class SignUpDaoImpl extends BaseDao implements SignUpDao {

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
