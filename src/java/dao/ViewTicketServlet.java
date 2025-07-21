package dao;

import model1.Ticket;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewTicketServlet")
public class ViewTicketServlet extends HttpServlet {

   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Get the logged-in user ID from the session
    Integer userId = (Integer) request.getSession().getAttribute("userId");

    // Check if the user is logged in
    if (userId != null) {
        // Instantiate TicketDAO
        TicketDAO1 ticketDAO = new TicketDAO1();

        // Get the list of tickets for the logged-in user
        List<Ticket> tickets = ticketDAO.getAllTickets(userId);

        // Set the tickets as a request attribute
        request.setAttribute("tickets", tickets);
        //System.out.println("Tickets: " + tickets);
        request.getRequestDispatcher("viewTicket.jsp").forward(request, response);
    } else {
        // Redirect to the login page
        response.sendRedirect("login.jsp");
    }
}
}
