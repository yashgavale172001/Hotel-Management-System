package com.qsp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Rooms 
{
  @Id
  @GeneratedValue(strategy=GenerationType.IDENTITY)
  private int room_id;
  
  @Column(unique=true)
  private int room_no;
  
  private String status;
  private String type;
  private double price;
  private String img_url;
  
  public Rooms()
  {
	  
  }

public String getType() {
	return type;
}

public void setType(String type) {
	this.type = type;
}

public int getRoom_id() {
	return room_id;
}

public void setRoom_id(int room_id) {
	this.room_id = room_id;
}

public int getRoom_no() {
	return room_no;
}

public void setRoom_no(int room_no) {
	this.room_no = room_no;
}

public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}

public double getPrice() {
	return price;
}

public void setPrice(double price) {
	this.price = price;
}

public String getImg_url() {
	return img_url;
}

public void setImg_url(String img_url) {
	this.img_url = img_url;
}
  
}
