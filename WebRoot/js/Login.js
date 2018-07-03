/**
 * 
 */
function Login(){
	var a=$("#account").val();
	var p=$("#password").val();
	window.location.href="LoginCheck?account="+a+"&&password="+p;
}