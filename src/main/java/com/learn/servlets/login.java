package com.learn.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.learn.cart.factoryProvider;
import com.learn.dao.userDao;
import com.learn.entities.user;

public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out= response.getWriter();
		try {
			String email=request.getParameter("email");
			String password=request.getParameter("password");

			
	//Authenticate
			userDao ud= new userDao(factoryProvider.getFactory());
			user usr= ud.getMailAndPassword(email, password);
			//System.out.println(usr);
			HttpSession httpSession=request.getSession();
			if(usr==null) {
				httpSession.setAttribute("message", "Invalid Detail!! User not found!!!!");
			    response.sendRedirect("login.jsp");
			    return;
				
			}else {
				httpSession.setAttribute("current", usr);
				if(usr.getUserType().equals("admin")) {
					response.sendRedirect("admin.jsp");
				}else if(usr.getUserType().equals("normal")) {
					response.sendRedirect("index.jsp");
				}else {
					out.println("Unknown User");
				}
			
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
	}

}
