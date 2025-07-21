<%-- 
    Document   : Registration
    Created on : 22 Feb, 2024, 10:30:30 PM
    Author     : Tanishqua
--%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
   
    String userId = request.getParameter("userId");
    String username = request.getParameter("username");
    String email1 = request.getParameter("email");
    String phno1 = request.getParameter("phoneno");
    long phno2 = Long.parseLong(phno1);
    String pass1 = request.getParameter("pass1");
    String pass2 = request.getParameter("pass2");

    
    PreparedStatement ps1 = null;
    PreparedStatement ps2 = null;
    Connection conn = null;
    ResultSet rs = null;

  
    String query1 = "SELECT userid from user_detail WHERE userid=?";
    String query2 = "INSERT INTO USER_DETAIL(userId,username,email,phoneno,password) VALUES(?,?,?,?,?)";

    try {
       
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        conn = DriverManager.getConnection("jdbc:derby://localhost:1527/TSS", "root", "root");

        // Check if the user already exists
        ps1 = conn.prepareStatement(query1);
        ps1.setString(1, userId);
        rs = ps1.executeQuery();

        if (rs.next()) {
            // If the user already exists, redirect to an error page
            response.sendRedirect("RegisterError1.html");
        } else {
            // If the user doesn't exist, proceed with registration
            if (pass1.equals(pass2)) {
                // Insert user details into the database
                ps2 = conn.prepareStatement(query2);
                ps2.setString(1, userId);
                ps2.setString(2, username);
                ps2.setString(3, email1);
                ps2.setLong(4, phno2);
                ps2.setString(5, pass1);
                int i = ps2.executeUpdate();
                // Redirect to the login page after successful registration
                response.sendRedirect("login.html");
            } else {
                // If passwords don't match, redirect to an error page
                response.sendRedirect("RegisterError2.html");
            }
        }
    } catch (Exception e) {
        // Handle any exceptions
        out.println(e);
    } finally {
        // Close resources in a finally block to ensure they are always closed
        try {
            if (rs != null) rs.close();
            if (ps1 != null) ps1.close();
            if (ps2 != null) ps2.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            // Handle any exceptions that occur while closing resources
            out.println(e);
        }
    }
%>
