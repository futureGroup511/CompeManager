package com.future.service;

import com.future.domain.Student;
import com.future.utils.Page_S;

public interface AwardRecordService {

	public Page_S findAwardByStudent(Student s, Page_S ps);
}
