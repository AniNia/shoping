package com.learn.cart;

import java.util.HashMap;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.mapping.Map;

public class Helper {
	public static String get10Words(String desc) {
		
		String[] str = desc.split(" ");
		if(str.length>10) {
			String res="";
			for(int i=0;i<10;i++) {
				res=res+str[i]+" ";
			}
			return res+"...";
		}else {
			return desc+"...";
		}
		
	}
	public static HashMap<String, Long> getCount(SessionFactory factory) {
		
		Session session=factory.openSession();
		String s1="select count(*) from user";
		String s2="select count(*) from product";
		Query q1=session.createQuery(s1);
		Query q2=session.createQuery(s2);
		Long getUser=(Long)q1.list().get(0);
		Long getProd=(Long)q2.list().get(0);
		//Map<String,Long> map=new HashMap<>();
		 HashMap<String, Long> map=new HashMap<String, Long>();
		map.put("getUser", getUser);
		map.put("getProd", getProd);
		
		session.close();
		return map;
	}

}
