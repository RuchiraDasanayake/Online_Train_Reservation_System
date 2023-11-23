package com.user.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import com.user.model.user;
import com.user.util.DBConnection;
import com.user.util.commonConstants;
import com.user.util.queryUtil;

public class UserServiceImplement implements IUserService{
	
	private static Connection con;
	private static Statement stmt;
	private static PreparedStatement prepstamt;
	
	
	static {
		createReqUserTable();
	}
	public static void createReqUserTable() { //create database
		try {
			con = DBConnection.getDBConnection();
			
			stmt = con.createStatement();
			
			stmt.execute(queryUtil.queryById(commonConstants.QUERY_ID_CREATE_USERREQ_TABLE));
			
			System.out.println("create table query executerd");
			
		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.println(e.getMessage());
			System.out.println("exception thrown from createrequsertable");
		}finally {
			try {
				if(con != null) {
					con.close();
				}if(stmt != null) {
					stmt.close();
				}
			}catch (SQLException e) {
				System.out.println(e.getMessage());
				System.out.println("exception thrown from createrequsertable final block");
			}
		}
	}
	
	
	
	
	@Override
	public void addUser(user user) {//add user details to database

		
		String userId = user.getUserID();
		
		try {
			con = DBConnection.getDBConnection();
			
			PreparedStatement perpforid = con.prepareStatement(queryUtil.queryById(commonConstants.QUERY_ID_check_id));
			perpforid.setString(commonConstants.COLUMN_INDEX_ONE, userId);
			
			ResultSet rsid = perpforid.executeQuery();
			
			if(rsid.next()) {
				System.out.println("it seems this user already requested a monthly train pass");
				user.setUserID(userId);
				user.setErrormsg("dataexist");//set error attribute
		
				
				
			}else {
				
			
			prepstamt = con.prepareStatement(queryUtil.queryById(commonConstants.QUERY_ID_INSERT_USER));
			con.setAutoCommit(false);
			
			user.setUserID(userId);
			
			prepstamt.setString(commonConstants.COLUMN_INDEX_ONE, user.getUserID());
			prepstamt.setString(commonConstants.COLUMN_INDEX_TWO, user.getFirstName());
			prepstamt.setString(commonConstants.COLUMN_INDEX_THREE, user.getLastName());
			prepstamt.setString(commonConstants.COLUMN_INDEX_FOUR, user.getNIC());
			prepstamt.setString(commonConstants.COLUMN_INDEX_FIVE, user.getContactNo());
			prepstamt.setString(commonConstants.COLUMN_INDEX_SIX, user.getAddress());
			prepstamt.setString(commonConstants.COLUMN_INDEX_SEVEN, user.getStPoint());
			prepstamt.setString(commonConstants.COLUMN_INDEX_EIGHT, user.getDestPoint());
			
			user.setErrormsg("datanotexist");
			
			prepstamt.executeLargeUpdate();
			con.commit();
			}
			
		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.println(e.getMessage());
			System.out.println("exeption thrown from adduser method");
			
		}finally {
			try {
				if(con != null) {
					con.close();
				}
				if(prepstamt != null) {
					prepstamt.close();
				}
			} catch (SQLException e2) {
				System.out.println("exception in table close in adduser" + e2.getMessage());
			}
		}
		
		
	}
	
	
	
	
	public ArrayList<user> getUserById(String uid){//get user details from database
		ArrayList<user> userlist = new ArrayList<user>();
		
		try {
			con = DBConnection.getDBConnection();
			
			prepstamt = con.prepareStatement(queryUtil.queryById(commonConstants.QUERY_ID_GET_REQUESTED_DETAILS));
			prepstamt.setString(commonConstants.COLUMN_INDEX_ONE, uid);
			
			ResultSet rs = prepstamt.executeQuery();
			
			while(rs.next()) {
				user us = new user();
				
				us.setUserID(rs.getString(commonConstants.COLUMN_INDEX_ONE));
				us.setFirstName(rs.getString(commonConstants.COLUMN_INDEX_TWO));
				us.setLastName(rs.getString(commonConstants.COLUMN_INDEX_THREE));
				us.setNIC(rs.getString(commonConstants.COLUMN_INDEX_FOUR));
				us.setContactNo(rs.getString(commonConstants.COLUMN_INDEX_FIVE));
				us.setAddress(rs.getString(commonConstants.COLUMN_INDEX_SIX));
				us.setStPoint(rs.getString(commonConstants.COLUMN_INDEX_SEVEN));
				us.setDestPoint(rs.getString(commonConstants.COLUMN_INDEX_EIGHT));
				
				userlist.add(us);
			}
			
			
		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.println(e.getMessage());
			System.out.println("from getUserById method");
		}finally {
			try {
				if(con != null) {
					con.close();
				}
				if(prepstamt != null) {
					prepstamt.close();
				}
			} catch (SQLException e2) {
				System.out.println("table close exveption from getUserById final."+e2.getMessage());
			}
		}
		
		return userlist;
	};
	
	
	
	
	public void updateUser(String uid,user user) {//update details in database
		
		try {
			
			con = DBConnection.getDBConnection();
			
			prepstamt = con.prepareStatement(queryUtil.queryById(commonConstants.QUERY_ID_UPDATE_USER_DETAILS));
			con.setAutoCommit(false);
			
			prepstamt.setString(commonConstants.COLUMN_INDEX_EIGHT, user.getUserID());
			prepstamt.setString(commonConstants.COLUMN_INDEX_ONE, user.getFirstName());
			prepstamt.setString(commonConstants.COLUMN_INDEX_TWO, user.getLastName());
			prepstamt.setString(commonConstants.COLUMN_INDEX_THREE, user.getNIC());
			prepstamt.setString(commonConstants.COLUMN_INDEX_FOUR, user.getContactNo());
			prepstamt.setString(commonConstants.COLUMN_INDEX_FIVE, user.getAddress());
			prepstamt.setString(commonConstants.COLUMN_INDEX_SIX, user.getStPoint());
			prepstamt.setString(commonConstants.COLUMN_INDEX_SEVEN, user.getDestPoint());
			
			prepstamt.executeLargeUpdate();
			con.commit();
			
		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.println(e.getMessage());
			System.out.println("exception thrown from updateuser method");
		}finally {
			try {
				if(con != null) {
					con.close();
				}
				if(prepstamt != null) {
					prepstamt.close();
				}
			} catch (SQLException e2) {
				System.out.println("table close exveption from updateuser method."+e2.getMessage());
			}
		}
		
	};
	
	
	
	
	public void deleteUser(String uid) {
		
		if(uid != null && !uid.isEmpty()) {
			try {
				con = DBConnection.getDBConnection();
				
				prepstamt = con.prepareStatement(queryUtil.queryById(commonConstants.QUERY_ID_DELETE_USER_DETAILS));
				prepstamt.setString(commonConstants.COLUMN_INDEX_ONE,uid);
				
				
				prepstamt.execute();
				
							
			} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
				System.out.println(e.getMessage());
				System.out.println("exception throws from deleteuser method");
			}finally {
				try {
					if(con != null) {
						con.close();
					}
					if(prepstamt != null) {
						prepstamt.close();
					}
				} catch (SQLException e2) {
					System.out.println("exception throws from finally block of deleteuser"+e2.getMessage());
				}
			}
		}
		
	};
	
	//not required delete if needed
	public ArrayList<user> getAllRequests(){
		ArrayList<user> userlist = new ArrayList<user>();
		
		try {
			con = DBConnection.getDBConnection();
			
			prepstamt = con.prepareStatement(queryUtil.queryById(commonConstants.QUERY_GET_ALL_REQUESTS));
			
			ResultSet rs = prepstamt.executeQuery();
			
			while(rs.next()) {
				user us = new user();
				
				us.setUserID(rs.getString(commonConstants.COLUMN_INDEX_ONE));
				us.setFirstName(rs.getString(commonConstants.COLUMN_INDEX_TWO));
				us.setLastName(rs.getString(commonConstants.COLUMN_INDEX_THREE));
				us.setNIC(rs.getString(commonConstants.COLUMN_INDEX_FOUR));
				us.setContactNo(rs.getString(commonConstants.COLUMN_INDEX_FIVE));
				us.setAddress(rs.getString(commonConstants.COLUMN_INDEX_SIX));
				us.setStPoint(rs.getString(commonConstants.COLUMN_INDEX_SEVEN));
				us.setDestPoint(rs.getString(commonConstants.COLUMN_INDEX_EIGHT));
				
				userlist.add(us);
			}
			
			
		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.println(e.getMessage());
			System.out.println("from getUserById method");
		}finally {
			try {
				if(con != null) {
					con.close();
				}
				if(prepstamt != null) {
					prepstamt.close();
				}
			} catch (SQLException e2) {
				System.out.println("table close exveption from getUserById final."+e2.getMessage());
			}
		}
		
		return userlist;
	};
	
	
	
}
