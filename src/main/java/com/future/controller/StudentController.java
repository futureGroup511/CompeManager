
package com.future.controller;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.future.base.BaseAction;
import com.future.domain.Student;
import com.future.utils.Page_S;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

@Controller
@Scope("prototype")
public class StudentController extends BaseAction<Student> implements ModelDriven<Student>,SessionAware{

	private Integer currentPage=1; //当前页默认为1
	private Integer pageSize=10;
	
	public String login(){
		Student student=stuser.login(stu);
		if(student!=null){
			session.put("stu", student);
			return "operation";
		}
		return "erro";
	}

	public String loginView(){
		
		return "loginView";
	}
	
	public String addStudentView(){
		return "addStudentView";
	}
	
	public String addStudent(){
		stuser.addOrUpdateStudent(stu);
		return "success";
	}
	
	//报名
	public String apply(){
		Page_S ps=new Page_S();
		ps.setCurrentPage(currentPage);
		ps.setPageSize(pageSize);
		ps=comps.findapplyCompetition(ps);
		ActionContext.getContext().put("ps", ps);
		return "success";
		
	}
	
	
	private Student stu;
	@Override
	public Student getModel() {
		stu=new Student();
		return stu;
	}
	
	
	Map<String, Object> session;

	@Override
	public void setSession(Map<String, Object> arg0) {
		session=arg0;
	}
	
}
