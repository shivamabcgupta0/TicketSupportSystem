package dao;

import model1.Ticket;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TicketDAO1 {

    private String jdbcURL = "jdbc:derby://localhost:1527/TSS";
    private String dbUser = "root";
    private String dbPassword = "root";

    public List<Ticket> getAllTickets(int userId) {
        List<Ticket> tickets = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
            String query = "SELECT * FROM tickets WHERE userId = ?";
            try (PreparedStatement pst = connection.prepareStatement(query)) {
                pst.setInt(1, userId);

                try (ResultSet resultSet = pst.executeQuery()) {
                    while (resultSet.next()) {
                        int ticketId = resultSet.getInt("ticketId");
                        String title = resultSet.getString("title");
                        String description = resultSet.getString("description");
                        String priority = resultSet.getString("priority");

                        Ticket ticket = new Ticket(ticketId, userId, title, description, priority);
                        tickets.add(ticket);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tickets;
    }
}
