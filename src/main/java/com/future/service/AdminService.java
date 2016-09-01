package com.future.service;

import java.util.List;

import com.future.domain.Admin;
import com.future.domain.Competition;
import com.future.utils.PageBean;

public interface AdminService {

	//查看所有待审核项目
	public List<Competition> findAllNoCheckProject();

	//查看审核成功项目
	public List<Competition> findAllSuccessCheckProject();

	//审核通过
	public void pass(Integer id);

	//审核未通过
	public void noPass(Integer id);

	////查看未通过审核项目
	public List<Competition> findNoPassCheck();

	//1、根据id查询到具体某一条数据
	public Competition findById(Integer id);

	//分页查看成功审核
	public PageBean getPageBean(int pageNum, int pageSize);

	//分页查看所有待审核项目
	public PageBean getPageBeanFindAllNoCheckProject(int pageNum, int pageSize);

	//分页查看未通过审核项目
	public PageBean getPageBeanNoPassCheck(int pageNum, int pageSize);

	
	//登陆
	public Admin jugeByNumAndPassword(String num, String password);
	//准备数据，查询状态=3（结果录入完毕）所有竞赛项目
	public List<Competition> findAllHaveResultProject();


	

}
