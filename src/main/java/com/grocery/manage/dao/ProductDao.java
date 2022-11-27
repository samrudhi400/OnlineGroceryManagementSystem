package com.grocery.manage.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import com.grocery.manage.entities.Admin;
import com.grocery.manage.entities.BillingItemHistory;
import com.grocery.manage.entities.CustomerHistory;
import com.grocery.manage.entities.GstDiscount;
import com.grocery.manage.entities.Product;
import com.grocery.manage.entities.User;
import com.grocery.manage.repository.AdminRepository;
import com.grocery.manage.repository.BillingitemHistoryRepository;
import com.grocery.manage.repository.CustomerHistoryRepository;
import com.grocery.manage.repository.GstDiscountRepository;
import com.grocery.manage.repository.ProductRepository;
import com.grocery.manage.repository.UserRepository;

@Configuration
public class ProductDao {

	@Autowired
	private ProductRepository pr;

	@Autowired
	private UserRepository ur;

	@Autowired
	private AdminRepository adr;
	
	@Autowired
	private GstDiscountRepository gdr;
	
	@Autowired
	private CustomerHistoryRepository chr;
	
	@Autowired
	private BillingitemHistoryRepository bhr;
	
	
	
	//pr------------------------------------------------------------
	
	//to get all product
	public List<Product> getAll() {
		System.out.println("getAll method");
		System.out.println();
		return (List<Product>) this.pr.findAll();
	}
	
	//to get the product by user_name and shop_name
	public Product findByNameAndShop_name(String name, String shop_name) {
		System.out.println(this.pr.findByNameAndShop_name(name, shop_name));
		System.out.println("findByNameAndShop_name method");
		System.out.println();
		return this.pr.findByNameAndShop_name(name, shop_name);
	}
	

