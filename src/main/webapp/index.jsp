<%@page import="com.learn.cart.Helper"%>
<%@page import="com.learn.entities.category"%>
<%@page import="com.learn.dao.categoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.dao.productDao"%>
<%@page import="com.learn.cart.factoryProvider"%>
<%@page import="com.learn.entities.product"%>
<html lang="en">
<head>
<title>Mycart : home</title>
<%@ include file="common.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="row mt-2 mb-3 mx-1">


		<%
		productDao pd = new productDao(factoryProvider.getFactory());	
		String cat=request.getParameter("category");
		//int i = Integer.parseInt(request.getParameter("category"));		
		List<product> plist = null;
		if (cat==null || cat.trim().equals("all")) {
			plist = pd.getAllProducts();
			
		} else {
			int i=Integer.parseInt(cat.trim());
			
			plist = pd.getAllProductsOfCategory(i);
			

		}
	
		categoryDao cd = new categoryDao(factoryProvider.getFactory());
		List<category> clist = cd.getCategory();
		%>
		<!-- show categories -->
		<div class="col-md-2">



			<div class="list-group">
				<a href="index.jsp?category=all"
					class="list-group-item list-group-item-action active"
					style="background: #3a1435;" aria-current="true"> All Products
				</a>





				<%
				for (category ct : clist) {
				%>
				<a href="index.jsp?category=<%=ct.getCategoryId() %>"
					class="list-group-item list-group-item-action"><%=ct.getCategoryTitle()%></a>
				<%
				}
				%>
			</div>

		</div>

		<!-- show products -->


		<div class="col-md-10">
			<div class="container">

				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">


					<%
					for (product pr : plist) {
					%>
					<div class="col mt-2">

						<div class="card mt-2 h-100 c1">
							<img src="img/products/<%=pr.getpPhoto()%>" class="card-img-top"
								alt="..."
								style="max-height: 270px; max-width: 100%; width: auto;">
							<div class="card-body">
								<h5 class="card-title"><%=pr.getpName()%></h5>
								<p class="card-text"><%=Helper.get10Words(pr.getpDescription())%></p>
							</div>

							<div class="card-footer text-center">
								<button class="btn blue text-white" onclick="add_to_cart(<%=pr.getpId()%>,'<%=pr.getpName()%>',<%=pr.getPriceAfterDiscount()%>)">Add to Cart</button>
								<button class="btn btn-outline-success">
									&#8377;
									<%=pr.getPriceAfterDiscount()%>/-   <span class="text-warning discount-label">&#8377;<%=pr.getpPrice()%>/-   <%=pr.getpDiscount() %>% off</span></button>
							</div>
						</div>
					</div>
					<%
					}
					%>


				</div>

			</div>


		</div>



	</div>	
	<%@include file="common_modals.jsp" %>	
	<%@include file="footer.jsp" %>
</body>
</html>
