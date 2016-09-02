package com.future.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.future.domain.Admin;
import com.future.domain.DepManager;
import com.future.domain.Student;
import com.future.service.AdminService;
import com.future.service.DepManagerService;
import com.future.service.StudentService;

public class CookieUtiles {
	public final static String COOKIE="user.cookie";
	private static String STUDENT="学生";
	private static String DEPARTMENT="学院负责人";
	private static String DEAN="教务处";
	//添加一个cookie
	public Cookie addCookie(Object object,String role) throws UnsupportedEncodingException{
		Cookie cookie=null;
		//value=URLEncoder.encode(value,"UTF-8"); 
		String value = null;
		if(object instanceof Student){
			Student stu=(Student)object;
			//cookie=new Cookie(COOKIE,stu.getStu_num()+","+stu.getStu_password()+","+role);
			value=URLEncoder.encode(stu.getStu_num()+","+stu.getStu_password()+","+role,"UTF-8");
		}else if(object instanceof DepManager){
			DepManager demp=(DepManager) object;
			//cookie=new Cookie(COOKIE,demp.getDepM_num()+","+demp.getDepM_password()+","+role);
			value=URLEncoder.encode(demp.getDepM_num()+","+demp.getDepM_password()+","+role,"UTF-8");
		
		}else if(object instanceof Admin){
			Admin admin=(Admin)object;
			//cookie=new Cookie(COOKIE,admin.getAd_num()+","+admin.getAd_password()+","+role);
			value=URLEncoder.encode(admin.getAd_num()+","+admin.getAd_password()+","+role,"UTF-8");
		}
		if(value!=null){
			cookie=new Cookie(COOKIE,value);
		}
		if(cookie!=null){
			cookie.setMaxAge(60*60*24*14);//保存两周
		}
		return cookie;
	}
	
	//得到cookie
	public Boolean getcookie(Map<String, Object> session,HttpServletRequest request,StudentService stuser,DepManagerService dempser,AdminService adminser) throws UnsupportedEncodingException{
		//可以通过request得到cookie
		Cookie[] cookies=request.getCookies();
		if(cookies!=null){
			for(Cookie cookie:cookies){
				//可以通过cookie.getName()得到cookie的名字
				if(CookieUtiles.COOKIE.equals(cookie.getName())){
					String value=URLDecoder.decode(cookie.getValue(),"utf-8");
					if(!value.equals("")){
						String[] info=value.split(",");
						String number=info[0];
						String password=info[1];
						String role=info[2];
					
						if(role.equals(STUDENT)){
							Student student=new Student();
							student.setStu_num(number);
							student.setStu_password(password);
							student=stuser.login(student);
							if(student!=null){
								session.put("stu", student);
								return true;
							}
						}else if(role.equals(DEPARTMENT)){
							DepManager depManager=dempser.getByNumAndPassword(number, password);
							if(depManager!=null){
								session.put("depManager", depManager);
								return true;
							}
						}else if(role.equals(DEAN)){
							Admin admin=adminser.jugeByNumAndPassword(number, password);
							if(admin!=null){
								session.put("admin", admin);
								return true;
							}
						}
						
					}
				}
			}
		}
		return false;
	}
	
	//消除cookie
	public Cookie delCookie(HttpServletRequest request){
		Cookie[] cookies=request.getCookies();
		if(cookies!=null){
			for (Cookie cookie:cookies) {
				if(CookieUtiles.COOKIE.equals(cookie.getName())){
					cookie.setValue("");
					cookie.setMaxAge(0);
					return cookie;
				}
				
			}
		}
		return null;
	}
}
