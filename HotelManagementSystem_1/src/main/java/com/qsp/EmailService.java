package com.qsp;

import java.io.InputStream;
import java.security.SecureRandom;
import java.time.LocalDate;
import java.util.Properties;
import javax.persistence.Query;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.web.servlet.ModelAndView;


public class EmailService {

    private JavaMailSender sendMail;

    public EmailService() {
        JavaMailSenderImpl mailSenderImpl = new JavaMailSenderImpl();
        mailSenderImpl.setHost("smtp.gmail.com");
        mailSenderImpl.setPort(587);

        Properties properties = new Properties();
        try (InputStream input = getClass().getClassLoader().getResourceAsStream("application.properties")) {
            properties.load(input);
            System.out.println("Loaded Email Properties:");
            System.out.println("Username: " + properties.getProperty("mail.username"));
            System.out.println("Password: " + properties.getProperty("mail.password"));
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        mailSenderImpl.setUsername(properties.getProperty("mail.username"));
        mailSenderImpl.setPassword(properties.getProperty("mail.password"));

        Properties props = mailSenderImpl.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        props.put("mail.debug", "true");

        this.sendMail = mailSenderImpl;
    }


    public ModelAndView sendBookingConfirmation(String room_no, String total_days, String total_price, HttpServletRequest req) {
        System.out.println("Entering sendBookingConfirmation");

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("dev");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        HttpSession hs = req.getSession();
        int roomNo = Integer.parseInt(room_no);
        //int totalDays = Integer.parseInt(total_days);
        System.out.println(roomNo);
        
        Customer customer = (Customer) hs.getAttribute("customer");
       // int c_id = customer.getC_id();
        String name = customer.getFirst_name() + " " + customer.getLast_name();

        LocalDate from_date = (LocalDate) hs.getAttribute("from_date");
        LocalDate upto_date = (LocalDate) hs.getAttribute("upto_date");

        Query q = em.createQuery("SELECT r FROM Rooms r WHERE r.room_no = :roomNo");
        q.setParameter("roomNo", roomNo);
        Rooms room = (Rooms) q.getSingleResult();

        ModelAndView mv = new ModelAndView("homepage.jsp");

       System.out.println("before subject");
       
        String subject = "Booking Confirmation - YG Hotels";
        String body = "Booking Confirmation\n"
                + "Dear " + name + ",\n\n"
                + "Thank you for choosing our hotel! Your booking has been successfully confirmed. Below are the details:\n\n"
                + "Name: " + name + "\n"
                + "Room Type: " + room.getType() + "\n"
                + "Check-in Date: " + from_date + "\n"
                + "Check-out Date: " + upto_date + "\n"
                + "Total Price: " + total_price + "\n\n"
                + "If you have any questions, feel free to contact us.\n";

        System.out.println("after subject");
        
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(customer.getEmail());
        message.setSubject(subject);
        message.setText(body);

        sendMail.send(message);
        mv.addObject("confirmation", "yes");

        em.close();
        emf.close();

        return mv;
    }


    //random otp genertion
	public String generateOTP() {
		// TODO Auto-generated method stub
	  final String CHARACTERS="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	  final SecureRandom secureRandom=new SecureRandom();
	  StringBuilder otp=new StringBuilder();
	  for(int i=0;i<6;i++)
	  {
		  otp.append(CHARACTERS.charAt(secureRandom.nextInt(CHARACTERS.length())));
	  }
	  System.out.println("otp in EmailService Class Stringbuilder:"+otp+" String:"+otp.toString());
		return otp.toString();
	}


	public ModelAndView verifyOtp(String userOtp, String otp) {
		// TODO Auto-generated method stub
		ModelAndView mv;
		if(userOtp.equals(otp))
		{
			return new ModelAndView("homepage.jsp");
		}
		else {
			 mv=new ModelAndView("LoginOtp.jsp");
			 mv.addObject("errorMessage", "Wrong OTP Please enter correct one");
			 return mv;
		}
		
	}


	public void sendOtp(String otp,HttpServletRequest req) {
		
		HttpSession hs=req.getSession();
		// TODO Auto-generated method stub
		String subject = "One Time Password (OTP)"; 

		String body = "Dear Customer,\n\n"
		            + "Your One-Time Password (OTP) for verification is: " + otp + "\n\n"
		            + "This OTP is valid for 5 minutes. Please do not share it with anyone.\n\n"
		            + "If you did not request this OTP, please ignore this email.\n\n"
		            + "Thank you,\n"
		            + "YG Hotels";

        Customer customer=(Customer)hs.getAttribute("customer");

        System.out.println("after subject");
        
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(customer.getEmail());
        message.setSubject(subject);
        message.setText(body);

        sendMail.send(message);
	}
}
