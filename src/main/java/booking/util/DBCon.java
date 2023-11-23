package booking.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBCon extends ComUtil {
	private static Connection connection;
	private DBCon() {
		//Private constructor to prevent instantiation
	}
	public static Connection getDBCon() throws ClassNotFoundException, SQLException{
		if(connection==null||connection.isClosed()) {
			//Load the database driver and establish connection
			Class.forName(properties.getProperty(ComCons.DRIVER_NAME));
			connection=DriverManager.getConnection(properties.getProperty(ComCons.URL),
					properties.getProperty(ComCons.USERNAME), properties.getProperty(ComCons.PASSWORD));
		}
		return connection;
	}
}
