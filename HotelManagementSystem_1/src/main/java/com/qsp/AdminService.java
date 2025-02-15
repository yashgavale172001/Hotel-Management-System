package com.qsp;

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
public class AdminService 
{
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("dev");
	   EntityManager em=emf.createEntityManager();
	   EntityTransaction et=em.getTransaction();
	   
   public ModelAndView AdminVerify(HttpServletRequest req,AdminDTO admin)
   { 
	   
	   Query query= em.createQuery("SELECT a FROM Admin a WHERE a.email=:email AND a.password=:password");
	   query.setParameter("email", admin.getEmail());
	   query.setParameter("password", admin.getPassword());
	   ModelAndView mav=new ModelAndView("adminlogin.jsp");
	   Admin ad=null;
	   try {
		   ad=(Admin)query.getSingleResult();
	   }
	   catch(Exception e)
	   {
		   mav.addObject("errorMessage", "Wrong Email or Password");
		   return mav;
	   }
	 //  ModelAndView mv=new ModelAndView("adminlogin.jsp");
	  
		   if(ad.getEmail().equals(admin.getEmail()) && ad.getPassword().equals(admin.getPassword()))
		   {
			   ModelAndView mv=new ModelAndView("admindashboard.jsp");
			   Query q1=em.createQuery("SELECT r FROM Rooms r");
			   Query q2=em.createQuery("SELECT b FROM Booking b");
			   
			   List<Rooms> room=(List<Rooms>)q1.getResultList();
			   List<Booking> booking=(List<Booking>)q2.getResultList();
			   
			   HttpSession hs=req.getSession();
			   hs.setAttribute("name", ad.getName());
			   hs.setAttribute("rooms",room);
			   hs.setAttribute("bookings", booking);
			   
			   return mv;
		   }
	      
		return mav;	   
	   
   }
   
   public ModelAndView adminRegister(String name,String email,String password)
   {
	   
	   Admin admin=new Admin();
	   admin.setName(name);
	   admin.setEmail(email);
	   admin.setPassword(password);
	   try {
		   et.begin();
		   em.persist(admin);
		   et.commit();
	   }
	   catch(Exception e)
	   {
		   System.out.println("enters in catch");
		   ModelAndView mv=new ModelAndView("adminregister.jsp");
		   mv.addObject("errorMessage","Email Already Exist!");
		   return mv;
	   }

	   return new ModelAndView("adminlogin.jsp");
	   
   }
	
}
