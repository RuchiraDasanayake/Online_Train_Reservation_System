//IT22334138
//De Vaas Gunawardana A.C.T.D
//MLB_WD_G129_OOP_Online Train Reservation System
package train.service;

import java.util.ArrayList;
import train.model.*;

public interface ITrainService {
	
	public void addTrain(Train train);
	
	public ArrayList<Train> getTrain(String frowhere, String towhere, String date);
	
	public ArrayList<Train> getTrainById(String TrainId);
	
	public void updateTrain(String trainId, Train train);
	
	public void deleteTrain(String trainId);
}
