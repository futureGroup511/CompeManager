<<<<<<< HEAD
package com.future.controller;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.future.base.BaseAction;
@Controller
@Scope("prototype")
public class StudentController extends BaseAction{

}
=======
package com.future.controller;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.future.domain.Student;
import com.opensymphony.xwork2.ModelDriven;

@Controller
@Scope("prototype")
public class StudentController implements ModelDriven<Student>{

	public String login(){
		
		
		return "success";
	}

	
	private Student stu;
	@Override
	public Student getModel() {
		stu=new Student();
		return stu;
	}
	
}
>>>>>>> e304ae30be9f74270ce29ffb5b6b1333ebbe09eb
