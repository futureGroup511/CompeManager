package com.future.dao;

import com.future.domain.DepManager;

public interface DepManagerDao {

	//根据用户名密码得到 学院负责人
	public DepManager getByNumAndPassword(String num, String password);
}
