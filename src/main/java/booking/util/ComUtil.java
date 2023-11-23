package booking.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Properties;

public class ComUtil {
	public static final Properties properties=new Properties();

	static {
		try {
			properties.load(QueUtil.class.getResourceAsStream(ComCons.PROPERTY_FILE));
		}catch (IOException e) {
			System.out.println(e.getMessage());
		}
	}
	public static String generatepIds(ArrayList<String> ids) {
		String id;
		int next=ids.size()+1;
		id=ComCons.PASSENGER_ID_PREFIX+next;

		//Check id validity
		if(ids.contains(id)){
			next++;
			id=ComCons.PASSENGER_ID_PREFIX+next;
		}
		return id;
	}
}
