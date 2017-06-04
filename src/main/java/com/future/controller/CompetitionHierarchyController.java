package com.future.controller;

import java.util.Map;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.future.base.BaseAction;
import org.apache.struts2.interceptor.RequestAware;
import com.future.domain.CompetitionHierarchy;
import com.future.utils.Page_S;
import com.opensymphony.xwork2.ModelDriven;

@Controller
@Scope("prototype")
public class CompetitionHierarchyController extends BaseAction<CompetitionHierarchy> implements RequestAware,ModelDriven<CompetitionHierarchy>{

	
	private Integer currentPage=1;
	private Integer pageSize=10;

	//查看所有竞赛等级
	public String findAllcomphier(){
		Page_S ps=new Page_S();
		ps.setCurrentPage(currentPage);
		ps.setPageSize(pageSize);
		ps=comphieser.findAllCompeHierarchy(ps);
		request.put("ps", ps);
		return "allcomphier";
	}
	
	//修改竞赛等级
	public String modifyCompHierarchy(){
		model=comphieser.fomdByID(model.getCompeHie_id());
		request.put("comph", model);
		return "modifyCompHierarchyView";
	}
		
	public String modify(){
		comphieser.addOrupdate(model);
		return "modifysuccess";
	}
		
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
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
