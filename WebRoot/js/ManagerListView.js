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
					goods_status : "在售商品",
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

$(document).ready(function(){
  $("#BtmodifyGoods").hide();
  $("#BtAddNewGoods").hide();
  $("#spec_no").hide();
  $("#price").hide();
  $("#sku").hide();
  $("#addGoods").hide();
  $("#modifySku").click(function () {
	  $("#spec_no").show();
	  $("#price").show();
	  $("#sku").show();
	  $("#addGoods").show();
  });
  $("#addGoodsBt").click(function () {
	  $("#addGoods").show();
  });
  $("#addNewGoods").click(function () {
		alert("提交");
		var modal_goods_no = document.getElementById("modal_goods_no").value;
		var modal_goods_name = document.getElementById("modal_goods_name").value;
		var modal_goods_discount = document.getElementById("modal_goods_discount").value;
		var modal_goods_status = document.getElementById("modal_goods_status").value;
		var modal_select1 = document.getElementById("modal_select1").value;
		var modal_select2 = document.getElementById("modal_select2").value;
		var modal_spec_no = document.getElementById("modal_spec_no").value;
		var modal_spec_type = document.getElementById("modal_spec_type").value;
		var modal_price = document.getElementById("modal_price").value;
		var modal_sku = document.getElementById("modal_sku").value;
		console.log(modal_goods_no);
		console.log(modal_goods_name);
		console.log(modal_goods_discount);
		console.log(modal_goods_status);
		console.log(modal_select1);
		console.log(modal_select2);
		console.log(modal_spec_no);
		console.log(modal_spec_type);
		console.log(modal_price);
		console.log(modal_sku);
		$.ajax({
			type : 'post',
			async : false,
			url : "AddNewGoods",
			data : {"goods_no":modal_goods_no,"goods_name":modal_goods_name,
				"goods_discount":modal_goods_discount,"goods_status":modal_goods_status,
				"sort_no":modal_select1,"branch_no":modal_select2,
				"spec_no":modal_spec_no,"spec_type":modal_spec_type,
				"price":modal_price,"sku":modal_sku},
			dataType : 'json', //返回数据形式为json
			success : function(result) {
				fetchGoodsData();
				console.log("成功");
				alert("修改成功！");
				},
			error : function(){
				console.log("失败");
		        alert("修改失败")
		    }
			});
	})
});

function modifyGoodsInf() {
	var spec_no = document.getElementById("spec_no").value;
	var price = document.getElementById("price").value;
	var sku = document.getElementById("sku").value;
	$.ajax({
		type : 'post',
		async : false,
		url : "ModifyGoodsSpec",
		data : {"spec_no":spec_no,"price":price,"sku":sku},
		dataType : 'json', //返回数据形式为json
		success : function(result) {
			fetchGoodsData();
			console.log("成功");
			alert("修改成功！");
			},
		error : function(){
			console.log("失败");
	        alert("修改失败")
	    }
		});
}

