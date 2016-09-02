package com.future.controller;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.future.base.BaseAction;
import com.future.domain.Admin;
import com.future.domain.DepManager;
import com.future.domain.Student;
import com.future.utils.CookieUtiles;
import com.opensymphony.xwork2.ActionContext;
@Controller
@Scope("prototype")
public class LoginController extends BaseAction<Object> implements SessionAware,ServletResponseAware,ServletRequestAware {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String number;
	private String password;
	private String role;
	private static String STUDENT="学生";
	private static String DEPARTMENT="学院负责人";
	private static String DEAN="教务处";
	private Boolean JUGE=false;
	private Boolean useCookie=false;
	private CookieUtiles cookieutils=new CookieUtiles();
	/**
	 * 登陆
	 * @author 牛洧鹏
	 * @return
	 */
	public String juge(){
		
		if(role.equals(STUDENT)){
			//查看学生是否有此人
			Student stu=new Student();
			stu.setStu_num(number);
			stu.setStu_password(password);
			stu=stuser.login(stu);
			if(stu!=null){
				session.put("stu", stu);
				JUGE=true;
			}  
		}else if(role.equals(DEPARTMENT)){
			//查看学院负责人中是否有此人
			DepManager dep=depManagerService.getByNumAndPassword(number, password);
			if(dep!=null){
				session.put("depManager", dep);
				JUGE=true;
			}
		}else if(role.equals(DEAN)){
			//查看教务处是否有此人
			Admin admin=adminService.jugeByNumAndPassword(number, password);
			if(admin!=null){
				session.put("admin", admin);
				JUGE=true;
			}
		}
		
		if(!JUGE){
		     ActionContext.getContext().getValueStack().push("erro");;	
		}else{
			 ActionContext.getContext().getValueStack().push("correct");;		
		}
		
		return "info";
	}
	
	public String login() throws UnsupportedEncodingException{
		Cookie cookie=null;
		Student stu=(Student) session.get("stu");
		Admin admin=(Admin) session.get("admin");
		DepManager depManager=(DepManager) session.get("depManager");
		if(stu!=null){
			if(useCookie){
				cookie=cookieutils.addCookie(stu,STUDENT);
			}
		}else if(depManager!=null){
			if(useCookie){
				cookie=cookieutils.addCookie(depManager,DEPARTMENT);
			}
		}else if(admin!=null){
			if(useCookie){
				cookie=cookieutils.addCookie(admin,DEAN);
			}
		}else{
			return "censorCookie";
		}
		if(cookie!=null){
			reponse.addCookie(cookie);
		}
		return "success";
	}
	
	public String loginView(){
		
		return "loginView";
	}
	
	
	public String loginOut(){
		session.remove("stu");
		session.remove("depManager");
		session.remove("admin");
		Cookie cookie = cookieutils.delCookie(request);  
        if (cookie != null)  
        reponse.addCookie(cookie); 
	    return "loginView";
	}
	
	
	public String firstLogin() throws UnsupportedEncodingException{
		//是否存在cookie由前台来决定
		boolean juge=cookieutils.getcookie(session,request, stuser, depManagerService, adminService);
		if(juge){
			return "success";
		}
		return "loginView";
	}
	
	
	
	
	
	
	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}


	public Boolean getUseCookie() {
		return useCookie;
	}

	public void setUseCookie(Boolean useCookie) {
		this.useCookie = useCookie;
	}












	private Map<String, Object> session;
	private HttpServletRequest request;
	private HttpServletResponse reponse;
	
	@Override
	public void setSession(Map<String, Object> arg0) {
		session=arg0;
	}
	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		reponse=arg0;
	}
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request=arg0;
	}


	
}
