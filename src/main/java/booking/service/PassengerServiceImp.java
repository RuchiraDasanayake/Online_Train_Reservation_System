package booking.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import java.sql.Statement;

import booking.model.Passenger;
import booking.util.ComCons;
import booking.util.ComUtil;
import booking.util.DBCon;
import booking.util.QueUtil;

public class PassengerServiceImp implements PassengerService {

	public static Connection conn;
	private static Statement stmt;
	private static PreparedStatement preparedStatement;

	static {
		createPassengerTable();
	}

	//Method to create a passenger table
	public static void createPassengerTable() {
		try {
			conn=DBCon.getDBCon();
			stmt=conn.createStatement();
			stmt.execute(QueUtil.queryById(ComCons.QUERY_ID_CREATE_PASSENGER_TABLE));

		}catch(SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.println("Create table exception "+e.getMessage());

		}finally {
			try {
				if(conn!=null) {
					conn.close();
				}
				if(stmt!=null) {
					stmt.close();
				}

			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}

	@Override
	public void addPassenger(Passenger passenger) {
		String pId=ComUtil.generatepIds(getPassengerIds());
		try {
			conn=DBCon.getDBCon();
			preparedStatement=conn.prepareStatement(QueUtil.queryById(ComCons.QUERY_ID_INSERT_PASSENGER));
			conn.setAutoCommit(false);

			passenger.setpId(pId);
			preparedStatement.setString(ComCons.COLUMN_INDEX_ONE, passenger.getpId());
			preparedStatement.setString(ComCons.COLUMN_INDEX_TWO, passenger.getName());
			preparedStatement.setString(ComCons.COLUMN_INDEX_THREE, passenger.getNIC());
			preparedStatement.setString(ComCons.COLUMN_INDEX_FOUR, passenger.getConNum());
			preparedStatement.setString(ComCons.COLUMN_INDEX_FIVE, passenger.getAddress());
			preparedStatement.setString(ComCons.COLUMN_INDEX_SIX, passenger.getEmail());

			preparedStatement.executeLargeUpdate();
			conn.commit();

		}catch(SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.println("Create table exception "+e.getMessage());

		}finally {
			try {
				if(conn!=null) {
					conn.close();
				}
				if(stmt!=null) {
					stmt.close();
				}

			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}

	@Override
	public ArrayList<Passenger> getPassengers() {
		ArrayList<Passenger> passengerList=new ArrayList<Passenger>();

		try {
			conn=DBCon.getDBCon();
			preparedStatement=conn.prepareStatement(QueUtil.queryById(ComCons.QUERY_ID_GET_ALL_PASSENGERS));
			ResultSet rs=preparedStatement.executeQuery();
			while(rs.next()) {
				Passenger ps=new Passenger();
				ps.setpId(rs.getString(ComCons.COLUMN_INDEX_ONE));
				ps.setName(rs.getString(ComCons.COLUMN_INDEX_TWO));
				ps.setNIC(rs.getString(ComCons.COLUMN_INDEX_THREE));
				ps.setConNum(rs.getString(ComCons.COLUMN_INDEX_FOUR));
				ps.setAddress(rs.getString(ComCons.COLUMN_INDEX_FIVE));
				ps.setEmail(rs.getString(ComCons.COLUMN_INDEX_SIX));

				passengerList.add(ps);
			}

		}catch(SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.println("Create table exception "+e.getMessage());	

		}finally {
			try {
				if(conn!=null) {
					conn.close();
				}
				if(stmt!=null) {
					stmt.close();
				}

			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return passengerList;
	}

	@Override
	public ArrayList<Passenger> getPassengerById(String pId) {
		ArrayList<Passenger> passengerList=new ArrayList<Passenger>();

		try {
			conn=DBCon.getDBCon();
			preparedStatement=conn.prepareStatement(QueUtil.queryById(ComCons.QUERY_ID_GET_PASSENGER_BY_ID));
			preparedStatement.setString(ComCons.COLUMN_INDEX_ONE, pId);
			ResultSet rs=preparedStatement.executeQuery();
			while(rs.next()) {
				Passenger ps=new Passenger();
				ps.setpId(rs.getString(ComCons.COLUMN_INDEX_ONE));
				ps.setName(rs.getString(ComCons.COLUMN_INDEX_TWO));
				ps.setNIC(rs.getString(ComCons.COLUMN_INDEX_THREE));
				ps.setConNum(rs.getString(ComCons.COLUMN_INDEX_FOUR));
				ps.setAddress(rs.getString(ComCons.COLUMN_INDEX_FIVE));
				ps.setEmail(rs.getString(ComCons.COLUMN_INDEX_SIX));

				passengerList.add(ps);
			}

		}catch(SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.println("Create table exception "+e.getMessage());	

		}finally {
			try {
				if(conn!=null) {
					conn.close();
				}
				if(stmt!=null) {
					stmt.close();
				}

			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return passengerList;
	}

	@Override
	public void updatePassenger(String pId, Passenger passenger) {
		try {
			conn=DBCon.getDBCon();
			preparedStatement=conn.prepareStatement(QueUtil.queryById(ComCons.QUERY_ID_UPDATE_PASSENGER));
			conn.setAutoCommit(false);

			preparedStatement.setString(ComCons.COLUMN_INDEX_ONE, passenger.getName());
			preparedStatement.setString(ComCons.COLUMN_INDEX_TWO, passenger.getNIC());
			preparedStatement.setString(ComCons.COLUMN_INDEX_THREE, passenger.getConNum());
			preparedStatement.setString(ComCons.COLUMN_INDEX_FOUR, passenger.getAddress());
			preparedStatement.setString(ComCons.COLUMN_INDEX_FIVE, passenger.getEmail());
			preparedStatement.setString(ComCons.COLUMN_INDEX_SIX, passenger.getpId());

			preparedStatement.executeLargeUpdate();
			conn.commit();

		}catch(SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.println("Create table exception "+e.getMessage());

		}finally {
			try {
				if(conn!=null) {
					conn.close();
				}
				if(stmt!=null) {
					stmt.close();
				}

			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}

	@Override
	public void deletePassenger(String pId) {
		if(pId!=null && !pId.isEmpty()) {
			try {
				conn=DBCon.getDBCon();
				preparedStatement=conn.prepareStatement(QueUtil.queryById(ComCons.QUERY_ID_DELETE_PASSENGER));
				preparedStatement.setString(ComCons.COLUMN_INDEX_ONE, pId);
				preparedStatement.execute();

			}catch(SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
				System.out.println("Create table exception "+e.getMessage());

			}finally {
				try {
					if(conn!=null) {
						conn.close();
					}
					if(stmt!=null) {
						stmt.close();
					}

				}catch(SQLException e) {
					System.out.println(e.getMessage());
				}
			}
		}

	}

	public ArrayList<String> getPassengerIds(){
		ArrayList<String> ids=new ArrayList<String>();
		try {
			conn=DBCon.getDBCon();
			preparedStatement=conn.prepareStatement(QueUtil.queryById(ComCons.QUERY_ID_GET_PASSENGER_IDS));
			ResultSet rs=preparedStatement.executeQuery();
			while(rs.next()) {
				ids.add(rs.getString(ComCons.COLUMN_INDEX_ONE));
			}
		}catch(SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.println("Create table exception "+e.getMessage());
		}finally {
			try {
				if(conn!=null) {
					conn.close();
				}
				if(stmt!=null) {
					stmt.close();
				}	
			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return ids;
	}

}
