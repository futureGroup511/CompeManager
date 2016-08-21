package com.future.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.StudentDao;
import com.future.domain.SignUp;
import com.future.domain.Student;
import com.future.utils.Page_S;
@Repository
public class StudentDaoImp extends BaseDao implements StudentDao{

	@Override
	public Student login(Student student) {
		String hql="From Student s where s.stu_num=? and s.stu_password=?";
		Student stu=(Student) getsession().createQuery(hql).setString(0, student.getStu_num()).setString(1, student.getStu_password()).uniqueResult();
		return stu;
	}

	@Override
	public void addOrUpdateStudent(Student stu) {
			getsession().saveOrUpdate(stu);
	}
	/**
	 * 因为事务问题造成hibernate缓存不能清楚,尝试写了一个flush
	 */
	public void updateStudent(Student stu){
		getsession().update(stu);
	}
	@Override
	public Student findStudentById(Integer id) {
		/*String hql="from Student s where s.stu_id=?";
		Student student;
		//Student student=(Student) getsession().createQuery(hql).setInteger(0, id).uniqueResult();
		List<Student> students=getsession().createQuery(hql).setInteger(0, id).list();
		if(students.size()==0){
			return null;
		}
		student=students.get(0);*/
		Student student=new Student();
		getsession().load(student, id);
		return student;
	}

	@Override
	public Student findStudentByNameAndNum(Student student) {

		String hql="From Student s where s.stu_name=? and s.stu_num=?";
		Student stu=(Student) getsession().createQuery(hql).setString(0, student.getStu_name()).setString(1, student.getStu_num()).uniqueResult();
		return stu;
	}

	@Override
	public Page_S lookApplyByStatus(Student stu,Page_S ps) {
			Criteria criteria=getsession().createCriteria(SignUp.class);
			criteria.add(Restrictions.eq("signUp_student", stu));
			Long totalNum = (Long)criteria.setProjection(Projections.rowCount()).uniqueResult();
			criteria.setProjection(null);
			criteria.setFirstResult((ps.getCurrentPage()-1)*ps.getPageSize());
			criteria.setMaxResults(ps.getPageSize());
			criteria.addOrder(Order.desc("signUP_time"));
			List<SignUp> sup=criteria.list();
			Integer num=Integer.valueOf(totalNum.toString());
			Page_S p=new Page_S(ps.getCurrentPage(), ps.getPageSize(),num , sup);
			return p;
	}

	@Override
	public Page_S findAllStudenyByPage(Page_S ps) {
			Criteria criteria=getsession().createCriteria(Student.class);
			Long totalNum = (Long)criteria.setProjection(Projections.rowCount()).uniqueResult();
			criteria.setProjection(null);
			criteria.setFirstResult((ps.getCurrentPage()-1)*ps.getPageSize());
			criteria.setMaxResults(ps.getPageSize());
			List<Student> sup=criteria.list();
			Integer num=Integer.valueOf(totalNum.toString());
			Page_S p=new Page_S(ps.getCurrentPage(), ps.getPageSize(),num , sup);
			return p;
	}
}
