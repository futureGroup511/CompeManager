package com.future.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ParameterAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.future.base.BaseAction;
import com.future.domain.Competition;
import com.future.domain.CompetitionHierarchy;
import com.future.domain.CompetitionName;
import com.future.domain.DepManager;
import com.future.domain.Department;
import com.future.domain.Notification;
import com.future.domain.SignUp;
import com.future.service.CompetitionHierarchyService;
import com.future.service.CompetitionNameService;
import com.future.service.CompetitionService;
import com.future.service.DepManagerService;
import com.future.service.SignUpService;
import com.future.utils.FileUpLoadUtils;
import com.future.utils.PageBean;
import com.future.utils.Page_S;
import com.opensymphony.xwork2.ActionContext;
@Controller
@Scope("prototype")
public class DepManagerController extends BaseAction<Object> implements SessionAware, ParameterAware, RequestAware{

	private static final long serialVersionUID = 1L;
	
	@Resource
	private DepManagerService depManagerService;
	@Resource
	private CompetitionHierarchyService competitionHierarchyService;
	@Resource
	private CompetitionNameService competitionNameService;
	@Resource
	private CompetitionService competitionService;
	@Resource
	private SignUpService signUpService;
	
	//根据 paramterMap 参数判断应该创建那个模型 之后再方法中进行强制转换
	private Object model = new Object();
	private Map<String, Object> sessionMap;
	private Map<String, String[]> paramMap;
	private Map<String, Object> requestMap;
	
	private List<CompetitionHierarchy> competitionHierarchies;
	//查看所有的竞赛名称，准备数据的
	private List<CompetitionName> competitionNames;
	/**
	 * 竞赛名称
	 */
	private CompetitionName competitionName;
	
	//文件上传   竞赛方案
	//=============================
	
	private File compeProgramFile;//文件
	private String compeProgramFileFileName;//文件名
	private String compeProgramFileContentType;//文件类型
	//==============================
	
	//文件下载
	//================================
	private String filename;//初始化要保存的文件名
	private String savePath = "/UploadFile/";//下载文件所在路径 默认
	private InputStream inputStream;
	//=======================
	
	//竞赛分页相关
	private Integer currentPage = 0;
	private Integer pageSize=10;
	//查看竞赛的详细信息
	private Integer compeId;
	private Integer depM_id;
	//竞赛通知
	private Notification notification=new Notification();
	private Integer noti_id;
	/**
	 * 赵硕
	 * 学院负责人登陆
	 */
	public String login(){
		DepManager depManager = (DepManager)model;
		System.out.println(depManager.getDepM_num()+":"+depManager.getDepM_password());
		depManager = depManagerService.getByNumAndPassword(depManager.getDepM_num(), depManager.getDepM_password());
		
		if(depManager == null){//如果没有该人就返回重新登陆
			addActionError("用户名/密码错误");
			return "ReLogin";
		}
		//添加用户到 session会话中去
		sessionMap.put("depManager", depManager);
		return "LoginSuccess";
	}
	
	/**
	 * 赵硕
	 * 学院负责人 申请项目名称 
	 */
	public String applyCompeName(){
		
		DepManager depManager = (DepManager)sessionMap.get("depManager");
		if(depManager == null){
			addActionError("用户未登录/没有此权限请联系管理员");
			return "ReLogin";
		}
		competitionHierarchies = competitionHierarchyService.getAll();
		//System.out.println("zhaoshuo================>"+competitionHierarchies);
		return "ApplyCompeNameToPage";
	}
	
	/**
	 * zhaoshuo
	 * 保存竞赛名称
	 */
	public String saveCompeName(){
		System.out.println("==========>"+competitionName);
		Integer compeHieId = competitionName.getCompeName_compeHierarchy().getCompeHie_id();
		if(compeHieId == null || compeHieId == 0){
			competitionName.getCompeName_compeHierarchy().setCompeHie_id(null);
		}
		competitionName.setCompeName_status(1+"");//提交申请，正在审核状态
		competitionNameService.save(competitionName);
		return "LoginSuccess";
	}
	
