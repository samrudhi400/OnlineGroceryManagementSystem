package com.grocery.manage;


import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.print.PageFormat;
import java.awt.print.Paper;
import java.awt.print.Printable;
import java.awt.print.PrinterException;
import java.awt.print.PrinterJob;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.grocery.manage.entities.Product;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.awt.FontMetrics;



@AllArgsConstructor
@Data
public  class Printer {
	
	public static   List<Product> l = new ArrayList<>();
	public static  double result;
	public static  String shop_name;
	public static List<Double> total = new ArrayList<>();
	public static String c_name;
	public static long ph;
	public static String pay_method;
	public static double gst;
	public static double discount;
	
	
	public static void printbill() {
		
		PrinterJob pj = PrinterJob.getPrinterJob();
		pj.setPrintable(new BillPrintable(), getPageFormat(pj));
		try {
			pj.print();

		} catch (PrinterException ex) {
			ex.printStackTrace();
		}
	}
	
	
	
	public static PageFormat getPageFormat(PrinterJob pj) {

		PageFormat pf = pj.defaultPage();
		Paper paper = pf.getPaper();

		double middleHeight = 8.0;
		double headerHeight = 2.0;
		double footerHeight = 2.0;
		double width = convert_CM_To_PPI(8); // printer know only point per inch.default value is 72ppi
		double height = convert_CM_To_PPI((int) (headerHeight + middleHeight + footerHeight));
		paper.setSize(width, height);
		paper.setImageableArea(0, 10, width, height - convert_CM_To_PPI(1)); // define boarder size after that print
																				// area width is about 180 points

		pf.setOrientation(PageFormat.PORTRAIT); // select orientation portrait or landscape but for this time portrait
		pf.setPaper(paper);

		return pf;
	}

	private static double convert_CM_To_PPI(int i) {
		// TODO Auto-generated method stub
		return 0;
	}




}







class BillPrintable implements Printable {
    
	  public int print(Graphics graphics, PageFormat pageFormat,int pageIndex) 
	  throws PrinterException 
	  {    
	      
	                
		  Printer pr = new Printer(); 
	      int result = NO_SUCH_PAGE;    
	        if (pageIndex == 0) {                    
	        
	            Graphics2D g2d = (Graphics2D) graphics;                    

	            double width = pageFormat.getImageableWidth();                    
	           
	            g2d.translate((int) pageFormat.getImageableX(),(int) pageFormat.getImageableY()); 

	            ////////// code by alqama//////////////

	            FontMetrics metrics=g2d.getFontMetrics(new Font("Arial",Font.BOLD,7));
	        //    int idLength=metrics.stringWidth("000000");
	            //int idLength=metrics.stringWidth("00");
	            int idLength=metrics.stringWidth("000");
	            int amtLength=metrics.stringWidth("000000");
	            int qtyLength=metrics.stringWidth("00000");
	            int priceLength=metrics.stringWidth("000000");
	            int prodLength=(int)width - idLength - amtLength - qtyLength - priceLength-17;

	        //    int idPosition=0;
	        //    int productPosition=idPosition + idLength + 2;
	        //    int pricePosition=productPosition + prodLength +10;
	        //    int qtyPosition=pricePosition + priceLength + 2;
	        //    int amtPosition=qtyPosition + qtyLength + 2;
	            
	            int productPosition = 0;
	            int discountPosition= prodLength+5;
	            int pricePosition = discountPosition +idLength+10;
	            int qtyPosition=pricePosition + priceLength + 4;
	            int amtPosition=qtyPosition + qtyLength;
	            
	            
	              
	        try{
	            /*Draw Header*/
	            int y=20;
	            int yShift = 10;
	            int headerRectHeight=15;
	            int headerRectHeighta=40;
	            
	            ///////////////// Product names Get ///////////
//	                String pn1a="sai";
//	                String pn2a="lonu";
//	                String pn3a="mass";
//	                String pn4a="pal";
	            ///////////////// Product names Get ///////////
	                
	            
	            ///////////////// Product price Get ///////////
//	                int pp1a=1;
//	                int pp2a=2;
//	                int pp3a=2;
//	                int pp4a=2;
//	                int sum=10;
	            ///////////////// Product price Get ///////////
	            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
	            LocalDateTime now = LocalDateTime.now();  
	            System.out.println(dtf.format(now));
	                
	             g2d.setFont(new Font("Monospaced",Font.PLAIN,9));
	             g2d.drawString("               WELCOME                  ",12,y);y+=yShift;
	            g2d.drawString("------------------------------------------",12,y);y+=yShift;
	            g2d.drawString("         "+ pr.shop_name +" Receipt        ",12,y);y+=yShift;
	            g2d.drawString("------------------------------------------",12,y);y+=headerRectHeight;
	            g2d.drawString(" Billing Dt & Time  "+dtf.format(now)+"  ",12,y);y+=yShift;
	            g2d.drawString("------------------------------------------",12,y);y+=yShift;
	            g2d.drawString("  Cus_name: "+ pr.c_name +"   ",12,y);y+=yShift;
	            g2d.drawString("------------------------------------------",12,y);y+=headerRectHeight;
	            g2d.drawString("  Customer ph_no:"+pr.ph+"   ",12,y);y+=yShift;
	            g2d.drawString("------------------------------------------",10,y);y+=yShift;
	            g2d.drawString(" Sl.No Items Name  Qty   price    T.Price  ",10,y);y+=yShift;
	            g2d.drawString("------------------------------------------",10,y);y+=headerRectHeight;
	            
	            int t = 0;
	            for (Product p : pr.l) {
	            	g2d.drawString(" "+ Math.addExact(t, 1) +"     "+p.getName()+"      "+p.getQty() +"      "+p.getPrice()+"      "+pr.total.get(t)+"  ",10,y);y+=yShift;
	            	t++;
				}
	           
//	            g2d.drawString(" "+pn2a+"                  "+pp2a+"  ",10,y);y+=yShift;
//	            g2d.drawString(" "+pn3a+"                  "+pp3a+"  ",10,y);y+=yShift;
//	            g2d.drawString(" "+pn4a+"                  "+pp4a+"  ",10,y);y+=yShift;
	            g2d.drawString("------------------------------------------",10,y);y+=yShift;
	            g2d.drawString(" gst: "+pr.gst+"%    discount: "+pr.discount+"      ",10,y);y+=yShift;
	            g2d.drawString("------------------------------------------",10,y);y+=yShift;
	            g2d.drawString(" Total amount: "+pr.result+"               ",10,y);y+=yShift;
	            g2d.drawString("------------------------------------------",10,y);y+=yShift;
	            g2d.drawString("      Payment Method - "+pr.pay_method+"        ",10,y);y+=yShift;
	            g2d.drawString("------------------------------------------",10,y);y+=yShift;
	            g2d.drawString("          Free Home Delivery           ",10,y);y+=yShift;
	            g2d.drawString("             0311384737                ",10,y);y+=yShift;
	            g2d.drawString("******************************************",10,y);y+=yShift;
	            g2d.drawString("      THANKS TO VISIT OUR SHOP         ",10,y);y+=yShift;
	            g2d.drawString("******************************************",10,y);y+=yShift;
	                   
	           
	             
	           
	            
//	            g2d.setFont(new Font("Monospaced",Font.BOLD,10));
//	            g2d.drawString("Customer Shopping Invoice", 30,y);y+=yShift; 
	          

	    }
	    catch(Exception r){
	    r.printStackTrace();
	    }

	              result = PAGE_EXISTS;    
	          }    
	          return result;    
	      }
}
