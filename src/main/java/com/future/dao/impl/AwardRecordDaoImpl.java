package com.future.dao.impl;


import java.math.BigInteger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.AwardRecordDao;
import com.future.domain.AwardHierarchy;
import com.future.domain.AwardRecord;
import com.future.domain.AwardStandard;
import com.future.domain.Competition;
import com.future.domain.ProjectAwardNum;
import com.future.domain.Student;
import com.future.utils.DeQuery;
import com.future.utils.PageBean;
import com.future.utils.Page_S;

@Repository
public class AwardRecordDaoImpl extends BaseDao implements AwardRecordDao {
	
	@Override
	public Page_S findAwardByStudent(Student s, Page_S ps) {
		Criteria criteria=getsession().createCriteria(AwardRecord.class);
		criteria.add(Restrictions.eq("awardRecor_student", s));
		Long totalnum=(Long)criteria.setProjection(Projections.rowCount()).uniqueResult();
		criteria.setProjection(null);
		criteria.setFirstResult((ps.getCurrentPage()-1)*ps.getPageSize());
		criteria.setMaxResults(ps.getPageSize());
		criteria.addOrder(Order.desc("awardRecor_time"));
		List<AwardRecord> awardRecords=criteria.list();
		Integer num=Integer.valueOf(totalnum.toString());
		Page_S p=new Page_S(ps.getCurrentPage(), ps.getPageSize(),num , awardRecords);
		return p;
	}

	
	/**
	 * 保存获奖记录
	 */
	@Override
	public void saveAwardRecord(AwardRecord awardRecord) {
		getsession().save(awardRecord);
	}
	
	
	//===============================================================
	//调用service查询待审核竞赛结果
	@Override
	public List<AwardRecord> findCheckNoAwardRecord() {
		String hql="from AwardRecord a where a.awardRecor_status = 1";
		return getsession().createQuery(hql).list();
	}

	//查看审核通过竞赛结果
	@Override
	public List<AwardRecord> findCheckSuccessAwardRecord() {
		String hql="from AwardRecord a where a.awardRecor_status = 2";
		return getsession().createQuery(hql).list();
	}

	//查看未通过审核竞赛结果
	@Override
	public List<AwardRecord> findNoPassCheckAwardRecord() {
		String hql="from AwardRecord a where a.awardRecor_status = 3";
		return getsession().createQuery(hql).list();
	}
	
	//分页查看待审核竞赛结果
	@Override
	public PageBean getPageBeanCheckNoAwardRecord(int pageNum, int pageSize) {
		List list = getsession().createQuery("from AwardRecord a where a.awardRecor_status = 1 and awardRecor_picturePath !=''")
				.setFirstResult((pageNum - 1 ) * pageSize)
				.setMaxResults(pageSize)
				.list();
		
		Long count =  (Long) getsession().createQuery("select count (*) from AwardRecord a  where a.awardRecor_status = 1 and awardRecor_picturePath !=''")
				.uniqueResult();
		
		return new PageBean(pageNum, pageSize, count.intValue(), list);
	}

	//分页查看审核通过竞赛结果
	@Override
	public PageBean getPageBeanCheckSuccessAwardRecord(int pageNum, int pageSize) {
		List list = getsession().createQuery("from AwardRecord a where a.awardRecor_status = 2")
				.setFirstResult((pageNum - 1 ) * pageSize)
				.setMaxResults(pageSize)
				.list();
		
		Long count =  (Long) getsession().createQuery("select count (*) from AwardRecord a  where a.awardRecor_status = 2")
				.uniqueResult();
		
		return new PageBean(pageNum, pageSize, count.intValue(), list);
	}

	//分页查看未通过审核竞赛结果
	@Override
	public PageBean getPageBeanNoPassCheckAwardRecord(int pageNum, int pageSize) {
		List list = getsession().createQuery("from AwardRecord a where a.awardRecor_status = 3")
				.setFirstResult((pageNum - 1 ) * pageSize)
				.setMaxResults(pageSize)
				.list();
		
		Long count =  (Long) getsession().createQuery("select count (*) from AwardRecord a  where a.awardRecor_status = 3")
				.uniqueResult();
		
		return new PageBean(pageNum, pageSize, count.intValue(), list);
	}
	
	//分页查询所有获奖记录
	@Override
	public PageBean getPageBeanFindAllAwardRecord(int pageNum, int pageSize) {
		List list = getsession().createQuery("from AwardRecord a where  a.awardRecor_awadHie.awardHie_name not like '%未获奖%'")
				.setFirstResult((pageNum - 1 ) * pageSize)
				.setMaxResults(pageSize)
				.list();
		
		Long count =  (Long) getsession().createQuery("select count (*) from AwardRecord a where a.awardRecor_awadHie.awardHie_name not like '%未获奖%'")
				.uniqueResult();
		
		return new PageBean(pageNum, pageSize, count.intValue(), list);
	}
		

	//通过
	@Override
	public void pass(Integer id) {
		//先根据当前id拿到对象
		AwardRecord awardRecord = findById(id);
		//设置对象的状态为2
		awardRecord.setAwardRecor_status(2);
		//保存
		getsession().save(awardRecord);
	}

	//未通过
	@Override
	public void noPass(Integer id,String reason) {
		//先根据当前id拿到对象
		AwardRecord awardRecord = findById(id);
		//设置对象的状态为3
		awardRecord.setAwardRecor_status(3);
		awardRecord.setAwardRecor_reason(reason);
		//保存
		getsession().save(awardRecord);
	}
	
	

