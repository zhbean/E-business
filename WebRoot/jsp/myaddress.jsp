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

<title>My JSP 'myaddress.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/profile.css">
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="js/StoreProscenium.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script language="JavaScript"> 
　　function getAccount(){
   　　var account="<%=session.getAttribute("account")%>"; 
   return account;
　　}
	$("#searchtext").bind("change",function(){

		var a=$("#searchtext").val();
		Search();
		
	});
</script>
<script type="text/javascript" src="js/myaddress.js"></script>



</head>

<body style="background-color:#f5f5f5">
	<nav class="profile-nav navbar navbar-default "
		style="width:80%;margin-left:150px">
	<div class="profile-nav container-fluid ">
		<div class="navbar-header">
			<a class="navbar-brand" href="StroeProscenium.jsp"> <img
				alt="Brand" src="imgs/logo.jpg" height=100%>
			</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">账户信息 <span class="sr-only">(current)</span></a></li>
				<li><a href="#">账户安全</a></li>
				<li><a href="#">我的订单</a></li>
				<li><a href="#">收货地址</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">账户信息 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">账户安全</a></li>
						<li><a href="#">我的订单</a></li>
						<li><a href="#">收货地址</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="#">我的金币</a></li>
					</ul></li>
			</ul>
			<form class="navbar-form navbar-left">
				<div class="form-group input-group sec-t z">
					<a href="#" class="dropdown-toggle sec-t" data-toggle="dropdown"
						role="button" aria-haspopup="true" aria-expanded="true"><input
						type="text" id="searchtext" class="form-control "></a>
					<ul class="dropdown-menu sec-t">
						<li><a href="#" target="_blank" id="1"></a></li>
						<li><a href="#" target="_blank" id="2"></a></li>
						<li><a href="#" target="_blank" id="3"></a></li>
						<li><a href="#" target="_blank" id="4"></a></li>
						<li><a href="#" target="_blank" id="5"></a></li>
						<li><a href="#" target="_blank" id="6"></a></li>
						<li><a href="#" target="_blank" id="7"></a></li>
						<li><a href="#" target="_blank" id="8"></a></li>
						<li><a href="#" target="_blank" id="9"></a></li>
						<li><a href="#" target="_blank" id="10"></a></li>
					</ul>
					<button type="submit" class="btn btn-default">搜索</button>
				</div>
			</form>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">购物车</a></li>
				<li><a href="#">注销</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Dropdown <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="#">Separated link</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
	</div>
	</nav>
	<div class="my-body">
		<div>
			<div style="text-align:center">
				<h4>设置</h4>
			</div>
			<ul class="list-group">
				<li class="list-group-item">账户信息</li>
				<li class="list-group-item">账户安全</li>
				<li class="list-group-item">我的订单</li>
				<li class="list-group-item">收货地址</li>
				<li class="list-group-item">我的金币</li>
			</ul>
		</div>
		<div class="detailshow" id="detailshow">
			<div id="opt-address"></div>
			<div>
				<button type="button" class="btn btn-success" id="newaddress"
					name="newaddress">新增收货地址</button>
				<div id="myaddress"></div>
			</div>
			<br>

		</div>
		<div class="dl-im" id="UserImg">
			<!-- 登录模块图片区 -->
			<img src=image/013.jpg class=img-circle>
			<div>
				<font id="gold-coin"></font>
			</div>
		</div>
</body>
</html>
