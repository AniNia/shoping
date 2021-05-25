<%
user usr=(user)session.getAttribute("current");
if(usr==null){
	session.setAttribute("message", "You are not logged in. !! Login first to access checkout");
	response.sendRedirect("login.jsp");
	return;
}



%>
<html lang="en">
<head>
<title>Mycart : Checkout</title>
<%@ include file="common.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container">
	<div class="row mt-2">
	<div class="col-md-6">
	<div class="card">
	<h3 class="text-center mb-2">Your Selected Items</h3>
	<div class="cart-body"></div>
	</div>
	</div>
	<div class="col-md-6">
	
	<div class="card px-3">
	<h3 class="text-center mb-2"> Details For Order</h3>
	<form action="" method="post">
<div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">User Name</label>
    <input required type="text" value="<%=usr.getUserName() %>" class="form-control" id="name" aria-describedby="emailHelp" name="user_name" placeholder="Enter Full Name">
  </div>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">User Email</label>
    <input required type="email" value="<%=usr.getUserEmail()%>" class="form-control" id="email" aria-describedby="emailHelp" name="user_email" placeholder="Enter Email">
  </div>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Mobile Number</label>
    <input required type="number" value="<%=usr.getUserPhone() %>" class="form-control" id="number" aria-describedby="emailHelp" name="user_number" placeholder="Enter Mob. Number">
  </div>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Your Shipping Address</label>
    <textarea required name="user_address" value="<%=usr.getUserAddress()%>" style="height:100px;" class="form-control" placeholder="Enter your address"></textarea>
  </div>
  <div class="container text-center">
  <button class="btn btn-outline-success" type="submit">Order Now</button>
  <a class="btn btn-outline-primary" href="index.jsp">Continue Shopping</a>
  </div>
  </form>
	</div>
	</div>
	
	</div>
	
	</div>
	
	<%@include file="common_modals.jsp" %>
</body>
</html>
