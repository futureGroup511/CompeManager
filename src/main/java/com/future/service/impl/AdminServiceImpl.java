package com.future.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.AdminDao;
import com.future.domain.Admin;
import com.future.domain.Competition;
import com.future.domain.Department;
import com.future.service.AdminService;
import com.future.utils.PageBean;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {

	@Resource
	private AdminDao adminDao;

	//查看所有待审核项目
	@Override
	public List<Competition> findAllNoCheckProject() {
		//System.out.println("到这里了");
		return adminDao.findAllNoCheckProject();
	}

	//查看审核成功项目
	@Override
	public List<Competition> findAllSuccessCheckProject() {
		return adminDao.findAllSuccessCheckProject();
	}

	//审核成功
	@Override
	public void pass(Integer id) {
		adminDao.pass(id);
	}

	//审核未通过
	@Override
	public void noPass(Integer id) {
		adminDao.noPass(id);
	}

	//查看未通过审核项目
	@Override
	public List<Competition> findNoPassCheck() {
		return adminDao.findNoPassCheck();
	}

	////1、根据id查询到具体某一条数据
	@Override
	public Competition findById(Integer id) {
		return adminDao.findById(id);
	}

	//分页
	@Override
	public PageBean getPageBean(int pageNum, int pageSize) {
		return adminDao.getPageBean(pageNum,pageSize);
	}

	//分页查看所有待审核项目
	@Override
	public PageBean getPageBeanFindAllNoCheckProject(int pageNum, int pageSize) {
		return adminDao.getPageBeanFindAllNoCheckProject(pageNum,pageSize);
	}

	//分页查看未通过审核项目
	@Override
	public PageBean getPageBeanNoPassCheck(int pageNum, int pageSize) {
		return adminDao.getPageBeanNoPassCheck(pageNum,pageSize);
	}

	@Override
	public Admin jugeByNumAndPassword(String num, String password) {
		return adminDao.jugeByNumAndPassword(num, password);

	
	//准备数据，查询状态=3（结果录入完毕）所有竞赛项目
	}
	@Override
	public List<Competition> findAllHaveResultProject() {
		return adminDao.findAllHaveResultProject();
	}

	//查询当前院系申报了那些竞赛
	public List<Competition> findDeCompe(Integer department) {
		return adminDao.findDeCompe(department);
	}

	//查询所有院系
	@Override
	public List<Department> findBynameDepartment() {
		
		return null;
	}

	
}
