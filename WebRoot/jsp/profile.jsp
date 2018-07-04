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

<title>My JSP 'profile.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/profile.css">
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script language="JavaScript"> 
　　function getAccount(){
   　　var account="<%=session.getAttribute("account")%>"; 
   return account;
　　}
</script>

</head>

<body style="background-color:#f5f5f5">
	<nav class="profile-nav navbar navbar-default " style="width:80%;margin-left:150px">
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
				<li><a href="<%=basePath%>jsp/myorders.jsp">我的订单</a></li>
				<li><a href="<%=basePath%>jsp/myaddress.jsp">收货地址</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">账户信息 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">账户安全</a></li>
						<li><a href="<%=basePath%>jsp/myorders.jsp">我的订单</a></li>
						<li><a href="<%=basePath%>jsp/myaddress.jsp">收货地址</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="#">我的金币</a></li>
					</ul></li>
			</ul>
			<form class="navbar-form navbar-left">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">搜索</button>
			</form>
			<ul class="nav navbar-nav navbar-right">
			<li><a href="<%=basePath%>cart.jsp">购物车</a></li>
				<li><a href="<%=basePath%>Login.jsp">注销</a></li>
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
				<li class="list-group-item"><a href="<%=basePath%>jsp/myorders.jsp">我的订单</a></li>
				<li class="list-group-item"><a href="<%=basePath%>jsp/myaddress.jsp">收货地址</a></li>
				<!-- //<li class="list-group-item">我的金币</li> -->
			</ul>
		</div>
		<div style="flex-grow:1">
		<form action="setprofile">
			<div>
				<span>账号<input id="myaccount" name="myaccount" class="form-control" type="text"
					placeholder="账号" readonly></span>
			</div>
			<br>
			<div>
				<span>用户名<input id="myusername" name="myusername" class="form-control" type="text"
					placeholder="名字"></span>
			</div>
			<br>
			<div>
				<span>性别</span>
				<div class="bs-example">
					<div class="form-group">
						<label class="radio-inline "> <input type="radio"
							value="option1" id="sex-man" name="sex" checked>男
						</label> <label class="radio-inline"> <input type="radio"
							value="option2" id="sex-woman" name="sex" >女
						</label> <label class="radio-inline"> <input type="radio"
							value="option3" id="sex-non" name="sex" >保密
						</label>
					</div>
				</div>
			</div>
			<br>
			<div>
				<span>等级<input id="myrank" name="myrank" class="form-control" type="text"
					placeholder="等级" readonly></span>
			</div>
			<br>
			<div>
				<span>邮箱<input id="myemail" name="myemail" class="form-control" type="text"
					placeholder="邮箱" readonly><a href="">验证邮箱</a></span>
			</div>
			<br>
			<button type="submit" class="btn btn-default">提交</button>
			</form>
		</div>
		<div class="dl-im" id="UserImg">
			<!-- 登录模块图片区 -->
			<img src=image/013.jpg class=img-circle>
			<div><font id="gold-coin"></font>金币</div>
			
		</div>
	</div>
	<script type="text/javascript" src="js/myprofile.js"></script>
</body>
</html>
