$(document).ready(function() {

	var account = getAccount();
	//alert(account);

	$.ajax({
		async : false,
		type : "GET",
		url : "myaddress?account=a", //+account,
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
				$("#adpanel" + i).append('<button type="button" class="btn btn-btn-warning btn-sm" value='+result[i].address_no+' id="setaddress' + result[i].address_no + '">修改收货地址</button>');
			}

		},
		error : function(result) {
			console.log("失败" + result);
		}
	})

})

$(function(){
	$("button[id$=setaddress]").blur(function(){
		
		var address_no=$("button[id$=setaddress]").val();
		
		$.ajax({
			async : false,
			type : "GET",
			url : "byaddressno?address_no="+address_no, //+account,
			data : {},
			datatype : "json",
			success : function(result) {

				

			},
			error : function(result) {
				console.log("失败" + result);
			}
		})
		
	})
})