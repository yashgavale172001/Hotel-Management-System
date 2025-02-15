package com.qsp;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query; 
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;



@Service
public class CustomerService 
{
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("dev");
	EntityManager em=emf.createEntityManager();
	EntityTransaction et =em.getTransaction();
	
	//to register the user
    public ModelAndView saveCustomer(CustomerDTO cd) 
    {
    	ModelAndView mv;
    	Customer customer=new Customer();
    	
    	customer.setAge(cd.getAge());
    	customer.setAddress(cd.getAddress());
    	customer.setCity(cd.getCity());
    	customer.setCountry(cd.getCountry());
    	customer.setEmail(cd.getEmail());
    	customer.setFirst_name(cd.getFirst_name());
    	customer.setLast_name(cd.getLast_name());
    	customer.setPassword(cd.getPassword());
    	customer.setPhone_number(cd.getPhone_number());
    	customer.setState(cd.getState());
    	
    	try {
    		et.begin();
        	em.persist(customer);
        	et.commit();
    	}
    	catch(Exception e)
    	{
    		 mv=new ModelAndView("register.jsp");
    		 mv.addObject("errorMessage","Email Already Exist!..");
    		 return mv;
    	}
    	System.out.println("ho raha he");
    	
    	
    	mv=new ModelAndView("Login.jsp");
    	return mv;
    }
    
    //to verify login credentials
    public ModelAndView loginCustomer(CustomerDTO cd,HttpServletRequest req)
    {
    	EmailService emailService=new EmailService();
    	//creating session
    	HttpSession hs=req.getSession();
    	
    	ModelAndView mv=new ModelAndView("login");
    	
        String jpql = "SELECT c FROM Customer c WHERE c.email = :email AND c.password = :password";
        Query query = em.createQuery(jpql);
        query.setParameter("email", cd.getEmail());
        query.setParameter("password", cd.getPassword());

        Customer customers;
        try {
        	customers = (Customer)query.getSingleResult();
        }
        catch(Exception e)
        {
        	ModelAndView mav = new ModelAndView("Login.jsp"); // login.jsp
            mav.addObject("errorMessage", "Wrong Email or Password");
            System.out.println("not matched");
            return mav;
        }
    			System.out.println(customers);
      
        	if(customers.getEmail().equals(cd.getEmail()) && customers.getPassword().equals(cd.getPassword()))
        	{
        		ModelAndView mav=new ModelAndView("LoginOtp.jsp");
        		Query query1=em.createQuery("SELECT r FROM Rooms r");
        		Query query2=em.createQuery("SELECT b FROM Booking b WHERE b.c_email=:email");
        		query2.setParameter("email",customers.getEmail());
        		
        		List<Booking> bookings=(List<Booking>)query2.getResultList();
        		
        		//setting current customer in the session
        		hs.setAttribute("customer",customers);
        		
        		hs.setAttribute("bookings",bookings);
        		hs.setAttribute("email",customers.getEmail());
        		
        		List<Rooms> room=(List<Rooms>)query1.getResultList();
        		hs.setAttribute("rooms", room);
        		hs.setAttribute("sortRooms", room);
        		
        		//generating otp
        		String otp=emailService.generateOTP();
        		
        		//sending otp to customers email
        		emailService.sendOtp(otp,req);
        		System.out.println("otp in customer service "+otp);
        		System.out.println("matched");
        		hs.setAttribute("otp", otp);
        		//emailService.sendOtp(otp);
        		
        		return mav;
        	}
      return mv;
    }
    
}
