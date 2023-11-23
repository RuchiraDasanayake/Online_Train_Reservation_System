package com.user.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.model.user;
import com.user.service.IUserService;
import com.user.service.UserServiceImplement;

/**
 * Servlet implementation class AddUserServlet
 */
@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		HttpSession session = request.getSession();
		String Id = (String) session.getAttribute("id");
		
		System.out.println("id " + Id);
		
		//get data from index.jsp file 
		
		user user = new user();
		user.setUserID(Id); 
		user.setFirstName(request.getParameter("first_name"));
		user.setLastName(request.getParameter("last_name"));
		user.setNIC(request.getParameter("nic_number"));
		user.setContactNo(request.getParameter("contactNo"));
		user.setAddress(request.getParameter("address"));
		user.setStPoint(request.getParameter("starting_station"));
		user.setDestPoint(request.getParameter("destination"));
		
		IUserService iuserservice = new UserServiceImplement();
		
		iuserservice.addUser(user);
		
		
		if(user.getErrormsg().equals("dataexist")) {//if data exist error thown
			request.setAttribute("dataexist", "it seems you already requested a train pass.");
			
			request.setAttribute("exisUser", user);
			
			request.setAttribute("exisuserid", user.getUserID());
			
			RequestDispatcher disp = getServletContext().getRequestDispatcher("/index.jsp");//send dat to index.jsp page
			disp.forward(request, response);
			}else {//if data exist error not thrown
				
				
			request.setAttribute("User", user);
			
			request.setAttribute("userid", user.getUserID());
			
			RequestDispatcher disp = getServletContext().getRequestDispatcher("/monthPassRequest.jsp");//send data to monthpassrequest.jsp
			disp.forward(request, response);
		}
		
		
	}

}
