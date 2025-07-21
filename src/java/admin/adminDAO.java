package admin;
import java.sql.*;

public class adminDAO {
        // Helper method to check if the user already exists


    // Helper method to update the priority column in the tickets table
public boolean updatePriority(int ticketId,int userId, String newPriority) throws SQLException {
    boolean success = false;
    try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/TSS", "root", "root");
         PreparedStatement ps = conn.prepareStatement("UPDATE tickets SET priority = ? WHERE Userid = ? And ticketid= ?")) {
        ps.setString(1, newPriority);
        ps.setInt(2, userId);
        ps.setInt(3, ticketId);
        int rowsAffected = ps.executeUpdate();
        if (rowsAffected > 0) {
            success = true;
        }
    }
    return success;
}
    // Helper method to delete a ticket based on userId
    public boolean deleteTicketByUserId(int TicketId, int UserId) throws SQLException {
        boolean success = false;
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/TSS", "root", "root");
             PreparedStatement ps = conn.prepareStatement("DELETE FROM tickets WHERE userid = ? AND ticketid = ?")) {
            ps.setInt(1,TicketId );
            ps.setInt(2, UserId);
            int rowsAffected = ps.executeUpdate();
        if (rowsAffected > 0) {
            success = true;
        }
    }
    return success;
}
    
}