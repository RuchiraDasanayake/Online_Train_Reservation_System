package registration.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/updateUsername")
public class UpdateUsernameServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/updateUsername.jsp");
        dispatcher.forward(request, response);
    }
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newUsername = request.getParameter("newUsername");
        String currentUsername = request.getParameter("currentUsername");

        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/online-train_reservation_system", "root", "it200024403355");

            String updateQuery = "UPDATE users SET username = ? WHERE username = ?";
            PreparedStatement pstmt = conn.prepareStatement(updateQuery);
            pstmt.setString(1, newUsername);
            pstmt.setString(2, currentUsername);

            int rowsUpdated = pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            if (rowsUpdated > 0) {
            	HttpSession session = request.getSession();
            	session.setAttribute("username", newUsername);
            	response.getWriter().println("Update is successful.");
            } else {
                response.getWriter().println("Update is not successful.");
            }
            
            response.sendRedirect("read");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
