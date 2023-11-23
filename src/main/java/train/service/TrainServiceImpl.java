//IT22334138
//De Vaas Gunawardana A.C.T.D
//MLB_WD_G129_OOP_Online Train Reservation System
package train.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import train.model.Train;
import train.util.CommonConstant;
import train.util.CommonUtil;
import train.util.DBConnection;
import train.util.QueryUtil;

public class TrainServiceImpl implements ITrainService{
	
	private static Connection connection;
	private static Statement stmt;
	private static PreparedStatement preparedstatement;

	static {
		createTrainTable();
	}
	//create train table
	public static void createTrainTable() {
		
		try {
			
			connection = DBConnection.getConnection();
			
			stmt = connection.createStatement();
			
			stmt.execute(QueryUtil.queryById(CommonConstant.QUERY_ID_CREATE_TRAIN_TABLE));
			
		}catch(SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			
			System.out.println("Create table exception " + e.getMessage());
			
		}finally {
			
			try {
				
				if(connection != null) {
					
					connection.close();
					
				}
				
				if(stmt != null) {
					
					stmt.close();
					
				}
			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}
	
	//add train to database
	public void addTrain(Train train) {
		
		String trainId = CommonUtil.generateTrainIds(getTrainIds());
		
		try {
			
			connection = DBConnection.getConnection();
			
			preparedstatement = connection.prepareStatement(QueryUtil.queryById(CommonConstant.QUERY_ID_INSERT_TRAIN_TABLE));
			connection.setAutoCommit(false);
			
			train.setTrainId(trainId);
			
			preparedstatement.setString(CommonConstant.COLUMN_INDEX_ONE, train.getTrainId());
			preparedstatement.setString(CommonConstant.COLUMN_INDEX_TWO, train.getTrainName());
			preparedstatement.setString(CommonConstant.COLUMN_INDEX_THREE, train.getFromWhere());
			preparedstatement.setString(CommonConstant.COLUMN_INDEX_FOUR, train.getToWhere());
			preparedstatement.setString(CommonConstant.COLUMN_INDEX_FIVE, train.getDispatcher());
			preparedstatement.setString(CommonConstant.COLUMN_INDEX_SIX, train.getArrival());
			preparedstatement.setString(CommonConstant.COLUMN_INDEX_SEVEN, train.getDate());
			
			preparedstatement.executeLargeUpdate();
			connection.commit();
			
		}catch(SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.println("Add train exception " + e.getMessage());
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
	}

	//get train details from database
	public ArrayList<Train> getTrain(String frowhere, String towhere, String date) {
		
		ArrayList<Train> trainList = new ArrayList<>();
		
		try {
			
			connection = DBConnection.getConnection();
			
			preparedstatement = connection.prepareStatement(QueryUtil.queryById(CommonConstant.QUERY_ID_GET_ALL_TRAIN));
			preparedstatement.setString(CommonConstant.COLUMN_INDEX_ONE , frowhere);
			preparedstatement.setString(CommonConstant.COLUMN_INDEX_TWO , towhere);
			preparedstatement.setString(CommonConstant.COLUMN_INDEX_THREE , date);
			ResultSet rs = preparedstatement.executeQuery();
			
			while(rs.next()) {
				
				Train tr = new Train();
				
				tr.setTrainId(rs.getString(CommonConstant.COLUMN_INDEX_ONE));
				tr.setTrainName(rs.getString(CommonConstant.COLUMN_INDEX_TWO));
				tr.setFromWhere(rs.getString(CommonConstant.COLUMN_INDEX_THREE));
				tr.setToWhere(rs.getString(CommonConstant.COLUMN_INDEX_FOUR));
				tr.setDispatcher(rs.getString(CommonConstant.COLUMN_INDEX_FIVE));
				tr.setArrival(rs.getString(CommonConstant.COLUMN_INDEX_SIX));
				tr.setDate(rs.getString(CommonConstant.COLUMN_INDEX_SEVEN));
				
				trainList.add(tr);
			}
			
		}catch(SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.println("Get All train exception " + e.getMessage());
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
		
		return trainList;
	}

	//get train details from database by train id
	public ArrayList<Train> getTrainById(String TrainId) {
		
		ArrayList<Train> trainList = new ArrayList<>();
		
		try {
			
			connection = DBConnection.getConnection();
			
			preparedstatement = connection.prepareStatement(QueryUtil.queryById(CommonConstant.QUERY_ID_GET_TRAIN_BY_ID));
			preparedstatement.setString(CommonConstant.COLUMN_INDEX_ONE , TrainId);
			ResultSet rs = preparedstatement.executeQuery();
			
			while(rs.next()) {
				
				Train tr = new Train();
				
				tr.setTrainId(rs.getString(CommonConstant.COLUMN_INDEX_ONE));
				tr.setTrainName(rs.getString(CommonConstant.COLUMN_INDEX_TWO));
				tr.setFromWhere(rs.getString(CommonConstant.COLUMN_INDEX_THREE));
				tr.setToWhere(rs.getString(CommonConstant.COLUMN_INDEX_FOUR));
				tr.setDispatcher(rs.getString(CommonConstant.COLUMN_INDEX_FIVE));
				tr.setArrival(rs.getString(CommonConstant.COLUMN_INDEX_SIX));
				tr.setDate(rs.getString(CommonConstant.COLUMN_INDEX_SEVEN));
				
				trainList.add(tr);
			}
			
		}catch(SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.println("Get train by id exception " + e.getMessage());
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
		
		return trainList;
	}

	//update train detail
	public void updateTrain(String trainId, Train train) {

		try {
			
			connection = DBConnection.getConnection();
			
			preparedstatement = connection.prepareStatement(QueryUtil.queryById(CommonConstant.QUERY_ID_UPDATE_TRAIN));
			connection.setAutoCommit(false);
			
			train.setTrainId(trainId);
			
			preparedstatement.setString(CommonConstant.COLUMN_INDEX_ONE, train.getTrainName());
			preparedstatement.setString(CommonConstant.COLUMN_INDEX_TWO, train.getFromWhere());
			preparedstatement.setString(CommonConstant.COLUMN_INDEX_THREE, train.getToWhere());
			preparedstatement.setString(CommonConstant.COLUMN_INDEX_FOUR, train.getDispatcher());
			preparedstatement.setString(CommonConstant.COLUMN_INDEX_FIVE, train.getArrival());
			preparedstatement.setString(CommonConstant.COLUMN_INDEX_SIX, train.getDate());
			preparedstatement.setString(CommonConstant.COLUMN_INDEX_SEVEN, train.getTrainId());
			
			preparedstatement.executeLargeUpdate();
			connection.commit();
			
		}catch(SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.println("Update train exception " + e.getMessage());
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
		
	}

	//remove train details from database
	public void deleteTrain(String trainId) {
		
		if(trainId != null && !trainId.isEmpty()) {
			try {
				
				connection = DBConnection.getConnection();
				
				preparedstatement = connection.prepareStatement(QueryUtil.queryById(CommonConstant.QUERY_ID_DELETE_TRAIN));
				preparedstatement.setString(CommonConstant.COLUMN_INDEX_ONE, trainId);
				
				preparedstatement.execute();
				
			}catch(SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
				System.out.println("Delete train exception " + e.getMessage());
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
		}
	}
	//get train ids from database
	public ArrayList<String> getTrainIds(){
		
		ArrayList<String> ids = new ArrayList<>();
		
		try {
			
			connection = DBConnection.getConnection();
			
			preparedstatement = connection.prepareStatement(QueryUtil.queryById(CommonConstant.QUERY_ID_GET_STUDENT_IDS));
			
			ResultSet rs = preparedstatement.executeQuery();
			
			while(rs.next()) {
				
				ids.add(rs.getString(CommonConstant.COLUMN_INDEX_ONE));
				
			}
			
		}catch(SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.println("Get trainIds exception " + e.getMessage());
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
		
		return ids;
	}
}
