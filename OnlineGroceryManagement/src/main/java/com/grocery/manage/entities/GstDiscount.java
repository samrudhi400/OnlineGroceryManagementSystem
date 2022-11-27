package com.grocery.manage.entities;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Entity
public @Data class GstDiscount {
	
	@Id
	private String shop_name;
	
	@NotNull(message =  "can't be null")
	@Min(value = 0, message = "min is 0")
	@Max(value = 100, message = "max is 100")
	private double gst;
	
	@NotNull(message =  "can't be null")
	@Min(value = 0, message = "min is 0")
	@Max(value = 100, message = "max is 100")
	private double discount;

	public String getShop_name() {
		return shop_name;
	}

	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}

	public double getGst() {
		return gst;
	}

	public void setGst(double gst) {
		this.gst = gst;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

}
