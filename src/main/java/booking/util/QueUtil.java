package booking.util;
import java.io.IOException;
import java.io.File;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class QueUtil extends ComUtil {
	public static String queryById(String id) throws SAXException, IOException, ParserConfigurationException{
		NodeList nodeList;
		Element element=null;

		//Load and parse the XML file
		nodeList=DocumentBuilderFactory.newInstance().newDocumentBuilder()
				.parse(new File(System.getProperty("catalina.base")+"\\wtpwebapps\\Online-Train-Reservation-System\\WEB-INF\\queries.xml")).
				getElementsByTagName(ComCons.TAG_NAME);

		//Iterate through the XML elements to find the query by ID
		for(int value=0;value<nodeList.getLength();value++) {
			element=(Element) nodeList.item(value);
			if(element.getAttribute(ComCons.ATTRIBUTE_NAME).equals(id)) {
				break;
			}
		}
		return element.getTextContent().trim();
	}
}
