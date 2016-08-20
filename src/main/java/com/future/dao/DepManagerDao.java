package com.future.dao;

import java.util.List;

import com.future.domain.DepManager;
import com.future.utils.Page_S;

public interface DepManagerDao {

	//根据用户名密码得到 学院负责人
	public DepManager getByNumAndPassword(String num, String password);
	
	//得到所有学院负责人
	public Page_S getAllDepManageByPage(Page_S p);
	
	//删除学院负责人
	public void deleteDep(Integer id);
	
	//根据ID
	public DepManager getDemById(Integer id);

	//增加或更新学院负责人
	public void addOrUpdate(DepManager dm);
	
	//得到所有学院负责人
	public List<DepManager> getAllDepManager();
}
