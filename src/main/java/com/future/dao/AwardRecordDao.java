package com.future.dao;

import com.future.domain.Student;
import com.future.utils.Page_S;

public interface AwardRecordDao {

	public Page_S findAwardByStudent(Student s,Page_S ps);
	
}
