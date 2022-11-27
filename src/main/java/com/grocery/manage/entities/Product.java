package com.grocery.manage.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.UniqueElements;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "product")
@AllArgsConstructor
@NoArgsConstructor
public @Data class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long slno;
	
	@NotNull(message = "can't be null")
	@Min(value = 1, message = "min is 1")
	private long id;
	
	@NotEmpty(message = "can't be Empty")
	@Size(min = 3, max= 30, message = "size is in between 3 to 30")
	private String name;
	

	@Min(value = 1, message = "min is 1")
	private int qty;
	

	@Min(value = 1, message = "min is 1")
	@NotNull(message = "not null")
//	@Pattern(regexp = "^([1-9][0-9]*)$", message = "can't be 0")
	private double price;
	
	private String shop_name;

	public long getSlno() {
		return slno;
	}

	public void setSlno(long slno) {
		this.slno = slno;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getShop_name() {
		return shop_name;
	}

	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}

	
	
}
