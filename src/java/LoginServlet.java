import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet {

    String JDBC_URL = "jdbc:derby://localhost:1527/TSS";
    String DB_USER = "root";
    String DB_PASSWORD = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);

            String query = "SELECT * FROM USER_DETAIL WHERE username = ? AND password = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int userId = resultSet.getInt("userId");
                String email = resultSet.getString("email");
                String Phoneno = resultSet.getString("Phoneno");

                HttpSession session = request.getSession(true); // Create a new session if it doesn't exist
                session.setAttribute("userId", userId);
                session.setAttribute("username", username);
                session.setAttribute("email", email);
                session.setAttribute("Phoneno", Phoneno);

                response.sendRedirect("userDashboard.jsp");
            } else {
                response.sendRedirect("loginError1.html");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}