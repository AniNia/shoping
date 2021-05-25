package com.learn.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.learn.cart.factoryProvider;
import com.learn.entities.user;

public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public register() {
        super();
        // TODO Auto-generated constructor stub
    }


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String name=request.getParameter("user_name");
			String mail=request.getParameter("user_email");
			String password=request.getParameter("user_password");
			String phone= request.getParameter("user_number");
			String address=request.getParameter("user_address");
			
			//creating user object to store data
			user usr=new user(name,mail,password,phone,"default.jpg",address,"normal");
			Session hibSession=factoryProvider.getFactory().openSession();
			Transaction tx=hibSession.beginTransaction();
			hibSession.save(usr);
			tx.commit();
			hibSession.close();
			HttpSession httpSession=request.getSession();
			
            httpSession.setAttribute("message", "Registered Successfully !!! ");
			response.sendRedirect("register.jsp");
			
			return;
			
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
	}

}
