package com.future.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.future.base.BaseAction;
import com.future.domain.Competition;
import com.future.utils.FileUpLoadUtils;
import com.opensymphony.xwork2.ActionContext;

@Controller
@Scope("prototype")
public class CompetitionController extends BaseAction<Competition> {

	private File upload;  //包含文件内容
	private String uploadFileName;//上传文件的名称；
	private String uploadContentType; //上传文件的MIME类型；
	//这些属性都会随着文件的上传自动赋值；
	private String name;
	
	//文件上传   竞赛方案
	//=============================
		
	private File compeProgramFile;//文件
	private String compeProgramFileFileName;//文件名
	private String compeProgramFileContentType;//文件类型

	// 修改竞赛项目
	public String alterCompetition() throws IOException {
		
		/*String path = ServletActionContext.getServletContext().getRealPath("/");  
        String filename = path+File.separator+uploadFileName;  
        FileInputStream in = new FileInputStream(upload);  
        FileOutputStream out = new FileOutputStream(filename);  
        byte[]b = new byte[1024];  
        int len = 0;  
        while((len=in.read(b))>0){  
            out.write(b,0,len);  
        }  
        out.close(); 
		
        System.out.println("path:" + path);
        System.out.println("filename:" + filename);
        System.out.println(upload+"----" + uploadFileName+"----" +uploadContentType);*/
		
		
		//model.setCompe_program(uploadFileName);
		// 把当前model传入service进行修改
		competitionService.alterCompetition(model);

		return "alterCompetition";
	}
	
	//修改竞赛方案UI
	public String alterCompetitionProgramUI(){
		System.out.println(model.getCompe_id());
		ActionContext.getContext().put("compe_id", model.getCompe_id());
		return "alterCompetitionProgramUI";
	}
	
	//修改竞赛方案UI
	public String alterCompetitionProgram(){
		System.out.println("再次接收id：" + model.getCompe_id());
		
		String realPath = "";
		try {
			realPath = FileUpLoadUtils.processUploadFile(compeProgramFile, compeProgramFileFileName, compeProgramFileContentType);
		} catch (IOException e) {
			//处理上传文件失败
			addActionError("文件上传输出未知错误，请重试！！！");
			return "ToApplyCompePage";
		}
		//保存文件路径
		//competition.setCompe_program(realPath);
		//传过路径和id，让service去处理
		competitionService.updateCompetitionPro(model.getCompe_id(),realPath);
		return "alterCompetitionProgram";
	}
	
	//下载
	public InputStream getTargetFile() throws UnsupportedEncodingException{
		System.out.println("+++++++++++");
		System.out.println(inputPath);
		//用这个方法只适合于IE，百度浏览器，火狐还是无效，下面那个方法有效~~~请往下看~
		//ServletActionContext.getResponse().setHeader("Content-Disposition","attachment;fileName="+java.net.URLEncoder.encode(inputPath, "UTF-8"));
		return ServletActionContext.getServletContext().getResourceAsStream(inputPath);
	}
	
	public String upload(){
		return "success";
	}

	
	//=====================下载
	private String inputPath;
	
	public String getInputPath() throws UnsupportedEncodingException {
		//ServletActionContext.getResponse().setHeader("Content-Disposition","attachment;fileName="+java.net.URLEncoder.encode(inputPath, "UTF-8"));
		//====================这句话超级重要，一定要记下，这个和上面有异曲同工之妙，这个是火狐等浏览器适配，上面那个是ie
		System.out.println("??????");
		inputPath = new String(inputPath.getBytes(), "ISO8859-1");
		return inputPath;
		//return inputPath = new String(inputPath.getBytes("ISO-8859-1"), "utf-8");
	}

	public void setInputPath(String inputPath) throws UnsupportedEncodingException {
		this.inputPath = new String(inputPath.getBytes("ISO-8859-1"), "utf-8");
		//this.inputPath = inputPath;
	}

	//=====================上传属性
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
	
	


}
