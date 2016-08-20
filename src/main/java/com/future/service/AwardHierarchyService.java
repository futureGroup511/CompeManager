package com.future.service;

import com.future.domain.AwardHierarchy;
import com.future.utils.Page_S;

public interface AwardHierarchyService {
	public Page_S findAll(Page_S ps) ;

	public AwardHierarchy fomdByID(Integer id) ;

	public void addOrupdate(AwardHierarchy awardHierarchy) ;
}
