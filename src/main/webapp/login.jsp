<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="common.jsp" %>
<title>User Login</title>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="container">
<div class="row mt-2 mb-2">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-header blue text-white"><h3 class="text-center">Login</h3></div>
<%@ include file="message.jsp" %>
<div class="card-body px-4">

<form action="login" method="post">
   <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Enter Email Id</label>
    <input required type="email" class="form-control" id="email" aria-describedby="emailHelp" name="email" placeholder="Enter Email">
  </div>
   <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Enter Password</label>
    <input required type="password" class="form-control" id="password" aria-describedby="emailHelp" name="password" placeholder="Enter Password">
  </div>
  <a href="register.jsp" class="text-center d-block mb-2">If not registered user</a>
  <div class="container text-center">
  <button class="btn btn-outline-success" type="submit">Login</button>
  <button class="btn btn-outline-danger" type="reset">Reset</button>
  </div>
</form>
</div>
</div>
</div>
</div>
</div>
<%@include file="common_modals.jsp" %>
</body>
</html>