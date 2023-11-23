package com.user.util;

import java.util.Properties;

public class commonUtil {
	public static final Properties prop = new Properties();
	
	static {
		try {
			prop.load(queryUtil.class.getResourceAsStream(commonConstants.PROPERTY_FILE));
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("exception raised from commonutill class");
		}
	}
}
