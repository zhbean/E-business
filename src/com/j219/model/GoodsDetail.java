package com.j219.model;

public class GoodsDetail {
	private String goods_no;
	private String goods_name;
	private float goods_discount;
	private String goods_status;
	private String sort_no;
	private String brand_no;
	private String spec_no;
	public String getSpec_no() {
		return spec_no;
	}
	public void setSpec_no(String spec_no) {
		this.spec_no = spec_no;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getSku() {
		return sku;
	}
	public void setSku(Integer sku) {
		this.sku = sku;
	}
	private Integer price;
	private Integer sku;
	public String getGoods_no() {
		return goods_no;
	}
	public void setGoods_no(String goods_no) {
		this.goods_no = goods_no;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public float getGoods_discount() {
		return goods_discount;
	}
	public void setGoods_discount(float goods_discount) {
		this.goods_discount = goods_discount;
	}
	public String getGoods_status() {
		if("1".equals(goods_status)){this.goods_status="在售";}
		else if("2".equals(goods_status)){this.goods_status="已下架";}
		return goods_status;
	}
	public void setGoods_status(String goods_status) {
		this.goods_status = goods_status;
	}
	public String getSort_no() {
		if("sort_a".equals(sort_no)){this.sort_no="牛奶";}
		else if("sort_b".equals(sort_no)){this.sort_no="电子产品";}
		else if("sort_c".equals(sort_no)){this.sort_no="书籍";}
		else if("sort_d".equals(sort_no)){this.sort_no="军事";}
		else if("sort_e".equals(sort_no)){this.sort_no="家用电子";}
		else if("sort_f".equals(sort_no)){this.sort_no="其他";}
		return sort_no;
	}
	public void setSort_no(String sort_no) {
		this.sort_no = sort_no;
	}
	public String getBrand_no() {
		if("brand_a".equals(brand_no)){this.brand_no="苹果";}
		else if("brand_b".equals(brand_no)){this.brand_no="小米";}
		else if("brand_c".equals(brand_no)){this.brand_no="一加";}
		else if("brand_d".equals(brand_no)){this.brand_no="蒙牛";}
		else if("brand_e".equals(brand_no)){this.brand_no="伊利";}
		else if("brand_f".equals(brand_no)){this.brand_no="其他";}
		else if("brand_g".equals(brand_no)){this.brand_no="杂货单专属";}
		else if("brand_h".equals(brand_no)){this.brand_no="伊利";}
		else if("brand_i".equals(brand_no)){this.brand_no="旺旺";}
		else if("brand_j".equals(brand_no)){this.brand_no="光明";}
		else if("brand_k".equals(brand_no)){this.brand_no="格力";}
		return brand_no;
	}
	public void setBrand_no(String brand_no) {
		this.brand_no = brand_no;
	}

}
