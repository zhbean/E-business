package com.j219.model;

public class GoodsDetail {
	private String goods_no;
	private String goods_name;
	private float goods_discount;
	private Integer goods_status;
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
	public Integer getGoods_status() {
		return goods_status;
	}
	public void setGoods_status(Integer goods_status) {
		this.goods_status = goods_status;
	}
	public String getSort_no() {
		return sort_no;
	}
	public void setSort_no(String sort_no) {
		this.sort_no = sort_no;
	}
	public String getBrand_no() {
		return brand_no;
	}
	public void setBrand_no(String brand_no) {
		this.brand_no = brand_no;
	}

}