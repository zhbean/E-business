/**
 * 
 */
function getcount(a){
	
	$.ajax({
		type : 'post',
		async : false,
		url : "orderscount?account="+a,
		data : {},
		dataType : 'json', //返回数据形式为json
		success : function(result) {
			
				$("#OrderCount").text(result[0]);
				$("#TOrderCount").text(result[1]);

			}
			// set the new data
		});
}
function Search(){
	$.ajax({
		type : 'post',
		async : false,
		url : "goods?goodsname="+$("#searchtext").val(),
		data : {},
		dataType : 'json', //返回数据形式为json
		success : function(result) {
			
			for(var i = 0; i < Object.keys(result).length; i++){

				$("#serId").append("<li ><a href='goodsdetails.jsp?goodsname="+result[i].goodsname+"' target='_blank' >"+result[i].goodsname+"</a></li>");
			}
			}
			// set the new data
		});

}