	//条件查询
	@Override
	public List<AwardRecord> conditionQuery(AwardRecord model) {
				
		Criteria criteria=getsession().createCriteria(AwardRecord.class);
		//如果选择了竞赛    默认请选择=0，所以要！=0
		if(model.getAwardRecor_competition().getCompe_id() != 0){
			criteria.add(Restrictions.eq("awardRecor_competition.compe_id", model.getAwardRecor_competition().getCompe_id()));
		}
	
		//如果选择了奖项  默认请选择=0，所以要！=0
		if(model.getAwardRecor_awadHie().getAwardHie_id() != 0){
			if(model.getAwardRecor_awadHie().getAwardHie_id() == 23){
				List list = findAllCountry(23);  
				criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id",list));			
			} else if(model.getAwardRecor_awadHie().getAwardHie_id() == 24){
				List list = findAllCountry(24);  
				criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id",list));
			} else if(model.getAwardRecor_awadHie().getAwardHie_id() == 26){
				List list = findAllCountry(26);  
				criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id",list));
			} else if(model.getAwardRecor_awadHie().getAwardHie_id() == 25){
				List list = findAllCountry(25);  
				criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id",list));
			} else {
				//根据id拿到名称，名且根据名称拿到id
				List list = findByIdTwoId(model.getAwardRecor_awadHie().getAwardHie_id());
				//criteria.add(Restrictions.eq("awardRecor_awadHie.awardHie_id", model.getAwardRecor_awadHie().getAwardHie_id()));
				criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id", list));
			}
		}
		
		if(model.getAwardRecor_time() != null){
			SimpleDateFormat currentFormat = new SimpleDateFormat("yyyy");
			String currentTime = currentFormat.format(model.getAwardRecor_time());
			
			Date date;
			try {
				date = new SimpleDateFormat("yyyy-MM-dd").parse(currentTime +"-12-31");
				criteria.add(Restrictions.between("awardRecor_time", model.getAwardRecor_time(), date));
			} catch (ParseException e) {
				e.printStackTrace();
			} 
		}
		
		//拿到奖项，竞赛项目结果  如果只有两个条件，就返回结果，结果
		
		//List<AwardRecord> awardRecord=criteria.list();
		/*for(AwardRecord obj:awardRecord){
			System.out.println("项目 + 奖项 ：" + obj.getAwardRecor_student().getStu_name());
		}*/
		
		//如果有院系，继续搞
		if(model.getAwardRecor_student().getStu_department().getDe_id() !=0){
			
			Integer departmentId=model.getAwardRecor_student().getStu_department().getDe_id();
			//学院所有获奖记录
			List<AwardRecord> AwardRecordDepartment = findAllDepartmentAward(model.getAwardRecor_student().getStu_department().getDe_id());            
			//for(AwardRecord obj:AwardRecordDepartment){
				//System.out.println("list+++1111" + obj.getAwardRecor_id());
			//}
			//AwardRecordDepartment.retainAll(awardRecord);
			//本来到这结束
			
			//拿到学院所有获奖记录id
			List list = findAllAwardIdForDepartment(model.getAwardRecor_student().getStu_department().getDe_id()); 
			//System.out.println("+++++++++++++" + list);
			if(list!=null && !list.isEmpty()){
				criteria.add(Restrictions.in("awardRecor_id",list));
			} else{
				criteria.add(Restrictions.eq("awardRecor_id",0));
			}
			/*for(AwardRecord obj:AwardRecordDepartment){
				System.out.println("=====>>>>第三次" + obj.getAwardRecor_student().getStu_name());
			}*/
		}
		List<AwardRecord> awardRecord=criteria.list();
		return awardRecord;
	}

	
	

	//拿到学院所有获奖记录id
	private List findAllAwardIdForDepartment(Integer de_id) {//getAwardRecor_student().getStu_department().getDe_id()
		String hql = "select a.awardRecor_id from AwardRecord a where a.awardRecor_student.stu_department.de_id = ?";
		return getsession().createQuery(hql).setParameter(0, de_id).list();
	}

	//根据id拿到当前对象
	private AwardRecord findById(Integer id) {
		String hql = "from AwardRecord a where a.awardRecor_id = ?";
		return (AwardRecord) getsession().createQuery(hql).setParameter(0, id).uniqueResult();
	}

	//查询所有获奖记录
	@Override
	public List<AwardRecord> findAllAwardRecord() {
		String hql="from AwardRecord";
		return getsession().createQuery(hql).list();
	}
	
	//根据id拿到名称，名且根据名称拿到id
	private List findByIdTwoId(Integer awardHie_id) {
		//根据id拿到名称
		String hql = "select a.awardHie_name from AwardHierarchy a where a.awardHie_id = ?";
		String name = (String) getsession().createQuery(hql).setParameter(0, awardHie_id).uniqueResult();
		//System.out.println("=====================" + name);
		//根据名称拿到id
		String hql1 = "select a.awardHie_id from AwardHierarchy a where a.awardHie_name=?";
		//System.out.println(getsession().createQuery(hql1).setParameter(0, name).list());
		
		return getsession().createQuery(hql1).setParameter(0, name).list();
	}

	//二次写学院所有竞赛
	public List<AwardRecord> findAllDepartmentAward(Integer departmentId){
		String hql ="from AwardRecord a where a.awardRecor_student in ("
				+ "from Student awardRecor_student where awardRecor_student.stu_department.de_id = ?)";
		return (List<AwardRecord>) getsession().createQuery(hql).setParameter(0, departmentId).list();
	}

	

