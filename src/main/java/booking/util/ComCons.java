package booking.util;

public class ComCons {
	public static final String QUERY_XML="queries.xml";//changed
	public static final String PROPERTY_FILE="Config2.properties"; //changed
	public static final String TAG_NAME="query";
	public static final String ATTRIBUTE_NAME="id";

	//Database connection parameters
	public static final String URL="url";
	public static final String USERNAME="userName";//username changed
	public static final String PASSWORD="password";
	public static final String DRIVER_NAME="driverName";

	//Column indices
	public static final int COLUMN_INDEX_ONE=1;
	public static final int COLUMN_INDEX_TWO=2;
	public static final int COLUMN_INDEX_THREE=3;
	public static final int COLUMN_INDEX_FOUR=4;
	public static final int COLUMN_INDEX_FIVE=5;
	public static final int COLUMN_INDEX_SIX=6;

	//Passenger constants
	public static final String PASSENGER_ID_PREFIX="PID 000";
	public static final String QUERY_ID_CREATE_PASSENGER_TABLE="create_passenger_table";
	public static final String QUERY_ID_INSERT_PASSENGER="insert_passenger";
	public static final String QUERY_ID_GET_PASSENGER_IDS="get_passenger_ids";
	public static final String QUERY_ID_GET_ALL_PASSENGERS="get_all_passengers";
	public static final String QUERY_ID_GET_PASSENGER_BY_ID="get_passenger_by_id";
	public static final String QUERY_ID_UPDATE_PASSENGER="update_passenger";
	public static final String QUERY_ID_DELETE_PASSENGER="delete_passenger";
}
