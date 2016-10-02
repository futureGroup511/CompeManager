package com.future.controller;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.future.base.BaseAction;
import java.util.Map;
import org.apache.struts2.interceptor.RequestAware;
import com.future.domain.AwardHierarchy;
import com.future.utils.Page_S;
import com.opensymphony.xwork2.ModelDriven;
@Controller
@Scope("prototype")
public class AwardHierarchyController extends BaseAction<AwardHierarchy> implements RequestAware,ModelDriven<AwardHierarchy>{

	private Integer currentPage=1;
	private Integer pageSize=10;
	

	public String findAll(){
		Page_S ps=new Page_S();
		ps.setCurrentPage(currentPage);
		ps.setPageSize(pageSize);
		ps=ahserv.findAll(ps);
		request.put("ps", ps);
		return "all";
	}
	
	public String modifyView(){
		model=ahserv.fomdByID(model.getAwardHie_id());
		request.put("awardh", model);
		return "modifyView";
	}
	
	public String modify(){
		System.out.println("====================" + model.getAwardHie_id());
		ahserv.addOrupdate(model);
		return "modifysuccess";
	}
	
	
	
	
	
	
	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}






	private Map<String, Object> request ;
	@Override
	public void setRequest(Map<String, Object> arg0) {
		request=arg0;
	}

}
