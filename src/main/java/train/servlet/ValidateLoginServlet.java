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
import javax.servlet.http.HttpSession;

import train.model.Login;
import train.service.LoginImpl;
/**
 * Servlet implementation class ValidateLogin
 */
@WebServlet("/ValidateLoginServlet")
public class ValidateLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidateLoginServlet() {
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
		
		Login login = new Login();
		LoginImpl loginimpl = new LoginImpl();
		
		//set values to login object that read from login.jsp page
		login.setUsername(request.getParameter("username"));
		login.setPassword(request.getParameter("password"));
		
		//validate user
		String validate = loginimpl.ValidateLogin(login);
		
		//create session to hold current logged user details
		HttpSession session = request.getSession();
		
		if(validate.equals("SUCCESS")) {//if user username and password is correct
			//set details of current user to session object
			session.setAttribute("id", login.getId());
			session.setAttribute("username", login.getUsername());
			session.setAttribute("role", login.getRole());
			session.setAttribute("loggedIn", "logged");
			
			RequestDispatcher dispature = getServletContext().getRequestDispatcher("/home.jsp");
			dispature.forward(request, response);
		}else {//if user username or password is incorrect
			RequestDispatcher dispature = getServletContext().getRequestDispatcher("/login.jsp");
			dispature.forward(request, response);
		}
	}

}
