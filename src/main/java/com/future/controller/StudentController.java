package com.future.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.future.base.BaseAction;
import com.future.domain.AwardRecord;
import com.future.domain.Competition;
import com.future.domain.Department;
import com.future.domain.SignUp;
import com.future.domain.Student;
import com.future.utils.Page_S;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

@Controller
@Scope("prototype")
public class StudentController extends BaseAction<Student> implements ModelDriven<Student>,SessionAware,RequestAware{

	private Integer currentPage=1; //当前页默认为1
	private Integer pageSize=10;
	private Integer compe_id;
	private SignUp  sup=new SignUp();
	private Integer award_id;
	private List<Student> students=new ArrayList<Student>();

	
	private File file;
	private String fileFileName;//  
	private String fileContentType;//
	public String login(){
		Student student=stuser.login(stu);
		if(student!=null){
			session.put("stu", student);
			return "operation";
		}
		return "erro";
	}

	public String loginView(){
		
		return "loginView";
	}
	
	public String addStudentView(){
		List<Department> departments=departservice.getAllDepartMent();
		request.put("departments", departments);
		return "addStudentView";
	}
	
	public String addStudent(){
		stuser.addOrUpdateStudent(stu);
		return "success";
	}
	
	//报名
	public String apply(){
		Page_S ps=new Page_S();
		ps.setCurrentPage(currentPage);
		ps.setPageSize(pageSize);
		ps=comps.findapplyCompetition(ps);
		request.put("ps", ps);
		return "apply";
		
	}
	
	//查看竞赛的详细信息
	public String lookDescComp(){
		Competition comp=comps.findCompetitionById(compe_id);
		request.put("comp", comp);
		return "desccompetition";
	}
	
	
	//填写报名表
	public String fillentryform(){
		Competition comp=comps.findCompetitionById(compe_id);
		request.put("comp", comp);
		return "fillentryform";
	}
	
	//判断学生是否报过名
	public String jugeapply(){
		Student stdent;
		if(stu.getStu_id()!=null){
		 stdent	=stuser.findStudentById(stu.getStu_id());
		}else {
		 stdent=stuser.findStudentByNameAndNum(stu);
		}
		if(stdent==null){
			ActionContext.getContext().getValueStack().push("notexist");
			return "jugeapply";
		}
		Competition c=comps.findCompetitionById(compe_id);
		SignUp s=sups.jugeStudentuge(stdent,c , sup.getSignUP_type());
		ActionContext.getContext().getValueStack().push(s);
		return "jugeapply";
	}
	
	//完成报名
	public String finishApply(){
		Date apply=new Date();
		Competition compt=new Competition();
		compt.setCompe_id(compe_id);
		Iterator<Student> iterator=students.iterator();
		int index=1;
		while(iterator.hasNext()){
			SignUp sgp=new SignUp();
			sgp.setSignUp_teacher(sup.getSignUp_teacher());
			sgp.setSignUp_team(sup.getSignUp_team());
			sgp.setSignUP_type(sup.getSignUP_type());
			Student s=iterator.next();
			s=stuser.findStudentByNameAndNum(s);
			if(s==null){
				return "erro";
			}else{
				if(index==1&&students.size()!=1){
					sgp.setSingUp_manager(1);
				}else{
					if(students.size()!=1){
						sgp.setSingUp_manager(0);
					}else if(students.size()==1){
						sgp.setSingUp_manager(null);
					}
					
				}
				sgp.setSignUp_student(s);
			}
			sgp.setSignUP_time(apply);
			sgp.setSignUp_status(1);
			sgp.setSignUp_competition(compt);
			sups.addSignUp(sgp);
			index++;
		}
		return "success";
	}
	
	//查看团队报名的队名是否重复
	public String jugeTeam(){
		String result="";
		if(sup.getSignUp_team()!=null&&!sup.getSignUp_team().equals("")){
			result=sups.jugeTeamexist(sup.getSignUp_team());
			ActionContext.getContext().getValueStack().push(result);
		}else{
			ActionContext.getContext().getValueStack().push(null);
		}
		return "jugeapply";
		
	}
	
	
	public String lookApplyStatus(){
		//得到学生
		Student st=(Student) session.get("stu");
		Page_S page=new Page_S();
		page.setCurrentPage(currentPage);
		page.setPageSize(pageSize);
		page=stuser.lookApplyByStatus(st,page);
		request.put("page", page);
		return "lookapplystatus";
	}
	
	//查看所获奖记录
	public String lookAward(){
		Student s=(Student) session.get("stu");
		Page_S page=new Page_S();
		page.setCurrentPage(currentPage);
		page.setPageSize(pageSize);
		page=ars.findAwardByStudent(s, page);
		request.put("page", page);
		return "lookAward";
	}
	
	//跳转到上传附件的页面
	public String uploadView(){
		request.put("award_id", award_id);
		return "uploadView";
	}
	
	//文件上传
	public String uploadFile(){
		String root = ServletActionContext.getServletContext().getRealPath(
		               "/UploadFile");// 上传路径
	    InputStream inputStream;
	    File destFile;
	    OutputStream os;
        String pre= getFileFileName().substring(0,getFileFileName().indexOf("."));  
	    String sfx=getFileFileName().substring(getFileFileName().indexOf("."));
	    root=root+"\\"+pre+UUID.randomUUID()+sfx;
             try {
				inputStream = new FileInputStream(file);
				destFile = new File(root);
		        os = new FileOutputStream(destFile);
		              byte[] buffer = new byte[400];
		             int length = 0;
		             while ((length = inputStream.read(buffer)) > 0) {
		                  os.write(buffer, 0, length);
		            }
		      
		     inputStream.close();
		     os.close();
             } catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
           
             
        AwardRecord ar=ars.findAwardRecordById(award_id);
        ar.setAwardRecor_picturePath(root);
		ars.saveOrUpdaAward(ar);
        return "success";
	}
	private Student stu;
	@Override
	public Student getModel() {
		
		stu=new Student();
		return stu;
	}
	
	
	
	
	
	
	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getCompe_id() {
		return compe_id;
	}

	public void setCompe_id(Integer compe_id) {
		this.compe_id = compe_id;
	}

	public SignUp getSup() {
		return sup;
	}

	public void setSup(SignUp sup) {
		this.sup = sup;
	}

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}

	public Integer getAward_id() {
		return award_id;
	}

	public void setAward_id(Integer award_id) {
		this.award_id = award_id;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	Map<String, Object> session;
	Map<String, Object> request;
	@Override
	public void setRequest(Map<String, Object> arg0) {
		request=arg0;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		session=arg0;
	}
	
	
	
	
	
	
}

