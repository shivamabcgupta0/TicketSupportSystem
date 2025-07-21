import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AdminLoginServlet extends HttpServlet {

    String JDBC_URL = "jdbc:derby://localhost:1527/TSS";
    String DB_USER = "root";
    String DB_PASSWORD = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adminname = request.getParameter("adminname");
        String password = request.getParameter("password");

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);

            String query = "SELECT * FROM ADMIN WHERE adminname = ? AND password = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, adminname);
            preparedStatement.setString(2, password);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int adminId = resultSet.getInt("adminid");
                String email = resultSet.getString("email");
                String phoneno = resultSet.getString("phoneno");
                int age=resultSet.getInt("age");

                HttpSession session = request.getSession(true); // Create a new session if it doesn't exist
                session.setAttribute("adminId", adminId);
                session.setAttribute("adminname", adminname);
                session.setAttribute("email", email);
                session.setAttribute("phoneno", phoneno);
                session.setAttribute("age",age);

                response.sendRedirect("adminDashboard.jsp");
            } else {
                response.sendRedirect("adminLoginError.html");
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
