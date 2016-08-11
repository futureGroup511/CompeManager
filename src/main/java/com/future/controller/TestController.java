package com.future.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.future.domain.Admin;
import com.future.service.TestService;

@Controller
@Scope("prototype")
public class TestController {
	
	@Autowired
	private TestService testService;
	
	private String username;
	private String password;
	
	
	
	public String login(){
		System.out.println("()()()()()()()()()()()()()()((");
		 Admin admin = new Admin();
		 admin.setAd_name("校长");
		 admin.setAd_num(username);
		 admin.setAd_password(password);
		 admin.setAd_sex("男");
		 
		 testService.save(admin);
		return "success";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
