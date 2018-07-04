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
<script type="text/ecmascript" src="js/bootstrap-select.js"></script>
<script type="text/javascript" src="js/ManagerListView.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="css/ui.jqgrid-bootstrap.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="css/bootstrap-select.css" />
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
							<h3 id="ShowGoodsList">商品列表</h3>
							<h3 id="addGoodsBt">添加商品</h3>
							<h3 id="modifySku">修改库存</h3>
							<h3 id="ShowDeleteGoodsBt">删除商品</h3>
						</div>
					</li>
					<li>
						<h2 class="obtain">
							订单管理<i></i>
						</h2>
						<div class="secondary">
							<h3 id="ShowOrdersList">订单列表</h3>
							<h3 id="MaintainOrder">管理订单状态</h3>
						</div>
					</li>
					<li>
						<h2 class="obtain">
							用户管理<i></i>
						</h2>
						<div class="secondary">
							<h3 id="ShowUsersList">用户列表</h3>
						</div>
					</li>
					<li>
						<h2 class="obtain">
							商城内容<i></i>
						</h2>
						<div class="secondary">
							<h3 onclick="GotoHomePage()">导航菜单</h3>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<div style="background-color:#e5e5e5;width:100%;height:100%">

		<div class="OutListClass"
			style="margin-left:500px;background-color:#e5e5e5;width:1100px;height:780px"
			id="displayForManager">
			<div class="OutListClass" id="jqTurn"></div>
			<table class="ListTable" id="jqlist"></table>
			<div id="jqGridPager" class="OutListClass"></div>
		</div>

		<div class="OutListClass"
			style="margin-left:1500px;width:200px;height:50px">
			<input id="spec_no" type="text" class="form-control"
				placeholder="商品详情号"> <input id="price" type="text"
				class="form-control" placeholder="商品价格"> <input id="sku"
				type="text" class="form-control" placeholder="商品库存">
			<button id="BtmodifyGoods" class="btn btn-primary"
				style="width:200px;height:50px;" onclick="modifyGoodsInf()">修改商品信息</button>
		</div>
		<!-- 三个模态框激活按钮 -->
		<button id="deleteGoodsBt" type="button" class="btn btn-primary"
			data-toggle="modal" data-target="#DeleteModal">删除商品
		</button>
		
		<button id="addGoodsModal" type="button" class="btn btn-primary"
			data-toggle="modal" data-target="#AddModal">添加商品
		</button>
		
		<button id="MaintainOrderModal" type="button" class="btn btn-primary"
			data-toggle="modal" data-target="#MaintainModal">管理订单状态
		</button>
		
		<!-- 管理订单模态框  -->
		<div class="modal fade" id="MaintainModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">请确定以下信息</h4>
					</div>
					<div class="modal-body">
							<input id="Maintain_no" type="text" class="form-control" placeholder="订单号">
							<select id="Orderstatus_no" class="selectpicker">
							<option value="2">完成</option>
							<option value="3">退款</option>
							<option value="4">删除</option>
						</select> 
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button id="MaintainOrderBt" type="button" class="btn btn-primary">提交</button>
					</div>
				</div>
			</div>
		</div>
	</div>
		
		<!-- 删除商品模态框  -->
		<div class="modal fade" id="DeleteModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">请输入想要删除的商品编号和商品详情号</h4>
					</div>
					<div class="modal-body">
							<input id="DeleteGoods_no" type="text" class="form-control" placeholder="商品编号">
							<input id="DeleteSpec_no" type="text" class="form-control" placeholder="商品详情号">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button id="deleteGoods" type="button" class="btn btn-primary">提交</button>
					</div>
				</div>
			</div>
		</div>
	</div>

		<!-- 添加商品模态框  -->
		<div class="modal fade" id="AddModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">确定添加商品信息</h4>
					</div>
					<div class="modal-body">
						<input id="modal_goods_no" type="text" class="form-control"
							placeholder="商品编号">
							<input id="modal_goods_name" type="text" class="form-control" placeholder="商品名称">
							<input id="modal_goods_discount" type="text" class="form-control" placeholder="商品折扣">
							<input id="modal_goods_status" type="text" class="form-control" placeholder="商品状态">
							 <select id="modal_select1" class="selectpicker">
							<option value="sort_a">牛奶</option>
							<option value="sort_b">电子产品</option>
							<option value="sort_c">书籍</option>
							<option value="sort_d">军事</option>
							<option value="sort_e">家用电器</option>
							<option value="sort_f">其他</option>
						</select> 
						<select id="modal_select2" class="selectpicker">
							<option value="brand_a">苹果</option>
							<option value="brand_b">小米</option>
							<option value="brand_c">一加</option>
							<option value="brand_d">蒙牛</option>
							<option value="brand_e">伊利</option>
							<option value="brand_f">其他</option>
							<option value="brand_g">杂货单专属</option>
							<option value="brand_h">伊利</option>
							<option value="brand_i">旺旺</option>
							<option value="brand_j">光明</option>
							<option value="brand_k">格力</option>
						</select> 
							<input id="modal_spec_no" type="text" class="form-control" placeholder="商品详情号">
							<input id="modal_spec_type" type="text" class="form-control" placeholder="商品规格"><!-- GoodsList未显示 -->
							<input id="modal_price" type="text" class="form-control" placeholder="商品价格">
							<input id="modal_sku" type="text" class="form-control" placeholder="商品库存">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button id="addNewGoods" type="button" class="btn btn-primary">提交</button>
					</div>
				</div>
			</div>
		</div>
	</div>


		<script type="text/javascript">
			$.jgrid.defaults.width = 780;
			$.jgrid.defaults.styleUI = 'Bootstrap';
		</script>

		<script>
			$("#ShowGoodsList").click(function() {
			$("#MaintainOrderModal").hide();
				$("#jqTurn").empty();
				$("#jqTurn").append('<table id="jqlist"></table><div id="jqGridPager"></div>');
				$("#jqlist").jqGrid({
					colModel : [
						{
							label : '商品编号',
							name : 'goods_no',
							sorttype : 'goods_no',
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
				$("#BtmodifyGoods").hide();
				$("#spec_no").hide();
				$("#price").hide();
				$("#sku").hide();
				$("#deleteGoodsBt").hide();
				$("#addGoodsModal").hide();
				$("#MaintainOrderModal").hide();
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
					caption : "用户信息"
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

		<script>
			$("#ShowOrdersList").click(function() {
				$("#BtmodifyGoods").hide();
				$("#spec_no").hide();
				$("#price").hide();
				$("#sku").hide();
				$("#deleteGoodsBt").hide();
				$("#addGoodsModal").hide();
				$("#jqTurn").empty();
				$("#jqTurn").append('<table id="jqlist"></table><div id="jqGridPager"></div>');
				$("#jqlist").jqGrid({
					colModel : [
						{
							label : '订单号',
							name : 'order_no',
							width : 80,
							height : 80,
						},
						{
							label : '用户名',
							name : 'account',
							width : 60,
						},
						{
							label : '地址',
							name : 'address_no',
							width : 60,
						},
						{
							label : '产生时间',
							name : 'order_time',
							width : 90,
						},
						{
							label : '订单状态',
							name : 'order_status',
							width : 60,
						},
						{
							label : '快递信息',
							name : 'express_no',
							width : 70,
						},
						{
							label : '商品总数量',
							name : 'total_count',
							width : 80,
						},
						{
							label : '订单总金额',
							name : 'total_money',
							width : 80,
						}
					],
		
					viewrecords : true, // show the current page, data rang and total records on the toolbar
					height : 800,
					width : 1100,
					rowNum : 60,
					datatype : 'local',
					pager : "#jqGridPager",
					caption : "总订单信息"
				});
		
				fetchOrdersData(); //获取FindGoodsListController返回的JSON数据
		
				function fetchOrdersData() {
					var gridArrayData = [];
					// show loading message
					$("#jqlist")[0].grid.beginReq();
					$.ajax({
						type : 'post',
						async : false,
						url : "JSONOrdersList",
						data : {},
						dataType : 'json', //返回数据形式为json
						success : function(result) {
							for (var i = 0; i < Object.keys(result).length; i++) {
								gridArrayData.push({
									order_no : result[i].order_no,
									account : result[i].account,
									address_no : result[i].address_no,
									order_time : result[i].order_time,
									order_status : result[i].order_status,
									express_no : result[i].express_no,
									total_count : result[i].total_count,
									total_money : result[i].total_money,
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