package com.tigerconnect.model;

import java.io.Serializable;

public class UserInfo implements Serializable{
	
	private static final long serialVersionUID = 1238918602068356152L;
	
	int id;
	String username;
	String password;
	String email;
	
	
	public UserInfo(String username, String password, String email) {
		super();
		this.id       = -1;
		this.username = username;
		this.password = password;
		this.email    = email;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
