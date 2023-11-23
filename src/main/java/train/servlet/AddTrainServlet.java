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

import train.model.Train;
import train.service.ITrainService;
import train.service.TrainServiceImpl;

/**
 * Servlet implementation class AddTrainServlet
 */
@WebServlet("/AddTrainServlet")
public class AddTrainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTrainServlet() {
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
		
		Train train = new Train();
		
		//Set values to train object that read from addtrain.jsp page
		train.setTrainName(request.getParameter("TrainNAme"));
		train.setFromWhere(request.getParameter("FromWhere"));
		train.setToWhere(request.getParameter("ToWhere"));
		train.setDispatcher(request.getParameter("Dispatcher"));
		train.setArrival(request.getParameter("Arrival"));
		train.setDate(request.getParameter("date"));
		
		//add train details to database
		ITrainService itrainservice = new TrainServiceImpl();
		itrainservice.addTrain(train);
		
		request.setAttribute("train", train);
		RequestDispatcher dispature = getServletContext().getRequestDispatcher("/SearchTrain.jsp");
		dispature.forward(request, response);
	}

}
