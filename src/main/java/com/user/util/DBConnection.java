package com.user.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection extends commonUtil{
	private static Connection connect;
	
	private DBConnection() {
		
	}
	
	public static Connection getDBConnection() throws ClassNotFoundException,SQLException{
		if(connect == null || connect.isClosed()) {
			Class.forName(prop.getProperty(commonConstants.DRIVER_NAME));
			
			connect = DriverManager.getConnection(prop.getProperty(commonConstants.URL),
					prop.getProperty(commonConstants.USERNAME),prop.getProperty(commonConstants.PASSWORD));
			
			System.out.println("getDBconnection executed");
			
		}
		
		return connect;
	}
}
