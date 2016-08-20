package com.future.dao;

import java.util.List;

import com.future.domain.Competition;
import com.future.utils.PageBean;

public interface AdminDao {

	//查询所有待审核项目
	List<Competition> findAllNoCheckProject();

	//查看审核成功项目
	List<Competition> findAllSuccessCheckProject();

	//审核成功
	void pass(Integer id);

	//审核不通过
	void noPass(Integer id);

	//查看未通过审核项目
	List<Competition> findNoPassCheck();
	
	//1、根据id查询到具体某一条数据
	public Competition findById(Integer id);

	//分页
	PageBean getPageBean(int pageNum, int pageSize);

	//查询所有待审核项目
	PageBean getPageBeanFindAllNoCheckProject(int pageNum, int pageSize);

	//分页查看未通过审核项目
	PageBean getPageBeanNoPassCheck(int pageNum, int pageSize);

}