	/**
	 * zhaoshuo
	 * 查看所有已申请的竞赛名称的申请状态信息
	 * @return
	 */
	public String seeAllApplyCompNames(){
		competitionNames = competitionNameService.getAllCompeNames();
		return "ToSeeAllApplyCompeNamePage";
	}
	
	/**
	 * zhaoshuo
	 * 申请竞赛 ====》填写竞赛信息页面
	 */ 
	public String applyCompetitionPage(){
		DepManager depManager = (DepManager)sessionMap.get("depManager");
		if(depManager == null){
			addActionError("用户未登录/没有此权限请联系管理员");
			return "ReLogin";
		}
		//得到所有的竞赛名称
		competitionNames = competitionNameService.getAllCompeNames();
		System.out.println(competitionNames);
		return "ToApplyCompePage";
	}

	/**
	 * zhaoshuo
	 * 保存申请的竞赛信息
	 */
	String wrongFilepath = "fileNotAllowed";//上传失败的界面
	public String saveApplyCompetition(){
		if(model.getClass() == Competition.class){
			System.out.println("要保存竞赛了");
		}else{
			System.out.println("不时地");
		}
		Competition competition = (Competition)model;
		String realPath = "";
		//设置竞赛状态  出事状态，申请中
		competition.setCompe_status(1);
		System.out.println(competition.getCompe_manager());
		try {
			realPath = FileUpLoadUtils.processUploadFile(compeProgramFile, compeProgramFileFileName, compeProgramFileContentType);
		} catch (IOException e) {
			//处理上传文件失败
			addActionError("文件上传输出未知错误，请重试！！！");
			return "ToApplyCompePage";
		}
		//保存文件路径
		competition.setCompe_program(realPath);
		competitionService.save(competition);
		return "SaveApplyCompetition";
	}
	
	
	/**
	 *查看申请竞赛的审核状态  分页查询
	 */
	public String seeAllApplyCompetition(){
		Integer recordCount = competitionService.getCompetitionCount();
		List<Competition> recordList = new ArrayList<Competition>();
		Integer pageSize = 6;//每页显示的数量
		if(currentPage == null || (currentPage+"").trim() == ""){
			currentPage = 0;
		}
		PageBean pageBean = new PageBean(currentPage, pageSize, recordCount, null);
		recordList = competitionService.getCompetitionByPage(pageBean);
		System.out.println(recordList.size());
		pageBean.setRecordList(recordList);
		requestMap.put("pageBean", pageBean);
		System.out.println(currentPage+"==============");
		return "ToSeeAllApplyCompetitionPage";
	}
	
	
	/*查看竞赛的详细信息
	 * 赵硕
	 */
	public String seeCompetitionDetail(){
		
		Competition competition = competitionService.getCompetitionById(compeId);
		requestMap.put("compe", competition);
		requestMap.put("currentPage", currentPage);
		return "SeeCompetitionDetailPage";
	}
	
	//文件下载
	// 隐含属性 targetFile ,用于封装下载文件  
    public InputStream getInputStream() throws FileNotFoundException{  
    	 try {
			filename = new String(filename.getBytes("iso-8859-1"), "utf8");
		} catch (UnsupportedEncodingException e) {
			System.out.println("文件下载错误");
			return null;
		}
    	inputStream = ServletActionContext.getServletContext().getResourceAsStream(savePath+filename);
    	if(inputStream == null){
    		System.out.println("down file error");
    	}
    	System.out.println("filename=========>"+filename);
    	return inputStream;
    }  
    
    public String downloadCompeProgram(){
    	return SUCCESS;
    }
    
    public String getFilename() {
		return filename;
	}

	public static boolean isIE() {  
	    return ServletActionContext.getRequest().getHeader("USER-AGENT")  
	            .toLowerCase().indexOf("msie") > 0 ? true : false;  
	}  
	/**
	 * 功能重复  待考察
	 */
	public String seeHistoryCompetition(){//查看历史申报项目
		
		return "ToSeeHistoryCompetition";
	}
	/**
	 * 到达审核学生报名页面                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               通过与否
	
	 */
	public String inspectStudentApplyPage(){
		Integer count = signUpService.getCount();
		Integer pageSize = 6;//每页显示的数量
		if(currentPage == null || (currentPage+"").trim() == ""){
			currentPage = 0;
		}
		PageBean pb = new PageBean(currentPage, pageSize, count, null);
		List<SignUp> signUpList = signUpService.getAllSignUp(pb);
		pb.setRecordList(signUpList);
		requestMap.put("pb", pb);
		return "InspectStudentSignUp";
	}
	
	
	

	
	
