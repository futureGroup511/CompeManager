package com.future.service;

import java.util.List;

import com.future.domain.DepManager;
import com.future.utils.Page_S;

public interface DepManagerService {

	//根据账号密码得到学院负责人
	public DepManager getByNumAndPassword(String num, String password);

	public Page_S getAllDepManageByPage(Page_S ps);
	
	//删除学院负责人
	public void deleteDep(Integer id);
	
	//通过id
	public DepManager getDemById(Integer id);

	//增加或修改
	public void addOrUpdate(DepManager dm);

	/**
	 * 得到所有学院负责人
	 * @return
	 */
	public List<DepManager> getAllDepManager();
}
