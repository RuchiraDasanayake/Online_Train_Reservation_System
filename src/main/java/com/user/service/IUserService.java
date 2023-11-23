package com.user.service;

import java.util.ArrayList;

import com.user.model.user;

public interface IUserService {
	public void addUser(user user);
	
	//public ArrayList<user> getUser();
	
	public ArrayList<user> getUserById(String uid);
	
	public void updateUser(String uid,user user);
	
	public void deleteUser(String uid);
	
	
}