	//分页条件查询
	@Override
	public PageBean getPageBeanConditionQuery(int pageNum, int pageSize, AwardRecord model) {

		Criteria criteria=getsession().createCriteria(AwardRecord.class);
		//如果选择了竞赛    默认请选择=0，所以要！=0
		if(model.getAwardRecor_competition().getCompe_id() != 0){
			criteria.add(Restrictions.eq("awardRecor_competition.compe_id", model.getAwardRecor_competition().getCompe_id()));
		}
		
		//criteria.add(Restrictions.not(Exprission.eq(Restrictions.like("awardRecor_awadHie.awardHie_name", "未获奖"))));
		//此处应该写活  得到所有获奖的获奖等级
		List<AwardHierarchy> li = findAwardHie();
/*		for(AwardHierarchy obj:li){
			System.out.println(obj.getAwardHie_id());
		}*/
		criteria.add(Restrictions.in("awardRecor_awadHie", li));
		
		
		//查询国际奖id
		Integer guojiId = findguojiId();
		System.out.println("国际奖励id：" + guojiId);
		//查询全国奖id
		Integer quanguoId = findquanguoId();
		System.out.println("全国奖：" + quanguoId);
		//查询校级奖id
		Integer xiaojiId = findxiaojiId();
		System.out.println("校级奖：" + xiaojiId);
		//查询省级奖id
		Integer shengjiId = findshengjiId();
		System.out.println("省级奖：" + shengjiId);
		
		//如果选择了奖项  默认请选择=0，所以要！=0
		if(model.getAwardRecor_awadHie().getAwardHie_id() != 0){
			//国际奖
			if(model.getAwardRecor_awadHie().getAwardHie_id() == guojiId){
				List list = findAllCountry(23);  
				criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id",list));			
			} else if(model.getAwardRecor_awadHie().getAwardHie_id() == quanguoId){
				List list = findAllCountry(24);  
				criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id",list));
			} else if(model.getAwardRecor_awadHie().getAwardHie_id() == shengjiId){
				List list = findAllCountry(26);  
				criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id",list));
			} else if(model.getAwardRecor_awadHie().getAwardHie_id() == xiaojiId){
				List list = findAllCountry(25);  
				criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id",list));
			} else {
				//根据id拿到名称，名且根据名称拿到id
				List list = findByIdTwoId(model.getAwardRecor_awadHie().getAwardHie_id());
				//criteria.add(Restrictions.eq("awardRecor_awadHie.awardHie_id", model.getAwardRecor_awadHie().getAwardHie_id()));
				criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id", list));
			}
		}
		
		if(model.getAwardRecor_time() != null){
			SimpleDateFormat currentFormat = new SimpleDateFormat("yyyy");
			String currentTime = currentFormat.format(model.getAwardRecor_time());
			
			Date date;
			try {
				date = new SimpleDateFormat("yyyy-MM-dd").parse(currentTime +"-12-31");
				criteria.add(Restrictions.between("awardRecor_time", model.getAwardRecor_time(), date));
			} catch (ParseException e) {
				e.printStackTrace();
			} 
		}
		
		//拿到奖项，竞赛项目结果  如果只有两个条件，就返回结果，结果
		
		//List<AwardRecord> awardRecord=criteria.list();
		/*for(AwardRecord obj:awardRecord){
			System.out.println("项目 + 奖项 ：" + obj.getAwardRecor_student().getStu_name());
		}*/
		
		//如果有院系，继续搞
		if(model.getAwardRecor_student().getStu_department().getDe_id() !=0){
			
			Integer departmentId=model.getAwardRecor_student().getStu_department().getDe_id();
			//学院所有获奖记录
			List<AwardRecord> AwardRecordDepartment = findAllDepartmentAward(model.getAwardRecor_student().getStu_department().getDe_id());            
			//for(AwardRecord obj:AwardRecordDepartment){
				//System.out.println("list+++1111" + obj.getAwardRecor_id());
			//}
			//AwardRecordDepartment.retainAll(awardRecord);
			//本来到这结束
			
			//拿到学院所有获奖记录id
			List list = findAllAwardIdForDepartment(model.getAwardRecor_student().getStu_department().getDe_id()); 
			//System.out.println("+++++++++++++" + list);
			if(list!=null && !list.isEmpty()){
				criteria.add(Restrictions.in("awardRecor_id",list));
			} else{
				criteria.add(Restrictions.eq("awardRecor_id",0));
			}
			/*for(AwardRecord obj:AwardRecordDepartment){
				System.out.println("=====>>>>第三次" + obj.getAwardRecor_student().getStu_name());
			}*/
		}
		
		//criteria.setFirstResult((pageBean.getCurrentPage()-1)*pageBean.getPageSize());  
	    //criteria.setMaxResults(pageBean.getPageSize());
		
		
		criteria.setFirstResult((pageNum - 1) * pageSize); 
		criteria.setMaxResults(pageSize);
		
		//int count1 = ((Number)criteria.uniqueResult()).intValue();
		//Long count = new Long((long)count1);
		
		List<AwardRecord> awardRecord=criteria.list();
		/*for(AwardRecord obj:awardRecord){
			System.out.println(obj.getAwardRecor_id());
		}*/
		
		criteria.setProjection(Projections.rowCount());
		Long count1 = (Long)criteria.uniqueResult();
		
		//此方法是临时解决办法，条件第二次分页查询出现count1为null的错误
		if(count1==null){
			criteria=getsession().createCriteria(AwardRecord.class);
			//如果选择了竞赛    默认请选择=0，所以要！=0
			if(model.getAwardRecor_competition().getCompe_id() != 0){
				criteria.add(Restrictions.eq("awardRecor_competition.compe_id", model.getAwardRecor_competition().getCompe_id()));
			}
			
			List<AwardHierarchy> li1 = findAwardHie();
			criteria.add(Restrictions.in("awardRecor_awadHie", li1));
					
			//如果选择了奖项  默认请选择=0，所以要！=0
			if(model.getAwardRecor_awadHie().getAwardHie_id() != 0){
				if(model.getAwardRecor_awadHie().getAwardHie_id() == guojiId){
					List list = findAllCountry(23);  
					criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id",list));			
				} else if(model.getAwardRecor_awadHie().getAwardHie_id() == quanguoId){
					List list = findAllCountry(24);  
					criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id",list));
				} else if(model.getAwardRecor_awadHie().getAwardHie_id() == shengjiId){
					List list = findAllCountry(26);  
					criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id",list));
				} else if(model.getAwardRecor_awadHie().getAwardHie_id() == xiaojiId){
					List list = findAllCountry(25);  
					criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id",list));
				} else {
					//根据id拿到名称，名且根据名称拿到id
					List list = findByIdTwoId(model.getAwardRecor_awadHie().getAwardHie_id());
					//criteria.add(Restrictions.eq("awardRecor_awadHie.awardHie_id", model.getAwardRecor_awadHie().getAwardHie_id()));
					criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id", list));
				}
			}
			
			if(model.getAwardRecor_time() != null){
				SimpleDateFormat currentFormat = new SimpleDateFormat("yyyy");
				String currentTime = currentFormat.format(model.getAwardRecor_time());				
				Date date;
				try {
					date = new SimpleDateFormat("yyyy-MM-dd").parse(currentTime +"-12-31");
					criteria.add(Restrictions.between("awardRecor_time", model.getAwardRecor_time(), date));
				} catch (ParseException e) {
					e.printStackTrace();
				} 
			}
			//如果有院系，继续搞
			if(model.getAwardRecor_student().getStu_department().getDe_id() !=0){
				Integer departmentId=model.getAwardRecor_student().getStu_department().getDe_id();
				//学院所有获奖记录
				List<AwardRecord> AwardRecordDepartment = findAllDepartmentAward(model.getAwardRecor_student().getStu_department().getDe_id());
				
				//拿到学院所有获奖记录id
				List list = findAllAwardIdForDepartment(model.getAwardRecor_student().getStu_department().getDe_id()); 
				//System.out.println("+++++++++++++" + list);
				if(list!=null && !list.isEmpty()){
					criteria.add(Restrictions.in("awardRecor_id",list));
				} else{
					criteria.add(Restrictions.eq("awardRecor_id",0));
				}
			}
			criteria.setProjection(Projections.rowCount());
			count1 = (Long)criteria.uniqueResult();
			//System.out.println("==================" + count1);
		}
		//System.out.println("------------" + count1);
		return new PageBean(pageNum, pageSize, count1.intValue(),awardRecord);
	}
	
	//此处应该写活  得到所有获奖的获奖等级
	private List<AwardHierarchy> findAwardHie() {
		String hql = "from AwardHierarchy a where a.awardHie_name not like '%未获奖%'" ;
		//System.out.println("我要输出~~~~");
		List<AwardHierarchy> list = getsession().createQuery(hql).list();
		return list;
	}


