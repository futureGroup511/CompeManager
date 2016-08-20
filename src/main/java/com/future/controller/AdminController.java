package com.future.controller;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
/**
 * 注释
 * 注释
 * */
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.future.base.BaseAction;
import com.future.domain.Admin;
import com.future.domain.AwardHierarchy;
import com.future.domain.AwardStandard;
import com.future.domain.CompetitionHierarchy;
import com.future.domain.DepManager;
import com.future.domain.Department;
import com.future.domain.Student;
import com.future.utils.Page_S;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
@Controller
@Scope("prototype")
public class AdminController extends BaseAction<Admin> implements RequestAware{

	
	//竞赛分页相关
		private Integer currentPage = 1;
		private Integer pageSize=10;
	
	//学院负责人
		private DepManager dm=new DepManager();
	//学生
		private Student stu=new Student();
	//学院
		private Department department=new Department();
	//竞赛等级
		private CompetitionHierarchy comhi=new CompetitionHierarchy();
	//获奖等级
		private AwardHierarchy awardhi=new AwardHierarchy();
	//奖励标准
		private AwardStandard awardStandard=new AwardStandard();
	//查看所有院系
		public String finAllDepartment(){
			Page_S ps=new Page_S();
			ps.setCurrentPage(currentPage);
			ps.setPageSize(pageSize);
			ps=departservice.findAllDepartment(ps);
			request.put("ps", ps);
			return "allDepartment";
		}
		
	//修改院系
		public String modifyDepartView(){
			Department depart=departservice.findDepartById(department.getDe_id());
			request.put("depart", depart);
			return "modifyDepartView";
		}
		
		public String modifyDepartsuccess(){
			departservice.addOrupdate(department);
			return "modifyDepartsuccess";
		}
		
	//查看所有学生
		public String findAllStudent(){
			Page_S  ps=new Page_S();
			ps.setCurrentPage(currentPage);
			ps.setPageSize(pageSize);
			ps=stuser.findAllStudenyByPage(ps);
			request.put("ps", ps);
			return "allstudent";
		}
	//修改学生
		public String modifyStuView(){
			Student student=stuser.findStudentById(stu.getStu_id());
			request.put("stu", student);
			return "modityStuView";
		}
		
		public String modifyStu(){
			System.out.println();
			stuser.updateStudent(stu);
			return "modifyStuSuccess";
		}
		
	//查看所有学院负责人
	public String findAll(){
		Page_S  ps=new Page_S();
		ps.setCurrentPage(currentPage);
		ps.setPageSize(pageSize);
		ps=depManagerService.getAllDepManageByPage(ps);
		ActionContext.getContext().put("ps", ps);
		return "all";
		
	}


	//删除学院负责人
	
	public String deleteDep(){
		depManagerService.deleteDep(dm.getDepM_id());
		return "deletesuccess";
	}
	
	
	
	/**
	 * 修改学院负责人，有外键的不让修改
	 * 跳转到修改页面
	 */
	public String modifyDep(){
		DepManager dem=depManagerService.getDemById(dm.getDepM_id());
		request.put("dem", dem);
		return "modifyView";
	}

	//修改学院负责人
	public String modify(){
		depManagerService.addOrUpdate(dm);
		return "modifysuccess";
		
	}
	
	/**
	 * @author 牛洧鹏
	 * @return
	 * 添加学院负责人
	 */
	public String addDeparmentManegerView(){
		List<Department> departments=departservice.getAllDepartMent();
		request.put("departments", departments);
		return "addDeparmentManegerView";
	}
	
	/**
	 * 添加学院
	 * @return
	 */
	public String addDepartmentView(){
		List<DepManager> depManagers=depManagerService.getAllDepManager();
		request.put("depManagers", depManagers);
		return "addDepartmentView";
	}
	
	public String addDepartment(){
		departservice.addOrupdate(department);
		return "addSuccess";
	}
	
	/**
	 * 添加学院负责人
	 * @return
	 */
	public String addDepartmentManager(){
		depManagerService.addOrUpdate(dm);
		return "addSuccess";
	}
	
	public String addCompetitionHierarchyView(){
		return "addCompetitionHierarchyView";
	}
	
	public String addCompetitionHierarchy(){
		comphieser.addOrupdate(comhi);
		return "addSuccess";
	}
	
	/**
	 * 添加获奖等级
	 * @return
	 */
	public String addAwardHierarchyView(){
		List<AwardStandard> awardStandards=awardstandser.getAll();
		request.put("awardStandards", awardStandards);
		return "addAwardHierarchyView";
	}
	public String addAwardHierarchy(){
		ahserv.addOrupdate(awardhi);
		return "addSuccess";
	}
	public String addAwardStandView(){
		
		return "addAwardStandView";
	}
	
	public String addAwardStand(){
		awardstandser.addOrupdate(awardStandard);
		return "addSuccess";
	}
	public Integer getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}


	public DepManager getDm() {
		return dm;
	}


	public void setDm(DepManager dm) {
		this.dm = dm;
	}

	private Map<String, Object> request;

	@Override
	public void setRequest(Map<String, Object> arg0) {
			request=arg0;
	}



	public Student getStu() {
		return stu;
	}



	public void setStu(Student stu) {
		this.stu = stu;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public CompetitionHierarchy getComhi() {
		return comhi;
	}

	public void setComhi(CompetitionHierarchy comhi) {
		this.comhi = comhi;
	}

	public AwardHierarchy getAwardhi() {
		return awardhi;
	}

	public void setAwardhi(AwardHierarchy awardhi) {
		this.awardhi = awardhi;
	}

	public AwardStandard getAwardStandard() {
		return awardStandard;
	}

	public void setAwardStandard(AwardStandard awardStandard) {
		this.awardStandard = awardStandard;
	}
	
	
	
	
}
