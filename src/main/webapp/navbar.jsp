<%@page import="com.learn.entities.user"%>
<%
user usr1=(user)session.getAttribute("current");
%>




<nav class="navbar navbar-expand-lg navbar-dark blue">
<div class="container">

    <a class="navbar-brand ml-4" style="color: orange; font-family:cursive; font-weight: bold;" href="index.jsp">AniEcommerce</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
        
        <li class="nav-item dropdown">
          
         </ul>
         
         
         <!-- conditional rendering -->
      <ul class="navbar-nav ml-auto">
      
      
      <li class="nav-item">
          <a class="nav-link active" href="#!" data-toggle="modal" data-target="#crt"><i class="fa fa-cart-plus" style="font-size: 20px;"></i><span class="ml-0 cart-items"> ( 0 )</span></a>
        </li>
      
      <%
      if(usr1==null){
      %>
      
    	  <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="login.jsp">Login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="register.jsp">Register</a>
        </li>
    	  
     <% }else{%>
     
      <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="<%=usr1.getUserType().equals("admin")?"admin.jsp":"normal.jsp"%>"><%=usr1.getUserName() %></a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="logoutServlet">Logout</a>
        </li>
     <% 
    	 
     }
      
      %>
     
      </ul>
    </div>
    </div>
</nav>