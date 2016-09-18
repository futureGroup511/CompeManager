package com.future.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
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
import com.future.domain.AwardHierarchy;
import com.future.domain.AwardRecord;
import com.future.domain.Competition;
import com.future.domain.CompetitionHierarchy;
import com.future.domain.CompetitionName;
import com.future.domain.DepManager;
import com.future.domain.Notification;
import com.future.domain.SignUp;
import com.future.service.AwardHierarchyService;
import com.future.service.AwardRecordService;
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
	@Resource
	private AwardHierarchyService awardHierarchyService;
	@Resource
	private AwardRecordService awardRecordService;
	//根据 paramterMap 参数判断应该创建那个模型 之后再方法中进行强制转换
	private Object model = new Object();
	private Map<String, Object> sessionMap;
	private Map<String, String[]> paramMap;
	private Map<String, Object> requestMap;
	private SignUp signup;
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
	public InputStream inputStream;
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
		
		DepManager depManager = null;
		if(model == null || model.getClass() != DepManager.class){
			return "ReLogin";
		}
		depManager = (DepManager)model;
		System.out.println(depManager.getDepM_num()+":"+depManager.getDepM_password());
		depManager = depManagerService.getByNumAndPassword(depManager.getDepM_num(), depManager.getDepM_password());
		/**
		 * 竞赛已经完成的 可以填写竞赛结果的竞赛 当年申请的竞赛
		 */
		/*List<Competition> compeList = competitionService.getAvaliableCopetion();
		requestMap.put("compeList", compeList);
		System.out.println(compeList.size()+"hhhhhhhhhhhhhhhhhhh");*/
		if(depManager == null){//如果没有该人就返回重新登陆
			addActionError("用户名/密码错误");
			return "ReLogin";
		}
		//添加用户到 session会话中去
		sessionMap.put("depManager", depManager);
		return "LoginSuccess";
	}
	
	
	public String registerScoreToDb(){
		Integer depId = ((DepManager)sessionMap.get("depManager")).getDepM_department().getDe_id();
		/**
		 * 竞赛已经完成的 可以填写竞赛结果的竞赛 当年申请的竞赛
		 */
		//List<Competition> compeList = competitionService.getAvaliableCopetion();
		/**
		 * 竞赛已经完成的 可以填写竞赛结果的竞赛 当年申请的竞赛并且是本院系的
		 */
		List<Competition> compeList = competitionService.getAvaliableCopetionByDep(depId);
		requestMap.put("compeList", compeList);
		System.out.println(compeList.size()+"hhhhhhhhhhhhhhhhhhh");
		return "RegisterScoreToDb";
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
		return "ToSuccessPage";
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
		competitionNames = competitionNameService.getAvailableCompeNames();
		System.out.println(competitionNames);
		return "ToApplyCompePage";
	}

	/**
	 * zhaoshuo
	 * 保存申请的竞赛信息
	 */
	String wrongFilepath = "fileNotAllowed";//上传失败的界面
	public String saveApplyCompetition(){
		if(model != null && model.getClass() == Competition.class){
			System.out.println("要保存竞赛了");
		}else{
			System.out.println("不时地");
			return "ReLogin";
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
			return "fileNotAllowed";
		}
		//新增
		competition.setCompe_department(((DepManager)sessionMap.get("depManager")).getDepM_department());
		//保存文件路径
		competition.setCompe_program(realPath);
		competitionService.save(competition);
		//TODO 项目申请成功到达的界面
		/*return "SaveApplyCompetition";*/
		return "ToSuccessPage";
	}
	
	
	/**
	 *查看申请竞赛的审核状态  分页查询
	 */
	public String seeAllApplyCompetition(){
		Integer depId = ((DepManager)sessionMap.get("depManager")).getDepM_department().getDe_id().intValue();
		//Integer recordCount = competitionService.getCompetitionCount();
		Integer recordCount = competitionService.getCompetitionCountByDep(depId);
		List<Competition> recordList = new ArrayList<Competition>();
		Integer pageSize = 10;//每页显示的数量
		if(currentPage == null || (currentPage+"").trim() == ""){
			currentPage = 0;
		}
		PageBean pageBean = new PageBean(currentPage, pageSize, recordCount, null);
		//recordList = competitionService.getCompetitionByPage(pageBean);
		recordList = competitionService.getCompetitionByPageAndDep(pageBean,depId);
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
	public InputStream getInputStream(){  
    	System.out.println(filename);
    	 try {
			filename = new String(filename.getBytes("iso-8859-1"), "utf8");
			System.out.println("编码之后的文件名称"+filename);
			//TODO  注意配置全局的文件异常映射，防止文件被删除之后还去下载从而引发错误
		} catch (Exception e) {
			System.out.println("文件下载错误");
			return null;
		}
    	inputStream = ServletActionContext.getServletContext().getResourceAsStream(filename);
    	System.out.println(savePath+filename);
    	if(inputStream == null){
    		System.out.println("down file error");
    	}
    	System.out.println("filename=========>"+filename);
    	return inputStream;
    }  
    
    public String downloadCompeProgram(){
    	System.out.println("我要下载东西了");
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
		
		Integer depId = ((DepManager)sessionMap.get("depManager")).getDepM_department().getDe_id();
		//Integer count = signUpService.getCount();
		Integer count = signUpService.getCountByDep(depId);
		Integer pageSize = 10;//每页显示的数量
		if(currentPage == null || (currentPage+"").trim() == ""){
			currentPage = 0;
		}
		PageBean pb = new PageBean(currentPage, pageSize, count, null);
		//List<SignUp> signUpList = signUpService.getAllSignUp(pb);
		List<SignUp> signUpList = signUpService.getAllSignUpByDep(pb,depId);
		pb.setRecordList(signUpList);
		requestMap.put("pb", pb);
		return "InspectStudentSignUp";
	}
	
	
	

	
	
	//报名id
	private Integer signId;
	public String inspectSuccess(){
		signUpService.changeSignStatus(signId, 2);//改变审核状态  已通过
		return "RedirectToStudenSignUptPage";//重定向至指定当前页
	}
    /**
     * 禁止审核通过
     * @return
     */
	public String inspectFailure(){
		signUpService.changeSignStatus(signId, 3);//改变审核状态  禁止通过
		return "RedirectToStudenSignUptPage";
	}
	/**
	 * 指定其为团队负责人
	 */
	//修改团队负责人的团队名称
	private String teamName;
	public String inspectToTeamLeader(){
		try {
			System.out.println(new String(teamName.getBytes(), "UTF-8"));
			System.out.println(new String(teamName.getBytes("iso-8859-1"), "UTF-8"));
			teamName = new String(teamName.getBytes(Charset.forName("iso-8859-1")), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		signUpService.makeToTeamLeader(teamName, signId);
		return "RedirectToStudenSignUptPage";//重定向至指定的action
	}
	private Integer signType;// 1：团队 2： 个人
	public String registerScore(){
		Integer depId = ((DepManager)sessionMap.get("depManager")).getDepM_department().getDe_id();
		if(signType != null){
			
		}else{
			signType = (Integer)sessionMap.get("signType");
		}
		if(compeId != null){
			
		}else{
			
			compeId = (Integer)sessionMap.get("compeId");
		}
		if(sessionMap.get("currentPage") != null){
			currentPage = (Integer)sessionMap.get("currentPage");
		}
		System.out.println("竞赛id为============》"+compeId+"类型"+signType);
		
		//得到指定竞赛的 还没有录入成绩的 团队报名和个人报名信息
		Integer pageSize = 10;//每页显示的数量
		//Integer count = signUpService.getCount();
		Integer count = signUpService.getCountByDep(depId);
		if(currentPage == null || (currentPage+"").trim() == ""){
			currentPage = 0;
		}
		PageBean pageBean = new PageBean(currentPage, pageSize, count, null);
		List<SignUp> signUpList = null;
		if(signType == 1){
			//signUpList = signUpService.getAvaliableGroupSignUp(compeId, pageBean);
			signUpList = signUpService.getAvaliableGroupSignUpByDep(compeId, pageBean,depId);
		}else if(signType == 2){
			//signUpList = signUpService.getAvaliablePersonalSignUp(compeId, pageBean);
			signUpList = signUpService.getAvaliablePersonalSignUpByDep(compeId, pageBean,depId);
		}
		requestMap.put("signUpList", signUpList);
		requestMap.put("isGroup",signType==1?true:false);
		requestMap.put("currentPage", currentPage);
		//保存成绩后还可以重新定位到指定页数和指定竞赛的指定竞赛类型的报名信息，来继续进行录入成绩
		sessionMap.put("signType", signType);
		sessionMap.put("compeId", compeId);
		sessionMap.put("currentPage", currentPage);
		System.out.println(signUpList.size()+"=============zhaoshuo");
		
		List signUpListGroup = signUpService.getAvaliableGroupSignUp(compeId, pageBean);
		List signUpListPersonal = signUpService.getAvaliablePersonalSignUp(compeId, pageBean);
		if(signUpListGroup.size()==0 && signUpListPersonal.size() ==0){
			//更新竞赛的状态为录入成绩完成
			competitionService.changeCompetitionStatus(compeId, 3);
		}
		return "RegisterCompetitionScore";
	}
	/**
	 * 到达录入成绩页面
	 */
	private Integer registerSignUpId;//报名表的id
	private boolean groupIsOrNot;
	public String registerScoreToPage(){
		List<AwardHierarchy> hieList = null; 
		if(groupIsOrNot){
			//查询所有团体赛 获奖等级
			hieList = awardHierarchyService.getGroupOrPersonalAwardHie(groupIsOrNot);
			System.out.println("团体的竞赛录入成绩");
		}else{
			hieList = awardHierarchyService.getGroupOrPersonalAwardHie(groupIsOrNot);
		}
		SignUp signUp = signUpService.getById(registerSignUpId);
		requestMap.put("signUp", signUp);
		requestMap.put("hieList", hieList);
		requestMap.put("groupIsOrNot", groupIsOrNot);
	System.out.println(hieList.size()+"**8888888888888888"+groupIsOrNot);
		return "RegisterStudentScorePage";
	}
	/**
	 * 保存获奖记录
	 * @return
	 */
	private Integer ScoreAdded;
	private Integer awardHieId;
/*	private Integer registerSignUpId;
	private boolean groupIsOrNot;*/
	public String registerScoreToRecord(){
		
		System.out.println(ScoreAdded+" : "+awardHieId+" : "+registerSignUpId+" : "+groupIsOrNot);
		//更新报名表 改变已获奖状态，下次不需要再录入成绩  属性  ：signUp_registerRecord
		signUpService.makeSignUpScored(registerSignUpId, 1);
		//构造获奖记录 并保存
		AwardRecord awardRecord = new AwardRecord();
		SignUp signUp = signUpService.getById(registerSignUpId);
		AwardHierarchy awardHierarchy = awardHierarchyService.getSpecialAwardHie(awardHieId);
		if(signUp.getSignUp_team() != null){//如果是团队
			awardRecord.setAwardRecor_team(signUp.getSignUp_team());
			awardRecord.setAwardRecor_manager(signUp.getSingUp_manager());
		}
		awardRecord.setAwardRecor_coachTeacher(signUp.getSignUp_teacher());
		awardRecord.setAwardRecor_time(new Date());
		awardRecord.setAwardRecor_status(1);
		awardRecord.setAwardRecor_stuMoney(awardHierarchy.getAwardHie_standard().getAward_stuMoney());
		awardRecord.setAwardRecor_teaMoney(awardHierarchy.getAwardHie_standard().getAward_teaMoney());
		awardRecord.setAwardRecor_score(ScoreAdded);
		awardRecord.setAwardRecor_student(signUp.getSignUp_student());
		awardRecord.setAwardRecor_competition(signUp.getSignUp_competition());
		awardRecord.setAwardRecor_awadHie(awardHierarchy);
		
		awardRecordService.saveAwardRecord(awardRecord);
		awardRecordService.beCalled();
		return "RedirectToRegisterStudentPage";//重定向至报名表列表 
 	}
	
	
	/**
	 * 得到 成绩录完的 项目 进行下一级别的比赛 再次录入成绩
	 */
	public String nextClassCompetition(){
		List<Competition> compeList = competitionService.getNextClassCompetition(((DepManager)sessionMap.get("depManager")).getDepM_department().getDe_id());
		requestMap.put("compeList", compeList);
		return "ToNextClassCompetition";
	}
	public String startNextClassCompetition(){
		System.out.println(compeId+"==============zhaohsuo ===>>>");
		competitionService.changeCompetitionStatus(compeId, 2);
		return "RedirectToNextClassCompetitionPage";
	}
	/**
	 *查看进行中项目的报名情况，总人数，以及可以进行人数的详细查询 
	 */
	public String lookProcessingCompetitionStatus(){
		Integer depId = ((DepManager)sessionMap.get("depManager")).getDepM_department().getDe_id();
		//得到正在进行中的该学院的竞赛
		//List<Competition> compeList = competitionService.getProcessingCompetition();
		//得到正在进行中的该学院的竞赛 指定学院的
		List<Competition> compeList = competitionService.getProcessingCompetitionByDep(depId);
		// 竞赛 id 为键 报名人数为值
		Map<Integer,Integer> compeSignUpsMap = new HashMap<Integer,Integer>();
		for(Competition compe:compeList){
			Integer compeId = compe.getCompe_id();
			List<SignUp> signUpList = signUpService.getSpecialCompetitionSignUps(compeId);
			compeSignUpsMap.put(compeId, signUpList.size());
		}
		requestMap.put("compeList", compeList);
		requestMap.put("compeSignUpsMap", compeSignUpsMap);
		System.out.println("compeList"+compeList.size());
		System.out.println("compeSignUpMap"+compeSignUpsMap.values());
		return "ToProcessingCompetition";
	}
	/**
	 * 查看指定项目详细报名情况  报名该项目的所有学生的信息
	 */
	public String seeSignUpsDetails(){
		System.out.println("《》《》《》《》《》zhaoshuo"+compeId);
		Integer pageSize =10;//每页显示的数量
		Integer count = signUpService.getSpecialCompetitionSignUps(compeId).size();
		if(currentPage == null || (currentPage+"").trim() == ""){
			currentPage = 0;
		}
		PageBean pageBean = new PageBean(currentPage, pageSize, count, null);
		List<SignUp> signUpList = signUpService.getSpecialCompeSignUpsByPage(pageBean, compeId);
		pageBean.setRecordList(signUpList);
		requestMap.put("pageBean", pageBean);
		return "CompeSignUpAllStudentsInfo";
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
		return "sendInformsuccess";
		
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
	
	//修改报名表
	public String modifySignUpView(){
		SignUp signUp=signUpService.getById(signup.getSignUp_id());
		requestMap.put("signUp", signUp);
		return "modifySignUpView";
	}
	
	public String modifySignUp(){
		SignUp s=signUpService.getById(signup.getSignUp_id());
		s.setSignUP_time(signup.getSignUP_time());
		s.setSignUp_teacher(signup.getSignUp_teacher());
		s.setSingnup_type(signup.getSingnup_type());
		if(signup.getSignUp_team()!=null){
			List<SignUp> signUps=signUpService.getSpecialGroupMember(s.getSignUp_team());
			s.setSignUp_team(signup.getSignUp_team());
			signUpService.updateSignUp(s);
			Iterator<SignUp> iterator=signUps.iterator();
			while(iterator.hasNext()){
				SignUp result=iterator.next();
				result.setSignUp_team(signup.getSignUp_team());
				signUpService.updateSignUp(result);
			}
		}
		if(signup.getSignUp_team()==null){
			signUpService.updateSignUp(s);
		}
		
		
		return "modifySignUp";
	}

	
	public Integer getSignId() {
		return signId;
	}

	public void setSignId(Integer signId) {
		this.signId = signId;
	}

	
	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	

	
	public Integer getRegisterSignUpId() {
		return registerSignUpId;
	}

	public void setRegisterSignUpId(Integer registerSignUpId) {
		this.registerSignUpId = registerSignUpId;
	}

	public boolean isGroupIsOrNot() {
		return groupIsOrNot;
	}

	public void setGroupIsOrNot(boolean groupIsOrNot) {
		this.groupIsOrNot = groupIsOrNot;
	}
	
	public Integer getScoreAdded() {
		return ScoreAdded;
	}

	public void setScoreAdded(Integer scoreAdded) {
		ScoreAdded = scoreAdded;
	}

	public Integer getAwardHieId() {
		return awardHieId;
	}

	public void setAwardHieId(Integer awardHieId) {
		this.awardHieId = awardHieId;
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
	

	public Integer getSignType() {
		return signType;
	}

	public void setSignType(Integer signType) {
		this.signType = signType;
	}


	public SignUp getSignup() {
		return signup;
	}


	public void setSignup(SignUp signup) {
		this.signup = signup;
	}

}
