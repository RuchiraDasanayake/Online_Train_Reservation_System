package booking.service;

import java.util.ArrayList;
import booking.model.Passenger;

public interface PassengerService {
	public void addPassenger(Passenger passenger);
	public ArrayList<Passenger> getPassengers();
	public ArrayList<Passenger> getPassengerById(String pId);
	public void updatePassenger(String pId, Passenger passenger);
	public void deletePassenger(String pId);
}
