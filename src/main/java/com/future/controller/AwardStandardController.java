package com.future.controller;

import java.util.Map;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.future.base.BaseAction;

import org.apache.struts2.interceptor.RequestAware;
import com.future.domain.AwardStandard;
import com.future.utils.Page_S;
import com.opensymphony.xwork2.ModelDriven;
@Controller
@Scope("prototype")
public class AwardStandardController extends BaseAction<AwardStandard> implements ModelDriven<AwardStandard>,RequestAware{

	
	private Integer currentPage=1;
	private Integer pageSize=10;
	
	
	public String findAll(){
		Page_S ps=new Page_S();
		ps.setCurrentPage(currentPage);
		ps.setPageSize(pageSize);
		ps=awardstandser.findAll(ps);
		request.put("ps", ps);		
		return "all";
	}
	
	public String modifyView(){
		model=awardstandser.fomdByID(model.getAward_id());
		request.put("awardstand", model);		
		return "modifyView";
	}
	
	public String modify(){
		awardstandser.addOrupdate(model);
		return "modifysuccess";
	}
	
	
	
	
	
	private Map<String, Object> request;
	@Override
	public void setRequest(Map<String, Object> arg0) {
		request=arg0;
	}
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
}
