$(document).ready(function(){
//  $("#BtmodifyGoods").hide();
//  $("#BtAddNewGoods").hide();
});

$("#ShowGoodsList").click(function(){
	  $("#BtmodifyGoods").show();
	});

$("#ShowUsersList").click(function(){
	  $("#BtmodifyGoods").hide();
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
			console.log(result);
			}
		});
}