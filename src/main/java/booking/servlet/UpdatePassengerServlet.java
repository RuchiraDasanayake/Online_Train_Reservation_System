package booking.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import booking.model.Passenger;
import booking.service.PassengerService;
import booking.service.PassengerServiceImp;

/**
 * Servlet implementation class UpdatePassengerServlet
 */
@WebServlet("/UpdatePassengerServlet")
public class UpdatePassengerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdatePassengerServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		Passenger passenger = new Passenger();
		String pId=request.getParameter("pId");
		passenger.setpId(pId);
		passenger.setName(request.getParameter("Name"));
		passenger.setAddress(request.getParameter("Address"));
		passenger.setEmail(request.getParameter("Email"));
		passenger.setConNum(request.getParameter("Contact"));
		passenger.setNIC(request.getParameter("NIC"));

		PassengerService passengerservice=new PassengerServiceImp();
		passengerservice.updatePassenger(pId,passenger);

		request.setAttribute("passenger", passenger);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/allPassengers.jsp");
		dispatcher.forward(request, response);
	}

}
