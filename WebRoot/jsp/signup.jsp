<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'signup.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/signup.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">

<script type="text/javascript" src="js/jquery-3.3.1.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		console.log("test");
		var hasAccount = $("hasAccount").text();
		console.log(hasAccount);
	});
</script>


</head>

<body>
	<div id="signup-header">
		<div id="e-logo">
			<a href="<%=basePath%>StoreProscenium.jsp"><img alt="杂货铺"
				src="imgs/logo.jpg" height=90%></a>
		</div>
		<div id="e-logo-title">欢迎注册</div>
		<div id="signuped">
			已有账号？<a href="<%=basePath%>Login.jsp">请登录</a>
		</div>
	</div>
	<div class="input-group" id="signup-body">
		<form action="signup" type="post">
			<div class="input-group">
				<span class="input-group-addon" id="sizing-addon2">手机号</span> <input
					name="account" type="text" class="form-control"
					placeholder="作为账号用于登录" aria-describedby="sizing-addon2">
			</div>
			<span id="legal-account"></span> <br>
			<div class="input-group">
				<span class="input-group-addon" id="sizing-addon2">用户名</span> <input
					name="username" type="text" class="form-control" placeholder="用户名"
					aria-describedby="sizing-addon2"><span id="legal-username"></span>
			</div>
			<br>
			<div class="input-group">
				<span class="input-group-addon" id="sizing-addon2">密码</span> <input
					name="password" type="password" class="form-control"
					placeholder="密码" aria-describedby="sizing-addon2">
			</div>
			<br>
			<div class="btn-group" role="group" aria-label="...">
				<button type="submit" class="btn btn-default">注册</button>
			</div>
			<br>
			</form>
	</div>
</body>
</html>
