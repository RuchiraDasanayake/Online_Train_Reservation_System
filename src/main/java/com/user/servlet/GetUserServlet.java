package com.user.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.service.IUserService;
import com.user.service.UserServiceImplement;

/**
 * Servlet implementation class getstudentservlet
 */
@WebServlet("/GetUserServlet")
public class GetUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetUserServlet() {
    	
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		System.out.println("getuserservlet called");
		
		String uid = request.getParameter("uid");
		IUserService iuserservice = new UserServiceImplement();
		System.out.println("getuserservlet user id: " + uid);
		
		iuserservice.getUserById(uid);
		request.setAttribute("userid", uid);
		
		RequestDispatcher disp = getServletContext().getRequestDispatcher("/updateRequest.jsp"); //redirect data to updaterequest.jsp page
		disp.forward(request, response);
	}

}
