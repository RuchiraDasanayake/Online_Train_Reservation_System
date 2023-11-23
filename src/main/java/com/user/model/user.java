package com.user.model;

public class user {
	private String userID;
	private String firstName;
	private String lastName;
	private String address;
	private String stPoint;
	private String destPoint;
	private String NIC;
	private String contactNo;
	//attribute to save if there is a error
	private String errormsg;
	public String getErrormsg() {
		return errormsg;
	}
	public void setErrormsg(String errormsg) {
		this.errormsg = errormsg;
	}
	
	//end of error attribute
	public String getUserID() {
		return userID;
	}
	public String getFirstName() {
		return firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public String getAddress() {
		return address;
	}
	public String getStPoint() {
		return stPoint;
	}
	public String getDestPoint() {
		return destPoint;
	}
	public String getNIC() {
		return NIC;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setStPoint(String stPoint) {
		this.stPoint = stPoint;
	}
	public void setDestPoint(String destPoint) {
		this.destPoint = destPoint;
	}
	public void setNIC(String nIC) {
		NIC = nIC;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	
	
	
}
