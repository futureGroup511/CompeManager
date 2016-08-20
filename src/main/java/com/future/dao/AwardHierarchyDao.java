package com.future.dao;

import java.util.List;

import com.future.domain.AwardHierarchy;

public interface AwardHierarchyDao {

	//查询所有奖项
	List<AwardHierarchy> findAllAwardHierarchy();

}
