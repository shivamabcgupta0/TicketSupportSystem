package admin;
import dao.User1;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class ManageDAO {
    
    private String jdbcURL = "jdbc:derby://localhost:1527/TSS";
    private String dbUser = "root";
    private String dbPassword = "root";
    
    
   public List<User1> getAllUsers() {
    List<User1> users = new ArrayList<>();
    try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
        
        String query = "SELECT * FROM User_Detail";
        
        try (PreparedStatement pst = connection.prepareStatement(query);
            
             ResultSet resultSet = pst.executeQuery()) {
            System.out.print(pst);

            while (resultSet.next()) {
                int userId = resultSet.getInt("userId");
                String username = resultSet.getString("username");
                String email = resultSet.getString("email");
                

                // Add more user attributes as needed

                User1 user = new User1(userId, username, email);
                users.add(user);

                // Debugging statements
                System.out.println("User ID: " + userId);
                System.out.println("Username: " + username);
                System.out.println("Email: " + email);
            }
        }
    } catch (SQLException e) {
        // Log the exception or handle it appropriately
        e.printStackTrace();
        System.out.println("SQL Exception: " + e.getMessage());
    }

    // Debugging statement
    System.out.println("Total Users Retrieved: " + users.size());
    System.out.println("Users: " + users); // Check if the list is populated

    return users;
}

}