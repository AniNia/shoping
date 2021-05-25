package com.learn.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import com.learn.entities.product;


public class productDao {

	private SessionFactory factory;

	public productDao(SessionFactory factory) {
		this.factory = factory;
	}
	public boolean saveProduct(product pro) {
		boolean f=false;
		try {
			
			Session session=this.factory.openSession();
			Transaction tx=session.beginTransaction();
			session.save(pro);
			
			tx.commit();
			session.close();
			f=true;
			
		}catch(Exception e) {
			e.printStackTrace();
			f=false;
		}
		return f;
	}
	//get all products
	public java.util.List<product> getAllProducts(){
		
		Session s=this.factory.openSession();
		Query q=s.createQuery("from product");
	       
        java.util.List<product> list=q.list();
        return list;
		
	}
	//get all products of given category
		public java.util.List<product> getAllProductsOfCategory(int cid){
			
			Session s=this.factory.openSession();
			Query q=s.createQuery("from product as p where p.Category.categoryId =: id");
			q.setParameter("id", cid);   
	        java.util.List<product> list=q.list();
	        return list;
			
		}

	
}
	
