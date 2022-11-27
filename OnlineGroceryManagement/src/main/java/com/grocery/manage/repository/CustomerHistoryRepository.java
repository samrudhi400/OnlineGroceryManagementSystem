package com.grocery.manage.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.grocery.manage.entities.CustomerHistory;

public interface CustomerHistoryRepository extends CrudRepository<CustomerHistory, Integer> {
	
	@Query(value = "select * from customer_history where shop_name = ?1 order by id desc" , nativeQuery = true)
	public List<CustomerHistory> getAllCustomerHistoryByShop_name(String shop_name);
	
	
	@Query(value = "select id from customer_history where c_name = ?1" , nativeQuery = true)
	public long getCidByCName(String c_name);
	
	
	@Transactional
	@Modifying
	@Query(value = "delete from customer_history where id = ?1" , nativeQuery = true)
	public void deleteCusByCId(long id);

}
