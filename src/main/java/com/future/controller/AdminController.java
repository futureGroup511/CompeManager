package com.future.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
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
import com.future.domain.Competition;
import com.future.domain.CompetitionHierarchy;
import com.future.domain.DepManager;
import com.future.domain.Department;
import com.future.domain.Student;
import com.future.utils.ImportDate;
import com.future.utils.PageBean;
import com.future.utils.Page_S;
import com.opensymphony.xwork2.ActionContext;

@Controller
@Scope("prototype")
public class AdminController extends BaseAction<Admin> implements RequestAware {
	
	private File upload;  //包含文件内容
	private String uploadFileName;//上传文件的名称；
	private String uploadContentType; //上传文件的MIME类型；
	private Integer de_id;
	//这些属性都会随着文件的上传自动赋值；
	
	
	//导入数据页面
	public String importStudentUI(){
		
		return "importStudentUI";
	}
	
	//导入数据
	public String importStudent() throws IOException{
		
		//上传文件并记住路径
		String path = ServletActionContext.getServletContext().getRealPath("/importDate");  
        String filename = path+File.separator+uploadFileName;  
        FileInputStream in = new FileInputStream(upload);  
        FileOutputStream out = new FileOutputStream(filename);  
        byte[]b = new byte[1024];  
        int len = 0;  
        while((len=in.read(b))>0){  
            out.write(b,0,len);  
        }  
        out.close(); 
		
        //System.out.println("path:" + path);
        //System.out.println("filename:" + filename);
        //System.out.println(upload+"----" + uploadFileName+"----" +uploadContentType);
        //接着把文件路径传入导入类~
        //获取所有院系信息
        List<Department> de = departmentService.findAllDepartment();
        Map<String,Department> deMap = new HashMap<String,Department>();
        for(Department obj:de){
        	//System.out.println(obj.getDe_name());
        	deMap.put(obj.getDe_name(), obj);
        }
        
        ImportDate importDate = new ImportDate();
        List<Object> message =  importDate.prepare(filename,deMap);
        Map<Student,List> errStuMap= (Map<Student, List>) message.get(0);
        int a = (int) message.get(1);
        
        System.out.println(errStuMap);
        System.out.println("sdf符合数量:" + a);
        
        if(errStuMap.isEmpty()){
        	ActionContext.getContext().put("num", a);
        	return "importStudentUISuccess";
        } else {
        	ActionContext.getContext().put("errStuMap", errStuMap);
        	ActionContext.getContext().put("num", a);
        	return "importStudentUI2";
        }
	}

	

	// =======================================================================================
	// 显示主页面
	public String loginView() {
		// System.out.println("访问成功");
		return "success";
	}

	// 看看待审核项目
	public String checkNoProject() {
		// System.out.println("调用service方法查询所有未审核项目");
		/*
		 * for(Competition a:competitions){
		 * System.out.println(a.getCompe_compeName().getCompeName_name()); }
		 */
		// 1、调用service方法查询所有未审核项目
		// List<Competition> competitions =
		// adminService.findAllNoCheckProject();
		// 2、放入map中
		// ActionContext.getContext().put("competitions", competitions);
		PageBean pageBean = adminService.getPageBeanFindAllNoCheckProject(pageNum, pageSize);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "checkNoProject";
	}

	// 查看审核成功项目
	public String checkSuccessProject() {
		// 添加分页
		PageBean pageBean = adminService.getPageBean(pageNum, pageSize);
		ActionContext.getContext().getValueStack().push(pageBean);

		// 1、调用service方法查询所有未审核项目
		List<Competition> competitions = adminService.findAllSuccessCheckProject();

		// 2、放入map中
		ActionContext.getContext().put("competitions", competitions);

		return "checkSuccessProject";
	}

	// 教务处审批：让通过审核
	public String pass() {
		// 拿到项目id属性，接下来去修改状态
		adminService.pass(id);
		return "checkSuccess";
	}

	// 教务处审核：不让通过审核
	public String noPass() {
		adminService.noPass(id);
		return "checkNo";
	}

	// 查看未通过审核项目
	public String noPassCheck() {
		// 1、调用service方法查询所有未"通过"审核项目
		// List<Competition> competitions = adminService.findNoPassCheck();
		// 2、放入map中
		// ActionContext.getContext().put("competitions", competitions);

		// 分页查看未通过审核项目
		PageBean pageBean = adminService.getPageBeanNoPassCheck(pageNum, pageSize);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "noPassCheck";
	}

