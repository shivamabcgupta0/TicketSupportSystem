package admin;

import model1.Ticket;
import dao.TicketDAO1;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adminManageTickets")
public class adminManageTickets extends HttpServlet {
   
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            // Load the Derby JDBC driver
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            // Connect to the Derby database
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/TSS", "root", "root");

            // Prepare SQL query to retrieve tickets
            String query = "SELECT ticketid, userid, title, description, priority FROM tickets";
            stmt = conn.prepareStatement(query);

            // Execute the query
            rs = stmt.executeQuery();

            // Process the result set
            List<Ticket> tickets = new ArrayList<>();
            while (rs.next()) {
                int ticketId = rs.getInt("ticketid");
                int userId = rs.getInt("userid");
                String title = rs.getString("title");
                String description = rs.getString("description");
                String priority = rs.getString("priority");

                // Create Ticket object
                Ticket ticket = new Ticket(ticketId, userId, title, description, priority);
                tickets.add(ticket);
            }

            // Set the tickets as a request attribute
            request.setAttribute("tickets", tickets);
            request.getRequestDispatcher("admin_manage_tickets.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException e) {
            // Handle any errors
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving tickets: " + e.getMessage());
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
