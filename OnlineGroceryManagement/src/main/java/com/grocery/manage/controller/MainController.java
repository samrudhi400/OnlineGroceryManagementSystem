package com.grocery.manage.controller;

import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import javax.validation.constraints.Null;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.sym.Name;
import com.grocery.manage.Printer;
import com.grocery.manage.dao.ProductDao;
import com.grocery.manage.entities.BillingItemHistory;
import com.grocery.manage.entities.CustomerHistory;
import com.grocery.manage.entities.GstDiscount;
import com.grocery.manage.entities.Product;
import com.grocery.manage.entities.User;

@Controller
public class MainController {
	
	private double result = 0;
	//list for storing the items to be billed
	private  List<Product> l = new ArrayList<>();
	
	//list for storing the shop's items
	private List<Product> ol = new ArrayList<>();
	
	//list for storing the each item price after multiplying with quantity
	private List<Double> total = new ArrayList<>();
	
	//user full name
	private String c_name;
	private long phn;
	private String pay_method;
	
	//user name 
	private String name;

	@Autowired
	private ProductDao pd;

	// start billing page -------------------------------------------------------------------------------------
	
	@GetMapping("/billpage")
	public String billpage(HttpServletRequest request, Model m) {
		String shop_name = request.getParameter("shop_name");
		System.out.println(shop_name);
		ol = this.pd.getAllProduct(shop_name);
		m.addAttribute("list", ol);
//		m.addAttribute("shop_name", shop_name);
//		m.addAttribute("c_name", c_name);
		m.addAttribute("gd", this.pd.getGstDiscountByShop_name(shop_name));
		
		return "billing_page";

	}

	
	
	@PostMapping("/addToBill")
	public String addToBill(@RequestParam("item") String item, @RequestParam("quantity") int quantity,
			@RequestParam("price") Double price,  Model m) {
		
//		System.out.println(phn +"  "+ pay_method);
//		this.c_name = c_n;
		
		
		boolean flag =  false;
		Product op = new Product();
		System.out.println(price.SIZE + " price");
		
		// nothing can't be null

		
		
		for (Product p : ol) {
			if(p.getName().equals(item) == true && p.getPrice() == price) {
				
				// to check the quantity is present or not and quantity should not equal to zero
				if(p.getQty() < quantity || quantity == 0 || price == 0.0 ) {
					
					m.addAttribute("p", l);
					m.addAttribute("list", ol);
					if(quantity == 0) m.addAttribute("msg", "quantity is 0, change quantity");
					else if(price == 0) m.addAttribute("msg", "price is 0");
					else m.addAttribute("msg", "Not enough quantity is present");
					m.addAttribute("res", result);
					m.addAttribute("total", total);
//					m.addAttribute("c_name", c_name);
					m.addAttribute("gd", this.pd.getGstDiscountByShop_name(p.getShop_name()));
					
					return"billing_page";
				}
					
				
				op = p;
				p.setQty(p.getQty() - quantity);
				flag = true;
				break;
				
				}
			}
		
		//to check item and price is present........
		if(flag == false) {
			m.addAttribute("msg", "either item or price not found");
			m.addAttribute("list", ol);
			m.addAttribute("p", l);
			m.addAttribute("res", result);
			m.addAttribute("total", total);
//			m.addAttribute("c_name", c_name);
			m.addAttribute("gd", this.pd.getGstDiscountByShop_name(op.getShop_name()));
			
			return "billing_page";
		}
		
		Product newp = new Product();
		newp.setId(op.getId());
		newp.setName(op.getName());
		newp.setQty(quantity);
		newp.setPrice(op.getPrice());
		newp.setShop_name(op.getShop_name());
		
		
		double t = quantity * newp.getPrice();
		total.add(t);
		
		l.add(newp);
		
//		
		GstDiscount gd = this.pd.getGstDiscountByShop_name(op.getShop_name());
		
			if(gd.getGst() != 0) {
				double d = t * gd.getGst();
				d = d / 100;
				result = result + d + t;	
				System.out.println(result);
			}
			
			else if(gd.getDiscount() != 0) {
				double d = 0;
				d = t * gd.getDiscount();
				d = d / 100;
				System.out.println(d +"--d");
				result = result - d;
			}
			
			else {
				result = result + t;
			}
			
			DecimalFormat df = new DecimalFormat();
			df.setMaximumFractionDigits(2);

			result = Double.valueOf(df.format(result));
			
			System.out.println(10);
			m.addAttribute("res", result);
			m.addAttribute("p", l);
			m.addAttribute("list", ol);
			m.addAttribute("total", total);
//			m.addAttribute("c_name", c_name);
			m.addAttribute("gd", this.pd.getGstDiscountByShop_name(op.getShop_name()));
		
			return"billing_page";
	}
	