	//in addProduct check where product id or product name is already present or not
	public Product checkIdOrName(long id, String name, String shop_name) {
		Product p = new Product();
		try {
			
			 p = this.pr.findByIdAndByNameOfSameShop_name(id, name, shop_name);
			 if(p != null) return p;
			 p = null;
			 
			 p = this.pr.findByNameAndShop_name(name, shop_name);
			 if(p != null) return p;
			 p = null;
			 
			 p = this.pr.findByIdAndShop_name(id, shop_name);
			 if(p != null) return p;
			 p = null;
			 
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return p;
	}
	

	// to get all product details by knowing shop name
	public List<Product> getAllProduct(String name) {
		return this.pr.findByShop_name(name);
	}

	// save product
	public void addProduct(Product p) {
		this.pr.save(p);
	}
	
	// delete product by product name
	public void delete(long id, String name, String shop_name) {
		this.pr.deleteByNameAndShop_name(id, name, shop_name);
		System.out.println("delete");
	}

	// to check quantity of a product
	public boolean checkProductQty(String name, int quantity) {
		int q = this.pr.getQtyByName(name);
		if (q >= quantity)
			return true;
		else
			return false;
	}
	
	
	// find products by shop_name
	public List<Product> findByShop_name(String shop_name) {
		try {
			return (List<Product>) this.pr.findByShop_name(shop_name);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;

	}
	

	// find products Order By shop_name
	public List<Product> findByOrderByShop_name() {
		try {
			return (List<Product>) this.pr.findByOrderByShop_name();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;

	}
	
	
	
	// to add product list
	public void saveAllPrdByList(List<Product> ol) {
		this.pr.saveAll(ol);
	}
	
	//find product by id
	public Product findPrdByid(long id) {
		Product p = new Product();
		System.out.println(this.pr.findById(id)+"    __________________+++++++++++++++++");
		try {
			return this.pr.findById(id);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return p;
	}
	
	//update shop_name By new Shop_name
	
	public void updateShop_nameByShop_Name(String shop_name2, String shop_name) {
		this.pr.updateProductShop_nameByShop_name(shop_name2, shop_name);
	}
	
	
	
	//pr---------------------------------------------------------
	
	//ur--------------------------------------------------------------
	
	//get u_name where user_name
	public String getUNameByUser_name(String user_name) {
		return this.ur.getUNameByUser_name(user_name);
	}
	
	//check u_name where user_name
	public boolean checkUNameByUserName(String user_name) {
		try {

			if(this.ur.checkUNameByUser_name(user_name).equals(user_name)) {
				System.out.println("user_name"+"++++++");
				return true;
			}
		} 
			catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	// check User password by user_name
	public boolean checkUser(String name, String password) {
		System.out.println(4);
		Optional<User> findById = this.ur.findById(name);
		if (findById.get().getPassword().equals(password)) {
			System.out.println(findById.get().getPassword());
			return true;
		}

		return false;
	}
	
	// save User
	public void addUser(User user) {
		this.ur.save(user);
	}
	

	// to get User Shop name
	public Optional<User> getByShopName(String name) {
		Optional<User> findById = this.ur.findById(name);
		return findById;
	}
	

	// to get User name from shop_name
	public String getUserNameByShop_name(String shop_name) {
		return this.ur.getUserNameByShop_name(shop_name);
	}
	
	
	// to get All User Date
	public List<User> getAllUser() {
		try {
			return (List<User>) this.ur.findAll();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	
	// getuser by user_name
	public User getUserByUser_name(String user_name) {
		
		 User user = this.ur.getUserByUser_name(user_name);
		 return user;
	}
	
	//update user by user_name
	public void updateUserByUser_Name(User u,String user_name) {
		this.ur.updateUserByUser_Name(u.getUser_name(), u.getU_name(),u.getEmail() , u.getPh_number(),u.getShop_name() ,
				u.getPassword(), user_name);
	}
	
	
	
	//ur--------------------------------------------------------------------
	
	//adr----------------------------------------------------------------------
	
	// to check the admin password
	public boolean checkAdmin(String name, String password) {

		Optional<Admin> findById = this.adr.findById(name);
		System.out.println(3);
		if (findById.get().getPassword().equals(password)) {
			System.out.println(findById.get().getPassword());
			return true;
		}

		return false;
	}
	

	// to get all admin data
	public List<Admin> getAllAdmin() {
		try {
			return (List<Admin>) this.adr.findAll();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	
	
	//adr------------------------------------------------------------------
	
	//gdr------------------------------------------------------------------
	
	// save gst and dicount.........
	public void saveGstDiscount(GstDiscount gd) {
		this.gdr.save(gd);
	}
	
	//to get gst and dicount
	public GstDiscount getGstDiscountByShop_name(String shop_name) {
		try {
			Optional<GstDiscount> findById = this.gdr.findById(shop_name);
			return findById.get();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return null;
	}
	
	//gdr------------------------------------------------------------------
	
	//chr------------------------------------------------------------------
	
	
	//delete Customer history from Id
	public void deleteCusByCId(long id) {
		this.chr.deleteCusByCId(id);
	}
	
	
	//save customer history
	public void saveCustomerHistory(CustomerHistory ch) {
		this.chr.save(ch);
	}
	
	//get customer id by customer name from Customer history
	public long getCidByCName(String c_name) {
		return this.chr.getCidByCName(c_name);
	}
	
	
	//get customer history by shop_name
	public List<CustomerHistory> getCHByShop_name(String shop_name){
		return this.chr.getAllCustomerHistoryByShop_name(shop_name);
	}

	
	
	//chr------------------------------------------------------------------
	
	//bhr------------------------------------------------------------------
	
	
	//After deleting Customer history delete BillingItem history
	public void deleteItemByCId(long id) {
		this.bhr.deleteItemByCId(id);
	}
	
	//get all items of a particular customer by id
	public List<BillingItemHistory> getItemsById(long id){
		try {
			
		return this.bhr.getitemsById(id);
		
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("getItemsById");
			e.printStackTrace();
			System.out.println("getItemsById");
		}
		return null;
	}
	
	
	//save Billing item History table
	public void saveBillingItemHistory(BillingItemHistory bh) {
		this.bhr.save(bh);
	}
	
	
	//bhr------------------------------------------------------------------
	
	//Login page
	public boolean checkName(String name) {
		try {
			System.out.println(1);
			Optional<Admin> findById = this.adr.findById(name);
			if (findById.get().getName().equals(name))
				System.out.println(findById.get().getName());
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		try {
			System.out.println(2);
			Optional<User> findById2 = this.ur.findById(name);
			if (findById2.get().getUser_name().equals(name))
				System.out.println(findById2.get().getUser_name());
			return true;

		} catch (Exception e) {
			// TODO: handle exception
		}

		return false;
	}



	// to Delete an User
	public void deleteUser(String user_name, String shop_name) {
		try {
			this.ur.deleteUserByUser_name(user_name);
			this.pr.deleteByShop_name(shop_name);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}


	

	






}
