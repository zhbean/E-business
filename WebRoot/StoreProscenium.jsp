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
<link rel="stylesheet" type="text/css" href="css/StoreProsenium.css">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/StoreProscenium.js"></script>
</head>
<!--      导航条登录        -->
<script type="text/javascript">
$(document).ready(function(){
	var username="<%=session.getAttribute("username") %>";
	var account="<%=session.getAttribute("account") %>";
	$.ajax({
		type : 'post',
		async : false,
		url : "bulletintitle",
		data : {},
		dataType : 'json', //返回数据形式为json
		success : function(result) {
			for(var i = 0; i < Object.keys(result).length; i++){
				$("#notice").append("<li class=gong-zhan-news><a href=bulletins.jsp?bulletintitle="+result[i].bulletinstit+" target=_blank>"+result[i].bulletinstit+"</a></li>");
			}
			}
			// set the new data
		});
	
	if(username!="null"&&username!=""){
	$("#UserLogin").append("<a href=ManagerShopIndex.jsp><span id='user'>欢迎您!"+username+"</span></a>");
	$("#UserImg").append("<a href=ManagerShopIndex.jsp><img src=image/013.jpg class=img-circle></a>");
	$("#Userlo").append("<a href=ManagerShopIndex.jsp><h2>"+username+"</h2></a>");
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
							aria-expanded="false" id="selord">我的219杂货铺 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#" target="_blank">未完成订单<span id="OrderCount"class="b"></span></a></li>
								<li><a href="#" target="_blank">返修退换货<span id="TOrderCount"class="b"></span></a></li>
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
										aria-expanded="true"
										><input type="text" id="searchtext" class="form-control "></a>
										<ul class="dropdown-menu sec-t" >
											<li ><a href="#" target="_blank" id="1"></a></li>
											<li ><a href="#" target="_blank" id="2"></a></li>
											<li ><a href="#" target="_blank" id="3"></a></li>
											<li ><a href="#" target="_blank" id="4"></a></li>
											<li ><a href="#" target="_blank" id="5"></a></li>
											<li ><a href="#" target="_blank" id="6"></a></li>
											<li ><a href="#" target="_blank" id="7"></a></li>
											<li ><a href="#" target="_blank" id="8"></a></li>
											<li ><a href="#" target="_blank" id="9"></a></li>
											<li ><a href="#" target="_blank" id="10"></a></li>
										</ul>
									
								</div>
							</div>

							<button id="searchbutton"class="btn btn-danger ">
								<span class="glyphicon glyphicon-search" aria-hidden="true"></span>搜索
							</button>
						</div>
					</div>
					<!--                     购物车                         -->
					<div class="col-xs-2 ">
						<button class="btn btn-default " id="cartButton">
							<span class="glyphicon glyphicon-shopping-cart "></span> <span>我的购物车</span><span
								class="badge " id="CartCount">0</span>
						</button>
					</div>

					<div class="row sec-dh">
						<nav class="navbar ">
						<div class="container-fluid">

							<div class="collapse navbar-collapse"
								id="bs-example-navbar-collapse-1">

								<ul class="nav navbar-nav navbar-left">
									<li><a href="MyJsp.jsp" target="_blank">杂货铺会员</a></li>
								</ul>
								<ul class="nav navbar-nav navbar-left">
									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-haspopup="true"
										aria-expanded="false" >我的219杂货铺 <span class="caret"></span></a>
										<ul class="dropdown-menu">
											<li><a href="#" target="_blank">未完成订单<span class="b">0</span></a></li>
											<li><a href="#" target="_blank">返修退换货<span class="b">0</span></a></li>

											<li role="separator" class="divider"></li>
											<li><a href="#" target="_blank">我的金币</a></li>
										</ul></li>
								</ul>
								<ul class="nav navbar-nav navbar-left">
									<li><a href="MyJsp.jsp" target="_blank">订单</a></li>
								</ul>
								<ul class="nav navbar-nav navbar-left">
									<li><a href="MyJsp.jsp" target="_blank"><span
											class="c">折扣商品</span></a></li>
								</ul>

							</div>
						</div>
						</nav>
					</div>
				</div>
			</div>

		</div>
		<div class="ce">
			<div class="fl u">
				<div class="text-center x">
					
					<ul class=" list-unstyled">

						<li><a>苹果</a><span>/</span><a>小米</a><span>/</span><a>一加</a></li>
						<li><a>蒙牛</a><span>/</span><a>伊利</a><span>/</span><a>其他</a></li>
						<li><a>伊利</a><span>/</span><a>旺旺</a><span>/</span><a>光明</a></li>
						<li><a>格力</a><span>/</span><a>杂货单专属</a></li>

					</ul>
				</div>

			</div>
			<div class="lgt">
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						<li data-target="#carousel-example-generic" data-slide-to="3"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active lunbotu">
							<a href="goodsdetails.jsp?goodsname=小米8" target="_blank"><img src="goodsimg/xiaomi8.jpg"
								class="lunbotu"></a>
							<div class="carousel-caption"><h1 class="b">小米8震撼来袭<br><small >使用了晓龙845</small></h1></div>
						</div>
						<div class="item lunbotu" >
							<a href="goodsdetails.jsp?goodsname=伊利纯牛奶" target="_blank"><img src="goodsimg/yilichunniunai.jpg"
								class="lunbotu"></a>
							<div class="carousel-caption"><h1 class="b"><small >惊爆价</small>¥30</h1></div>
						</div>
						<div class="item lunbotu">
							<a href="goodsdetails.jsp?goodsname=格力空调" target="_blank"><img src="goodsimg/geilikongtiao.jpg"
								class="lunbotu"></a>
							<div class="carousel-caption"><h1 class="b">格力空调，好的选择</h1></div>
						</div>
						<div class="item lunbotu">
							<a href="goodsdetails.jsp?goodsname=一加6" target="_blank"><img src="goodsimg/yijia6.jpg"
								class="lunbotu"></a>
							<div class="carousel-caption"><h1 class="b">一加6震撼来袭</h1></div>
						</div>
					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#carousel-example-generic"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="gt">
				<div class="gt-a">
					<a href="goodsdetails.jsp?goodsname=苹果x" target="_blank"><img src="goodsimg/iphone10.jpg"
						alt="..." class="img-rounded inadm"></a>
						
				</div>
				<div class="gt-a">
					<a href="goodsdetails.jsp?goodsname=歼20" target="_blank"><img src="goodsimg/jian20.jpg"
						alt="..." class="img-rounded inadm"></a>
				</div>
				<div class="gt-a">
					<a href="goodsdetails.jsp?goodsname=95式自动步枪" target="_blank"><img src="goodsimg/95shibuqiang.jpg"
						alt="..." class="img-rounded inadm"></a>
				</div>
			</div>
			<div class="dlg">
				<div class="dl">
					<div class="dl-im" id="UserImg">
						<!-- 登录模块图片区 -->
					</div>
					<div class="dl-u" id="Userlo">
					<!-- 登录模块按钮区 -->
					</div>
				</div>
				<div class="gong">
					<div class="gont-t">
						<h4>
							<a href="#"><span class="label label-danger">公告</span></a>
						</h4>
					</div>
					<div class="gong-zhan">
						<ul id="notice">
							
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="ds">
			<div class="ds-title"><h2 class="ds-t">商品总览</h2></div>
			<div class="ds-gods">
				<ul class="list-unstyled list-inline" id="ulgoods">
					

				</ul>
			</div>
			<div class="btm"><h1> 已达最底层</h1></div>
		</div>
		
	</div>
	
</body>

<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type : 'post',
		async : false,
		url : "goodsdetails",
		data : {},
		dataType : 'json', //返回数据形式为json
		success : function(result) {
			for(var i = 0; i < Object.keys(result).length; i++){
			$("#ulgoods").append("<li class='ds-gods-l'><a href=goodsdetails.jsp?goodsname="+result[i].goodsname+" target=_blank>"+
			"<div class='ds-gods-img-di'><img src="+result[i].goodsimgadrs+" class='img-thumbnail ds-gods-img'></div>"+
			"<div class='ds-gods-nd'>=<p><h2>"+result[i].goodsname+"</h2></p><h4 class='b'><i>¥</i><span>"+result[i].price+"</span></h4></div></a></li>");
			}
			}
			// set the new data
		});
		$("#cartButton").click(function(){
			
			window.open('cart.jsp');
		});
});
</script>
</html>




