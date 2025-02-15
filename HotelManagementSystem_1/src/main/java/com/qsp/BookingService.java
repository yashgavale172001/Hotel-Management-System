package com.qsp;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

@Service
public class BookingService {

	EntityManagerFactory emf=Persistence.createEntityManagerFactory("dev");
	EntityManager em=emf.createEntityManager();
	EntityTransaction et =em.getTransaction();
	
	
	public ModelAndView confirmBooking(String customerName, String customerEmail,String roomNum,
			String checkinDate, String checkoutDate, HttpServletRequest req) {
		
		 ModelAndView mv=new ModelAndView("bookingConfirm.jsp");
		 
		 
		HttpSession hs=req.getSession();
		
		System.out.println("customer in confirm booking "+(Customer)hs.getAttribute("customer"));
		Customer c=(Customer)hs.getAttribute("customer");
		System.out.println(c.getFirst_name());
		
		// Define the format of the string
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        int roomNumber=Integer.parseInt(roomNum);
        
        // Convert string to LocalDate
        LocalDate cinDate = LocalDate.parse(checkinDate, formatter);
        LocalDate coutDate = LocalDate.parse(checkoutDate, formatter);
        
        hs.setAttribute("from_date",cinDate);
        hs.setAttribute("upto_date", coutDate);
        
		
		  Query query= em.createQuery("SELECT r FROM Rooms r WHERE r.room_no=:room_no");
		  query.setParameter("room_no",roomNumber);
		  
		  Rooms room=(Rooms)query.getSingleResult();
		  
		  long total_days= ChronoUnit.DAYS.between(cinDate,coutDate);
		   System.out.println("total days "+total_days);
		   
		   if(total_days==0)
		   {
			   total_days++;
		   }
		   
		  double total_price=room.getPrice() *total_days;
		  System.out.println("total price "+total_price);
		  
		  mv.addObject("total_days", total_days);
		  mv.addObject("total_price",total_price);
		  mv.addObject("room_no",roomNumber);
		  
		// TODO Auto-generated method stub
		return mv;
	}


	public void finalConfirm(String room_no, String total_days, String total_price, HttpServletRequest req) 
	{
		System.out.println("entering booking service");
		
		//ModelAndView mv=new ModelAndView("homepage.jsp");
		
		HttpSession hs=req.getSession();
		
		// TODO Auto-generated method stub
		int roomNo=Integer.parseInt(room_no);
		int totalDays=Integer.parseInt(total_days);
		double totalprice=Double.parseDouble(total_price);
		
		Customer customer=(Customer)hs.getAttribute("customer");
		
		String email=customer.getEmail();
		
		System.out.println("email is "+email);
		
		int c_id=customer.getC_id();
		String name=customer.getFirst_name()+" "+customer.getLast_name();
		
		LocalDate from_date=(LocalDate)hs.getAttribute("from_date");
		LocalDate upto_date=(LocalDate)hs.getAttribute("upto_date");
		
		Booking booking=new Booking();
		
		
		Query q=em.createQuery("SELECT r FROM Rooms r WHERE r.room_no=:room_no");
		q.setParameter("room_no",roomNo);
		Rooms room=(Rooms)q.getSingleResult();
		
		//changing status of room
		room.setStatus("Booked");
		
		
		//setting values of booking
		booking.setBook_from(from_date);
		booking.setBook_upto(upto_date);
		booking.setC_id(c_id);
		booking.setName(name);
		booking.setRoom_no(roomNo);
		booking.setPrice(totalprice);
		booking.setTotal_days(totalDays);
		booking.setC_email(email);
		try {
			et.begin();
			em.merge(room);
			em.persist(booking);
			et.commit();
		}
		catch(Exception e)
		{
			System.out.println("Error while storing the data");
		}
		
		Query query2=em.createQuery("SELECT b FROM Booking b WHERE b.c_email=:email");
		query2.setParameter("email",customer.getEmail());
		List<Booking> bookings=(List<Booking>)query2.getResultList();
		hs.setAttribute("bookings",bookings);
		//mv.addObject("confirmation","yes" );
		//return mv;
		System.out.println("Data successfully stored in database");
	}

	public Booking getConflictingBooking(String roomNumber, String checkinDate, String checkoutDate) {
	    int room_no = Integer.parseInt(roomNumber);
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

	    // Convert string dates to LocalDate
	    LocalDate cinDate = LocalDate.parse(checkinDate, formatter);
	    LocalDate coutDate = LocalDate.parse(checkoutDate, formatter);
	    
	    EntityManager em = emf.createEntityManager();
	    try {
	        String jpql = "SELECT b FROM Booking b WHERE b.room_no = :room_no " +
	                      "AND (:newCheckIn BETWEEN b.book_from AND b.book_upto " +
	                      "OR :newCheckOut BETWEEN b.book_from AND b.book_upto " +
	                      "OR b.book_from BETWEEN :newCheckIn AND :newCheckOut " +
	                      "OR b.book_upto BETWEEN :newCheckIn AND :newCheckOut) " +
	                      "ORDER BY b.book_from ASC"; // Get the earliest conflicting booking
	        
	        List<Booking> bookings = em.createQuery(jpql, Booking.class)
	                                   .setParameter("room_no", room_no)
	                                   .setParameter("newCheckIn", cinDate)
	                                   .setParameter("newCheckOut", coutDate)
	                                   .getResultList();
	        
	        return bookings.isEmpty() ? null : bookings.get(0); // Return first conflicting booking or null
	    } finally {
	        em.close();
	    }
	}


	public ModelAndView updateBooking(String bookingId, HttpServletRequest req) {
		// TODO Auto-generated method stub
		int bookingid=Integer.parseInt(bookingId);
		
		Query query=em.createQuery("SELECT b FROM Booking b WHERE b.booking_id=:bookingId");
		query.setParameter("bookingId", bookingid);
		Booking booking=(Booking)query.getSingleResult();
		
		HttpSession hs=req.getSession();
		hs.setAttribute("singleBooking",booking);
		
		ModelAndView mv=new ModelAndView("updateBooking.jsp");
		return mv;
		//return null;
	}


	public ModelAndView updateSingleBooking(String checkin, String checkout, String idProof, String idNumber,HttpServletRequest req) {
		// TODO Auto-generated method stub
		ModelAndView mv=new ModelAndView("BookingManagement.jsp");
		LocalDateTime currentDateTime = LocalDateTime.now();
		HttpSession hs=req.getSession();
		Booking booking=(Booking)hs.getAttribute("singleBooking");
		
		if(checkin.equals("Yes"))
		{
			booking.setCheck_in(currentDateTime);
		}
		if(checkout.equals("Yes"))
		{
			booking.setCheck_out(currentDateTime);
		}
		booking.setId_proof(idProof);
		booking.setId_number(idNumber);
		
		et.begin();
		em.merge(booking);
		et.commit();
		
		Query q=em.createQuery("SELECT b FROM Booking b");
		List<Booking>bookings=q.getResultList();
		hs.setAttribute("bookings", bookings);
		
		return mv;
	}

	
	
   
}
