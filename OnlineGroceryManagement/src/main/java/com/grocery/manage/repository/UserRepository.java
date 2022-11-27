package com.grocery.manage.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.grocery.manage.entities.User;

public interface UserRepository extends CrudRepository<User, String> {

	@Query(value = "select user_name from user where shop_name = ?1" , nativeQuery = true)
	public String getUserNameByShop_name(String shop_name);
	
	@Query(value = "select u_name from user where user_name = ?1" , nativeQuery = true)
	public String getUNameByUser_name(String user_name);
	
	@Query(value = "SELECT user_name FROM user WHERE EXISTS (SELECT user_name FROM user WHERE user_name = ?1)" , nativeQuery = true)
	public String checkUNameByUser_name(String user_name);
	
	@Transactional
	@Modifying
	@Query(value = "delete from user where user_name = ?1" , nativeQuery = true)
	public void deleteUserByUser_name(String shop_name);
	
	
	@Query(value = "select password from user where user_name = ?1" , nativeQuery = true)
	public String getUserPasswordByUser_name(String user_name);
	
	@Query(value = "select * from user where user_name = ?1" , nativeQuery = true)
	public User getUserByUser_name(String user_name);
	
	@Modifying
	@Transactional
	@Query(value = "UPDATE user SET user_name = ?1, u_name = ?2, email = ?3,ph_number = ?4, shop_name=?5, password = ?6  WHERE user_name = ?7" , nativeQuery = true)
	public int updateUserByUser_Name(String user_name,String u_name,String email,String ph_number,String shop_name
			,String password,String user_name2);
	
	
	
}
