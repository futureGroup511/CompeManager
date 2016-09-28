package com.future.dao.impl;

import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
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
			String md5Digest = DigestUtils.md5Hex(stu.getStu_password());
			stu.setStu_password(md5Digest);
			getsession().saveOrUpdate(stu);
	}
	/**
	 * 因为事务问题造成hibernate缓存不能清楚,尝试写了一个flush
	 */
	public void updateStudent(Student stu){
		Student student = findById(stu.getStu_id());
		//String md5Digest = DigestUtils.md5Hex(stu.getStu_password());
		//stu.setStu_password(md5Digest);
		//stu.setStu_password(student.getStu_password());
		student.setStu_name(stu.getStu_name());
		student.setStu_grade(stu.getStu_grade());
		student.setStu_major(stu.getStu_major());
		student.setStu_phone(stu.getStu_phone());
		student.setStu_sex(stu.getStu_sex());
		student.setStu_idCard(stu.getStu_idCard());
		System.out.println(stu.getStu_department());
		student.setStu_department(stu.getStu_department());
		student.setStu_class(stu.getStu_class());
		getsession().save(student);
	}
	
	private Student findById(Integer stu_id) {
		String hql = "from Student s where s.stu_id = ? ";
		return (Student) getsession().createQuery(hql).setParameter(0, stu_id).uniqueResult();
	}

	@Override
	public Student findStudentById(Integer id) {
		String hql="from Student s where s.stu_id=?";
		Student student;
		//Student student=(Student) getsession().createQuery(hql).setInteger(0, id).uniqueResult();
		List<Student> students=getsession().createQuery(hql).setInteger(0, id).list();
		if(students.size()==0){
			return null;
		}
		student=students.get(0);
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

	//一键重置学生密码
	@Override
	public void modifyStuPassword(Integer id) {
		Student student = findById(id);
		String mdDigest = DigestUtils.md5Hex(student.getStu_num());
		student.setStu_password(mdDigest);
		getsession().save(student);
	}

	//学生修改密码
	@Override
	public void updatePassword(Student stu) {
		Student student = findById(stu.getStu_id());
		String md5 = DigestUtils.md5Hex(stu.getStu_password());
		student.setStu_password(md5);
		getsession().save(student);
	}
}
