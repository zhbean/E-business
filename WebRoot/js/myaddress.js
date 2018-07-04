$(document).ready(function() {
	var te = '${upsuccess}';
	console.log(te);
	if ("true" == '${upsuccess}') alert("修改成功");

	var account = getAccount();


	$.ajax({
		async : false,
		type : "GET", //临时修改
		url : "myaddress?account="+account, //+account,
		data : {},
		datatype : "json",
		success : function(result) {

			for (i = 0; i < result.length; i++) {
				$("#detailshow").append('<div class="panel panel-default" id="adpanel' + i + '"></div>');
				$("#adpanel" + i).append('<table id="adtable' + i + '"></table>');
				$("#adtable" + i).append('<tr><td>收货人：' + result[i].buyer_name + '</td></tr>');
				$("#adtable" + i).append('<tr><td>所在地区：' + result[i].area + '</td></tr>');
				$("#adtable" + i).append('<tr><td>收货地址：' + result[i].address_detail + '</td></tr>');
				$("#adtable" + i).append('<tr><td>电话：' + result[i].phone_number + '</td></tr>');
				$("#adpanel" + i).append('<button type="button" class="btn btn-warning upd" id=' + result[i].address_no + '>修改收货地址</button>');
				$("#adpanel" + i).append('<button type="button" class="btn btn-primary del" id=' + result[i].address_no + '>删除收货地址</button>');

			}

		},
		error : function(result) {
			console.log("失败" + result);
		}
	})

})

$(function() {
	$("button:button.upd").click(function() {
		$("#opt-address").html = "";
		var address_no = $(this).attr("id");

		$.ajax({
			async : false,
			type : "POST",
			url : "byaddressno?address_no=" + address_no,
			data : {},
			datatype : "json",
			success : function(result) {

				i = 0;
				$("#opt-address").prepend('<div class="panel panel-default" id="adpanel' + i + '"></div>');
				$("#adpanel" + i).append('<form action="updateaddress" type="post" id="adform' + i + '">');
				$("#adform" + i).append('<input	name="address_no" type="hidden" value=' + result[i].address_no + '>');
				$("#adform" + i).append('收货人：<input	name="buyer_name" type="text" class="form-control" value=' + result[i].buyer_name + '>');
				$("#adform" + i).append('所在地区：<input name="area" type="text" class="form-control" value=' + result[i].area + '>');
				$("#adform" + i).append('收货地址：<input name="address_detail" type="text" class="form-control" value=' + result[i].address_detail + '>');
				$("#adform" + i).append('电话：<input name="phone_number" type="text" class="form-control" value=' + result[i].phone_number + '>');
				$("#adform" + i).append('<button type="submit" class="btn btn-primary btn-sm" id="btnupdateaddress">确认修改收货地址</button>');
				$("#adform" + i).append('<button type="button" class="btn btn-danger btn-sm" id="btncancle">取消修改收货地址</button>');


			},
			error : function(result) {
				console.log("失败" + result);
			}
		})
	})

	$("button:button.del").click(function() {

		var address_no = $(this).attr("id");

		$.ajax({
			async : false,
			type : "POST",
			url : "deladdress?address_no=" + address_no,
			data : {},
			datatype : "json",
			success : function(result) {
				window.location.reload();
				console.log("成功" + result);
			},
			error : function(result) {
				console.log("失败" + result);
			}
		})
	})


	$("#newaddress").click(function() {
		$("#opt-address").html = "";


		$.ajax({
			async : false,
			type : "GET",
			url : "addaddress", //?account=a",
			data : {},
			datatype : "json",
			success : function(result) {

				$("#opt-address").prepend('<div class="panel panel-default" id="add-adpanel"></div>');
				$("#add-adpanel").append('<form action="addaddress" type="post" id="add-adform">');
				$("#add-adform").append('<input	name="account" type="hidden" value=a>');
				$("#add-adform").append('收货人：<input	name="buyer_name" type="text" class="form-control" >');
				$("#add-adform").append('所在地区：<input name="area" type="text" class="form-control" >');
				$("#add-adform").append('收货地址：<input name="address_detail" type="text" class="form-control" >');
				$("#add-adform").append('电话：<input name="phone_number" type="text" class="form-control" >');
				$("#add-adform").append('<button type="submit" class="btn btn-primary" id="btnaddaddress">添加收货地址</button>');
				$("#add-adform").append('<button type="button" class="btn btn-danger btn-sm" id="btncancle">取消添加收货地址</button>');

			},
			error : function(result) {
				console.log("失败" + result);
			}
		})

	})
	
	$("#btncancle").click(function(){
		alert("取消");
		$("#opt-address").html="";
	})
})