	@GetMapping("/deleteFromList")
	public String deleteFromList(HttpServletRequest request, Model m) {
		int count =Integer.parseInt(request.getParameter("count"));
		System.out.println( "-------------------------------------");
		System.out.println(l);
		System.out.println(ol);
		System.out.println(total);
		total.remove(count-1);
		
		Product p = l.get(count -1);
		

		System.out.println(p+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

		System.out.println(p+"--p");

		
		int q = p.getQty();
		result = result - (q * p.getPrice());
		
		int t = 0;
		for(int i = 0; i< ol.size(); i++) {
			if(ol.get(i).getName() == p.getName()) {
				t = i;
				break;
			}
		}
		Product op = this.ol.get(t);
		op.setQty(op.getQty() + q);
		
	
		
		l.remove(count -1); 
		m.addAttribute("list", ol);
		m.addAttribute("p", l);
		if(l.size() == 0) {
			result = 0;
			m.addAttribute("res", result);
			}
		else {
			m.addAttribute("res", result);
		}
		m.addAttribute("total", total);
//		m.addAttribute("c_name", c_name);
		m.addAttribute("gd", this.pd.getGstDiscountByShop_name(p.getShop_name()));

		System.out.println(op+"________________________________");
		System.out.println(l);
		System.out.println(ol);
		System.out.println(total);
		
		return "billing_page";
	}
	
// end of billing page-------------------------------------------------------------------------
	
	//1
	//start login page ------------------------------------------------------------------------------

	@RequestMapping("/login")
	public String login(Model m) {
		if(l != null) {
			this.l.clear();
			this.total.clear();
			this.result = 0;
			this.c_name = null;
			this.ol.clear();
			this.pay_method = null;
			this.phn = 0;
			this.name = null;
		}
		m.addAttribute("user",new User() );
		return "login";
	}

	@PostMapping("/loginUser")
	public String loginUser(@RequestParam("name") String name, @RequestParam("password") String password, Model m) {
		
		// to check whether name is present in both
		if (this.pd.checkName(name) == false) {
			m.addAttribute("msg", "Account not found, please register your account.");
			return "login";
		}
		try {
			boolean a = true;
			boolean u = true;
			try {
				
				// to check admin name
				
				if (this.pd.checkAdmin(name, password)) {

					List<Product> listProduct = this.pd.findByOrderByShop_name();
					m.addAttribute("listPrd", listProduct);
					m.addAttribute("list", this.pd.getAllAdmin());
					m.addAttribute("l", this.pd.getAllUser());
					m.addAttribute("shop_name", "All");
					
					return "admin";
				} else
					a = false;
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			try {
				
				// to check user name
				// going to welcome page
				
				if (this.pd.checkUser(name, password)) {
					
					m.addAttribute("uname", this.pd.getUNameByUser_name(name));
					m.addAttribute("name", name);
					Optional<User> op = this.pd.getByShopName(name);
					String shop_name = op.get().getShop_name();
					System.out.println(shop_name);
					m.addAttribute("shop_name", shop_name);
					m.addAttribute("p", this.pd.getAllProduct(shop_name));
					
					//to set this.name as user_name;
					this.name = name;
					
					return "welcome";
				} else
					u = false;
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			// if either one pass is wrong
			if (a == false || u == false) {
				
				m.addAttribute("msg", "Password is wrong, please try again.");
				
				return "login";
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return "login";
	}

	//form from registeration
	
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute User user,BindingResult result ,Model m) {
		
		System.out.println(this.pd.checkUNameByUserName(user.getUser_name()));
		//to check whether there is another user_name is there or not
		if(this.pd.checkUNameByUserName(user.getUser_name())) {
			
			m.addAttribute("msg", "User Name is already present, Please use something else");
			
			return"login";
		}
		
		if(result.hasErrors()) {
			List<FieldError> errors = result.getFieldErrors();
			
			List<String> l1 = new ArrayList<>();
			List<String> l2 = new ArrayList<>();
			List<String> l3 = new ArrayList<>();
			List<String> l4 = new ArrayList<>();
			List<String> l5 = new ArrayList<>();
			List<String> l6 = new ArrayList<>();
			
			for (FieldError error : errors ) {
				System.out.println("-----------------------------------------------");
		        System.out.println (error.getField() + " - " + error.getDefaultMessage());
		        
		    	if(error.getField().equals("user_name")) l1.add(error.getDefaultMessage());
		    	if(error.getField().equals("u_name")) 	 l2.add(error.getDefaultMessage());
		    	if(error.getField().equals("email")) 	 l3.add(error.getDefaultMessage());
		    	if(error.getField().equals("ph_number")) l4.add(error.getDefaultMessage());
		    	if(error.getField().equals("shop_name")) l5.add(error.getDefaultMessage());
		    	if(error.getField().equals("password")) l6.add(error.getDefaultMessage());
		    	
		    	
		    }
			m.addAttribute("l1", l1);
			m.addAttribute("l2", l2);
			m.addAttribute("l3", l3);
			m.addAttribute("l4", l4);
			m.addAttribute("l5", l5);
			m.addAttribute("l6", l6);
			
			
			m.addAttribute("msg", "please check the fields in register");
			
			return "login";
		}
		
		this.pd.addUser(user);
		m.addAttribute("msg", "Register Successfully");
		
		return "login";
	}
// end of login page -------------------------------------------------------------------------------
	
	
// start welcome page--------------------------------------------------------------------
	
	
	
	// to add product by knowing shop_name

	@GetMapping("/addProduct")
	public String addProduct(HttpServletRequest request, Model m) {
		String name = request.getParameter("name");
		
		String[] arr = name.split(",");
		name = arr[0];
		String shop_name = arr[1];
		List<Product> allProduct = this.pd.getAllProduct(shop_name);
		m.addAttribute("uname", this.pd.getUNameByUser_name(name));
		m.addAttribute("p", allProduct);
		m.addAttribute("name", name);
		m.addAttribute("shop_name", shop_name);

		return "addProduct";
	}

	@PostMapping("/addItems")
	public String addItems(@Valid @ModelAttribute Product p,BindingResult result ,Model m) {
		//to check id is there or not
		Product prd = this.pd.checkIdOrName(p.getId());		
		
		// validation
			if(result.hasErrors() || prd != null) {
				
				List<FieldError> errors = result.getFieldErrors();
				List<String> l1 = new ArrayList<>();
				List<String> l2 = new ArrayList<>();
				List<String> l3 = new ArrayList<>();
				List<String> l4 = new ArrayList<>();
				
				for (FieldError error : errors ) {
		
			        System.out.println (error.getField() + " - " + error.getDefaultMessage());
			        
			    	if(error.getField().equals("id")) l1.add(error.getDefaultMessage());
			    	if(error.getField().equals("name")) 	 l2.add(error.getDefaultMessage());
			    	if(error.getField().equals("qty")) 	 l3.add(error.getDefaultMessage());
			    	if(error.getField().equals("price")) l4.add(error.getDefaultMessage());		    	
			    }
				
				//if it is empty its throws an exception, exception is stored..............
				
				String temp = "Failed to convert property ";
				
				try {
					if(l1.get(0).startsWith(temp)) {
						l1.clear();
						l1.add("can't be empty");
					}
					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				
				
				try {
					if(l3.get(0).startsWith(temp)) {
						l3.clear();
						l3.add("can't be empty");
					}					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				
				try {
					if(l4.get(0).startsWith(temp)) {
						l4.clear();
						l4.add("can't be empty");
					}					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				
				
				
			m.addAttribute("l1", l1);
			m.addAttribute("l2", l2);
			m.addAttribute("l3", l3);
			m.addAttribute("l4", l4);
			
			String shop_name = p.getShop_name();
			List<Product> allProduct = this.pd.getAllProduct(shop_name);
			System.out.println(p);
			System.out.println(10);
			m.addAttribute("uname", this.pd.getUNameByUser_name(this.pd.getUserNameByShop_name(shop_name)));
			m.addAttribute("p", allProduct);
			m.addAttribute("name", this.pd.getUserNameByShop_name(shop_name));
			m.addAttribute("shop_name", shop_name);
			if(prd != null) m.addAttribute("msg", "either id or item name is already present");
			
			return "addProduct";
		}
		
		this.pd.addProduct(p);
		String shop_name = p.getShop_name();
		List<Product> allProduct = this.pd.getAllProduct(shop_name);
		System.out.println(p);
		System.out.println(10);
		m.addAttribute("uname", this.pd.getUNameByUser_name(this.pd.getUserNameByShop_name(shop_name)));
		m.addAttribute("p", allProduct);
		m.addAttribute("name", this.pd.getUserNameByShop_name(shop_name));
		m.addAttribute("shop_name", shop_name);

		return "addProduct";
		
		
	}

	// back from additems page to show welcome page
	@GetMapping("/back")
	
	public String back(HttpServletRequest request, Model m) {
		String name = request.getParameter("name");
		this.name = name;
		m.addAttribute("name", name);
		Optional<User> op = this.pd.getByShopName(name);
		String shop_name = op.get().getShop_name();
		System.out.println(shop_name);
		m.addAttribute("shop_name", shop_name);
		m.addAttribute("p", this.pd.getAllProduct(shop_name));
		m.addAttribute("uname", this.pd.getUNameByUser_name(name));
		
		return "welcome";
	}

	
	//update the item details
	@GetMapping("/update")
	public String update(HttpServletRequest request, Model m) {
		String name = request.getParameter("name");
		String[] arr = name.split(",");
		name = arr[0];
		String shop_name = arr[1];
		List<Product> allProduct = this.pd.getAllProduct(shop_name);
		m.addAttribute("p", allProduct);
		m.addAttribute("name", this.pd.getUserNameByShop_name(shop_name));
		m.addAttribute("shop_name", shop_name);
		m.addAttribute("uname", this.pd.getUNameByUser_name(name));
		
		return "update";
	}
	// end of addProduct-----------------------------------------------------------------------

// start of update page-------------------------------------------------------------------------

	//delete item
	@GetMapping("/delete")
	public String deteleByName(HttpServletRequest request, Model m) {
		String pd_name = request.getParameter("name");
		String[] arr = pd_name.split(",");
		pd_name = arr[0];
		String shop_name = arr[1];
		String name = arr[2];
		System.out.println(pd_name + "   " + shop_name + "   " + name);
		this.pd.delete(pd_name, shop_name);
		List<Product> allProduct = this.pd.getAllProduct(shop_name);
		m.addAttribute("p", allProduct);
		m.addAttribute("name", this.pd.getUserNameByShop_name(shop_name));
		m.addAttribute("shop_name", shop_name);
		m.addAttribute("uname", this.pd.getUNameByUser_name(name));
		
		return "update";
	}

	// to edit the product
	@PostMapping("/saveTheEdit")
	public String savTheEdit(@Valid @ModelAttribute Product p,BindingResult result ,Model m) {
		
		Product prd = this.pd.findPrdByid(p.getId());
		System.out.println("-----------"+prd+"___________");
		
		if(result.hasErrors() || prd == null) {
			List<FieldError> errors = result.getFieldErrors();
			
			List<String> l1 = new ArrayList<>();
			List<String> l2 = new ArrayList<>();
			List<String> l3 = new ArrayList<>();
			List<String> l4 = new ArrayList<>();
			
			for (FieldError error : errors ) {
	
		        System.out.println (error.getField() + " - " + error.getDefaultMessage());
		        
		    	if(error.getField().equals("id"))    l1.add(error.getDefaultMessage());
		    	if(error.getField().equals("name"))  l2.add(error.getDefaultMessage());
		    	if(error.getField().equals("qty")) 	 l3.add(error.getDefaultMessage());
		    	if(error.getField().equals("price")) l4.add(error.getDefaultMessage());		    	
		    }
			
			String temp = "Failed to convert property ";
			try {
				if(l1.get(0).startsWith(temp)) {
					l1.clear();
					l1.add("can't be empty");
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			try {
				if(l3.get(0).startsWith(temp)) {
					l3.clear();
					l3.add("can't be empty");
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			try {
				if(l4.get(0).startsWith(temp)) {
					l4.clear();
					l4.add("can't be empty");
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		
			
			m.addAttribute("l1", l1);
			m.addAttribute("l2", l2);
			m.addAttribute("l3", l3);
			m.addAttribute("l4", l4);
			
			String shop_name = p.getShop_name();
			List<Product> allProduct = this.pd.getAllProduct(shop_name);
			m.addAttribute("p", allProduct);
			m.addAttribute("name", this.pd.getUserNameByShop_name(shop_name));
			m.addAttribute("shop_name", shop_name);
			m.addAttribute("uname", this.pd.getUNameByUser_name(this.pd.getUserNameByShop_name(shop_name)));
			if(prd == null ) m.addAttribute("msg", "Please check the id, Id is not present");
			
			return"update";
		}
		
		this.pd.addProduct(p);
		String shop_name = p.getShop_name();
		List<Product> allProduct = this.pd.getAllProduct(shop_name);
		m.addAttribute("p", allProduct);
		m.addAttribute("name", this.pd.getUserNameByShop_name(shop_name));
		m.addAttribute("shop_name", shop_name);
		m.addAttribute("uname", this.pd.getUNameByUser_name(this.pd.getUserNameByShop_name(shop_name)));
		
		return "update";
	}
	
	// end of update---------------------------------------------------------------------------
	
	//start of admin page-------------------------------------------------------------

	// in Admin page Delete an User
	@GetMapping("/deteleUser")
	public String deleteUser(HttpServletRequest request, Model m) {
		String user_name = request.getParameter("user_name");
		String[] ar = user_name.split(",");
		user_name = ar[0];
		String shop_name = ar[1];
		this.pd.deleteUser(user_name, shop_name);
		m.addAttribute("list", this.pd.getAllAdmin());
		m.addAttribute("l", this.pd.getAllUser());

		return "admin";
	}

	// to view user product
	@GetMapping("/viewUserProduct")
	public String viewUserProduct(HttpServletRequest request, Model m) {
		
		String user_name = request.getParameter("user_name");
		String[] ar = user_name.split(",");
		user_name = ar[0];
		String shop_name = ar[1];
		List<Product> listProduct = this.pd.findByShop_name(shop_name);
		m.addAttribute("listPrd", listProduct);
		m.addAttribute("list", this.pd.getAllAdmin());
		m.addAttribute("l", this.pd.getAllUser());
		m.addAttribute("shop_name", shop_name);
		
		return "admin";
	}

	// to view All Product Details
	@GetMapping("/allProduct")
	public String allProduct(Model m) {
		
		List<Product> listProduct = this.pd.findByOrderByShop_name();
		m.addAttribute("listPrd", listProduct);
		m.addAttribute("list", this.pd.getAllAdmin());
		m.addAttribute("l", this.pd.getAllUser());
		m.addAttribute("shop_name", "All");

		return "admin";
	}
	
	// end of adminpage-----------------------------------------------------------
	
//billing page---------------------------------------------------------
	// to print the bill
	@GetMapping("/print")
	public String printBill(HttpServletRequest request,Model m) {
		
		String s = request.getParameter("shop_name");
		System.out.println(s);
		String[] ar = s.split("-");
		String shop_name = ar[0];
		this.c_name = ar[1];
		this.phn = Long.valueOf(ar[2]);
		this.pay_method = ar[3];
		

		
		if(this.l.size() == 0) {
			ol = this.pd.getAllProduct(shop_name);
			System.out.println("inside printBill, if l.size == 0");
			m.addAttribute("list", ol);
			m.addAttribute("gd", this.pd.getGstDiscountByShop_name(shop_name));

			
			return "billing_page";
		}
		
		GstDiscount gd = this.pd.getGstDiscountByShop_name(shop_name);
		
		try {
			
		Printer pr = new Printer();
		pr.l =  this.l;
		pr.result = this.result;
		pr.total = this.total;
		pr.shop_name = shop_name;
		pr.c_name = this.c_name;
		pr.ph = this.phn;
		pr.pay_method = this.pay_method;
		pr.gst = gd.getGst();
		pr.discount = gd.getDiscount();
		pr.printbill();
		
		} catch (Exception e2) {
			// TODO: handle exception
			e2.printStackTrace();
		}
		
		// update in the customer history-----------------------
		
		try {
			
		
		CustomerHistory ch = new CustomerHistory();
		ch.setC_name(c_name);
		ch.setPh_number(phn);
		ch.setShop_name(shop_name);
		ch.setPayment_method(pay_method);
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
        LocalDateTime now = LocalDateTime.now();
		ch.setDate(dtf.format(now));
		
		ch.setPrice(result);
		
		//setting gst and discount
		ch.setGst(gd.getGst());
		ch.setDiscount(gd.getDiscount());
		
		
		//saving ch in the customerHistory
		this.pd.saveCustomerHistory(ch);
		
		} catch (Exception e2) {
			// TODO: handle exception
			e2.printStackTrace();
		}
		
		//update items in BillingItemHistory table
		try {
		
		l.forEach(e -> {
			int i = l.indexOf(e);
			long id = this.pd.getCidByCName(c_name);
			BillingItemHistory bh = new BillingItemHistory();
			bh.setId(id);
			bh.setItem_name(e.getName());
			bh.setQty(e.getQty());
			bh.setTotal(this.total.get(i));
			bh.setPrice(this.total.get(i) / e.getQty() );
			bh.setShop_name(shop_name);
			
			// saving bh in Billing item hISTORY
			this.pd.saveBillingItemHistory(bh);
		});
		
		} catch (Exception e2) {
			// TODO: handle exception
			e2.printStackTrace();
		}
		
		
		
		// updated ol is saved in database
		this.pd.saveAllPrdByList(this.ol);
		
		this.l.clear();
		this.total.clear();
		this.result = 0;
		this.c_name = null;
		this.phn = 0;
		this.pay_method = null;
		
		System.out.println(ol);
		
		System.out.println(shop_name);
		ol = this.pd.getAllProduct(shop_name);
		m.addAttribute("list", ol);
		m.addAttribute("gd", this.pd.getGstDiscountByShop_name(shop_name));

		return "billing_page";
	}
// end of billing page-------------------------------------------------

	
// gst page--------------------------------------------------------------------------
	//go to set gst and discount
	@GetMapping("/setGst")
	public String setGst(HttpServletRequest request, Model m) {
		
		String shop_name = request.getParameter("shop_name");
		GstDiscount gd = this.pd.getGstDiscountByShop_name(shop_name);
		if(shop_name != null) m.addAttribute("gd", gd);
		m.addAttribute("name", this.pd.getUserNameByShop_name(shop_name));
		m.addAttribute("shop_name", shop_name);
		
		return "setGst";
	}
	
	// save gst and discount
	@PostMapping("/saveGstDiscount")
	public String saveGstDiscount(@Valid @ModelAttribute GstDiscount gd,BindingResult result ,Model m) {
		 
		if(result.hasErrors()) {
			List<FieldError> errors = result.getFieldErrors();
			
			List<String> l2 = new ArrayList<>();
			List<String> l3 = new ArrayList<>();
			
			for (FieldError error : errors ) {
	
		        System.out.println (error.getField() + " - " + error.getDefaultMessage());
		        
		    	if(error.getField().equals("gst"))  		l2.add(error.getDefaultMessage());
		    	if(error.getField().equals("discount")) 	l3.add(error.getDefaultMessage());	    	
		    }
			
			String temp = "Failed to convert property ";
			try {
				if(l2.get(0).startsWith(temp)) {
					l2.clear();
					l2.add("can't be empty");
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			try {
				if(l3.get(0).startsWith(temp)) {
					l3.clear();
					l3.add("can't be empty");
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			System.out.println(l2 +"             " + l3);
			
			m.addAttribute("l2", l2);
			m.addAttribute("l3", l3);
			
			GstDiscount gdc = this.pd.getGstDiscountByShop_name(gd.getShop_name());
			if(gd.getShop_name() != null) m.addAttribute("gd", gdc);
			m.addAttribute("name", this.pd.getUserNameByShop_name(gd.getShop_name()));
			m.addAttribute("shop_name", gd.getShop_name());
			
			
			
			return "setGst";
		}
		System.out.println(gd);
		this.pd.saveGstDiscount(gd);
		m.addAttribute("gd", this.pd.getGstDiscountByShop_name(gd.getShop_name()));
		m.addAttribute("name", this.pd.getUserNameByShop_name(gd.getShop_name()));
		m.addAttribute("shop_name", gd.getShop_name());
		
		return "setGst";
	}
// end ------------------------------------------------------------------------------
	
//welcome page------------------------------------------------------------------------	
	//Edit user info form welcome page
	@GetMapping("/editUserInfo")
	public String checkTheUserByPassword(HttpServletRequest request, Model m) {
		String name = request.getParameter("name");
		String[] arr = name.split(",");
		name = arr[0];
		String uname= arr[1];
		m.addAttribute("name", name);
		m.addAttribute("uname", uname);
		
		return "checkUser";
	}
	
	@PostMapping("/checkUser")
	public String checkUser(@RequestParam("password") String password,@RequestParam("name") String name ,Model m) {
		
		String[] arr = name.split(",");
		name = arr[0];
		String uname= arr[1];
		if (this.pd.checkUser(name, password)) {
			
			m.addAttribute("user", this.pd.getUserByUser_name(name));
			
			return "editUserInfo";
		}
		else {
			
			m.addAttribute("name", name);
			m.addAttribute("uname", uname);
			m.addAttribute("msg", "Wrong Password, Try Again");
			return "checkUser";
		}
		
		
	}
	
	@PostMapping("/updateUserInfo")
	public String updateUserInfo(@Valid @ModelAttribute User user,BindingResult result ,Model m) {
		

		if(result.hasErrors()) {
			List<FieldError> errors = result.getFieldErrors();
			
			List<String> l1 = new ArrayList<>();
			List<String> l2 = new ArrayList<>();
			List<String> l3 = new ArrayList<>();
			List<String> l4 = new ArrayList<>();
			List<String> l5 = new ArrayList<>();
			List<String> l6 = new ArrayList<>();
			
			for (FieldError error : errors ) {
				System.out.println("-----------------------------------------------");
		        System.out.println (error.getField() + " - " + error.getDefaultMessage());
		        
		    	if(error.getField().equals("user_name")) l1.add(error.getDefaultMessage());
		    	if(error.getField().equals("u_name")) 	 l2.add(error.getDefaultMessage());
		    	if(error.getField().equals("email")) 	 l3.add(error.getDefaultMessage());
		    	if(error.getField().equals("ph_number")) l4.add(error.getDefaultMessage());
		    	if(error.getField().equals("shop_name")) l5.add(error.getDefaultMessage());
		    	if(error.getField().equals("password")) l6.add(error.getDefaultMessage());
		    	
		    	
		    }
			m.addAttribute("l1", l1);
			m.addAttribute("l2", l2);
			m.addAttribute("l3", l3);
			m.addAttribute("l4", l4);
			m.addAttribute("l5", l5);
			m.addAttribute("l6", l6);
			m.addAttribute("user", user);
			
			m.addAttribute("msg", "please check the fields");
			
			m.addAttribute("user", user);
			return "editUserInfo";
		}
		
		//getting old shop_name by old user_name
		Optional<User> op = this.pd.getByShopName(name);
		String shop_name = op.get().getShop_name();
		System.out.println(shop_name);
		
		// update the old shop_name by new shop_name
		this.pd.updateShop_nameByShop_Name(user.getShop_name(), shop_name);
		System.out.println(user+"    00000000000000000000000000000000000000");
		
		// update the old shop_name by new shop_name  in the Customer history table
		
		this.pd.updateUserByUser_Name(user,name);
		
		m.addAttribute("user", user);
		m.addAttribute("msg", "Update successfully");
		
		return"editUserInfo";
	}
// end-----------------------------------------------------
	
	//showCustomerHistory------------------------------------------------
	@GetMapping("/showCustomerHistory")
	public String showCustomerHistory(HttpServletRequest request ,Model m) {
		String shop_name = request.getParameter("shop_name");
		List<CustomerHistory> list = this.pd.getCHByShop_name(shop_name);
		System.out.println(list);
		
		m.addAttribute("l", list);
		m.addAttribute("name", this.name);
		
		return "showBillingHistory";
	}
	
	// view a particular customer's items by its id
	@GetMapping("/view")
	public String viewItems(HttpServletRequest request, Model m) {
		String i = request.getParameter("id");
		System.out.println(i);
		
		String[] ar = i.split(",");
		int id = Integer.parseInt(ar[0]);
		String shop_name = ar[1];

		
		List<BillingItemHistory> list = this.pd.getItemsById(id);
		System.out.println(list);
		m.addAttribute("l", list);
		m.addAttribute("shop_name", shop_name);
		
		return "viewItems";
	}
	
	@GetMapping("/backFromBIH")
	public String backFromBIH(HttpServletRequest request,Model m) {
		
		String shop_name = request.getParameter("shop_name");
		List<CustomerHistory> list = this.pd.getCHByShop_name(shop_name);
		System.out.println(list);
		
		m.addAttribute("l", list);
		m.addAttribute("name", this.name);
		
		return "showBillingHistory";
		
	}
	
	@GetMapping("/deleteFromCH")
	public String deleteFromCH(HttpServletRequest request,Model m) {
		
		
		String shop_name = request.getParameter("id");
		System.out.println(shop_name);
		
		String[] ar = shop_name.split(",");
		long id = Long.valueOf(ar[0]);
		shop_name = ar[1];
		
		
		//delete customer from customerHistory
		this.pd.deleteCusByCId(id);
		this.pd.deleteItemByCId(id);
		
		
		List<CustomerHistory> list = this.pd.getCHByShop_name(shop_name);
		System.out.println(list);
		
		m.addAttribute("l", list);
		m.addAttribute("name", this.name);
		return "showBillingHistory";
		
	}
	

}
