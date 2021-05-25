<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User</title>
<%@ include file="common.jsp" %>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="container">

<div class="row mt-2 mb-2">
<div class="col-md-6 offset-md-3">
<div class="card">
<%@ include file="message.jsp" %>
<div class="card-header blue text-white"><h3 class="text-center">Sign Up</h3></div>
<div class="card-body px-5">
<form action="register" method="post">
<div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">User Name</label>
    <input required type="text" class="form-control" id="name" aria-describedby="emailHelp" name="user_name" placeholder="Enter Full Name">
  </div>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">User Email</label>
    <input required type="email" class="form-control" id="email" aria-describedby="emailHelp" name="user_email" placeholder="Enter Email">
  </div>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Password</label>
    <input required type="password" class="form-control" id="password" aria-describedby="emailHelp" name="user_password" placeholder="Enter Password">
  </div>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Mobile Number</label>
    <input required type="number" class="form-control" id="number" aria-describedby="emailHelp" name="user_number" placeholder="Enter Mob. Number">
  </div>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Address</label>
    <textarea required name="user_address" style="height:100px;" class="form-control" placeholder="Enter your address"></textarea>
  </div>
  <a href="login.jsp" class="text-center d-block mb-2">If registered user</a>
  <div class="container text-center">
  <button class="btn btn-outline-success" type="submit">Register</button>
  <button class="btn btn-outline-danger" type="reset">Reset</button>
  </div>
  </form>
</div>
</div>
</div>
</div>
</div>
</body>
<%@include file="common_modals.jsp" %>
</html>