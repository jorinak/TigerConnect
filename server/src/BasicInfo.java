package com.tigerconnect.model;

import java.io.Serializable;

public class BasicInfo implements Serializable{
	
	private static final long serialVersionUID = 1238918602068356152L;
	
	int id;
	String fname;
	String lname;
	String cyear;
	String blurb;
	String major;
	String rcollege;
	
	public BasicInfo(String firstname, String lastname, String classyear, String description, String major, String rescollege) {
		super();
		this.id       = -1;
		this.fname    = firstname;
		this.lname    = lastname;
		this.cyear    = classyear;
		this.blurb    = description;
		this.major    = major;
		this.rcollege = rescollege;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstname() {
		return fname;
	}
	public void setFirstname(String fname) {
		this.fname = fname;
	}
	public String getLastname() {
		return lname;
	}
	public void setLastname(String lname) {
		this.lname = lname;
	}
	public String getClassyear() {
		return cyear;
	}
	public void setClassyear(String cyear) {
		this.cyear = cyear;
	}
	public String getBlurb() {
		return blurb;
	}
	public void setBlurb(String blurb) {
		this.blurb = blurb;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getRcollege() {
		return rcollege;
	}
	public void setRcollege(String rcollege) {
		this.rcollege = rcollege;
	}
	
}
