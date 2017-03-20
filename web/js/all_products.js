/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var prod_all_request;

var prod_all_area = document.getElementById("prod_all_area");
	
function get_all_prod()
{
	init_all_request();
	prod_all_request.open("GET", "prod-serv?page=shop.jsp&category=all", true);
	prod_all_request.send(null);
}

function init_all_request(index)
{
	if(window.XMLHttpRequest)
		prod_all_request = new XMLHttpRequest();
	else if(window.ActiveXObject)
		prod_all_request = new ActiveXObject("Microsoft.XMLHTTP");
	prod_all_request.onreadystatechange = disp_all_prod;
}

function disp_all_prod()
{
	if(prod_all_request != null && prod_all_request.readyState == 4 && prod_all_request.status == 200)
	{
		var prod_all = JSON.parse(prod_all_request.responseText);
		
		if(prod_all != null && prod_all_area != null)
		{
			/*
			<div class="col-md-3 col-sm-6">
				<div class="single-shop-product">
					<div class="product-upper">
						<img src="img/product-2.jpg" alt="" id="prod-all-img-1">
					</div>
					<h2><a href="" id="prod-all-single-1">Apple new mac book 2015 March :P</a></h2>
					<div class="product-carousel-price">
						<ins id="prod-all-price-1">$899.00</ins> <del>$999.00</del>
					</div>  

					<div class="product-option-shop">
						<a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70" id="prod-all-add-1">Add to cart</a>
					</div>                       
				</div>
			</div>
			 */
			while(prod_all_area.hasChildNodes())
				prod_all_area.removeChild(prod_all_area.lastChild);
			for(var i = 0; i < prod_all.length; i++)
			{
				var product = prod_all[i];
				
				var prod = document.createElement('div');
				prod.className = 'col-md-3 col-sm-6';
				
				var prod_single = document.createElement('div');
				prod_single.className = 'single-shop-product';
				
				var prod_single_upper = document.createElement('div');
				prod_single_upper.className = 'product-upper';
				
				var prod_single_upper_img = document.createElement('img');
				prod_single_upper_img.src = "prod-img-serv?page=shop.js&id=" + product.productId;
				prod_single_upper_img.style= "width:200px;height:250px;";
				
				prod_single_upper.appendChild(prod_single_upper_img);
				
				var prod_name = document.createElement('h2');
				
				var prod_name_link = document.createElement('a');
				prod_name_link.href = "ShowSingleProduct?id=" + product.productId;
				prod_name_link.text = product.name;
				
				prod_name.appendChild(prod_name_link);
				
				var prod_price = document.createElement('div');
				prod_price.className = "product-carousel-price";
				
				var prod_price_val = document.createElement('ins');
				
				var prod_price_val_text = document.createTextNode(product.price);
				
				prod_price_val.appendChild(prod_price_val_text);
				prod_price.appendChild(prod_price_val);
				
				var prod_add = document.createElement('div');
				prod_add.className = "product-option-shop";
				
				var prod_add_link = document.createElement('a');
				prod_add_link.className = "add_to_cart_button";
				prod_add_link.href = "add-to-cart?page=shop.jsp&id=" + product.productId;
				prod_add_link.text = "Add to cart";
				prod_add_link["data-quantity" ]= "1";
				prod_add_link["data-product_sku"] = "";
				prod_add_link["data-product_id"] = "70";
				prod_add_link.rel="nofollow";
				
				prod_add.appendChild(prod_add_link);
				
				prod_single.appendChild(prod_single_upper);
				prod_single.appendChild(prod_name);
				prod_single.appendChild(prod_price);
				prod_single.appendChild(prod_add);
				prod.appendChild(prod_single);
				
				prod_all_area.appendChild(prod);
			}
		}
	}
}
