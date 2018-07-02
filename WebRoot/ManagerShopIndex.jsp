<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!doctype html>
<html lang="en">
<head>

<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/ecmascript" src="js/grid.locale-cn.js"></script>
<script type="text/ecmascript" src="js/jquery.jqGrid.min.js"></script>
<script type="text/javascript" src="js/ManagerListView.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="css/ui.jqgrid-bootstrap.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="css/bootstrap.css" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="ie=edge">



<script src="js/Manageradapter.js"></script>
<!--rem适配js-->
<script src="js/Managermenu.js"></script>
<!--控制js-->

<link rel="stylesheet" href="css/Managerbase.css">
<!--初始化文件-->
<link rel="stylesheet" href="css/Managermenu.css">
<!--主样式-->
<link rel="stylesheet" href="css/Manageradd.css">
<!--新增样式-->
<title>商城管理</title>
</head>
<body>
	<header class="navbar-wrapper">

		<p style="text-align: center;line-height: 50px;font-size:20px;">管理界面</p>

	</header>
			
	<div id="menu">
		<!--隐藏菜单-->
		<div id="ensconce">
			<h2>
				<img src="images/show.png" alt=""> 展开菜单
			</h2>
		</div>

		<!--显示菜单-->
		<div id="open">
			<div class="navH">
				主菜单 <span><img class="obscure" src="images/obscure.png"
					alt=""></span>
			</div>
			<div class="navBox">
				<ul>
					<li>
						<h2 class="obtain">
							商品管理<i></i>
						</h2>
						<div class="secondary">
							<h3 id="addGoods">添加商品</h3>
							<h3 onclick="display_alert()">添加SKU</h3>
							<h3 id="ShowGoodsList">在售商品</h3>
							<h3>下架商品</h3>
							<h3>定时商品</h3>
							<h3>回收站</h3>
						</div>
					</li>
					<li>
						<h2 class="obtain">
							订单管理<i></i>
						</h2>
						<div class="secondary">
							<h3>订单列表</h3>
							<h3>打印订单</h3>
							<h3>配送</h3>
							<h3>退款列表</h3>
						</div>
					</li>
					<li>
						<h2 class="obtain">
							用户管理<i></i>
						</h2>
						<div class="secondary">
							<h3 id="ShowUsersList">用户列表</h3>
							<h3>积分设置</h3>
							<h3>会员等级</h3>
							<h3>管理员组</h3>
						</div>
					</li>
					<li>
						<h2 class="obtain">
							商城内容<i></i>
						</h2>
						<div class="secondary">
							<h3>导航菜单</h3>
							<h3>商城帮助</h3>
							<h3>友情链接</h3>
							<h3>banner流动广告</h3>
						</div>
					</li>
					<li>
						<h2 class="obtain">
							商品性质<i></i>
						</h2>
						<div class="secondary">
							<h3>商品品牌管理</h3>
							<h3>商品分类管理</h3>
						</div>
					</li>
					<li>
						<h2 class="obtain">
							系统设置<i></i>
						</h2>
						<div class="secondary">
							<h3>站点信息</h3>
							<h3>商城设置</h3>
							<h3>账户设置</h3>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<div style="background-color:#e5e5e5;width:100%;height:100%">

		<div class="OutListClass"
			style="margin-left:500px;background-color:#e5e5e5;width:900px;height:780px"
			id="displayForManager">
			<div class="OutListClass" id="jqTurn"></div>
			<table class="ListTable" id="jqlist"></table>
			<div id="jqGridPager" class="OutListClass"></div>
		</div>
		
		<div class="OutListClass" style="margin-left:1500px;width:200px;height:50px">
			 <input id="spec_no" type="text" class="form-control" placeholder="spec_no">
			  <input id="price" type="text" class="form-control" placeholder="price">
			  <input id="sku" type="text" class="form-control" placeholder="sku">
			<button id="BtmodifyGoods" class="btn btn-primary"  style="width:200px;height:50px;" onclick="modifyGoodsInf()">修改商品信息</button>
			</div>

	</div>

	<script type="text/javascript">
		$.jgrid.defaults.width = 780;
		$.jgrid.defaults.styleUI = 'Bootstrap';
	</script>

	<script>
		$("#ShowGoodsList").click(function() {
			$("#jqTurn").empty();
			$("#jqTurn").append('<table id="jqlist"></table><div id="jqGridPager"></div>');
			$("#jqlist").jqGrid({
				colModel : [
					{
						label : '商品编号',
						name : 'goods_no',
						sorttype:'goods_no',
						width : 60,
						height : 80,
					},
					{
						label : '商品名称',
						name : 'goods_name',
						width : 100,
					},
					{
						label : '商品折扣',
						name : 'goods_discount',
						width : 60,
						sorttype : 'integer',
						formatter : 'number',
					},
					{
						label : '商品状态',
						name : 'goods_status',
						width : 60,
						sorttype : 'integer',
						formatter : 'number',
					},
					{
						label : '商品分类',
						name : 'sort_no',
						width : 60,
					},
					{
						label : '商品品牌',
						name : 'brand_no',
						width : 60,
					},
					{
						label : '商品详情号',
						name : 'spec_no',
						width : 60,
					},
					{
						label : '商品价格',
						name : 'price',
						width : 60,
					},
					{
						label : '商品库存',
						name : 'sku',
						width : 60,
					}
				],
	
				viewrecords : true, // show the current page, data rang and total records on the toolbar
				height : 800,
				width : 950,
				rowNum : 60,
				datatype : 'local',
				pager : "#jqGridPager",
				caption : "商品信息"
			});
	
			fetchGoodsData(); //获取FindGoodsListController返回的JSON数据
			function fetchGoodsData() {
				var gridArrayData = [];
				// show loading message
				$("#jqlist")[0].grid.beginReq();
				$.ajax({
					type : 'post',
					async : false,
					url : "JSONGoodsList",
					data : {},
					dataType : 'json', //返回数据形式为json
					success : function(result) {
						console.log(result);
						for (var i = 0; i < Object.keys(result).length; i++) {
							gridArrayData.push({
								goods_no : result[i].goods_no,
								goods_name : result[i].goods_name,
								goods_discount : result[i].goods_discount,
								goods_status : result[i].goods_status,
								sort_no : result[i].sort_no,
								brand_no : result[i].brand_no,
								spec_no : result[i].spec_no,
								price : result[i].price,
								sku : result[i].sku
							});
						}
						// set the new data
						$("#jqlist").jqGrid('setGridParam', {
							data : gridArrayData
						});
						// hide the show message
						$("#jqlist")[0].grid.endReq();
						// refresh the grid
						$("#jqlist").trigger('reloadGrid');
					}
				});
			}
		}
		)
	</script>
	
	<script>
		$("#ShowUsersList").click(function() {
			$("#jqTurn").empty();
			$("#jqTurn").append('<table id="jqlist"></table><div id="jqGridPager"></div>');
			$("#jqlist").jqGrid({
				colModel : [
					{
						label : '用户名',
						name : 'username',
						width : 60,
						height : 80,
					},
					{
						label : '帐户名',
						name : 'account',
						width : 60,
					},
					{
						label : '密码',
						name : 'password',
						width : 60,
					},
					{
						label : '性别',
						name : 'mem_sex',
						width : 60,
					},
					{
						label : '邮箱',
						name : 'e_mail',
						width : 90,
					},
					{
						label : '支付密码',
						name : 'pay_psd',
						width : 90,
					},
					{
						label : '用户等级',
						name : 'mem_rank',
						width : 60,
					},
					{
						label : '用户类型',
						name : 'mem_kind',
						width : 60,
					},
					{
						label : '金币数量',
						name : 'gold_coin',
						width : 60,
						sorttype : 'integer',
						formatter : 'number',
					}
				],
	
				viewrecords : true, // show the current page, data rang and total records on the toolbar
				height : 800,
				width : 900,
				rowNum : 60,
				datatype : 'local',
				pager : "#jqGridPager",
				caption : "用户信息信息"
			});
	
			fetchUsersData(); //获取FindGoodsListController返回的JSON数据
			
			function fetchUsersData() {
				var gridArrayData = [];
				// show loading message
				$("#jqlist")[0].grid.beginReq();
				$.ajax({
					type : 'post',
					async : false,
					url : "JSONUserList",
					data : {},
					dataType : 'json', //返回数据形式为json
					success : function(result) {
						console.log(result);
						for (var i = 0; i < Object.keys(result).length; i++) {
							gridArrayData.push({
								username : result[i].username,
								account : result[i].account,
								password : result[i].password,
								mem_sex : result[i].mem_sex,
								e_mail : result[i].e_mail,
								pay_psd : result[i].pay_psd,
								mem_rank : result[i].mem_rank,
								mem_kind : result[i].mem_kind,
								gold_coin : result[i].gold_coin
							});
						}
						// set the new data
						$("#jqlist").jqGrid('setGridParam', {
							data : gridArrayData
						});
						// hide the show message
						$("#jqlist")[0].grid.endReq();
						// refresh the grid
						$("#jqlist").trigger('reloadGrid');
					}
				});
			}
		}
		)
	</script>
</body>
</html>