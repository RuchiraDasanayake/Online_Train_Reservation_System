package registration.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/read")
public class ReadUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String jdbcUrl = "jdbc:mysql://localhost:3306/online-train_reservation_system";
        String username = "root";
        String password = "it200024403355";
        Connection connection = null;
        
        System.out.println("read ");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcUrl, username, password);
            Statement statement = connection.createStatement();
            HttpSession session = request.getSession();
    		String Id = (String) session.getAttribute("id");
            String query = "SELECT * FROM users where user_id ='"+ Id +"'";
            ResultSet resultSet = statement.executeQuery(query);

            request.setAttribute("userResultSet", resultSet);

            request.getRequestDispatcher("views/ReadUserData.jsp").forward(request, response);
            System.out.println("read ");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("read "+ e.getMessage());
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
