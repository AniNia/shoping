package com.learn.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.learn.cart.factoryProvider;
import com.learn.dao.productDao;
import com.learn.dao.userDao;
import com.learn.entities.product;
import com.learn.entities.user;

/**
 * Servlet implementation class Filter
 */
public class Filter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Filter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out= response.getWriter();
		try {
			String cat = request.getParameter("Categ");
			productDao pd = new productDao(factoryProvider.getFactory());
			List<product> plist = null;
			if (cat.trim().equals("all")) {
				plist = pd.getAllProducts();
				
			} else {
				int i = Integer.parseInt(cat.trim());
				plist = pd.getAllProductsOfCategory(i);
				

			}
			

			
			
			}
			
			
		catch(Exception e){
			e.printStackTrace();
			
		}
		
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
