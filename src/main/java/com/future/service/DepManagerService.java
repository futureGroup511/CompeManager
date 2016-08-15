package com.future.service;

import com.future.domain.DepManager;

public interface DepManagerService {

	//根据账号密码得到学院负责人
	public DepManager getByNumAndPassword(String num, String password);
}
