//Ashour
function checkPhone()
{
    //console.log("phone");
    var str2 = document.getElementById("billing_phone").value;
    var more = /^\(?([0-9]{3})\)?[ ]?([0-9]{3})[ ]?([0-9]{4})$/;
    if (!more.test(str2))
    {
        var error="please Enter Valid Phone";
        document.getElementById("checkph").innerHTML=error;
       // alert("enter valid phone");
    }
}

//Ashour
function checkEmail()
{
    var str= document.getElementById("billing_email").value;
    var patt= /^[_A-Za-z0-9-]+(.[A-Za-z0-9-]+)*@[A-Za-z0-9-]+(.[A-Za-z0-9-]+)*(.[A-Za-z]{2,})$/;
    if(!patt.test(str))
    {
        var error="please Enter Valid Email";
        document.getElementById("checkmail").innerHTML=error;
        //alert("enter valid email");
    }
}

//profile eddited by Ashour
var xmlHttp;
function createXMLHttpRequest() {
	
	if (window.ActiveXObject)
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	else if (window.XMLHttpRequest)
		xmlHttp = new XMLHttpRequest();
}
//Ashour
function startRequest() {
	createXMLHttpRequest();
	
	xmlHttp.onreadystatechange = handleStateChange;
	fname = document.getElementById("fname").value;
	lname = document.getElementById("lname").value;
	phone = document.getElementById("phone").value;
	email = document.getElementById("email").value;
	address = document.getElementById("address").value;
	console.log("fname is :"+fname);
	
	var params = "fname="+fname+"&lname="+lname+"&phone="+phone+"&email="+email+"&address="+address;  
	xmlHttp.open("post", "EditCustomer", true);
	xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlHttp.send(params);
}
//Ashour
function handleStateChange() {
	if (xmlHttp.readyState == 4 && xmlHttp.status == 200)
		
		result= xmlHttp.responseText;
		document.getElementById("result").value=result;
			console.log("result is"+result);
}

function startRequestPhoto() {
	createXMLHttpRequest();
	console.log("inside start");
	xmlHttp.onreadystatechange = handleStateChangePhoto;
	part = document.getElementById("photo").value;
	console.log(part);
	var params = "photo="+part; 
	xmlHttp.open("post", "EditCustomerPhoto", true);
	xmlHttp.setRequestHeader("Content-type", "multipart/mixed stream;boundary=boundary");
	xmlHttp.send(params);
}


function handleStateChangePhoto() {
	if (xmlHttp.readyState == 4 && xmlHttp.status == 200)
		
		var result= xmlHttp.responseText;
			console.log("result photo is"+result);
}