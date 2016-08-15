package com.future.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.SignUpDao;
import com.future.domain.SignUp;
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

}
