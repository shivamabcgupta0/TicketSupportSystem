package p1;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/TicketSubmitServlet")
public class TicketSubmitServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    HttpSession session = request.getSession();
    if (session != null) {
        int userId = (int) session.getAttribute("userId");

        String title = request.getParameter("ticketTitle");
        String description = request.getParameter("ticketDescription");
        String priority = request.getParameter("priority");

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/TSS", "root", "root");

            String query = "INSERT INTO TICKETS (userId, title, description, priority) VALUES (?, ?, ?, ?)";
            try (PreparedStatement pst = con.prepareStatement(query)) {
                pst.setInt(1, userId);
                pst.setString(2, title);
                pst.setString(3, description);
                pst.setString(4, priority);

                int rowsAffected = pst.executeUpdate();

                if (rowsAffected > 0) {
                    response.sendRedirect("success.jsp");
                } else {
                    response.sendRedirect("error.jsp");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("An error occurred while processing your request. Error: " + e.getMessage());
        }
    } else {
        out.println("User not logged in. Please log in first.");
    }
}}