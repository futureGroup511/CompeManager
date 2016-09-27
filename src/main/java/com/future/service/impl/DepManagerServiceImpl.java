package com.future.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.DepManagerDao;
import com.future.domain.DepManager;
import com.future.service.DepManagerService;
import com.future.utils.Page_S;

@Service
@Transactional
public class DepManagerServiceImpl implements DepManagerService{

	@Resource
	private DepManagerDao depManagerDao;

	@Override
	public DepManager getByNumAndPassword(String num, String password) {
		return depManagerDao.getByNumAndPassword(num, password);
	}

	@Override
	public Page_S getAllDepManageByPage(Page_S ps) {
		return depManagerDao.getAllDepManageByPage(ps);
	}

	@Override
	public void deleteDep(Integer id) {
		depManagerDao.deleteDep(id);
	}

	@Override
	public DepManager getDemById(Integer id) {
		
		return depManagerDao.getDemById(id);
	}

	@Override
	public void addOrUpdate(DepManager dm) {
		depManagerDao.addOrUpdate(dm);
	}

	@Override
	public List<DepManager> getAllDepManager() {
		return depManagerDao.getAllDepManager();
	}

	//重置密码
	@Override
	public void resetPassWord(Integer id) {
		depManagerDao.resetPassWord(id);
	}

	//添加学院负责人
	@Override
	public void addDepartmentManager(DepManager dm) {
		depManagerDao.addDepartmentManager(dm);
	}
}
