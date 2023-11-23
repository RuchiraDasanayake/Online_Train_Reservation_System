package registration.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import registration.model.User;

public class UserDao {

    public int registerUser(User user) {
        String INSERT_USERS_SQL = "INSERT INTO Users" +
            "(NIC, username, mobile, address, password) VALUES" +
            "(?,?,?,?,?);";

        int result = 0;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/online-train_reservation_system", "root", "it200024403355");
                 PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL);){

                preparedStatement.setString(1, user.getNIC());
                preparedStatement.setString(2, user.getUsername());
                preparedStatement.setString(3, user.getMobile());
                preparedStatement.setString(4, user.getAddress());
                preparedStatement.setString(5, user.getPassword());

                System.out.println(preparedStatement);

                result = preparedStatement.executeUpdate();
            } catch (SQLException e) {
                printSQLException(e);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return result;
    }
    public int validate(User user) {
        String jdbcUrl = "jdbc:mysql://localhost:3306/online-train_reservation_system";
        String username = "root";
        String password = "it200024403355";
        Connection connection = null;
        int result = 0; // Initialize the result to 0 (indicating username doesn't exist).

        try {
            // Database connection and query execution
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcUrl, username, password);
            String query = "SELECT * FROM users WHERE username = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, user.getUsername());
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                result = 1;
            }

            resultSet.close();
            preparedStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return result;
    }

    private void printSQLException(SQLException ex) {
        ex.printStackTrace(System.err);
        System.err.println("SQLState: " + ex.getSQLState());
        System.err.println("Error Code: " + ex.getErrorCode());
        System.err.println("Message: " + ex.getMessage());
        Throwable t = ex.getCause();
        while (t != null) {
            System.out.println("Cause: " + t);
            t = t.getCause();
        }
    }
}
