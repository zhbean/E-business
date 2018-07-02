/**
 * 
 */
function Search(){
	
	$.ajax({
		type : 'post',
		async : false,
		url : "goods?goodsname="+$("#searchtext").val(),
		data : {},
		dataType : 'json', //返回数据形式为json
		success : function(result) {
			for(var i = 0; i < Object.keys(result).length; i++){
				$("#"+i).text(result[i].goodsname);
			}
			}
			// set the new data
		});

}