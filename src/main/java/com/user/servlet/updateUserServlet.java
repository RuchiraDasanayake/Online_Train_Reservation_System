package com.user.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.model.user;
import com.user.service.IUserService;
import com.user.service.UserServiceImplement;

/**
 * Servlet implementation class updateUserServlet
 */
@WebServlet("/updateUserServlet")
public class updateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		//get data sent byu updaterequest.jsp
		
		user user= new user();
		
		String usid = request.getParameter("userid");
		System.out.println("updateuserservlet user id:"+ usid);
		
		
		user.setUserID(usid);
		user.setFirstName(request.getParameter("first_name"));
		user.setLastName(request.getParameter("last_name"));
		user.setNIC(request.getParameter("nic_number"));
		user.setContactNo(request.getParameter("contactNo"));
		user.setAddress(request.getParameter("address"));
		user.setStPoint(request.getParameter("starting_station"));
		user.setDestPoint(request.getParameter("destination"));
		user.setNIC(request.getParameter("nic_number"));
		
		IUserService iuserservice = new UserServiceImplement();
		iuserservice.updateUser(usid, user);
		
		request.setAttribute("user", user);
		request.setAttribute("userid", usid);
		
		RequestDispatcher disp = getServletContext().getRequestDispatcher("/monthPassRequest.jsp");//redirect to mothpassrequest.jsp
		disp.forward(request, response);
		
	}

}
