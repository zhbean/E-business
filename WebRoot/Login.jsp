<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/login.css">

<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/Login.js"></script>

</head>
<script type="text/javascript">
	$(document).ready(function(){
	
	$("#LoginButton").click(function(){Login();});
	$("#signupButton").click(function(){
		window.location.href="jsp/signup.jsp"; 
	});
	
});
</script>
<script type="text/javascript">
	$(document).ready(function(){
	var a="<%=request.getParameter("LoginError") %>";
	if(a!="null"&&a!=""){$("#LoginError").text(a)}
	signup.jsp
	
});
</script>
<body class="qu">
	<div>
		<div class="page-header">
			<h1>
				219 <small>杂货铺<small class="d">欢迎登陆</small></small>
			</h1>
		</div>
		<div class="e"></div>
		<div class="ln">
			<div class="b">
				<h3>用户登录</h3>
				<br>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" id="account"
					placeholder="账号">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" id="password"
					placeholder="密码">
			</div>
			<p id="LoginError" class="s"></p>
			<button type="button" id="LoginButton" class="btn btn-info btn-lg c">登录</button>
			<button type="button" id="signupButton"class="btn btn-warning btn-lg a">注册</button><br>
			</div>
		
	</div>
</body>
</html>
