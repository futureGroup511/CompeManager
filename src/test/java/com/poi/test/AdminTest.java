package com.poi.test;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.future.domain.Competition;
import com.future.service.AdminService;



@RunWith(value=SpringJUnit4ClassRunner.class) 
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class AdminTest {
	//private EvaluatedRecordService evaluatedRecordService;
	@Resource
	private AdminService adminService;
	
	@Test
	public void TestAdmin(){
		// 1、调用service方法查询所有未"通过"审核项目
		List<Competition> competitions = adminService.findAllNoCheckProject();
		for(Competition obj:competitions){
			System.out.println(obj.getCompe_manager());
		}
	}
}
