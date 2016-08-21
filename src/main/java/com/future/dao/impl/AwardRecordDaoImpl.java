package com.future.dao.impl;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.apache.struts2.components.ActionComponent;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import com.future.base.BaseDao;
import com.future.dao.AwardRecordDao;
import com.future.dao.DepartmentDao;
import com.future.domain.AwardRecord;
import com.future.domain.Competition;
import com.future.domain.Department;
import com.future.domain.Student;
import com.future.utils.PageBean;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.future.domain.AwardRecord;
import com.future.domain.Student;
import com.future.utils.Page_S;

@Repository
public class AwardRecordDaoImpl extends BaseDao implements AwardRecordDao {
	
	@Override
	public Page_S findAwardByStudent(Student s, Page_S ps) {
		Criteria criteria=getsession().createCriteria(AwardRecord.class);
		criteria.add(Restrictions.eq("awardRecor_student", s));
		Long totalnum=(Long)criteria.setProjection(Projections.rowCount()).uniqueResult();
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
		List list = getsession().createQuery("from AwardRecord a where a.awardRecor_status = 1")
				.setFirstResult((pageNum - 1 ) * pageSize)
				.setMaxResults(pageSize)
				.list();
		
		Long count =  (Long) getsession().createQuery("select count (*) from AwardRecord a  where a.awardRecor_status = 1")
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
		List list = getsession().createQuery("from AwardRecord")
				.setFirstResult((pageNum - 1 ) * pageSize)
				.setMaxResults(pageSize)
				.list();
		
		Long count =  (Long) getsession().createQuery("select count (*) from AwardRecord")
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
	public void noPass(Integer id) {
		//先根据当前id拿到对象
		AwardRecord awardRecord = findById(id);
		//设置对象的状态为3
		awardRecord.setAwardRecor_status(3);
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

	//分页条件查询
	@Override
	public PageBean getPageBeanConditionQuery(int pageNum, int pageSize, AwardRecord model) {

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
	
}
