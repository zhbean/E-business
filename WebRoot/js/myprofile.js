$(document).ready(function() {
	$.ajax({
		async : false,
		type : "POST",
		url : "myprofile?account=a",
		data : {},
		datatype : "json",
		success : function(result) {
			console.log(result);
			console.log(result.account);
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
					$("#sex-man").attr("checked", true);
				} else if (result[0].mem_sex == '女') {
					$("#sex-woman").attr("checked", true);
				} else {
					$("#sex-non").attr("checked", true);
				}
			} else {
				$("#sex-non").attr("checked", "checked");
			}
			if (result[0].gold_coin != null) {
				$("#gold-coin").text(result[0].gold_coin);
			}
		},
		error : function(result) {
			console.log("失败"+result);
		}
	})
})