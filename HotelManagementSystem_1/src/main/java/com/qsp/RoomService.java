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
public class RoomService {
	
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("dev");
	EntityManager em=emf.createEntityManager();
	EntityTransaction et =em.getTransaction();
	
	
	
	public ModelAndView addRoom(int room_no, String status, double price, String img_url,String type,HttpServletRequest req) {
		// TODO Auto-generated method stub
		Rooms rooms=new Rooms();
		
		rooms.setRoom_no(room_no);
		rooms.setStatus(status);
		rooms.setPrice(price);
		rooms.setImg_url(img_url);
		rooms.setType(type);
		
		try {
			et.begin();
			em.persist(rooms);
			et.commit();
		}
		catch(Exception e)
		{
//			//retrieves room list and updating
//			Query q1=em.createQuery("SELECT r FROM Rooms r");
//			List<Rooms> room=(List<Rooms>)q1.getResultList();
//			HttpSession session= req.getSession();
//			session.setAttribute("rooms", room);
			
			ModelAndView mv=new ModelAndView("admindashboard.jsp");
			mv.addObject("errorMessage", "Room no "+room_no+" is already Exist!");
			return mv;
		}
		
		//retrieves room list and updating
				Query q1=em.createQuery("SELECT r FROM Rooms r");
				List<Rooms> room=(List<Rooms>)q1.getResultList();
				HttpSession session= req.getSession();
				session.setAttribute("rooms", room);
				
		ModelAndView mv=new ModelAndView("admindashboard.jsp");
		mv.addObject("successMessage", "Room no "+room_no+" is Added Successfully!!.");
		return mv;
		
	}



	public ModelAndView editRoom(int room_id,HttpServletRequest req) {
		// TODO Auto-generated method stub
		//update rooms in session
		Query query=em.createQuery("SELECT r FROM Rooms r WHERE r.room_id=:room_id");
		query.setParameter("room_id", room_id);
		Rooms room=(Rooms)query.getSingleResult();
		
		HttpSession hs=req.getSession();
		hs.setAttribute("singleRoom",room);
		
		ModelAndView mv=new ModelAndView("editRoom.jsp");
		return mv;
	}



	public ModelAndView updateRoom(int room_id, String img_url, double price, String status,String type,HttpServletRequest req) {
		// TODO Auto-generated method stub
		HttpSession hs=req.getSession();
		Rooms singleRoom=(Rooms)hs.getAttribute("singleRoom");
		ModelAndView mv=new ModelAndView("RoomsManagement.jsp");
		if(img_url!=null)
    	{
			singleRoom.setImg_url(img_url);
    		et.begin();
    		em.merge(singleRoom);
    		et.commit();
    	}
    	if(price!=0.0)
    	{
    		singleRoom.setPrice(price);
    		et.begin();
    		em.merge(singleRoom);
    		et.commit();
    	}
        if(status!=null)
    	{
        	singleRoom.setStatus(status);
    		et.begin();
    		em.merge(singleRoom);
    		et.commit();
    	}
        if(type!=null)
    	{
        	singleRoom.setType(type);
    		et.begin();
    		em.merge(singleRoom);
    		et.commit();
    	}
        
        //update rooms in session by fetching updated data
        Query query=em.createQuery("SELECT r FROM Rooms r");
		List<Rooms>room=(List<Rooms>)query.getResultList();

		hs.setAttribute("rooms",room);
		return mv;
	}



