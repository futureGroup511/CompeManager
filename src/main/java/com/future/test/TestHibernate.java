package com.future.test;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;



public class TestHibernate {

	/*public static void main(String[] args) {
		 SessionFactory factory = new Configuration().configure().buildSessionFactory();  
		    Session session = factory.openSession();  
		      
		    session.beginTransaction(); 
		      
		    try{  
		   Admin admin = new Admin();
		   admin.setAd_name("校长");
		   admin.setAd_num("123456");
		   admin.setAd_password("123");
		   admin.setAd_sex("男");
		   
		    session.save(admin);  
		    } catch(Exception e) {  
		        e.printStackTrace();  
		        session.getTransaction().rollback();    
		    }  
		      
		    session.getTransaction().commit();  
		    System.out.println((Admin)session.load(Admin.class, 1).getAd_name());
	}*/
}
