package com.grocery.manage.entities;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Entity
public @Data class Admin {
	
	@Id
	private String name;
	private String ph_number;
	private String password;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPh_number() {
		return ph_number;
	}
	public void setPh_number(String ph_number) {
		this.ph_number = ph_number;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

}
