//IT22334138
//De Vaas Gunawardana A.C.T.D
//MLB_WD_G129_OOP_Online Train Reservation System
package train.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import train.service.ITrainService;
import train.service.TrainServiceImpl;

/**
 * Servlet implementation class DeleteTrainServlet
 */
@WebServlet("/DeleteTrainServlet")
public class DeleteTrainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteTrainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		
		//get trainId from schedule.jsp page
		String TrainId = request.getParameter("TrainId");
		
		//remove selected train from database
		ITrainService itrainservice = new TrainServiceImpl();
		itrainservice.deleteTrain(TrainId);
		
		request.setAttribute("TrainId", TrainId);
		RequestDispatcher dispature = getServletContext().getRequestDispatcher("/schedule.jsp");
		dispature.forward(request, response);
	}

}
