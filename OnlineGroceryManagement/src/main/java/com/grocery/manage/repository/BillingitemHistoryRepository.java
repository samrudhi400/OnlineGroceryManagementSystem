package com.grocery.manage.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.grocery.manage.entities.BillingItemHistory;

public interface BillingitemHistoryRepository extends CrudRepository<BillingItemHistory, Long> {
	
	@Query(value = "select * from billing_item_history where id = ?1" , nativeQuery = true)
	public List<BillingItemHistory> getitemsById(Long id);
	
	
	
	@Transactional
	@Modifying
	@Query(value = "delete from billing_item_history where id = ?1" , nativeQuery = true)
	public void deleteItemByCId(long id);
	

}
