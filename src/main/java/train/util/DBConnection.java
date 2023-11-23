package train.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection extends CommonUtil{
	
	private static Connection connection;
	
	private DBConnection() {
		
	}
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
		
		if(connection == null || connection.isClosed()) {
			
			Class.forName(properties.getProperty(CommonConstant.DRIVER_NAME));
			
			connection = DriverManager.getConnection(properties.getProperty(CommonConstant.URL), 
					properties.getProperty(CommonConstant.USERNAME), properties.getProperty(CommonConstant.PASSWORD));
		}
		
		return connection;
	}
}
