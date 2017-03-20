/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var prod_latest_requests = new Array();

var prod_latest_divs = document.getElementsByName('prod-latest-div');

function init_latest_prods()
{
	if(prod_latest_divs !== null)
		for(var i = 0; i < prod_latest_divs.length; i++)
		{
			init_latest_request(i);
			prod_latest_requests[i].open("GET", "prod-serv?page=index.jsp&category=latest&index=" + i, true);
			prod_latest_requests[i].send(null);
		}
}

function init_latest_request(index)
{
	if(window.XMLHttpRequest)
		prod_latest_requests[index] = new XMLHttpRequest();
	else if(window.ActiveXObject)
		prod_latest_requests[index] = new ActiveXObject("Microsoft.XMLHTTP");
	prod_latest_requests[index].onreadystatechange = disp_latest_prod;
}

function disp_latest_prod()
{
	for(var i = 0; i < prod_latest_requests.length; i++)
	{
		var request = prod_latest_requests[i];
		if(request !== null && request.readyState === 4 && request.status === 200)
		{
			var prod = JSON.parse(request.responseText);
			if(prod.index !== -1)
			{
				/**
					<div class="single-product">
						<div class="product-f-image">
							<img src="img/product-1.jpg" alt="">
							<div class="product-hover">
								<a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>
								<a href="single-product.html" class="view-details-link"><i class="fa fa-link"></i> See details</a>
							</div>
						</div>

						<h2><a href="single-product.html">Samsung Galaxy s5- 2015</a></h2>

						<div class="product-carousel-price">
							<ins>$700.00</ins> <del>$100.00</del>
						</div> 
					</div>
				*/
				/*var prodDiv = document.createElement('div');
				prodDiv.className = 'single-product';
				
				var prod_img = document.createElement('div');
				prod_img.className = 'product-f-image';
				
				var prod_img_img = document.createElement('img');
				prod_img_img.style = "width:195px;height:243px;";
				prod_img_img.src = "prod-img-serv?page=index.jsp&id=" + prod.product.productId;
				
				var prod_img_hover = document.createElement('div');
				prod_img_hover.className = "product-hover";
				
				var prod_img_hover_add = document.createElement('a');
				prod_img_hover_add.className = 'add-to-cart-link';
				prod_img_hover_add.href = "add-to-cart?page=index.jsp&id=" + prod.product.productId;
				
				var prod_img_hover_add_i = document.createElement('i');
				prod_img_hover_add_i.className = "fa fa-shopping-cart";
				
				var prod_img_hover_add_text = document.createTextNode("Add to cart");
				
				prod_img_hover_add.appendChild(prod_img_hover_add_i);
				prod_img_hover_add.appendChild(prod_img_hover_add_text);
				
				var prod_img_hover_details = document.createElement('a');
				prod_img_hover_details.className = 'view-details-link';
				prod_img_hover_details.href = "ShowSingleProduct.jsp?id=" + prod.product.productId;
				
				var prod_img_hover_details_i = document.createElement('i');
				prod_img_hover_details_i.className = "fa fa-link";
				
				var prod_img_hover_details_text = document.createTextNode("See details");
				
				prod_img_hover_details.appendChild(prod_img_hover_details_i);
				prod_img_hover_details.appendChild(prod_img_hover_details_text);
				
				prod_img_hover.appendChild(prod_img_hover_add);
				prod_img_hover.appendChild(prod_img_hover_details);
				
				prod_img.appendChild(prod_img_img);
				prod_img.appendChild(prod_img_hover);
				
				var prod_name = document.createElement('h2');
				
				var prod_name_link = document.createElement('a');
				prod_name_link.href = "ShowSingleProduct.jsp?id=" + prod.product.productId;
				prod_name_link.text = prod.product.name;
				
				prod_name.appendChild(prod_name_link);
				
				var prod_price = document.createElement('div');
				prod_price.className = "product-carousel-price";
				
				var prod_price_ins = document.createElement('ins');
				
				var prod_price_ins_txt = document.createTextNode(prod.product.price);
				
				prod_price_ins.appendChild(prod_price_ins_txt);
				prod_price.appendChild(prod_price_ins);
				
				prodDiv.appendChild(prod_img);
				prodDiv.appendChild(prod_name);
				prodDiv.appendChild(prod_price);
				
				prod_latest_area.appendChild(prodDiv);*/
				var prod_img = document.getElementsByName("prod-latest-img-" + prod.index);
				var prod_add = document.getElementsByName("prod-latest-add-" + prod.index);
				var prod_detail = document.getElementsByName("prod-latest-detail-" + prod.index);
				var prod_single = document.getElementsByName("prod-latest-single-" + prod.index);
				var prod_price = document.getElementsByName("prod-latest-price-" + prod.index);
				var pId = prod.product.productId;
				
				for(var j = 0; j < prod_img.length; j++)
				{
					prod_img[j].src = "prod-img-serv?page=index.jsp&id=" + prod.product.productId;
					prod_img[j].style = "width:195px;height:265px;";
					
					if(prod_add.length > 0)
						prod_add[j].href = "add-to-cart?page=index.jsp&id=" + pId;
					
					prod_detail[j].href = "ShowSingleProduct?id=" + pId;
					
					prod_single[j].href = "ShowSingleProduct?id=" + pId;
					
					prod_single[j].textContent = prod.product.name;
					
					prod_price[j].textContent = prod.product.price;
				}
			}
			prod_latest_requests[i] = null;
		}
	}
}