	//查询省级奖id
	private Integer findshengjiId() {
		String hql = "select a.awardHie_id from AwardHierarchy a where a.awardHie_name like :name";
		return (Integer) getsession().createQuery(hql).setParameter("name", "%" + "省级奖" + "%").uniqueResult();
	}

	//查询校级奖id
	private Integer findxiaojiId() {
		String hql = "select a.awardHie_id from AwardHierarchy a where a.awardHie_name like :name";
		return (Integer) getsession().createQuery(hql).setParameter("name", "%" + "校级奖" + "%").uniqueResult();
	}

	//查询国际奖id
	private Integer findguojiId() {
		String hql = "select a.awardHie_id from AwardHierarchy a where a.awardHie_name like :name";
		return (Integer) getsession().createQuery(hql).setParameter("name", "%" + "国际奖" + "%").uniqueResult();
	}
	
	//查询全国奖id
	private Integer findquanguoId() {
		String hql = "select a.awardHie_id from AwardHierarchy a where a.awardHie_name like :name";
		return (Integer) getsession().createQuery(hql).setParameter("name", "%" + "全国奖" + "%").uniqueResult();
	}
	
	//根据id全国奖找到 全国开头的奖项
	public List findAllCountry(Integer id){
		if(id == 23 ){
			String hql = "select a.awardHie_id from AwardHierarchy a where a.awardHie_name like :name";
			return getsession().createQuery(hql).setParameter("name", "%" + "国际" + "%").list();
		} else if(id == 24){
			String hql = "select a.awardHie_id from AwardHierarchy a where a.awardHie_name like :name";
			return getsession().createQuery(hql).setParameter("name", "%" + "国家" + "%").list();
		} else if(id == 26){
			String hql = "select a.awardHie_id from AwardHierarchy a where a.awardHie_name like :name";
			return getsession().createQuery(hql).setParameter("name", "%" + "省" + "%").list();
		} else if(id == 25){
			String hql = "select a.awardHie_id from AwardHierarchy a where a.awardHie_name like :name";
			return getsession().createQuery(hql).setParameter("name", "%" + "校级" + "%").list();
		}
		return null;
	}
	
	

	@Override
	public AwardRecord findAwardRecordById(Integer id) {
		String hql="From AwardRecord a where a.awardRecor_id=?";
		AwardRecord ar=(AwardRecord) getsession().createQuery(hql).setInteger(0, id).uniqueResult();
		return ar;
	}

	@Override
	public void saveOrUpdaAward(AwardRecord ar) {
		getsession().saveOrUpdate(ar);
	}

	//分页查询当前院系所有获奖记录
	@Override
	public PageBean getPageBeanDefindAllAwardRecord(int pageNum, int pageSize, Integer department) {
		List list = (List) getsession().createQuery("from AwardRecord a where a.awardRecor_student.stu_department.de_id = ? and a.awardRecor_awadHie.awardHie_name not like '%未获奖%'")
				.setFirstResult((pageNum - 1 ) * pageSize)
				.setMaxResults(pageSize)
				.setParameter(0, department)
				.list();
		
		Long count =  (Long) getsession().createQuery("select count (*) from AwardRecord a where a.awardRecor_student.stu_department.de_id = ? and a.awardRecor_awadHie.awardHie_name not like '%未获奖%'")
				.setParameter(0, department)
				.uniqueResult();
		
		return new PageBean(pageNum, pageSize, count.intValue(), list);
	}

	private void list() {
		// TODO Auto-generated method stub
		
	}
	
