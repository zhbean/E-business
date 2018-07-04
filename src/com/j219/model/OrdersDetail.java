package com.j219.model;

public class OrdersDetail {
	private String order_no;
	private String account;
	private String address_no;
	private String order_time;
	private String order_status;
	private String express_no;
	private Integer total_count;
	private Float total_money;
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getAddress_no() {
		if("0".equals(address_no)){this.address_no="河南科技大学";}
		else if("1".equals(address_no)){this.address_no="洛阳理工学院";}
		else if("2".equals(address_no)){this.address_no="河南科技大学";}
		return address_no;
	}
	public void setAddress_no(String address_no) {
		this.address_no = address_no;
	}
	public String getOrder_time() {
		return order_time;
	}
	public void setOrder_time(String order_time) {
		this.order_time = order_time;
	}
	public String getOrder_status() {
		if("0".equals(order_status)){this.order_status="未支付";}
		else if("1".equals(order_status)){this.order_status="已支付未完成";}
		else if("2".equals(order_status)){this.order_status="已完成";}
		else if("3".equals(order_status)){this.order_status="退款";}
		else if("4".equals(order_status)){this.order_status="删除";}
		
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public String getExpress_no() {
		if("1".equals(express_no)){this.express_no="顺丰快递";}
		else if("2".equals(express_no)){this.express_no="中通快递";}
		else if("3".equals(express_no)){this.express_no="圆通快递";}
		else if("0".equals(express_no)){this.express_no="无";}
		return express_no;
	}
	public void setExpress_no(String express_no) {
		this.express_no = express_no;
	}
	public Integer getTotal_count() {
		return total_count;
	}
	public void setTotal_count(Integer total_count) {
		this.total_count = total_count;
	}
	public Float getTotal_money() {
		return total_money;
	}
	public void setTotal_money(Float total_money) {
		this.total_money = total_money;
	}
	

}
