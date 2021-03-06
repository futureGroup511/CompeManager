package com.future.dao;

import java.util.List;
import com.future.domain.Admin;
import com.future.domain.Competition;
import com.future.domain.Department;
import com.future.utils.PageBean;

public interface AdminDao {

	//根据账号密码判断是否存在
	public Admin jugeByNumAndPassword(String num,String password);
	
	//查询所有待审核项目
	List<Competition> findAllNoCheckProject();

	//查看审核成功项目
	List<Competition> findAllSuccessCheckProject();

	//审核成功
	void pass(Integer id);

	//审核不通过
	void noPass(Integer id, String reason);

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

	//准备数据，查询状态=3（结果录入完毕）所有竞赛项目
	List<Competition> findAllHaveResultProject();

	//查询当前院系申报了那些竞赛
	public List<Competition> findDeCompe(Integer department);

	
	public Department findBynameDepartment(String value);

}
