$(document).ready(function(){
  $("#BtmodifyGoods").hide();
  $("#BtAddNewGoods").hide();
  $("#spec_no").hide();
  $("#price").hide();
  $("#sku").hide();
});

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