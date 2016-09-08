package com.future.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.future.base.BaseAction;
import com.future.domain.AwardHierarchy;
import com.future.domain.Competition;
import com.future.domain.DepManager;
import com.future.utils.DeQuery;
import com.future.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
@Controller
@Scope("prototype")
public class DepartmentController extends BaseAction<DeQuery>{
	

	
	//获取当前session中
	private Integer department = 1;
	
	//学院负责人查看本院申请项目获奖情况
	public String findAllDeCoAcCond(){
		
		//从当前session得到登陆id
		DepManager de= (DepManager) ActionContext.getContext().getSession().get("depManager");		//年度
		department = de.getDepM_department().getDe_id();
		
		//准备数据，年度   年度  往前推5年
		Date currentDate = new Date();
		SimpleDateFormat currentFormat = new SimpleDateFormat("yyyy");
		String currentTime=currentFormat.format(currentDate);
		Integer intTime = Integer.parseInt(currentTime);
		List<Compe> first = new ArrayList<Compe>();
		for(int i=intTime;i>intTime-5;i--){
			Compe co = new Compe();
			co.setId(i);
			co.setName(String.valueOf(i));
			first.add(co);
		}
		ActionContext.getContext().put("years", first);
		
		//准备数据，查询所有奖项
		List<AwardHierarchy> awardHieraychys = awardHierarchyService.findAllAwardHierarchy();
		ActionContext.getContext().put("awardHieraychys", awardHieraychys);
		
		//查询当前院系申报了那些竞赛
		List<Competition> competitons =adminService.findDeCompe(department);
		List<Compe> compe = new ArrayList<Compe>();
		for(Competition obj:competitons){
			Date time = obj.getCompe_requestDate();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy年");
			String stime=sdf.format(time);
			String name = stime + obj.getCompe_compeName().getCompeName_name();
			Compe linshi = new Compe();
			linshi.setId(obj.getCompe_id());
			linshi.setName(name);
			compe.add(linshi);
		}		
		ActionContext.getContext().put("competitons", compe);
		
		//学院负责人查看本院申请项目获奖情况
		PageBean pageBean = awardRecordService.getPageBeanfindAllDeCoAcCond(pageNum,pageSize,model,department);
		ActionContext.getContext().getValueStack().push(pageBean);
		
		
		return "findAllDeCoAcCond";
	}
	
	//分页查询当前院系申报项目的所有获奖记录  
	public String findAllDeCoAwardRecord(){
		//从当前session得到登陆id
		DepManager de= (DepManager) ActionContext.getContext().getSession().get("depManager");		//年度
		department = de.getDepM_department().getDe_id();
		PageBean pageBean = awardRecordService.getPageBeanFindAllDeCoAwardRecord(pageNum,pageSize,department);
		ActionContext.getContext().getValueStack().push(pageBean);
		
		
		//准备数据，年度   年度  往前推5年
		Date currentDate = new Date();
		SimpleDateFormat currentFormat = new SimpleDateFormat("yyyy");
		String currentTime=currentFormat.format(currentDate);
		Integer intTime = Integer.parseInt(currentTime);
		List<Compe> first = new ArrayList<Compe>();
		for(int i=intTime;i>intTime-5;i--){
			Compe co = new Compe();
			co.setId(i);
			co.setName(String.valueOf(i));
			first.add(co);
		}
		ActionContext.getContext().put("years", first);
		
		//准备数据，查询所有奖项
		List<AwardHierarchy> awardHieraychys = awardHierarchyService.findAllAwardHierarchy();
		ActionContext.getContext().put("awardHieraychys", awardHieraychys);
		
		//查询当前院系申报了那些竞赛
		System.out.println("+++++" + department);
		List<Competition> competitons =adminService.findDeCompe(department);
		List<Compe> compe = new ArrayList<Compe>();
		for(Competition obj:competitons){
			Date time = obj.getCompe_requestDate();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy年");
			String stime=sdf.format(time);
			String name = stime + obj.getCompe_compeName().getCompeName_name();
			Compe linshi = new Compe();
			linshi.setId(obj.getCompe_id());
			linshi.setName(name);
			compe.add(linshi);
		}		
		ActionContext.getContext().put("competitons", compe);
		
		return "findAllDeCoAwardRecord";
	}
		