	public ModelAndView sortRooms(String priceRange,String roomType, HttpServletRequest req) {
		// TODO Auto-generated method stub
		HttpSession hs=req.getSession();
	//	String page=(String)hs.getAttribute("page");
		ModelAndView mv;
//		if(page!=null)
//		{
//			mv=new ModelAndView("booking.jsp");
//			
//		}
//		else {
		mv=new ModelAndView("rooms.jsp");
//		}
		
		Query q1=em.createQuery("SELECT r FROM Rooms r");
		List<Rooms> room=(List<Rooms>)q1.getResultList();
		hs.setAttribute("rooms", room);
		
		System.out.println("PRICE: "+priceRange+" ROOM:"+roomType);
		if(priceRange.isEmpty() && roomType.isEmpty())
		{
			System.out.println("doghi empty");
			//hs.removeAttribute("sortRoom");
			return mv;
		}
		else if(priceRange!= "" && roomType!="")
		{
			System.out.println("doghi ahet");
			Query q=em.createQuery("SELECT r FROM Rooms r WHERE r.type=:type AND r.price>=:price1 AND r.price<=:price2").setParameter("type",roomType);
			if(priceRange.equals("0-2000"))
			{
				q.setParameter("price1", 0.0);
			    q.setParameter("price2", 2000.0);
		
			}
			else if(priceRange.equals("2001-4000"))
			{
				q.setParameter("price1", 2001.0);
			    q.setParameter("price2", 4000.0);
			}
			else if(priceRange.equals("4001-6000"))
			{
				q.setParameter("price1", 4001.0);
			    q.setParameter("price2", 6000.0);
			}
			List<Rooms> sortRoom=(List<Rooms>)q.getResultList();
			//hs.setAttribute("sortRoom", sortRoom);
			hs.setAttribute("rooms", sortRoom);
			return mv;
		}
		else if(roomType!="")
		{
			System.out.println("room ahe");
			Query q=em.createQuery("SELECT r FROM Rooms r WHERE r.type=:type");
			q.setParameter("type",roomType);
			List<Rooms> sortRoom=(List<Rooms>)q.getResultList();
		//	hs.setAttribute("sortRoom", sortRoom);
			hs.setAttribute("rooms", sortRoom);
			return mv;
		}
		else if(priceRange!="")
		{
			System.out.println("price ahe");
			Query q=em.createQuery("SELECT r FROM Rooms r WHERE r.price>=:price1 AND r.price<=:price2");
			if(priceRange.equals("0-2000"))
			{
				q.setParameter("price1", 0.0);
			    q.setParameter("price2", 2000.0);
		
			}
			else if(priceRange.equals("2001-4000"))
			{
				q.setParameter("price1", 2001.0);
			    q.setParameter("price2", 4000.0);
			}
			else if(priceRange.equals("4001-6000"))
			{
				q.setParameter("price1", 4001.0);
			    q.setParameter("price2", 6000.0);
			}
			List<Rooms> sortRoom=(List<Rooms>)q.getResultList();
			//hs.setAttribute("sortRoom", sortRoom);
			hs.setAttribute("rooms", sortRoom);
			System.out.println(sortRoom.isEmpty());
			return mv;
			
		}
		return mv;
	}



	public ModelAndView sortRoomsB(String priceRange, String roomType, HttpServletRequest req) {
		// TODO Auto-generated method stub
		HttpSession hs=req.getSession();
	
		ModelAndView mv;
		mv=new ModelAndView("booking.jsp");

		
		Query q1=em.createQuery("SELECT r FROM Rooms r");
		List<Rooms> room=(List<Rooms>)q1.getResultList();
		hs.setAttribute("sortRooms", room);
		
		System.out.println("PRICE: "+priceRange+" ROOM:"+roomType);
		if(priceRange.isEmpty() && roomType.isEmpty())
		{
			System.out.println("doghi empty B");
			//hs.removeAttribute("sortRoom");
			return mv;
		}
		else if(priceRange!= "" && roomType!="")
		{
			System.out.println("doghi ahet B");
			Query q=em.createQuery("SELECT r FROM Rooms r WHERE r.type=:type AND r.price>=:price1 AND r.price<=:price2").setParameter("type",roomType);
			if(priceRange.equals("0-2000"))
			{
				q.setParameter("price1", 0.0);
			    q.setParameter("price2", 2000.0);
		
			}
			else if(priceRange.equals("2001-4000"))
			{
				q.setParameter("price1", 2001.0);
			    q.setParameter("price2", 4000.0);
			}
			else if(priceRange.equals("4001-6000"))
			{
				q.setParameter("price1", 4001.0);
			    q.setParameter("price2", 6000.0);
			}
			List<Rooms> sortRoom=(List<Rooms>)q.getResultList();
			//hs.setAttribute("sortRoom", sortRoom);
			hs.setAttribute("sortRooms", sortRoom);
			return mv;
		}
		else if(roomType!="")
		{
			System.out.println("room aheB");
			Query q=em.createQuery("SELECT r FROM Rooms r WHERE r.type=:type");
			q.setParameter("type",roomType);
			List<Rooms> sortRoom=(List<Rooms>)q.getResultList();
		//	hs.setAttribute("sortRoom", sortRoom);
			hs.setAttribute("sortRooms", sortRoom);
			return mv;
		}
		else if(priceRange!="")
		{
			System.out.println("price ahe");
			Query q=em.createQuery("SELECT r FROM Rooms r WHERE r.price>=:price1 AND r.price<=:price2");
			if(priceRange.equals("0-2000"))
			{
				q.setParameter("price1", 0.0);
			    q.setParameter("price2", 2000.0);
		
			}
			else if(priceRange.equals("2001-4000"))
			{
				q.setParameter("price1", 2001.0);
			    q.setParameter("price2", 4000.0);
			}
			else if(priceRange.equals("4001-6000"))
			{
				q.setParameter("price1", 4001.0);
			    q.setParameter("price2", 6000.0);
			}
			List<Rooms> sortRoom=(List<Rooms>)q.getResultList();
			//hs.setAttribute("sortRoom", sortRoom);
			hs.setAttribute("sortRooms", sortRoom);
			System.out.println(sortRoom.isEmpty());
			return mv;
			
		}
		return mv;
	}

	
}
