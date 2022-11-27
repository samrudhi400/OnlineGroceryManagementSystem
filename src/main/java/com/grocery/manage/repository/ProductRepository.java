package com.grocery.manage.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.grocery.manage.entities.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {
	

	public Product findByName(String name);
	
	@Query(value = "select * from product where shop_name = ?1 order by id" , nativeQuery = true)
	public List<Product> findByShop_name(String name);
	
	@Query(value = "select * from product where id = ?1",nativeQuery = true)
	public Product findById(long id);
	
	// for checking if a particular shop has same item name
	@Query(value = "select * from product where name = ?1 and shop_name = ?2 " , nativeQuery = true)
	public List<Product> findBynameAndShop_name(String name, String shop_name);
	
	// for checking if a particular shop has same item id
	@Query(value = "select * from product where id = ?1 and shop_name = ?2",nativeQuery = true)
	public Product findByIdAndShop_name(long id, String shop_name);
	
	
	@Transactional
	@Modifying
	@Query(value = "DELETE FROM product WHERE id = ?1 and name=?2 and shop_name=?3" ,nativeQuery = true)
	public void deleteByNameAndShop_name(long id,String name, String shop_name);
	
	@Query(value="select qty from product where name = ?1" , nativeQuery= true )
	public int getQtyByName(String name);
	
	@Query(value="select * from product where name = ?1 and shop_name = ?2" , nativeQuery= true )
	public Product findByNameAndShop_name(String name, String shop_name);
	
	
	@Query(value="select * from product where id = ?1 and name = ?2 and shop_name = ?3" , nativeQuery= true )
	public Product findByIdAndByNameOfSameShop_name(long id,String name, String shop_name);

	
	@Transactional
	@Modifying
	@Query(value = "DELETE FROM product WHERE  shop_name=?1" ,nativeQuery = true)
	public void deleteByShop_name(String shop_name);
	
	@Query(value = "SELECT * FROM product ORDER BY shop_name" , nativeQuery = true)
	public List<Product> findByOrderByShop_name();
	
	
	@Modifying
	@Transactional
	@Query(value = "UPDATE product SET shop_name = ?1 WHERE shop_name = ?2" , nativeQuery = true)
	public void updateProductShop_nameByShop_name(String shop_name2, String shop_name);
	
}