	//条件分页查询
	public String conditionQuery(){
		//从当前session得到登陆id
		DepManager  de= (DepManager) ActionContext.getContext().getSession().get("depManager");		//年度
		//System.out.println("111111111111111111111" + de);
		department = de.getDepM_department().getDe_id();
		//System.out.println("111111111111111111111" + de.getDepM_department().getDe_id());
				
		System.out.println(model);
		System.out.println(model.getYear() + "==" + model.getAward()+ "==" + model.getCompetiton());
		//准备数据，年度   年度  往前推5年
		Date currentDate = new Date();
		SimpleDateFormat currentFormat = new SimpleDateFormat("yyyy");
		String currentTime=currentFormat.format(currentDate);
		Integer intTime = Integer.parseInt(currentTime);
		List<Compe> first = new ArrayList<Compe>();
		for(int i=intTime;i>intTime-5;i--){
			Compe co = new Compe();
			co.setId(i);
			co.setName(String.valueOf(i));
			first.add(co);
		}
		//System.out.println("first2 :" + first);
		ActionContext.getContext().put("years", first);
		
		//准备数据，查询所有竞赛项目
		//List<Competition> competitons =adminService.findAllSuccessCheckProject();
		List<Competition> competitons =adminService.findAllHaveResultProject();
		//查询出来之后应该处理一下竞赛项目名称 比如果 2015蓝桥杯2016蓝桥杯  他只显示蓝桥杯，处理一下在列表中显示竞赛项目前具体加上年份
		//这里弄了一个内部类临时存放了id和竞赛项目
		List<Compe> compe = new ArrayList<Compe>();
		for(Competition obj:competitons){
			Date time = obj.getCompe_requestDate();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy年");
			String stime=sdf.format(time);
			String name = stime + obj.getCompe_compeName().getCompeName_name();
			Compe linshi = new Compe();
			linshi.setId(obj.getCompe_id());
			linshi.setName(name);
			compe.add(linshi);
		}		
		ActionContext.getContext().put("competitons", compe);
		
		//准备数据，查询所有奖项
		List<AwardHierarchy> awardHieraychys = awardHierarchyService.findAllAwardHierarchy();
		ActionContext.getContext().put("awardHieraychys", awardHieraychys);
		
		//分页院系条件查询
		PageBean pageBean = awardRecordService.getPageBeanDeConditionQuery(pageNum,pageSize,model,department);
		ActionContext.getContext().getValueStack().push(pageBean);
		
		
		return "conditionQuery";
	}
	
	
	//分页查询当前院系所有获奖记录
	public String findAllAwardRecord(){
		//从当前session得到登陆id
		DepManager  de= (DepManager) ActionContext.getContext().getSession().get("depManager");		//年度
		//System.out.println("111111111111111111111" + de);
		department = de.getDepM_department().getDe_id();
		//System.out.println("111111111111111111111" + de.getDepM_department().getDe_id());
		
		//准备数据。年度  往前推5年
		
		Date currentDate = new Date();
		SimpleDateFormat currentFormat = new SimpleDateFormat("yyyy");
		String currentTime=currentFormat.format(currentDate);
		Integer intTime = Integer.parseInt(currentTime);
		List<Compe> first = new ArrayList<Compe>();
		for(int i=intTime;i>intTime-5;i--){
			Compe co = new Compe();
			co.setId(i);
			co.setName(String.valueOf(i));
			first.add(co);
		}
		ActionContext.getContext().put("years", first);
		//奖项
		List<AwardHierarchy> awardHieraychys = awardHierarchyService.findAllAwardHierarchy();
		ActionContext.getContext().put("awardHieraychys", awardHieraychys);
		//准备数据，查询状态=3（结果录入完毕）所有竞赛项目
		List<Competition> competitons =adminService.findAllHaveResultProject();
		List<Compe> compe = new ArrayList<Compe>();
		for(Competition obj:competitons){
			Date time = obj.getCompe_requestDate();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy年");
			String stime=sdf.format(time);
			String name = stime + obj.getCompe_compeName().getCompeName_name();
			Compe linshi = new Compe();
			linshi.setId(obj.getCompe_id());
			linshi.setName(name);
			compe.add(linshi);
		}
		ActionContext.getContext().put("competitons", compe);
		System.out.println("daoda ~~~~~~~~~~~~~~~");
		
		
		//
		//分页查询所有获奖记录
		PageBean pageBean = awardRecordService.getPageBeanDefindAllAwardRecord(pageNum,pageSize,department);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "findAllAwardRecord";
	}
	
	
	
	
	
	
	
	//===============================
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
