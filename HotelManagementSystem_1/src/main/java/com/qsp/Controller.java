package com.qsp;



import java.text.SimpleDateFormat;
import java.time.LocalDate;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;

//import javax.servlet.http.HttpServletRequest;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@org.springframework.stereotype.Controller
public class Controller {
	 
	private EmailService emailService=new EmailService();
	
	@PostMapping("/userLogin")
	   public ModelAndView Login(@ModelAttribute("cs") CustomerDTO cs,HttpServletRequest req)
	   {
		CustomerService ser = new CustomerService();
		   return ser.loginCustomer(cs,req);
		   //return "homepage.jsp";
	   }
	
	
	   @GetMapping("/register")
	   public ModelAndView Register(@ModelAttribute("cs") CustomerDTO cs)
	   {
		   
		   CustomerService ser = new CustomerService();
		  return ser.saveCustomer(cs);
		  
	   }
	   
	   
	   @PostMapping("/adminLogin")
	   public ModelAndView adminLogin(@ModelAttribute("admin")AdminDTO admin,HttpServletRequest req)
	   {
		   AdminService as=new AdminService();
		  return as.AdminVerify(req,admin);
		   
	   }

	    @PostMapping("/AdminRegister")
	    public ModelAndView adminRegisters(@RequestParam("name") String name,
	                                       @RequestParam("email") String email,
	                                       @RequestParam("password") String password) {
	    	System.out.println("hotay");
	    	 AdminService as=new AdminService();
	    	return  as.adminRegister(name, email, password);
	        //return  
	    }
	    
	    @PostMapping("/addRoom")
	    public ModelAndView addRooms(@RequestParam("room_no") int room_no,
	    		                     @RequestParam("status") String status,
	    		                     @RequestParam("price") double price,
	    		                     @RequestParam("img_url") String img_url,
	    		                     @RequestParam("type")String type,HttpServletRequest req)
	    {
	    	RoomService rs=new RoomService();
	    	return rs.addRoom(room_no,status,price,img_url,type,req);
	    }
	    
	    @GetMapping("/editRoom")
	    public ModelAndView editRoom(@RequestParam("room_id") int room_id,HttpServletRequest req)
	    {
	    	RoomService rs=new RoomService();
	    	return rs.editRoom(room_id, req);
	    }
	    @PostMapping("/updateBooking")
	    public ModelAndView updateBooking(@RequestParam("bookingId")String bookingId,HttpServletRequest req)
	    {
	    	BookingService bs=new BookingService();
	    	return bs.updateBooking(bookingId,req);
	    }
	    
	    @PostMapping("/updateSingleBooking")
	    public ModelAndView updateSingleBooking(@RequestParam("checkin")String checkin,@RequestParam("checkout")String checkout,@RequestParam("idProof")String idProof,@RequestParam("idNumber")String idNumber,HttpServletRequest req)
	    {
	    	BookingService bs=new BookingService();
	    	return bs.updateSingleBooking(checkin,checkout,idProof,idNumber,req);
	    	
	    }
	    
	    @PostMapping("/updateRoom")
	    public ModelAndView updateRoom(@RequestParam("room_id") int room_id,
	    		@RequestParam("img_url")String img_url,
	    		@RequestParam(value="price", required = false, defaultValue = "0.0") double price,
	    		@RequestParam("status") String status,
	    		@RequestParam("type")String type,HttpServletRequest req)
	    {
	    	RoomService rs=new RoomService();
	    	return rs.updateRoom(room_id,img_url,price,status,type,req);
	       
	    }
	    
	    @GetMapping("/adminLogout")
	    public ModelAndView adminLogout(HttpServletRequest req)
	    {
	    	HttpSession hs=req.getSession();
	    	hs.invalidate();
	    	ModelAndView mv=new ModelAndView("adminlogin.jsp");
	    	return mv;
	    }
	    @GetMapping("/logout")
	    public ModelAndView logout(HttpServletRequest req)
	    {
	    	HttpSession hs=req.getSession();
	    	hs.invalidate();
	    	ModelAndView mv=new ModelAndView("Login.jsp");
	    	return mv;
	    }
	    
	    @GetMapping("/sortRooms")
	    public ModelAndView sortRooms(@RequestParam("priceRange") String priceRange,
	    		@RequestParam("roomType") String roomType,HttpServletRequest req)
	    {
	    	RoomService rs=new RoomService();
	    	return rs.sortRooms(priceRange,roomType,req);
	    	
	    }
	    
	    @PostMapping("/sortRoomsB")
	    public ModelAndView sortRoomsB(@RequestParam("priceRange") String priceRange,
	    		@RequestParam("roomType") String roomType,HttpServletRequest req)
	    {
	    	RoomService rs=new RoomService();
	    	return rs.sortRoomsB(priceRange,roomType,req);
	    	
	    }
	    
	    // Register a custom binder to convert String to LocalDate
	    @InitBinder
	    public void initBinder(WebDataBinder binder) {
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  // Define the date format
	        binder.registerCustomEditor(LocalDate.class, new CustomDateEditor(dateFormat, true));  // Register custom date editor
	    }
	    
	    @PostMapping("/confirmBooking")
	    public ModelAndView confirmBooking(@RequestParam("customerName") String customerName,
	                                       @RequestParam("customerEmail") String customerEmail,
	                                       @RequestParam("roomNumber") String roomNumber,
	                                       @RequestParam("checkinDate") String checkinDate,
	                                       @RequestParam("checkoutDate") String checkoutDate,
	                                       HttpServletRequest req) {
	        System.out.println("Inside confirmBooking controller");

	        BookingService bs = new BookingService();
	        Booking conflictingBooking = bs.getConflictingBooking(roomNumber, checkinDate, checkoutDate);
	        
	        if (conflictingBooking == null) {
	            System.out.println("Room is available. Proceed with booking.");
	            return bs.confirmBooking(customerName, customerEmail, roomNumber, checkinDate, checkoutDate, req);
	        } else {
	            System.out.println("Room is already booked for these dates.");

	            ModelAndView mv = new ModelAndView("bookRoom.jsp");
	            mv.addObject("errorMessage", "Room is already booked from " +
	                       conflictingBooking.getBook_from() + " to " + conflictingBooking.getBook_upto() +
	                       ". Please choose different dates.");
	            return mv;
	        }
	    }

	    
	    @PostMapping("/finalConfirm")
	    public ModelAndView finalConfirm(@RequestParam("room_no")String room_no,
	    		                         @RequestParam("total_days")String total_days,
	    		                         @RequestParam("total_price")String total_price,
	    		                         HttpServletRequest req)
	    {
	    	 BookingService bs=new BookingService();
	    	 bs.finalConfirm(room_no,total_days,total_price,req);
	    	 return emailService.sendBookingConfirmation(room_no, total_days,total_price,req);
	    }
	    
	    @PostMapping("/verifyOtp")
	    public ModelAndView verifyOtp(@RequestParam("userOtp") String userOtp,@RequestParam("Otp")String Otp)
	    {
	    	EmailService emailService=new EmailService();
	    	return emailService.verifyOtp(userOtp,Otp);
	    	//return null;
	    }
	    
}

