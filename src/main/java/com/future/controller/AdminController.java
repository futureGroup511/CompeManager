package com.future.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
/**
 * 注释
 * 注释
 * */
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.future.base.BaseAction;
import com.future.domain.Admin;
import com.future.domain.Competition;
import com.future.service.AdminService;
import com.future.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
@Controller
@Scope("prototype")
public class AdminController extends BaseAction<Admin>{

	//显示主页面
	public String loginView(){
		//System.out.println("访问成功");
		return "success";
	}
	
	//看看待审核项目
	public String checkNoProject(){
		//System.out.println("调用service方法查询所有未审核项目");
		/*for(Competition a:competitions){
			System.out.println(a.getCompe_compeName().getCompeName_name());
		}*/
		//1、调用service方法查询所有未审核项目
		//List<Competition> competitions = adminService.findAllNoCheckProject();
		//2、放入map中	
		//ActionContext.getContext().put("competitions", competitions);
		PageBean pageBean = adminService.getPageBeanFindAllNoCheckProject(pageNum,pageSize);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "checkNoProject";
	}
	
	//查看审核成功项目
	public String checkSuccessProject(){
		//添加分页
		PageBean pageBean = adminService.getPageBean(pageNum,pageSize);
		ActionContext.getContext().getValueStack().push(pageBean);
		 
		
		//1、调用service方法查询所有未审核项目
		List<Competition> competitions = adminService.findAllSuccessCheckProject();
		
		//2、放入map中	
		ActionContext.getContext().put("competitions", competitions);
		
		return "checkSuccessProject";
	}
	
	//教务处审批：让通过审核
	public String pass(){
		//拿到项目id属性，接下来去修改状态
		adminService.pass(id);
		return "checkSuccess";
	}
	
	//教务处审核：不让通过审核
	public String noPass(){
		adminService.noPass(id);
		return "checkNo";
	}
	
	//查看未通过审核项目
	public String noPassCheck(){
		//1、调用service方法查询所有未"通过"审核项目
		//List<Competition> competitions = adminService.findNoPassCheck();
		//2、放入map中	
		//ActionContext.getContext().put("competitions", competitions);
		
		//分页查看未通过审核项目
		PageBean pageBean = adminService.getPageBeanNoPassCheck(pageNum,pageSize);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "noPassCheck";
	}
	
	public String alterCompetitionUI(){
		//准备数据,根据id查询到某一具体数据
		Competition competition = adminService.findById(id);
		System.out.println(competition.getCompe_manager());
		//放入值栈
		ActionContext.getContext().getValueStack().push(competition);
		
		return "alterCompetitionUI";
	}
	
		
	
	
	private Integer id;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	//分页数据
	private int pageNum = 1;//当前页
	private int pageSize = 10;//每页显示多少条记录
	
	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
}
