$(document).ready(function() {
	$.ajax({
		async : false,
		type : "GET",
		url : "myprofile?account="+getAccount(),
		data : {},
		datatype : "json",
		success : function(result) {
			console.log(result);
			if (result[0].account != null) {
				$("#myaccount").val(result[0].account);
			}
			if (result[0].username != null) {
				$("#myusername").val(result[0].username);
			}
			if (result[0].mem_rank != null) {
				$("#myrank").val(result[0].mem_rank);
			}
			if (result[0].e_mail != null) {
				$("#myemail").val(result[0].e_mail);
			}
			if (result[0].mem_sex != null) {
				
				if (result[0].mem_sex == '男') {
					alert($("#sex-man").val());
					$("input:radio[name='sex']").eq(0).prop("checked",true);
					$("#sex-man").prop("checked", true);
				} else if (result[0].mem_sex == '女') {
					$("input:radio[name='sex']").eq(1).prop("checked",true);
					$("#sex-woman").prop("checked", true);
				} else {
					$("input:radio[name='sex']").eq(2).prop("checked",true);
					$("#sex-non").prop("checked",true);
				}
			} else {
				$("#sex-non").prop("checked", true);
			}
			//alert($("input:radio[name='sex']:checked").val())
			if (result[0].gold_coin != null) {
				$("#gold-coin").text(result[0].gold_coin);
			}
		},
		error : function(result) {
			console.log("失败"+result);
		}
	})
})