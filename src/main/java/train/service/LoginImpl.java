//IT22334138
//De Vaas Gunawardana A.C.T.D
//MLB_WD_G129_OOP_Online Train Reservation System
package train.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;
import train.model.Login;
import train.util.CommonConstant;
import train.util.DBConnection;
import train.util.QueryUtil;
public class LoginImpl {
	
	private static Connection connection;
	private static PreparedStatement preparedstatement;
	
	//validate login
	public String ValidateLogin(Login login) {
		
		String Username = login.getUsername();
		String UsernameDB;
		String Password = login.getPassword();
		String PasswordDB;
		String RoleDB;
		String IdDB;
		
		try {
			
			connection = DBConnection.getConnection();
			
			preparedstatement = connection.prepareStatement(QueryUtil.queryById(CommonConstant.QUERY_ID_GET_LOGINS_BY_ID));
			
			ResultSet rs = preparedstatement.executeQuery();
			
			while(rs.next()) {
				UsernameDB = rs.getString(CommonConstant.COLUMN_INDEX_ONE);
				PasswordDB = rs.getString(CommonConstant.COLUMN_INDEX_TWO);
				RoleDB = rs.getString(CommonConstant.COLUMN_INDEX_THREE);
				IdDB = rs.getString(CommonConstant.COLUMN_INDEX_FOUR);
				
				if(Username.equals(UsernameDB) && Password.equals(PasswordDB)) {
					login.setUsername(UsernameDB);
					login.setPassword(PasswordDB);
					login.setRole(RoleDB);
					login.setId(IdDB);
					return "SUCCESS";
				}
			}
			
		}catch(SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.println("ValidateLogin exception " + e.getMessage());
		}finally {
			
			try {
				
				if(connection != null) {
					
					connection.close();
					
				}
				
				if(preparedstatement != null) {
					
					preparedstatement.close();
					
				}
			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		
		return "Invalid user credintials";
	}
}
