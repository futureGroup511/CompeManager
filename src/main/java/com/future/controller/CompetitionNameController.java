package com.future.controller;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.future.base.BaseAction;
import com.future.domain.CompetitionName;
import com.future.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
@Controller
@Scope("prototype")
public class CompetitionNameController extends BaseAction<CompetitionName>{

	//查看待审核竞赛名称
	public String checkNoName(){
		//1、调用service查询待审核竞赛名称列表
		//List<CompetitionName> competitionName = competitionNameService.findAllCheckNoName();
		//2、放入map
		//ActionContext.getContext().put("competitionNames", competitionName);
		
		//分页查看待审核竞赛名称
		PageBean pageBean = competitionNameService.getPageBeanCheckNoName(pageNum,pageSize);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "checkNoName";
	}
	
	//查看审核成功竞赛名称
	public String checkSuccessName(){
		//1、调用service查询审核成功项目名称
		//List<CompetitionName> competitionName = competitionNameService.checkSuccessName();
		//2、放入map
		//ActionContext.getContext().put("competitionNames", competitionName);
		
		//分页查看审核成功竞赛名称
		PageBean pageBean = competitionNameService.getPageBeanCheckSuccessName(pageNum,pageSize);
		ActionContext.getContext().getValueStack().push(pageBean);
		
		return "checkSuccessName";
	}
	
	//查看未通过审核竞赛名称
	public String noPassCheck(){
		//1、调用service查询未通过审核项目名称
		//List<CompetitionName> competitionName = competitionNameService.noPassCheck();
		//2、放入map
		//ActionContext.getContext().put("competitionNames", competitionName);
		
		//分页查看未通过审核竞赛名称
		PageBean pageBean = competitionNameService.getPageBeanNoPassCheck(pageNum,pageSize);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "noPassCheck";
	}
	
	//通过
	public String pass(){
		competitionNameService.pass(id);
		return "pass";
	}

	//未通过
	public String noPass(){
		competitionNameService.noPass(id);
		return "noPass";
	}
	
	//修改
	public String alterCompetitionNameUI(){
		//准备数据
		CompetitionName competitionName = competitionNameService.findById(id);
		ActionContext.getContext().getValueStack().push(competitionName);
		return "alterCompetitionNameUI";
	}
	
	//修改
	public String alter(){
		//修改
		competitionNameService.alter(model);
		return "alterSuccess";
	}
	
	
	
	
	
	
	
	//===================================
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
