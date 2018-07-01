package com.j219.model;

public class User {
	private String username;
	private String accountString;
	private String password;
	private String mem_sex;
	private String e_mail;
	private Integer pay_psd;
	private Integer mem_rank;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAccountString() {
		return accountString;
	}
	public void setAccountString(String accountString) {
		this.accountString = accountString;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMem_sex() {
		return mem_sex;
	}
	public void setMem_sex(String mem_sex) {
		this.mem_sex = mem_sex;
	}
	public String getE_mail() {
		return e_mail;
	}
	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}
	public Integer getPay_psd() {
		return pay_psd;
	}
	public void setPay_psd(Integer pay_psd) {
		this.pay_psd = pay_psd;
	}
	public Integer getMem_rank() {
		return mem_rank;
	}
	public void setMem_rank(Integer mem_rank) {
		this.mem_rank = mem_rank;
	}
	public String getMem_kind() {
		return mem_kind;
	}
	public void setMem_kind(String mem_kind) {
		this.mem_kind = mem_kind;
	}
	public Integer getGold_coin() {
		return gold_coin;
	}
	public void setGold_coin(Integer gold_coin) {
		this.gold_coin = gold_coin;
	}
	private String mem_kind;
	private Integer gold_coin;
}
