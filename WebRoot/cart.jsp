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
<link rel="stylesheet" type="text/css" href="css/cart.css">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/cart.js"></script>
</head>


<script type="text/javascript">
$(document).ready(function(){
	var username="<%=session.getAttribute("username") %>";
	var account="<%=session.getAttribute("account") %>";

	
	if(username!="null"&&username!=""){
	$("#UserLogin").append("<a href=ManagerShopIndex.jsp><span id='user'>欢迎您!"+username+"</span></a>");
	$("#UserImg").append("<a href=ManagerShopIndex.jsp><img src=image/013.jpg class=img-circle></a>");
	$("#Userlo").append("<a href=ManagerShopIndex.jsp><h2>"+username+"</h2></a>");
	$("#selord").click(function(){
	getcount(account);	
	});
	
	}
	else{
	$("#UserLogin").append("<a href=Login.jsp><span id='user'class='b'>登录/注册</span></a>");
	$("#UserImg").append("<a href=Login.jsp><img src=image/013.jpg class=img-circle></a>");
	$("#Userlo").append("<div class=dl-bf ><button class=btn btn-default btn-ms>登录</button></div><div class=dl-br><button class=btn btn-default btn-ms>注册</button></div>");
	}
});
</script>

<script type="text/javascript">
$(document).ready(function(){
	$("#searchtext").bind("change",function(){
		var a=$("#searchtext").val();
		Search();
		
	});
});
</script>


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


				</div>
			</div>

		</div>
		<div class="za"><h2>我的购物车</h2></div>
		
		<div class="sd">
			<table class="table table-striped">
			<thead class="ca">
				<tr>
				<td><div class="shang-head">商品</div></td>
				<td><div class="danjia-head">单价</div></td>
				<td><div class="shuliang-head">数量</div></td>
				<td><div class="xiaoji-head">小计</div></td>
				<td><div class="caozuo-head">操作</div></td>
				</tr>
			</thead>
 			<tbody id="cartgooodstdId">
 				
 			</tbody>
			</table>
		<div class="jiesan"><button class="btn btn-danger jsa">去结算</button></div>
		<div class="bottm"></div>
		</div>
	</div>
	<script type="text/javascript">
$(document).ready(function(){
	$("#abtncl").click(function(){
		
	});
});
</script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#countView").bind("change", function() {
			var a = $("#countView").val();
			var patt = /^[0-9]+/g;
			var c = a.match(patt);
			if (c != null) {
				$("#countView").val(c);
			} else {
				$("#countView").val(1);
			}
			if ($("#countView").val()!= 1) {
				$("#countSbtBtn").removeAttr("disabled");
			} else {
				$("#countSbtBtn").attr("disabled", "disabled");
			}
		});

		$("#countAdBtn").click(function() {
			var a = $("#countView").val();
			a = Number(a);
			$("#countView").val(a + 1)
			if ($("#countView").val() != 1) {
				$("#countSbtBtn").removeAttr("disabled");
			} else {
				$("#countSbtBtn").attr("disabled", "disabled");
			}
		});

		$("#countSbtBtn").click(function() {
			var a = $("#countView").val();
			a = Number(a);
			$("#countView").val(a - 1)
			if ($("#countView").val() != 1) {
				$("#countSbtBtn").removeAttr("disabled");
			} else {
				$("#countSbtBtn").attr("disabled", "disabled");
			}
		});
	});
</script>

<script type="text/javascript">
$(document).ready(function(){
	var account="<%=session.getAttribute("account") %>";
	$.ajax({
		type : 'post',
		async : false,
		url : "getcartgoods",
		data : {account:account},
		dataType : 'json', //返回数据形式为json
		success : function(result) {
			
			for(var i = 0; i < Object.keys(result).length; i++){
				$("#cartgooodstdId").append("<tr>"+
 					"<td><div class='shang'><a id='abtncl' href='goodsdetails.jsp?goodsname="+result[i].goodsname+"'><div class='shang-tu'><img src='"+result[i].goodsimgadrs+"' class='imgsz'></div>"+
 					"<div class='shang-jie'>商品名:"+result[i].goodsname+"  "+"规格:"+result[i].spectype+"</div></div></a></td>"+
 					"<td><div class='danjia'>¥"+result[i].price+"</div></td>"+
 					"<td><div class='shuliang'><button class='btnsz' disabled='disabled' id='countSbtBtn'>-</button>"+
 					"<input type='text' class='iptx' value='"+result[i].goodscount+"' id='countView'><button class=' btnsz' id='countAdBtn'>+</button></div></td>"+
 					"<td><div class='xiaoji'>¥"+result[i].price*result[i].goodscount+"</div></td>"+
 					"<td><div class='caozuo'><a target=_blank href='delcart?specno="+result[i].specno+"&&account="+account+"'>删除</a></div></td></tr>");
			}
			}
		});
	

});
</script>
</body>	
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			






















</html>
