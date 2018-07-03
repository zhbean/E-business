package com.j219.model;

public class Myorders {
	
	private String order_no;
	private String order_time;
	private String express_name;
	private String sum_price;
	private String order_status;
	public String getOrder_status() {
		
		if("0".equals(order_status)){this.order_status="未支付";}
		else if("1".equals(order_status)){this.order_status="已支付";}
		else if("2".equals(order_status)){this.order_status="已完成";}
		else if("3".equals(order_status)){this.order_status="退款";}
		if("4".equals(order_status)){this.order_status="删除";}
		
		return order_status;
	}
	public void setOrder_status(String order_status) {		
		this.order_status = order_status;
	}
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	public String getOrder_time() {
		return order_time;
	}
	public void setOrder_time(String order_time) {
		this.order_time = order_time;
	}
	public String getExpress_name() {
		return express_name;
	}
	public void setExpress_name(String express_name) {
		this.express_name = express_name;
	}
	public String getSum_price() {
		return sum_price;
	}
	public void setSum_price(String sum_price) {
		this.sum_price = sum_price;
	}
	
	

}