	//报名id
	private Integer signId;
	public String inspectSuccess(){
		
		return null;//重定向至指定当前页
	}
    
	//==============================
	// 属性的set和get方法
	//=================================

	public CompetitionName getCompetitionName() {
		return competitionName;
	}

	public void setCompetitionName(CompetitionName competitionName) {
		this.competitionName = competitionName;
	}
	
	public List<CompetitionHierarchy> getCompetitionHierarchies() {
		return competitionHierarchies;
	}

	public void setCompetitionHierarchies(List<CompetitionHierarchy> competitionHierarchies) {
		this.competitionHierarchies = competitionHierarchies;
	}

	public List<CompetitionName> getCompetitionNames() {
		return competitionNames;
	}

	public void setCompetitionNames(List<CompetitionName> competitionNames) {
		this.competitionNames = competitionNames;
	}

	
	public File getCompeProgramFile() {
		return compeProgramFile;
	}

	public void setCompeProgramFile(File compeProgramFile) {
		this.compeProgramFile = compeProgramFile;
	}

	public String getCompeProgramFileFileName() {
		return compeProgramFileFileName;
	}

	public void setCompeProgramFileFileName(String compeProgramFileFileName) {
		this.compeProgramFileFileName = compeProgramFileFileName;
	}

	public String getCompeProgramFileContentType() {
		return compeProgramFileContentType;
	}

	public void setCompeProgramFileContentType(String compeProgramFileContentType) {
		this.compeProgramFileContentType = compeProgramFileContentType;
	}
	
	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	

	public Integer getCompeId() {
		return compeId;
	}

	public void setCompeId(Integer compeId) {
		this.compeId = compeId;
	}

	
	public void setFilename(String filename) {
		this.filename = filename;
	}


	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	//发送通知页面
	public String sendInformView(){
		
		return "sendInformView";
	}
	
	//发送通知
	public  String sendInform(){
		Date date=new Date();
		notification.setNoti_time(date);
		nfs.saveOrUpdate(notification);
		return "success";
		
	}
	
	//查看通知页面
	public String  lookInformView(){
		Page_S p=new Page_S();
		p.setCurrentPage(currentPage);
		p.setPageSize(pageSize);
		p=nfs.queryAllNotification(p);
		ActionContext.getContext().put("p", p);
		return "lookAllInfor";
		
	}
	
	//查看详细通知
	public String lookinfo(){
		Notification no=nfs.findNotiById(noti_id);
		ActionContext.getContext().put("no", no);
		return "lookinfo";
	}
	
	
	//====================================
	// 接口实现方法
	//=========================
	@Override
	public Object getModel() {
		//判断是不是学院负责人登陆
		Object depM_num = paramMap.get("depM_num");
		//判断是不是竞赛项目的申请
		Object compe_manager = paramMap.get("compe_manager");
		if(depM_num != null){//是负责人登陆的时候
			model = new DepManager();
		}else if(compe_manager != null){//申报项目的时候
			model = new Competition();
		}
		return model;
	}
	@Override
	public void setSession(Map<String, Object> sessionMap) {
		this.sessionMap = sessionMap;
	}

	@Override
	public void setParameters(Map<String, String[]> paramMap) {
		this.paramMap = paramMap;
	}

	@Override
	public void setRequest(Map<String, Object> requestMap) {
		this.requestMap = requestMap;
	}

	public Notification getNotification() {
		return notification;
	}

	public void setNotification(Notification notification) {
		this.notification = notification;
	}

	public Integer getNoti_id() {
		return noti_id;
	}

	public void setNoti_id(Integer noti_id) {
		this.noti_id = noti_id;
	}

	public Integer getDepM_id() {
		return depM_id;
	}

	public void setDepM_id(Integer depM_id) {
		this.depM_id = depM_id;
	}
	
}
