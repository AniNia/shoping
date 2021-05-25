package com.learn.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.learn.entities.user;

public class userDao {
	private SessionFactory factory;

	public userDao(SessionFactory factory) {
		this.factory = factory;
	}
	// get user by email and password
	
	public user getMailAndPassword(String email, String password) {
		user usr=null;
		try {
			String query="from user where userEmail =: e and userPassword =: p";
			Session session=this.factory.openSession();
			Query q=session.createQuery(query);
			q.setParameter("e", email);
			q.setParameter("p", password);
			usr=(user)q.uniqueResult();
		  
		
			session.close();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	return usr;
	}

}
