package com.learn.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.learn.cart.factoryProvider;
import com.learn.dao.categoryDao;
import com.learn.dao.productDao;
import com.learn.entities.category;
import com.learn.entities.product;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ProductOperationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		String op=request.getParameter("operation");
		if(op.trim().equals("addcategory")) {
			//Add Category
			String title=request.getParameter("catTitle");
			String description=request.getParameter("catCategory");
			category cate=new category();
			cate.setCategoryTitle(title);
			cate.setCategoryDescription(description);
			
			categoryDao catDao=new categoryDao(factoryProvider.getFactory());
			catDao.saveCategory(cate);
			PrintWriter out=response.getWriter();
			//out.println("category saved");
			HttpSession httpSession=request.getSession();
			httpSession.setAttribute("message", "Category added successfully.");
			response.sendRedirect("admin.jsp");
			return;
			
			
			
		}else if(op.trim().equals("addproduct")) {
			
			String pName=request.getParameter("proName");
			String pDes=request.getParameter("proDetail");
	        int pPrice=Integer.parseInt(request.getParameter("proPrice"));
	        int pDiscount=Integer.parseInt(request.getParameter("proDiscount"));
	        int pQuantity=Integer.parseInt(request.getParameter("proQuantity"));
	        int pCId=Integer.parseInt(request.getParameter("proCat"));
	        Part part=request.getPart("proPic");
	        product p=new product();
	        p.setpName(pName);
	        p.setpDescription(pDes);
	        p.setpPhoto(part.getSubmittedFileName());
	        p.setpPrice(pPrice);
	        p.setpDiscount(pDiscount);
	        p.setpQuantity(pQuantity);
	        
	        
	        
	        
	        categoryDao cdao=new categoryDao(factoryProvider.getFactory());
	        category ca=cdao.getCategoryById(pCId);
	        p.setCategory(ca);
	        
	        productDao pDao=new productDao(factoryProvider.getFactory());
	       pDao.saveProduct(p);
	        
	        
	        String path=request.getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
	        System.out.println(path);
	        FileOutputStream fos=new FileOutputStream(path);
	        InputStream is=part.getInputStream();
	        
	        
	        byte [] data=new byte[is.available()];
	        is.read(data);
	        fos.write(data);
	        fos.close();
	        
	        PrintWriter out=response.getWriter();
	        //out.println("add Successfully");
	        HttpSession httpSession=request.getSession();
	        httpSession.setAttribute("message","Product Saved Successfully.");
	        response.sendRedirect("admin.jsp");
	        return;
	        
					}else {}
		
		
	}
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		String op=request.getParameter("operation");
		if(op.trim().equals("addcategory")) {
			//Add Category
			String title=request.getParameter("catTitle");
			String description=request.getParameter("catCategory");
			category cate=new category();
			cate.setCategoryTitle(title);
			cate.setCategoryDescription(description);
			
			categoryDao catDao=new categoryDao(factoryProvider.getFactory());
			catDao.saveCategory(cate);
			PrintWriter out=response.getWriter();
			//out.println("category saved");
			HttpSession httpSession=request.getSession();
			httpSession.setAttribute("message", "Category added successfully.");
			response.sendRedirect("admin.jsp");
			return;
			
			
			
		}
		else if(op.trim().equals("addproduct")) {
			
			String pName=request.getParameter("proName");
			String pDes=request.getParameter("proDetail");
	        int pPrice=Integer.parseInt(request.getParameter("proPrice"));
	        int pDiscount=Integer.parseInt(request.getParameter("proDiscount"));
	        int pQuantity=Integer.parseInt(request.getParameter("proQuantity"));
	        int pCId=Integer.parseInt(request.getParameter("catId"));
	        Part part=request.getPart("proPic");
	        product p=new product();
	        p.setpName(pName);
	        p.setpDescription(pDes);
	        p.setpPrice(pPrice);
	        p.setpDiscount(pDiscount);
	        p.setpQuantity(pQuantity);
	        p.setpPhoto(part.getSubmittedFileName());
	        
	        
	        categoryDao cdao=new categoryDao(factoryProvider.getFactory());
	        category ca=cdao.getCategoryById(pCId);
	        p.setCategory(ca);
	        
	        productDao pDao=new productDao(factoryProvider.getFactory());
	        pDao.saveProduct(p);
	        
	        
	        
	        String path=request.getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
	        System.out.println(path);
	        
	        FileOutputStream fos=new FileOutputStream(path);
	        InputStream is=part.getInputStream();
	        
	        
	        byte [] data=new byte[is.available()];
	        is.read(data);
	        fos.write(data);
	        fos.close();
	        
	        
	        PrintWriter out=response.getWriter();
	       // out.println("add Successfully");
	        HttpSession httpSession=request.getSession();
	        httpSession.setAttribute("message","Product Saved Successfully.");
	        response.sendRedirect("admin.jsp");
	        return;
	        
					}else {}
		
		
	}

	

}
