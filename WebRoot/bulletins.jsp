<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/bulletins.css">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/bulletins.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var username="<%=session.getAttribute("username")%>";
	var account="<%=session.getAttribute("account")%>";
	
	if(username!="null"&&username!=""){
	$("#UserLogin").append("<a href=ManagerShopIndex.jsp><span id='user'>欢迎您!"+username+"</span></a>");
	
	$("#selord").click(function(){
	getcount(account);

	});
	$.ajax({
		type : 'post',
		async : false,
		url : "CartCount",
		data : {account:account},
		dataType : 'json', //返回数据形式为json
		success : function(result) {
			$("#CartCount").text(result);
			}
			// set the new data
		});
	}
	else{
	$("#UserLogin").append("<a href=Login.jsp><span id='user'class='b'>登录/注册</span></a>");
	
	}
});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#searchtext").bind("change", function() {
			var a = $("#searchtext").val();
			Search();

		});
	});
</script>

<script type="text/javascript">
$(document).ready(function(){
	var bulletinstit="<%=request.getParameter("bulletintitle") %>";
	$("#title").text(bulletinstit);
	var a;
	$.ajax({
		type : 'post',
		async : false,
		url : "bulletin",
		data : {
		bulletinstit:bulletinstit
		},
		dataType : 'json', //返回数据形式为json
		success : function(result) {
			for(var i = 0; i < Object.keys(result).length; i++){
				a=result[i].bulletins;
			}
			
			
			$("#bdy").append(a);
			}
			// set the new data
		});
});

</script>

</head>

<body>

	<div class="a">
		<div class="dh">
			<nav class="navbar navbar-default dh">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">Brand</a>
				</div>
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false" id="selord">我的219杂货铺 <span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#" target="_blank">未完成订单<span
										id="OrderCount" class="b"></span></a></li>
								<li><a href="#" target="_blank">返修退换货<span
										id="TOrderCount" class="b"></span></a></li>
							</ul></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="MyJsp.jsp" target="_blank">我的订单</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li id="UserLogin"></li>
					</ul>
				</div>
			</div>
			</nav>
		</div>

		<div class="hd">
			<div class="lo">
				<div class="lo-im">
					<img src="image/014.jpg" class="img-rounded im-sz">
				</div>
				<div class="lo-z">
					<h1>
						<span class="label label-info">219</span><small>杂货铺</small>
					</h1>
				</div>
			</div>
			<div class="sec">
				<div class="row se">
					<div class="col-xs-8">
						<div class="form-group ">
							<div class="col-xs-10">
								<div class="input-group  sec-t z">

									<a href="#" class="dropdown-toggle sec-t"
										data-toggle="dropdown" role="button" aria-haspopup="true"
										aria-expanded="true"><input type="text" id="searchtext"
										class="form-control "></a>
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

								</div>
							</div>

							<button id="searchbutton" class="btn btn-danger ">
								<span class="glyphicon glyphicon-search" aria-hidden="true"></span>搜索
							</button>
						</div>
					</div>
					<!--                     购物车                         -->
					<div class="col-xs-2 ">
						<button class="btn btn-default ">
							<span class="glyphicon glyphicon-shopping-cart "></span> <span>我的购物车</span><span
								class="badge " id="CartCount">0</span>
						</button>
					</div>


				</div>
			</div>

		</div>
		<div class="bult">
			<div class="tit">
				<h1>
					<span id="title"></span>
				</h1>
			</div>
			<div class="bdy" id="bdy">
				
			</div>
		</div>
	</div>
</body>
</html>
