package com.qsp;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class Booking 
{
  @Id
  @GeneratedValue(strategy=GenerationType.IDENTITY)
  private int booking_id;
  private String name;
  private int c_id;
  private int room_no;
  private LocalDate book_from;
  private LocalDate book_upto;
  private String id_proof;
  private String id_number;
  private String c_email;
  private LocalDateTime check_in;
  
  private LocalDateTime check_out;
  private double price;
  private int total_days;
  
  public Booking()
  {
	  
  }

  
public String getC_email() {
	return c_email;
}


public void setC_email(String c_email) {
	this.c_email = c_email;
}


public int getTotal_days() {
	return total_days;
}

public void setTotal_days(int total_days) {
	this.total_days = total_days;
}

public int getRoom_no() {
	return room_no;
}

public void setRoom_no(int room_no) {
	this.room_no = room_no;
}

public String getId_proof() {
	return id_proof;
}

public void setId_proof(String id_proof) {
	this.id_proof = id_proof;
}

public String getId_number() {
	return id_number;
}

public void setId_number(String id_number) {
	this.id_number = id_number;
}

public LocalDate getBook_from() {
	return book_from;
}

public void setBook_from(LocalDate book_from) {
	this.book_from = book_from;
}

public LocalDate getBook_upto() {
	return book_upto;
}

public void setBook_upto(LocalDate book_upto) {
	this.book_upto = book_upto;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public int getBooking_id() {
	return booking_id;
}

public void setBooking_id(int booking_id) {
	this.booking_id = booking_id;
}

public int getC_id() {
	return c_id;
}

public void setC_id(int c_id) {
	this.c_id = c_id;
}

public LocalDateTime getCheck_in() {
	return check_in;
}

public void setCheck_in(LocalDateTime check_in) {
	this.check_in = check_in;
}

public LocalDateTime getCheck_out() {
	return check_out;
}

public void setCheck_out(LocalDateTime check_out) {
	this.check_out = check_out;
}

public double getPrice() {
	return price;
}

public void setPrice(double price) {
	this.price = price;
}
  
  
  
}
