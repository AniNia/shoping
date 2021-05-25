<%@page import="java.util.HashMap"%>
<%@page import="com.learn.cart.Helper"%>
<%@page import="com.learn.entities.category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.cart.factoryProvider"%>
<%@page import="com.learn.dao.categoryDao"%>
<%@page import="com.learn.entities.user"%>
<%
user usr=(user)session.getAttribute("current");
if(usr==null){
	session.setAttribute("message", "You are not logged in. !! Login first");
	response.sendRedirect("login.jsp");
	return;
}else{
	
	if(usr.getUserType().equals("normal")){
		session.setAttribute("message", "You are not admin. !! Do not access this page.");
		response.sendRedirect("login.jsp");
		return;
		
	}
}
%>
 <%
         categoryDao ctDao=new categoryDao(factoryProvider.getFactory());
         List<category> list=ctDao.getCategory();
         HashMap<String,Long> m=Helper.getCount(factoryProvider.getFactory());
         
         
         %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<%@ include file="common.jsp" %>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="container admin">

<div class="container-fluid mt-2">
<%@include file="message.jsp" %></div>

<div class="row mt-4">


<div class="col-md-4">
<div class="card c1" style="cursor: pointer;">
<div class="card-body text-center">
<div class="container">
<img src="img/group.png" style="max-width: 115px;" class="img-fluid rounded-circle" alt="user_icon">
</div>
<h1><%=m.get("getUser") %></h1>
<h1>User</h1>
</div>

</div>

</div>


<div class="col-md-4">

<div class="card c1" style="cursor: pointer;">
<div class="card-body text-center">

<div class="container">
<img src="img/box.png" style="max-width: 115px;" class="img-fluid rounded-circle" alt="product_icon">
</div>
<h1><%=m.get("getProd") %></h1>
<h1>Products</h1>
</div>
</div>
</div>



<div class="col-md-4">

<div class="card c1" style="cursor: pointer;">
<div class="card-body text-center">

<div class="container">
<img src="img/menu.png" style="max-width: 115px;" class="img-fluid rounded-circle" alt="category_icon">
</div>
<h1><%=list.size() %></h1>
<h1>category</h1>
</div>

</div>
</div>


</div>

<div class="row mt-2">
<div class="col-md-6">


<div class="card c1" style="cursor: pointer;" data-toggle="modal" data-target="#addCategoryModel">
<div class="card-body text-center">
<div class="container">
<img src="img/add-button.png" style="max-width: 115px;" class="img-fluid rounded-circle" alt="user_icon">
</div>

<h1>Add Category</h1>
</div>

</div>
</div>
<div class="col-md-6">


<div class="card c1" style="cursor: pointer;" data-toggle="modal" data-target="#addProductModel">
<div class="card-body text-center">
<div class="container">
<img src="img/product.png" style="max-width: 115px;" class="img-fluid rounded-circle" alt="user_icon">
</div>

<h1>Add Product</h1>
</div>

</div>
</div>
</div>
</div>

<!-- modal -->


<!-- add category Modal -->
<div class="modal fade" id="addCategoryModel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header blue text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
        <form action="ProductOperationServlet" method="post">
        <input type="hidden" name="operation" value="addcategory" />
        <div class="form-group">
        <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title" required/>
        </div>
         <div class="form-group mt-2">
         <textarea  class="form-control" style="height:200px;" placeholder="Enter Category Description" name="catCategory" required></textarea>
         </div>
         <div class="container mt-3 text-center">
         <button class="btn btn-outline-success">Add Category</button>
         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
         </div>
        
        </form>
      </div>
      
    </div>
  </div>
</div>
<!-- add product Modal -->
<div class="modal fade" id="addProductModel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header blue text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" name="operation" value="addproduct" />
        <div class="form-group mt-2">
        <input type="text" class="form-control" name="proName" placeholder="Enter Product Name" required/>
        </div>
        <div class="form-group mt-2">
        <input type="number" class="form-control" name="proPrice" placeholder="Enter Product Price" required/>
        </div>
        <div class="form-group mt-2">
        <input type="number" class="form-control" name="proDiscount" placeholder="Enter Product Discount" required/>
        </div>
        <div class="form-group mt-2">
        <input type="number" class="form-control" name="proQuantity" placeholder="Enter Product Quantity" required/>
        </div>
         <div class="form-group mt-2">
         <textarea  class="form-control" style="height:200px;" placeholder="Enter Product Description" name="proDetail" required></textarea>
         </div>
         
        
         
         <div class="form-group mt-2">
        <select name="proCat" id="catId" class="form-control">
        
        <%
        for(category c:list){%>
        <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle() %> </option>
        
        <%} %>
                </select>
        </div>
        <div class="form-froup">
        <label for="ppic">Select Picture of Product</label></br>
        <input type="file" name="proPic" id="ppic"required/>
        
        </div>
         <div class="container mt-3 text-center">
         <button class="btn btn-outline-success">Add Product</button>
         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
         </div>
        
        </form>
      </div>
      
    </div>
  </div>
</div>

<%@include file="common_modals.jsp" %>
</body>
</html>