	//分页院系条件查询  ly
	@Override
	public PageBean getPageBeanDeConditionQuery(int pageNum, int pageSize, DeQuery model, Integer department) {
		//System.out.println("model===" + model.getYear());
		//System.out.println("model===" + model.getAward());
		//System.out.println("model===" + model.getCompetiton());
		//System.out.println("model===" + department);
		Criteria criteria=getsession().createCriteria(AwardRecord.class);
		
		if(model.getCompetiton() != 0){
			criteria.add(Restrictions.eq("awardRecor_competition.compe_id", model.getCompetiton()));
		}
		
		//去除未获奖学生名单
		List<AwardHierarchy> li = findAwardHie();
		criteria.add(Restrictions.in("awardRecor_awadHie", li));
		
		//查询国际奖id
		Integer guojiId = findguojiId();
		System.out.println("国际奖励id：" + guojiId);
		//查询全国奖id
		Integer quanguoId = findquanguoId();
		System.out.println("全国奖：" + quanguoId);
		//查询校级奖id
		Integer xiaojiId = findxiaojiId();
		System.out.println("校级奖：" + xiaojiId);
		//查询省级奖id
		Integer shengjiId = findshengjiId();
		System.out.println("省级奖：" + shengjiId);
		
		//如果选择了奖项  默认请选择=0，所以要！=0
		if(model.getAward() != 0){
			//国际奖
			if(model.getAward() == guojiId){
				List list = findAllCountry(23);  
				criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id",list));			
			} else if(model.getAward() == quanguoId){
				List list = findAllCountry(24);  
				criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id",list));
			} else if(model.getAward() == shengjiId){
				List list = findAllCountry(26);  
				criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id",list));
			} else if(model.getAward() == xiaojiId){
				List list = findAllCountry(25);  
				criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id",list));
			} else {
				//根据id拿到名称，名且根据名称拿到id
				List list = findByIdTwoId(model.getAward());
				//criteria.add(Restrictions.eq("awardRecor_awadHie.awardHie_id", model.getAwardRecor_awadHie().getAwardHie_id()));
				criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id", list));
			}
		}
		
		//年度
		if(Integer.parseInt(model.getYear()) != 0){
			try {
				//System.out.println("ZZZZZZZZZ" + model.getYear());
				Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(model.getYear() + "-01-01");
				//System.out.println("11111111" + date1);
				Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse(model.getYear() + "-12-31");
				System.out.println(date2);
				criteria.add(Restrictions.between("awardRecor_time", date1, date2));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		List list = findAllAwardIdForDepartment(department); 
		if(list!=null && !list.isEmpty()){
			criteria.add(Restrictions.in("awardRecor_id",list));
		} else{
			criteria.add(Restrictions.eq("awardRecor_id",0));
		}
		criteria.setFirstResult((pageNum - 1) * pageSize); 
		criteria.setMaxResults(pageSize);
		List<AwardRecord> awardRecord=criteria.list();
		criteria.setProjection(Projections.rowCount());
		Long count1 = (Long)criteria.uniqueResult();
		
		//此方法是临时解决办法，条件第二次分页查询出现count1为null的错误
		if(count1==null){
			criteria=getsession().createCriteria(AwardRecord.class);
			//如果选择了竞赛    默认请选择=0，所以要！=0
			if(model.getCompetiton() != 0){
				criteria.add(Restrictions.eq("awardRecor_competition.compe_id", model.getCompetiton()));
			}
			
			//去除未获奖学生名单
			List<AwardHierarchy> li1 = findAwardHie();
			criteria.add(Restrictions.in("awardRecor_awadHie", li1));
			
			//如果选择了奖项  默认请选择=0，所以要！=0
			if(model.getAward() != 0){
				//国际奖
				if(model.getAward() == guojiId){
					List list1 = findAllCountry(23);  
					criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id",list1));			
				} else if(model.getAward() == quanguoId){
					List list1 = findAllCountry(24);  
					criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id",list1));
				} else if(model.getAward() == shengjiId){
					List list1 = findAllCountry(26);  
					criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id",list1));
				} else if(model.getAward() == xiaojiId){
					List list1 = findAllCountry(25);  
					criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id",list1));
				} else {
					//根据id拿到名称，名且根据名称拿到id
					List list1 = findByIdTwoId(model.getAward());
					//criteria.add(Restrictions.eq("awardRecor_awadHie.awardHie_id", model.getAwardRecor_awadHie().getAwardHie_id()));
					criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id", list1));
				}
			}
			
			//年度
			if(Integer.parseInt(model.getYear()) != 0){
				try {
					//System.out.println("ZZZZZZZZZ" + model.getYear());
					Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(model.getYear() + "-01-01");
					//System.out.println("11111111" + date1);
					Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse(model.getYear() + "-12-31");
					System.out.println(date2);
					criteria.add(Restrictions.between("awardRecor_time", date1, date2));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			
			List list2 = findAllAwardIdForDepartment(department); 
			if(list!=null && !list.isEmpty()){
				criteria.add(Restrictions.in("awardRecor_id",list2));
			} else{
				criteria.add(Restrictions.eq("awardRecor_id",0));
			}
			
			
			criteria.setProjection(Projections.rowCount());
			count1 = (Long)criteria.uniqueResult();
			System.out.println("++++++++++++++++++++" + count1);
		}
		
		
		
		
		
		
		return new PageBean(pageNum, pageSize, count1.intValue(),awardRecord);
		//return new PageBean(pageNum, pageSize, 300,awardRecord);
	}

	//让保存成绩的进行调用
	//默认提交最高的奖金
		public void beCalled(){
			
			
			String sql = "from Competition compe where compe.compe_requestDate >= YEAR(NOW()) and compe.compe_status = 2 and NOW()>= compe.compe_endTime";
			List<Competition> compeList = getsession().createQuery(sql)
														.list();
			
			/**
			 * 之前的时候进行查询所有的该竞赛的报名通过的是不是已经全部都录完成绩
			 */
			String sqlStr = "from SignUp signUp where signUp.signUp_status = 2 and signUp.signUp_competition.compe_id=:compeId and signUp.signUp_registerRecord = 0";
			for(int i=0;i<compeList.size();i++){
				Competition compe = compeList.get(i);											
				List list = getsession().createQuery(sqlStr).setParameter("compeId", compe.getCompe_id()).list();
				if(list.isEmpty() || list.size() == 0){
					compeList.remove(i);
					/*String sqlStr01 = "update Competition compe set compe.compe_status = 3 where compe.compe_id = :compeId";
					getsession().createQuery(sqlStr01)
									.setParameter("compeId", compe.getCompe_id())
										.executeUpdate();*/
					
					/**
					 * 成绩录完之后，默认提交该学生的最高的奖励
					 */
					String sqlstr02 = "from AwardRecord awardRecord where awardRecord.awardRecor_competition.compe_id = :compeId";//得到对应的
					List<AwardRecord> awardList = getsession().createQuery(sqlstr02).setParameter("compeId", compe.getCompe_id())
																						.list();
					Set<Integer> stuIdSet = new HashSet<Integer>();
					for(AwardRecord awardRecord : awardList){
						stuIdSet.add(awardRecord.getAwardRecor_student().getStu_id());
					}
					
					for(Integer stuId : stuIdSet){
						Integer compeId = compe.getCompe_id();
						
						//更新该学生的该项目的获奖记录为已经获得其他获奖记录
						String sqlStr03 = "update AwardRecord awardRecord set awardRecord.awardRecor_status = 4  where awardRecord.awardRecor_competition.compe_id = :compeId and awardRecord.awardRecor_student.stu_id = :stuId";
						getsession().createQuery(sqlStr03).setParameter("compeId", compeId)
																.setParameter("stuId", stuId)
																	.executeUpdate();
						//得到记录中 获奖等级id最小的那个
						String sqlStr04 = "from AwardRecord awardRecord where awardRecord.awardRecor_competition.compe_id = :compeId and awardRecord.awardRecor_student.stu_id = :stuId";
						List<AwardRecord> awardRecordList = getsession().createQuery(sqlStr04).setParameter("compeId", compeId)
																									.setParameter("stuId", stuId)
																										.list();
						Integer minHieId = awardRecordList.get(0).getAwardRecor_awadHie().getAwardHie_id();
						for(AwardRecord record : awardRecordList){
							Integer hieId = record.getAwardRecor_awadHie().getAwardHie_id();
							if(hieId <= minHieId){
								minHieId = hieId;
							}
						}
						//更新该项目该学生中获奖记录的获奖级别最高的提交给教务处负责人 奖励级别 的id 最小的那个奖励记录
						String sqlStr05 = "update AwardRecord awardRecord set awardRecord.awardRecor_status = 1 where awardRecord.awardRecor_awadHie.awardHie_id = :minHieId and awardRecord.awardRecor_competition.compe_id = :compeId and awardRecord.awardRecor_student.stu_id = :stuId";
						getsession().createQuery(sqlStr05)
										.setParameter("minHieId", minHieId)
										.setParameter("compeId", compeId)
										.setParameter("stuId", stuId)
										.executeUpdate();
						//TODO zhaoshuo
						
					}
				}
			}
		}

		//分页查询当前院系申报项目的所有获奖记录  
		@Override
		public PageBean getPageBeanFindAllDeCoAwardRecord(int pageNum, int pageSize, Integer department) {
			//拿到当前部门id申请的竞赛项目id
			List compeId = findByDeCompetition(department);
			//查询所有记录时家条件竞赛项目属于第一步拿到的竞赛项目id
			String hql = "from AwardRecord a where a.awardRecor_competition.compe_id in ("
					+ "select c.compe_id from Competition c where c.compe_department.de_id = :department"
					+ ") and a.awardRecor_awadHie.awardHie_name not like '%未获奖%'";
			List<AwardRecord> awardRecord = getsession().createQuery(hql)
					.setFirstResult((pageNum - 1 ) * pageSize)
					.setMaxResults(pageSize)
					.setParameter("department", department).list();
			
			Long count =  (Long) getsession().createQuery("select count (*) from AwardRecord a where a.awardRecor_competition.compe_id in ("
					+ "select c.compe_id from Competition c where c.compe_department.de_id = :department) and a.awardRecor_awadHie.awardHie_name not like '%未获奖%'")
					.setParameter("department", department)
					.uniqueResult();
		
			
			return new PageBean(pageNum,pageSize,count.intValue(),awardRecord);
		}
		
		//拿到当前部门id申请的竞赛项目id
		private List findByDeCompetition(Integer department) {
			String hql = "select c.compe_id from Competition c where c.compe_department.de_id = :department";
			return getsession().createQuery(hql).setParameter("department", department).list();
		}
		//学院负责人查看本院申请项目获奖情况
		@Override
		public PageBean getPageBeanfindAllDeCoAcCond(int pageNum, int pageSize, DeQuery model, Integer department) {
			Criteria criteria = getsession().createCriteria(AwardRecord.class);
			//首先添加第一个默认条件，所有记录都是本院系申请项目的
			List list = findAllDeCom(department);
			criteria.add(Restrictions.in("awardRecor_competition.compe_id", list));
			
			List<AwardHierarchy> li = findAwardHie();
			criteria.add(Restrictions.in("awardRecor_awadHie", li));
			
			//添加第一个条件  竞赛项目
			if(model.getCompetiton() != 0){
				criteria.add(Restrictions.eq("awardRecor_competition.compe_id", model.getCompetiton()));
			}
			
			//添加第二个条件 奖项
			//查询国际奖id
			Integer guojiId = findguojiId();
			System.out.println("国际奖励id：" + guojiId);
			//查询全国奖id
			Integer quanguoId = findquanguoId();
			System.out.println("全国奖：" + quanguoId);
			//查询校级奖id
			Integer xiaojiId = findxiaojiId();
			System.out.println("校级奖：" + xiaojiId);
			//查询省级奖id
			Integer shengjiId = findshengjiId();
			System.out.println("省级奖：" + shengjiId);
			
			//如果选择了奖项  默认请选择=0，所以要！=0
			if(model.getAward() != 0){
				//国际奖
				if(model.getAward() == guojiId){
					List list1 = findAllCountry(23);  
					criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id",list1));			
				} else if(model.getAward() == quanguoId){
					List list1 = findAllCountry(24);  
					criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id",list1));
				} else if(model.getAward() == shengjiId){
					List list1 = findAllCountry(26);  
					criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id",list1));
				} else if(model.getAward() == xiaojiId){
					List list1 = findAllCountry(25);  
					criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id",list1));
				} else {
					//根据id拿到名称，名且根据名称拿到id
					List list1 = findByIdTwoId(model.getAward());
					//criteria.add(Restrictions.eq("awardRecor_awadHie.awardHie_id", model.getAwardRecor_awadHie().getAwardHie_id()));
					criteria.add(Restrictions.in("awardRecor_awadHie.awardHie_id", list1));
				}
			}
			
			//添加第三个条件 年度
			//年度
			if(Integer.parseInt(model.getYear()) != 0){
				try {
					//System.out.println("ZZZZZZZZZ" + model.getYear());
					Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(model.getYear() + "-01-01");
					//System.out.println("11111111" + date1);
					Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse(model.getYear() + "-12-31");
					System.out.println(date2);
					criteria.add(Restrictions.between("awardRecor_time", date1, date2));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			
			//添加分页条件，执行查询
			criteria.setFirstResult((pageNum - 1) * pageSize); 
			criteria.setMaxResults(pageSize);
			List<AwardRecord> awardRecord=criteria.list();
			criteria.setProjection(Projections.rowCount());
			Long count1 = (Long)criteria.uniqueResult();
			
			//此方法是临时解决办法，条件第二次分页查询出现count1为null的错误
			if(count1==null){
				Criteria criteria1 = getsession().createCriteria(AwardRecord.class);
				//首先添加第一个默认条件，所有记录都是本院系申请项目的
				List list1 = findAllDeCom(department);
				criteria1.add(Restrictions.in("awardRecor_competition.compe_id", list1));
				//添加未获奖  把未获奖名单弄掉
				List<AwardHierarchy> li1 = findAwardHie();
				criteria.add(Restrictions.in("awardRecor_awadHie", li1));
				
				//添加第一个条件  竞赛项目
				if(model.getCompetiton() != 0){
					criteria1.add(Restrictions.eq("awardRecor_competition.compe_id", model.getCompetiton()));
				}
				
				//如果选择了奖项  默认请选择=0，所以要！=0
				if(model.getAward() != 0){
					//国际奖
					if(model.getAward() == guojiId){
						List list111 = findAllCountry(23);  
						criteria1.add(Restrictions.in("awardRecor_awadHie.awardHie_id",list111));			
					} else if(model.getAward() == quanguoId){
						List list11 = findAllCountry(24);  
						criteria1.add(Restrictions.in("awardRecor_awadHie.awardHie_id",list11));
					} else if(model.getAward() == shengjiId){
						List list11 = findAllCountry(26);  
						criteria1.add(Restrictions.in("awardRecor_awadHie.awardHie_id",list11));
					} else if(model.getAward() == xiaojiId){
						List list11 = findAllCountry(25);  
						criteria1.add(Restrictions.in("awardRecor_awadHie.awardHie_id",list11));
					} else {
						//根据id拿到名称，名且根据名称拿到id
						List list11 = findByIdTwoId(model.getAward());
						//criteria.add(Restrictions.eq("awardRecor_awadHie.awardHie_id", model.getAwardRecor_awadHie().getAwardHie_id()));
						criteria1.add(Restrictions.in("awardRecor_awadHie.awardHie_id", list11));
					}
				}
				
				//添加第三个条件 年度
				//年度
				if(Integer.parseInt(model.getYear()) != 0){
					try {
						//System.out.println("ZZZZZZZZZ" + model.getYear());
						Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(model.getYear() + "-01-01");
						//System.out.println("11111111" + date1);
						Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse(model.getYear() + "-12-31");
						System.out.println(date2);
						criteria1.add(Restrictions.between("awardRecor_time", date1, date2));
					} catch (ParseException e) {
						e.printStackTrace();
					}
				}
				
				criteria1.setProjection(Projections.rowCount());
				count1 = (Long)criteria1.uniqueResult();
				System.out.println("++++++++++++++++++++" + count1);
			
			}
			
			
			return new PageBean(pageNum, pageSize, count1.intValue(),awardRecord);
		}

		//首先添加第一个条件，所有记录都是本院系申请项目的
		private List findAllDeCom(Integer department) {
			String hql ="select c.compe_id from Competition c where c.compe_department.de_id = :department";
			return (List) getsession().createQuery(hql).setParameter("department", department).list();
		}

		//拿到所有记录当前登陆学院负责人session 的院系 的所有竞赛项目 的获奖记录
		@Override
		public List<AwardRecord> getAllAlert(Integer depId) {
			String hql = "from AwardRecord a where a.awardRecor_competition.compe_id in(select c.compe_id from Competition c where c.compe_department.de_id = ?)";
			//String hql = "from AwardRecord a where a.awardRecor_competition.compe_id = 1";
			
			return (List<AwardRecord>)getsession().createQuery(hql).setParameter(0, depId).list();
		}

		//拿到所有记录当前登陆学院负责人session 的院系 的所有竞赛项目 的获奖记录
		@Override
		public PageBean getPageBeanAllAlert(int pageNum, int pageSize, Integer depId) {
			
			//String hql = "from AwardRecord a where a.awardRecor_competition.compe_id in(select c.compe_id from Competition c where c.compe_department.de_id = ?) order by awardRecor_picturePath";
			//String hql = "from AwardRecord a where a.awardRecor_competition.compe_id in(select c.compe_id from Competition c where c.compe_department.de_id = ?) order by awardRecor_competition_compe_id";
			String hql = "from AwardRecord a where a.awardRecor_competition.compe_id in(select c.compe_id from Competition c where c.compe_department.de_id = ?) and a.awardRecor_unit =null or a.awardRecor_unit ='' order by awardRecor_competition_compe_id";
			
			List<AwardRecord> awardRecord = getsession().createQuery(hql).setFirstResult((pageNum - 1 ) * pageSize).setMaxResults(pageSize).setParameter(0, depId).list();

			
			Long count =  (Long) getsession().createQuery("select count (*) from AwardRecord a "
					+ "where a.awardRecor_competition.compe_id in(select c.compe_id from Competition "
					+ "c where c.compe_department.de_id = ?) and a.awardRecor_unit =null")
					.setParameter(0, depId).uniqueResult();
		
			return new PageBean(pageNum,pageSize,count.intValue(),awardRecord);
		}

		//根据id得到某条获奖记录
		@Override
		public AwardRecord getById(Integer id) {
			String hql = "from AwardRecord a where a.awardRecor_id = ?";
			AwardRecord awardRecord = (AwardRecord) getsession().createQuery(hql).setParameter(0, id).uniqueResult();
			return awardRecord;
		}

		//调用方法，保存  liuyang
		@Override
		public  void saveAwardRecordLY(AwardRecord model) {
			System.out.println("获奖等级:"+ model.getAwardRecor_awadHie().getAwardHie_id());
			System.out.println("获奖时间:"+model.getAwardRecor_time());
			System.out.println("获奖单位:"+model.getAwardRecor_unit());
			
			//得到获奖等级id
			Integer huojiangdengji = model.getAwardRecor_awadHie().getAwardHie_id();
			//查询id获奖等级
			AwardHierarchy awardHierarchy = findByIdAwardHie(huojiangdengji);
			
			AwardStandard awardStandard = findByIdAwardStan(awardHierarchy.getAwardHie_standard().getAward_id());
			System.out.println("调用方法查询:" + awardStandard.getAward_stuMoney());
			System.out.println("调用方法查询:" + awardStandard.getAward_teaMoney());
			
			System.out.println("===================");
			AwardRecord awardRecord = findById(model.getAwardRecor_id());
			awardRecord.setAwardRecor_awadHie(awardHierarchy);
			awardRecord.setAwardRecor_stuMoney(awardStandard.getAward_stuMoney());
			awardRecord.setAwardRecor_teaMoney(awardStandard.getAward_teaMoney());
			awardRecord.setAwardRecor_score(model.getAwardRecor_score());
			awardRecord.setAwardRecor_time(model.getAwardRecor_time());
			awardRecord.setAwardRecor_unit(model.getAwardRecor_unit());
			//如果修改过的获奖记录，获奖单位为无，则直接改变状态
			System.out.println(model.getAwardRecor_unit());
			if(model.getAwardRecor_unit().equals("无")){
				System.out.println("本条记录没有获奖");
				awardRecord.setAwardRecor_status(2);
			}
			
			getsession().save(awardRecord);
			
		}
		
		//获取奖励等级
		public AwardHierarchy findByIdAwardHie(Integer huojiangdengji){
			String hql = "from AwardHierarchy where awardHie_id = ?";
			return (AwardHierarchy) getsession().createQuery(hql).setParameter(0, huojiangdengji).uniqueResult();
		}
		//获取奖励标准
		public AwardStandard findByIdAwardStan(Integer id){
			String hql="from AwardStandard where award_id = ?";
			return (AwardStandard) getsession().createQuery(hql).setParameter(0, id).uniqueResult();
		}
		
		//得到项目总 各级奖励获取的人数，返回各个项目的汇总报告 excel
		@Override
		public List<ProjectAwardNum> getProjectAwardNum() {
			List<ProjectAwardNum> awardNumList = new ArrayList<ProjectAwardNum>();
			List<Integer> compeIds = getAllAwardCompeIds();
			ProjectAwardNum projectAwardNum = null;
			//国际
			 Integer internationFirstPrizeNum;
			 Integer internationSecondPrizeNum;
			 Integer internationThirdPrizeNum;
			//国家
			 Integer countryFirstPrizeNum;
			 Integer countrySecondPrizeNum;
			 Integer countryThirdPrizeNum;
			//省级
			 Integer provinceFirstPrizeNum;
			 Integer provinceSecondPrizeNum;
			 Integer provinceThirdPrizeNum;
			//校级
			 Integer schoolFirstPrizeNum;
			 Integer schoolSecondPrizeNum;
			 Integer schoolThirdPrizeNum;
			
			for(int i=0;i<compeIds.size();i++){
				
				projectAwardNum = new ProjectAwardNum();
				Integer compeId = compeIds.get(i);
				String compeDescr = getCompeNameAndDate(compeId);
				projectAwardNum.setProjectName(compeDescr);
				
				//国际一等奖 1 2
				internationFirstPrizeNum = getSpecialHieAndCompeProjectNum(compeId, 1, 2);
				//国际二等奖3 4
				internationSecondPrizeNum  = getSpecialHieAndCompeProjectNum(compeId, 3, 4);
				//国际三等奖7 8
				internationThirdPrizeNum  = getSpecialHieAndCompeProjectNum(compeId, 7, 8);
				
				projectAwardNum.setInternationFirstPrizeNum(internationFirstPrizeNum);
				projectAwardNum.setInternationSecondPrizeNum(internationSecondPrizeNum);
				projectAwardNum.setInternationThirdPrizeNum(internationThirdPrizeNum);
				
				
				
				//国家一等奖5 6
				countryFirstPrizeNum = getSpecialHieAndCompeProjectNum(compeId, 5, 6);
				//国家二等奖9 10
				countrySecondPrizeNum  = getSpecialHieAndCompeProjectNum(compeId, 9, 10);
				//国家三等奖11 12
				countryThirdPrizeNum  = getSpecialHieAndCompeProjectNum(compeId, 11, 12);
				
				
				projectAwardNum.setCountryFirstPrizeNum(countryFirstPrizeNum);
				projectAwardNum.setCountrySecondPrizeNum(countrySecondPrizeNum);
				projectAwardNum.setCountryThirdPrizeNum(countryThirdPrizeNum);
				//省级一等奖13 14
				provinceFirstPrizeNum  = getSpecialHieAndCompeProjectNum(compeId, 13, 14);
				//省级二等奖 15 16
				provinceSecondPrizeNum = getSpecialHieAndCompeProjectNum(compeId, 15, 16);
				//省级三等奖19 20
				provinceThirdPrizeNum = getSpecialHieAndCompeProjectNum(compeId, 19, 20);
				
				projectAwardNum.setProvinceFirstPrizeNum(provinceFirstPrizeNum);
				projectAwardNum.setProvinceSecondPrizeNum(provinceSecondPrizeNum);
				projectAwardNum.setProvinceThirdPrizeNum(provinceThirdPrizeNum);
				
				//校级一等奖17 18
				schoolFirstPrizeNum = getSpecialHieAndCompeProjectNum(compeId, 17, 18);
				//校级二等奖21 22
				schoolSecondPrizeNum = getSpecialHieAndCompeProjectNum(compeId, 21, 22);
				//校级三等奖 暂无
				//schoolThirdPrizeNum = getSpecialHieAndCompeProjectNum(compeId, hieId1, hieId2);
				
				projectAwardNum.setSchoolFirstPrizeNum(schoolFirstPrizeNum);
				projectAwardNum.setSchoolSecondPrizeNum(schoolSecondPrizeNum);
				//默认为0 处理
				projectAwardNum.setSchoolThirdPrizeNum(0);
				awardNumList.add(projectAwardNum);
			}
			return awardNumList;
		}
		//得到指定竞赛的名字和申请日期  的简要描述
		private String getCompeNameAndDate(Integer compeId){
			String sql = "select CONCAT(DATE_FORMAT(compe.compe_requestDate,'%Y年%m月%d号'),'申请的',compename.compeName_name) competitionDescr from cm_competitions compe inner join cm_competitionnames compename ON compe.compe_compeName_compeName_id = compename.compeName_id where compe.compe_id=:compeId";
			String compeDescr = getsession().createSQLQuery(sql).setParameter("compeId", compeId).uniqueResult().toString();
			return compeDescr;
		}
		
		
		private Integer getSpecialHieAndCompeProjectNum(Integer compeId, Integer hieId1, Integer hieId2){
			String sql = "select count(*) from cm_awardrecords where awardRecor_competition_compe_id = :compeId and awardRecor_awadHie_awardHie_id = :hieId1 or awardRecor_awadHie_awardHie_id = :hieId2";
			return ((Number)getsession().createSQLQuery(sql).setParameter("compeId", compeId).setParameter("hieId1", hieId1).setParameter("hieId2", hieId2).uniqueResult()).intValue();
		}

		private List<Integer> getAllAwardCompeIds() {
			String sql = "select distinct awardRecor_competition_compe_id from cm_awardrecords";
			getsession().createSQLQuery(sql).list();
			return getsession().createSQLQuery(sql).list();
		}


		@Override
		public Integer getNumByname(String name) {
			String hql="select count(*) from AwardRecord ar where ar.awardRecor_picturePath IS NOT NULL and ar.awardRecor_team= ?";
			Integer number=((Long) getsession().createQuery(hql).setParameter(0, name).iterate().next()).intValue();
			return number;
		}


		//查询所有待审核竞赛
		//首先拿到待审核竞赛所有竞赛，         竞赛里的值然后再去拿获奖记录，获奖记录等于1代表未审核
		@Override
		public List<AwardRecord> findAllNoCheckoutCompe() {
			// TODO Auto-generated method stub
			String hql = "from AwardRecord a where a.awardRecor_status = 1 group by awardRecor_competition.compe_id ";
			List<AwardRecord> a = getsession().createQuery(hql).list();
			
			
			for(AwardRecord obj:a){
				System.out.println(obj.getAwardRecor_id());
			}
			return a;
		}


		//根据竞赛id查到所有得比赛记录，并且遍历，如果软布都有获奖单位就返回，如果没有就舍弃
		@Override
		public PageBean byCompeFindAward(Integer pageNum, int pageSize, Integer id) {
			//String hql = "from AwardRecord a where a.awardRecor_competition.compe_id = ? and a.awardRecor_status = 1";
			String hql = "from AwardRecord a where a.awardRecor_competition.compe_id = ? and a.awardRecor_status = 1 and a.awardRecor_awadHie.awardHie_name not like '%未获奖%'";
			List<AwardRecord> awardRecord = getsession().createQuery(hql).setParameter(0, id)
					.setFirstResult((pageNum - 1 ) * pageSize)
					.setMaxResults(pageSize)
					.list(); 
			
			Long count =  (Long) getsession().createQuery("select count (*) from AwardRecord a where a.awardRecor_competition.compe_id = ? and a.awardRecor_status = 1 and a.awardRecor_awadHie.awardHie_name not like '%未获奖%'")
					.setParameter(0, id).uniqueResult();
			
			for(AwardRecord obj:awardRecord){
				System.out.println(obj.getAwardRecor_coachTeacher() + obj.getAwardRecor_unit());;
				if(obj.getAwardRecor_unit()==null){
					awardRecord.clear();
					count = (long) 0;
					break;
				}
			}
			
			System.out.println(awardRecord.size());
			System.out.println("count:" + count);
			return new PageBean(pageNum,pageSize,count.intValue(),awardRecord);
		}
	
}
