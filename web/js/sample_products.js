/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var prod_sample_requests = new Array();

var prod_sample_divs = document.getElementsByName("sample-product");
function init_sample_prods()
{
	for(var i = 0; i < prod_sample_divs.length; i++)
	{
		init_sample_request(i);
		prod_sample_requests[i].open("GET", "prod-serv?page=index.jsp&category=sample&index=" + i, true);
		prod_sample_requests[i].send(null);
	}
}

function init_sample_request(index)
{
	if(window.XMLHttpRequest)
		prod_sample_requests[index] = new XMLHttpRequest();
	else if(window.ActiveXObject)
		prod_sample_requests[index] = new ActiveXObject("Microsoft.XMLHTTP");
	prod_sample_requests[index].onreadystatechange = disp_sample_prod;
}

function disp_sample_prod()
{
	for(var i = 0; i < prod_sample_requests.length; i++)
	{
		var request = prod_sample_requests[i];
		if(request !== null && request.readyState === 4 && request.status === 200)
		{
			var prod = JSON.parse(request.responseText);
			if(prod.index !== -1)
			{
				var prod_img = document.getElementById("prod-sample-img-" + prod.index);
				prod_img.style = "width:75px;height:95px;";
				prod_img.src = "prod-img-serv?page=index.jsp&id=" + prod.product.productId;
				
				var prod_name = document.getElementById("prod-sample-name-" + prod.index);
				prod_name.href = "ShowSingleProduct?id=" + prod.product.productId;
				prod_name.textContent = prod.product.name;
				
				document.getElementById("prod-sample-price-" + prod.index).textContent = prod.product.price;
			}
			
			prod_sample_requests[i] = null;
		}
	}
}


