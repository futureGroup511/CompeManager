package com.future.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.future.base.BaseAction;
import com.future.domain.AwardHierarchy;
import com.future.domain.AwardRecord;
import com.future.domain.Competition;
import com.future.domain.DepManager;
import com.future.domain.Department;
import com.future.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
@Controller
@Scope("prototype")
public class AwardRecordController extends BaseAction<AwardRecord>{
	
	public String updateAwardRecord(){
		

		
		
		//调用方法，保存  liuyang
		awardRecordService.saveAwardRecordLY(model);
		return "updateAwardRecord";
	}
	
	public String alertAwardRecordUI(){
		System.out.println("修改获奖信息");
		//拿到所有获奖信息 
		//当前登陆学院负责人session 的院系 的所有竞赛项目 的获奖记录
		//Integer depId = ((DepManager)sessionMap.get("depManager")).getDepM_department().getDe_id();
		
		DepManager depM = (DepManager) ActionContext.getContext().getSession().get("depManager");
		Integer depId = depM.getDepM_department().getDe_id();
		

		//拿到所有记录当前登陆学院负责人session 的院系 的所有竞赛项目 的获奖记录
		PageBean pageBean = awardRecordService.getPageBeanAllAlert(pageNum,pageSize,depId);
		ActionContext.getContext().getValueStack().push(pageBean);
		
		
		return "alertAwardRecordUI";
	}
	
	public String alertAwardUD(){
		
		//准备获奖等级
		List<AwardHierarchy> awardHieraychys = awardHierarchyService.findAllAwardHierarchyTG();
		ActionContext.getContext().put("awardHieraychys", awardHieraychys);
		
		//根据id得到某条获奖记录
		AwardRecord awardRecord = awardRecordService.getById(id);
		ActionContext.getContext().getValueStack().push(awardRecord);
		
		return "alertAwardUD";
	}

	//条件查询查询
	public String conditionQuery() throws ParseException{
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
		
		//准备数据  包括学院  奖项 竞赛项目
		//准备数据，查询所有学院
		List<Department> departments = departmentService.findAllDepartment();
		ActionContext.getContext().put("departments", departments);
		
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

		//处理年度
		if(Integer.parseInt(year) != 0){
			Date date = new SimpleDateFormat("yyyy-MM-dd").parse(year +"-01-01"); 
			//System.out.println("ZZZZZZZZZZZZZ" + date);
			model.setAwardRecor_time(date);
		}
		//把model传给Service经i选哪个操作
		//List<AwardRecord> awardRecords = awardRecordService.conditionQuery(model);
		//ActionContext.getContext().put("awardRecords", awardRecords);
		//分页
		PageBean pageBean = awardRecordService.getPageBeanConditionQuery(pageNum,pageSize,model);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "conditionQuery";
	}

	//查看待审核竞赛结果
	public String checkNoAwardRecord(){
		//1、调用service查询待审核竞赛结果
		//List<AwardRecord> awardRecords = awardRecordService.findCheckNoAwardRecord();
		//2、放入map
		//ActionContext.getContext().put("awardRecords", awardRecords);
		
		//分页查看待审核竞赛结果
		PageBean pageBean = awardRecordService.getPageBeanCheckNoAwardRecord(pageNum,pageSize);
		System.out.println("是这里嘛 ?");
		ActionContext.getContext().getValueStack().push(pageBean);
		
		return "checkNoAwardRecord";
	}
	
	//查看审核通过竞赛结果
	public String checkSuccessAwardRecord(){
		//1、调用service查看审核通过竞赛结果
		//List<AwardRecord> awardRecords = awardRecordService.findCheckSuccessAwardRecord();
		//2、放入map
		//ActionContext.getContext().put("awardRecords", awardRecords);
		
		//分页查看审核通过竞赛结果
		PageBean pageBean = awardRecordService.getPageBeanCheckSuccessAwardRecord(pageNum,pageSize);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "checkSuccessAwardRecord";
	}
	
	//查看未通过审核竞赛结果
	public String noPassCheckAwardRecord(){
		//1、调用service查看审核通过竞赛结果
		//List<AwardRecord> awardRecords = awardRecordService.findNoPassCheckAwardRecord();
		//2、放入map
		//ActionContext.getContext().put("awardRecords", awardRecords);		
		
		//分页查看未通过审核竞赛结果
		PageBean pageBean = awardRecordService.getPageBeanNoPassCheckAwardRecord(pageNum,pageSize);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "noPassCheckAwardRecord";
	}
	
	//通过
	public String pass(){
		awardRecordService.pass(id);
		return "pass";
	}
	private String reason;
	
	
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	//未通过
	public String noPass(){
		String reasona = null;
		try {
			reasona = java.net.URLDecoder.decode(reason,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}	
		System.out.println(reason);
		awardRecordService.noPass(id,reasona);
		return "noPass";
	}
	
	//查询所有获奖记录,准备数据为多条件查询做准备
	public String findAllAwardRecord(){
		//准备数据  包括学院  奖项 竞赛项目
		//准备数据。年度  往前推5年
		Date currentDate = new Date();
		SimpleDateFormat currentFormat = new SimpleDateFormat("yyyy");
		String currentTime=currentFormat.format(currentDate);
		Integer intTime = Integer.parseInt(currentTime);
		//Map<Integer,String> map = new HashMap<Integer, String>();
		List<Compe> first = new ArrayList<Compe>();
		for(int i=intTime;i>intTime-5;i--){
			Compe co = new Compe();
			co.setId(i);
			co.setName(String.valueOf(i));
			first.add(co);
			//map.put(i, String.valueOf(i));
		}
		//System.out.println("first1 :" + first);
		ActionContext.getContext().put("years", first);
		
		
		//准备数据，查询所有学院
		List<Department> departments = departmentService.findAllDepartment();
		ActionContext.getContext().put("departments", departments);
		
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
		
		//准备数据，查询所有奖项
		List<AwardHierarchy> awardHieraychys = awardHierarchyService.findAllAwardHierarchy();
		ActionContext.getContext().put("awardHieraychys", awardHieraychys);
		
		//1准备数据。调用service查看审核通过竞赛结果
		//List<AwardRecord> awardRecords = awardRecordService.findAllAwardRecord();
		//ActionContext.getContext().put("awardRecords", awardRecords);	
		
		//分页查询所有获奖记录
		PageBean pageBean = awardRecordService.getPageBeanFindAllAwardRecord(pageNum,pageSize);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "findAllAwardRecord";
	}
	
	
	
	
	
	//============================
	//id是根据多条件传过来的id进行操纵
	private Integer id;
	//此属性是为了接收  年度查询的查询
	private String year;
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
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


//辅助类，这个类是为了在竞赛项目前边加上年份
class Compe{
	private Integer id;
	private String name;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}