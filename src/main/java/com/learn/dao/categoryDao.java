package com.learn.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.learn.entities.category;

import antlr.collections.List;
import java.util.*;

public class categoryDao {
	
	private SessionFactory factory;

	public categoryDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	public void saveCategory(category cate) {
		
	Session session=this.factory.openSession();	
	Transaction tx=session.beginTransaction();
	session.save(cate);
	tx.commit();
	session.close();

	}
	public java.util.List<category> getCategory(){
		Session session=this.factory.openSession();	
		Query q=session.createQuery("from category");
       
        java.util.List<category> list=q.list();
        return list;
		
	}
	
	public category getCategoryById(int cid) {
		category c=null;
		try {
			Session session=this.factory.openSession();	
			c=session.get(category.class, cid);
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return c;
	}

}
