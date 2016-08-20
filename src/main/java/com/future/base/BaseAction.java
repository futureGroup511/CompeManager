package com.future.base;

import java.lang.reflect.ParameterizedType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.future.service.AdminService;
import com.future.service.AwardHierarchyService;
import com.future.service.AwardRecordService;
import com.future.service.CompetitionNameService;
import com.future.service.CompetitionService;
import com.future.service.DepartmentService;

import com.future.service.SignUpService;
import com.future.service.StudentService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
@Controller
@Scope("prototype")
public abstract class BaseAction<T> extends ActionSupport implements ModelDriven<T>,Preparable{

	private static final long serialVersionUID = 1L;
	protected T model;
	@Autowired
	protected StudentService stuser;
	@Autowired
	protected AdminService adminService;
	@Autowired
	protected CompetitionService competitionService;
	@Autowired
	protected CompetitionService comps;
	@Autowired
	protected CompetitionNameService competitionNameService;
	@Autowired
	protected DepartmentService departmentService;
	@Autowired
	protected AwardRecordService awardRecordService;
	@Autowired
	protected AwardRecordService ars;
	@Autowired
	protected AwardHierarchyService awardHierarchyService;
	@Autowired
	protected SignUpService sups;
	public BaseAction() {
		try {
			ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
			Class clazz = (Class) type.getActualTypeArguments()[0];
			model = (T) clazz.newInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	@Override
	public void prepare() throws Exception {}

	@Override
	public  T getModel(){
		return model;
	};
}
