package com.qsp;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class Customer 
{
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private int c_id;
  private String first_name;
  private String last_name;
  private int age;
  private String email;
  private String password;
  private Long phone_number;
  private String address;
  private String city;
  private String state;
  private String country;
  @CreationTimestamp
  private LocalDateTime registrationTime;
  
  public Customer()
  {
	  
  }
public int getC_id() {
	return c_id;
}
public void setC_id(int c_id) {
	this.c_id = c_id;
}
public String getFirst_name() {
	return first_name;
}
public void setFirst_name(String first_name) {
	this.first_name = first_name;
}
public String getLast_name() {
	return last_name;
}
public void setLast_name(String last_name) {
	this.last_name = last_name;
}
public int getAge() {
	return age;
}
public void setAge(int age) {
	this.age = age;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public Long getPhone_number() {
	return phone_number;
}
public void setPhone_number(Long phone_number) {
	this.phone_number = phone_number;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public String getCountry() {
	return country;
}
public void setCountry(String country) {
	this.country = country;
}
public LocalDateTime getRegistrationTime() {
	return registrationTime;
}
public void setRegistrationTime(LocalDateTime registrationTime) 
{
	this.registrationTime = registrationTime;
}
}
