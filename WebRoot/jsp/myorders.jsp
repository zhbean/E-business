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

<title>My JSP 'myorders.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/profile.css">
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>


<script type="text/ecmascript" src="js/grid.locale-cn.js"></script>

<script type="text/ecmascript" src="js/jquery.jqGrid.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="css/ui.jqgrid-bootstrap.css" />

<script>
	$.jgrid.defaults.width = 780;
	$.jgrid.defaults.responsive = true;
	$.jgrid.defaults.styleUI = 'Bootstrap';
</script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
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
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">搜索</button>
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
		<div>
			<div>
				<div style="margin-left:20px">
					<h3>我的订单</h3>
				</div>
				<div>
					<table id="jqGrid"></table>
					<div id="jqGridPager"></div>
					<br /> <br />
				</div>
			</div>
		</div>
		<div class="dl-im" id="UserImg">
			<!-- 登录模块图片区 -->
			<img src=image/013.jpg class=img-circle>
			<div>
				<font id="gold-coin"></font>
			</div>
		</div>
	</div>


	<script type="text/javascript">
	
		$(document).ready(function() {
			$("#jqGrid").jqGrid({
				async : true,
				url : 'myorders?account=a',
				mtype : 'POST',
				datatype : "json",
				colModel : [
	
					{
						label : '订单编号',
						name : 'order_no',
						width : 85,
						key : true
					},
					{
						label : '订单时间',
						name : 'order_time',
						width : 85
					},
					{
						label : '物流公司',
						name : 'express_name',
						width : 50
					},
					{
						label : '金额',
						name : 'sum_price',
						width : 40
					},
					{
						label : '订单状态',
						name : 'order_status',
						width : 60
					},
					{
						label : '支付',
						name : 'pay_btn',
						width : '35',
						formatter : function(cellvalue, {rowId: rid}, rowObject) {
							// do something here	
							console.log(rid);
							var new_format_value = '<a href="<%=basePath%>'+rid+'.jsp"><button type="button" style="width:60px">去支付</button></a>'
							return new_format_value
						}
					},
					{
						label : '退货',
						name : 'returns',
						width : 30,
						formatter : function(cellvalue, {rowId: rid}, rowObject) {
							// do something here
							console.log(cellvalue)
							var new_format_value = '<a href="<%=basePath%>'+rid+'.jsp"><button type="button" style="width:50px">退货</button></a>'
							return new_format_value
						}
					},
					{
						label : '操作',
						name : "actions",
						width : 30,
						formatter : "actions",
						formatoptions : {
							url:"delmyorder?order_no=",
							delOptions : {}
						}
					},
				// sorttype is used only if the data is loaded locally or loadonce is set to true
				],
				loadonce : true,
				viewrecords : true,
				width : 900,
				height : '70%',
				rowNum : 20,
				rowList : [ 20, 30, 50 ],
				rownumbers : true,
				rownumWidth : 25,
				multiselect : true,
				subGrid : true,
				subGridRowExpanded : showChildGrid, // javascript function that will take care of showing the child grid
				subGridOptions : {
					// expand all rows on load
					"expandOnLoad" : true,
				},
				pager : "#jqGridPager"
			});
	
			function showChildGrid(parentRowID, parentRowKey) {
				var childGridID = parentRowID + "_table";
				var childGridPagerID = parentRowID + "_pager";
	
				// send the parent row primary key to the server so that we know which grid to show
				//var childGridURL = parentRowKey + ".json";
				console.log(parentRowKey);
				//childGridURL = childGridURL + "&parentRowID=" + encodeURIComponent(parentRowKey)
	
				// add a table and pager HTML elements to the parent grid row - we will render the child grid here
				$('#' + parentRowID).append('<table id=' + childGridID + '></table><div id=' + childGridPagerID + ' class=scroll></div>');
	
				$("#" + childGridID).jqGrid({
					url : "myorderdetails?order_no=" + parentRowKey,
					mtype : "POST",
					datatype : "json",
					page : 1,
					colModel : [
						{
							label : '商品图片',
							name : 'goods_img',
							key : true,
							width : 50,
							formatter : function(cellvalue, options, rowObject) {
								// do something here
								console.log(cellvalue)
								var new_format_value = '<img alt="杂货铺" src="' + cellvalue + '" height=50px></a>'
								return new_format_value
							}
						},
						{
							label : '商品名称',
							name : 'goods_name',
							width : 100,
							//key:true,
							formatter : function(cellvalue, options, rowObject) {
								// do something here

								var new_format_value = '<a id="goodsdetails" href="<%=basePath%>goodsdetails.jsp?goodsname="+cellvalue>'+cellvalue+'</a>'
								return new_format_value
							}
						},
						{
							label : '商品规格',
							name : 'spec_type',
							width : 100
						},
						{
							label : '商品数量',
							name : 'goods_count',
							width : 50
						}
					],
					loadonce : true,
					width : 780,
					height : '100%',
					/* loadComplete : (function() {
							$('.glyphicon,.glyphicon-triangle-bottom,.glyphicon-triangle-right').trigger('click');
					}), */
					pager : "#" + childGridPagerID
				});
	
			}
	
	
			$('#jqGrid').navGrid("#jqGridPager", {
				search : true, // show search button on the toolbar
				add : false,
				edit : false,
				del : false,
				refresh : true
			});
		});
	</script>
	<script type="text/javascript">
	 		$(function() {
				$('#goodsimg').blur(function() {
				$('#goodsdetails').trigger('click');
					alert('button is clicking！');
				});
				
			})
	</script>

</body>
</html>
