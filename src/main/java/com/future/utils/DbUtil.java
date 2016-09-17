package com.future.utils;

/**
 * 
 */


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.future.domain.Student;



/**
 * @author 刘阳
 * @created 2016-9-16
 */
public class DbUtil {

	/**
	 * @param sql
	 */
	public static void insert(String sql, Student student) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			Class.forName(ImportDate.DRIVER);
			conn = DriverManager.getConnection(ImportDate.URL, ImportDate.USERNAME, ImportDate.PASSWORD);
			ps = conn.prepareStatement(sql);
			ps.setString(1, student.getStu_num());
			ps.setString(2, student.getStu_name());
			ps.setString(3, student.getStu_sex());
			//ps.setObject(4, student.getStu_department());
			ps.setInt(4, student.getStu_department().getDe_id());
			ps.setString(5, student.getStu_major());
			ps.setString(6, student.getStu_class());
			ps.setString(7, student.getStu_idCard());
			ps.setString(8, student.getStu_grade());
			ps.setString(9, student.getStu_password());
			boolean flag = ps.execute();
			if(!flag){
				System.out.println("Save data : name. = " + student.getStu_name());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static List selectOne(String sql, Student student) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List list = new ArrayList();
		try {
			Class.forName(ImportDate.DRIVER);
			conn = DriverManager.getConnection(ImportDate.URL, ImportDate.USERNAME, ImportDate.PASSWORD);
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				//if(rs.getString("stu_num").equals(student.getNo()) || rs.getString("name").equals(student.getName())|| rs.getString("age").equals(student.getAge())){
				if(rs.getString("stu_num").equals(student.getStu_num()) ||rs.getString("stu_name").equals(student.getStu_name()) ){
					list.add(1);
				}else{
					list.add(0);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		return list;
	}
	
	
	public static ResultSet selectAll(String sql) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			Class.forName(ImportDate.DRIVER);
			conn = DriverManager.getConnection(ImportDate.URL, ImportDate.USERNAME, ImportDate.PASSWORD);
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		return rs;
	}
	
	public static Map<String,String> getDeMap() throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Map<String,String> deMap = new HashMap<String,String>();
		String sql = "select * from cm_departments";
		try {
			Class.forName(ImportDate.DRIVER);
			conn = DriverManager.getConnection(ImportDate.URL, ImportDate.USERNAME, ImportDate.PASSWORD);
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
					String name = rs.getString("de_name");
					String id = rs.getString("de_id");
					deMap.put(name, id);
			
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		
		return deMap;
	}
	

}

