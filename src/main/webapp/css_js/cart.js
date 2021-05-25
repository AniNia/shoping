function add_to_cart(pid, pname, price)
{
	let crt=localStorage.getItem("crt");
	
	if(crt==null){
		let products=[];
	let product={productId:pid, productName:pname, productQuantity:1, productPrice:price}
	products.push(product);
	localStorage.setItem("crt",JSON.stringify(products));
	console.log("Product is added first time.");
		
		
	}else{
		
		
		let pcrt=JSON.parse(crt);
		let oldProduct=pcrt.find((item) =>item.productId==pid)
		if(oldProduct){
			oldProduct.productQuantity=oldProduct.productQuantity+1;
			pcrt.map((item) =>{
				if(item.productId==oldProduct.productId){
					item.productQuantity=oldProduct.productQuantity;
				}				
				
			})
			localStorage.setItem("crt",JSON.stringify(pcrt));
				console.log("Product quantity is increased.");
			
			
		}else{
			let product={productId:pid, productName:pname, productQuantity:1, productPrice:price}
			  pcrt.push(product);
	        localStorage.setItem("crt",JSON.stringify(pcrt));
		console.log("Product is added.");
			
			
		}
		
		
	}
		
	updateCart()


}




function updateCart()
{
	
	let cartString=localStorage.getItem("crt");
	let cart=JSON.parse(cartString);
	if(cart==null || cart.length==0){
		console.log("cart is empty !!!");
		$(".cart-items").html("( 0 )");
		$(".cart-body").html("<h3>Cart does not have any items.</h3>");
		$(".checkout-btn").attr('disabled',true);		
		
	}
	else{		
		console.log(cart);
		$(".cart-items").html(`( ${cart.length} )`);
		let table=`
		<table class='table'>
		<thead class='thead-light'>
		<tr>
		<th>Item Name</th>
	    <th>Price</th>
	    <th>Quantity</th>
	    <th>Total Price</th>
        <th>Action</th>
		</tr>
		</thead>
		
		
		`;
		let total=0;
		 cart.map((item)=>{
			
			table+=`
			<tr>
			<td>${item.productName}</td>
			<td>${item.productPrice}</td>
			<td>${item.productQuantity}</td>
			
			<td>${item.productQuantity*item.productPrice}</td>
			<td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>
			</tr>
			`
			total+=item.productPrice*item.productQuantity;
		})
		
		
		table=table +`
		<tr><td colspan='5' class='text-right font-weight-bold m-5'>Total Price : ${total}</td></tr>
		
		</table>`
		$(".cart-body").html(table);
		$('checkout-btn').attr('disabled',false);
	}	
	
}
$(document).ready(function(){
	updateCart()
})


function deleteItemFromCart(pid){
	
	let cart=JSON.parse(localStorage.getItem("crt"));
	let newcart=cart.filter((item)=>item.productId!=pid)
	localStorage.setItem('crt',JSON.stringify(newcart))
	updateCart();
	
}



function goToCheckOut(){
	
}
