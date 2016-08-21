package com.future.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.future.base.BaseAction;
import com.future.domain.Competition;
import com.opensymphony.xwork2.ModelDriven;

@Controller
@Scope("prototype")
public class CompetitionController extends BaseAction<Competition> {

	private File upload;  //包含文件内容
	private String uploadFileName;//上传文件的名称；
	private String uploadContentType; //上传文件的MIME类型；
	//这些属性都会随着文件的上传自动赋值；
	private String name;

	// 修改竞赛项目
	public String alterCompetition() throws IOException {
		String path = ServletActionContext.getServletContext().getRealPath("/");  
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
        System.out.println(upload+"----" + uploadFileName+"----" +uploadContentType);
		
		
		model.setCompe_program(uploadFileName);
		// 把当前model传入service进行修改
		competitionService.alterCompetition(model);

		return "alterCompetition";
	}
	
	//下载
	public InputStream getTargetFile() throws UnsupportedEncodingException{
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

}