	public String alterCompetitionUI() {
		// 准备数据,根据id查询到某一具体数据
		Competition competition = adminService.findById(id);
		System.out.println(competition.getCompe_manager());
		// 放入值栈
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

	// 分页数据
	private int pageNum = 1;// 当前页
	// private int pageSize = 10;//每页显示多少条记录

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

	// =======================================================================================

	// 竞赛分页相关
	private Integer currentPage = 1;
	private Integer pageSize = 10;

	// 学院负责人
	private DepManager dm = new DepManager();
	// 学生
	private Student stu = new Student();
	// 学院
	private Department department = new Department();
	// 竞赛等级
	private CompetitionHierarchy comhi = new CompetitionHierarchy();
	// 获奖等级
	private AwardHierarchy awardhi = new AwardHierarchy();
	// 奖励标准
	private AwardStandard awardStandard = new AwardStandard();

	// 查看所有院系
	public String finAllDepartment() {
		Page_S ps = new Page_S();
		ps.setCurrentPage(currentPage);
		ps.setPageSize(pageSize);
		ps = departservice.findAllDepartment(ps);
		request.put("ps", ps);
		return "allDepartment";
	}

	// 修改院系
	public String modifyDepartView() {
		Department depart = departservice.findDepartById(department.getDe_id());
		request.put("depart", depart);
		return "modifyDepartView";
	}

	public String modifyDepartsuccess() {
		departservice.addOrupdate(department);
		return "modifyDepartsuccess";
	}

	// 查看所有学生
	public String findAllStudent() {
		Page_S ps = new Page_S();
		ps.setCurrentPage(currentPage);
		ps.setPageSize(pageSize);
		ps = stuser.findAllStudenyByPage(ps);
		request.put("ps", ps);
		return "allstudent";
	}

	// 修改学生
	public String modifyStuView() {
		Department de=departmentService.findDepartById(de_id);
		List<Department> departments=departmentService.getAllDepartMent();
		Iterator<Department> iterator=departments.iterator();
		while(iterator.hasNext()){
			if(iterator.next().getDe_id()==de.getDe_id()){
				iterator.remove();
			}
		}
		departments.add(0, de);
		Student student = stuser.findStudentById(stu.getStu_id());
		request.put("stu", student);
		request.put("departments", departments);
		return "modityStuView";
	}

	public String modifyStu() {
		stuser.updateStudent(stu);
		return "modifyStuSuccess";
	}

	// 查看所有学院负责人
	public String findAll() {
		Page_S ps = new Page_S();
		ps.setCurrentPage(currentPage);
		ps.setPageSize(pageSize);
		ps = depManagerService.getAllDepManageByPage(ps);
		ActionContext.getContext().put("ps", ps);
		return "all";

	}

	// 删除学院负责人

	public String deleteDep() {
		depManagerService.deleteDep(dm.getDepM_id());
		return "deletesuccess";
	}

	/**
	 * 修改学院负责人，有外键的不让修改 跳转到修改页面
	 */
	public String modifyDep() {
		DepManager dem = depManagerService.getDemById(dm.getDepM_id());
		request.put("dem", dem);
		return "modifyView";
	}

	// 修改学院负责人
	public String modify() {
		depManagerService.addOrUpdate(dm);
		return "modifysuccess";

	}

	/**
	 * @author 牛洧鹏
	 * @return 添加学院负责人
	 */
	public String addDeparmentManegerView() {
		List<Department> departments = departservice.getAllDepartMent();
		request.put("departments", departments);
		return "addDeparmentManegerView";
	}

	/**
	 * 添加学院
	 * 
	 * @return
	 */
	public String addDepartmentView() {
		List<DepManager> depManagers = depManagerService.getAllDepManager();
		request.put("depManagers", depManagers);
		return "addDepartmentView";
	}

	public String addDepartment() {
		departservice.addOrupdate(department);
		return "addDepartmentSuccess";
	}

	/**
	 * 添加学院负责人
	 * 
	 * @return
	 */
	public String addDepartmentManager() {
		depManagerService.addOrUpdate(dm);
		return "addManagerSuccess";
	}

	public String addCompetitionHierarchyView() {
		return "addCompetitionHierarchyView";
	}

	public String addCompetitionHierarchy() {
		comphieser.addOrupdate(comhi);
		return "addSuccess";
	}

	/**
	 * 添加获奖等级
	 * 
	 * @return
	 */
	public String addAwardHierarchyView() {
		List<AwardStandard> awardStandards = awardstandser.getAll();
		request.put("awardStandards", awardStandards);
		return "addAwardHierarchyView";
	}

	public String addAwardHierarchy() {
		ahserv.addOrupdate(awardhi);
		return "addSuccess";
	}

	public String addAwardStandView() {

		return "addAwardStandView";
	}

	public String addAwardStand() {
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
		request = arg0;
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
	//文件上传
	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public Integer getDe_id() {
		return de_id;
	}

	public void setDe_id(Integer de_id) {
		this.de_id = de_id;
	}
	
}
