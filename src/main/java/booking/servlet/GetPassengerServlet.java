package booking.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import booking.service.PassengerService;
import booking.service.PassengerServiceImp;

/**
 * Servlet implementation class GetPassengerServlet
 */
@WebServlet("/GetPassengerServlet")
public class GetPassengerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetPassengerServlet() {
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
		String pId=request.getParameter("pId");
		PassengerService passengerService=new PassengerServiceImp();
		passengerService.getPassengerById(pId);

		request.setAttribute("pId", pId);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/updatePassengers.jsp");
		dispatcher.forward(request, response);
	}

}
