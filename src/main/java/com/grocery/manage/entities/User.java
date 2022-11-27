package com.grocery.manage.entities;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Data;

@Entity
public @Data class User {

	@Id
	@NotBlank(message = "userName cannot be blank")
	@NotNull(message = "can't be null")
	@NotEmpty(message =  "can't be empty")
	@Pattern(regexp = "^(?=.{6,15}$)(?![_.])(?!.*[_.])[a-zA-Z0-9._]+(?<![_.])$", message = "ex:sai123")
	@Size(min = 6, max = 15, message = "size between 6 to 15")
	private String user_name;
	
	@NotBlank(message = "Name cannot be blank")
	@NotNull(message = "can't be null")
	@NotEmpty(message =  "can't be empty")
	@Pattern(regexp = "^[a-zA-Z_]+( [a-zA-Z_]+)*$", message = "ex:sai pal")
	@Size(min = 6, max = 30, message = "size between 6 to 30")
	private String u_name;
	
	@NotBlank(message = "email cannot be blank")
	@NotNull(message = "can't be null")
	@NotEmpty(message =  "can't be empty")
	@Pattern(regexp = "^[a-zA-Z0-9+_.-]+@gmail.com", message = "ex:sai12@gmail.com")
	@Size(min = 6, max = 30, message = "size between 6 to 30")
	private String email;
	
	@NotBlank(message = "Phone Number cannot be blank")
	@NotNull(message = "can't be null")
	@NotEmpty(message =  "can't be empty")
	@Pattern(regexp = "^[0-9]+$", message = "ex:sai12@gmail.com")
	@Size(min = 10, max = 10, message = "size is not 10")
	private String ph_number;
	
	@NotBlank(message = "Shop Name cannot be blank")
	@NotNull(message = "can't be null")
	@NotEmpty(message =  "can't be empty")
	@Size(min = 1, max = 20, message = "size will be between 1 to 20")
	private String shop_name;
	
	@NotBlank(message = "password cannot be blank")
	@NotEmpty(message =  "can't be empty")
	@NotNull(message = "can't be null")
	@Pattern(regexp = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{5,}$", message = "ex:Sai@123")
	@Size(min = 6, max = 20, message = "size between 6 to 20")
	private String password;

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPh_number() {
		return ph_number;
	}

	public void setPh_number(String ph_number) {
		this.ph_number = ph_number;
	}

	public String getShop_name() {
		return shop_name;
	}

	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}
