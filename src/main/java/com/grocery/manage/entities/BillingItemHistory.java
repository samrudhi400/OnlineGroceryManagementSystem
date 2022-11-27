package com.grocery.manage.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Entity
public @Data class BillingItemHistory {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long sl_no;
	
	@NotNull
	private long id;
	
	@NotNull
	@NotEmpty
	private String item_name;
	
	@NotNull
	private long qty;
	
	@NotNull
	private double price;
	
	@NotNull
	private double total;
	
	@NotNull
	@NotEmpty
	private String shop_name;

	public long getSl_no() {
		return sl_no;
	}

	public void setSl_no(long sl_no) {
		this.sl_no = sl_no;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public long getQty() {
		return qty;
	}

	public void setQty(long qty) {
		this.qty = qty;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public String getShop_name() {
		return shop_name;
	}

	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	
	
	

}
