package registration.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import registration.dao.UserDao;
import registration.model.User;

@WebServlet("/register")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserDao userDao = new UserDao();

    public UserServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/userregister.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String NIC = request.getParameter("NIC");
        String username = request.getParameter("username");
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");
        String address = request.getParameter("address");

        User user = new User();
        user.setNIC(NIC);
        user.setUsername(username);
        user.setMobile(mobile);
        user.setPassword(password);
        user.setAddress(address);
        
        int validate_num= userDao.validate(user);
        if(validate_num==0) {
        	userDao.registerUser(user);
        	RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
        else {
        	RequestDispatcher dispatcher = request.getRequestDispatcher("views/userregister.jsp");
            dispatcher.forward(request, response);
        }
    }
}
