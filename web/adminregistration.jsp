<%-- 
    Document   : AdminRegistration
    Created on : 22 Feb, 2024, 10:30:30 PM
    Author     : Tanishqua
--%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
   
    String adminId = request.getParameter("adminId");
    String adminName = request.getParameter("adminname");
    String email = request.getParameter("email");
    String phoneNo = request.getParameter("phoneno");
    long phoneNumber = Long.parseLong(phoneNo);
    String password = request.getParameter("pass1");
    String confirmPassword = request.getParameter("pass2");
    String age=request.getParameter("age");

    
    PreparedStatement ps1 = null;
    PreparedStatement ps2 = null;
    Connection conn = null;
    ResultSet rs = null;

  
    String query1 = "SELECT adminId FROM ADMIN WHERE adminId=?";
    String query2 = "INSERT INTO ADMIN(adminId, adminName, email, phoneNo, password,age) VALUES (?, ?, ?, ?, ?,?)";

    try {
       
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        conn = DriverManager.getConnection("jdbc:derby://localhost:1527/TSS", "root", "root");

        // Check if the admin already exists
        ps1 = conn.prepareStatement(query1);
        ps1.setString(1, adminId);
        rs = ps1.executeQuery();

        if (rs.next()) {
            // If the admin already exists, redirect to an error page
            response.sendRedirect("AdminRegisterError1.html");
        } else {
            // If the admin doesn't exist, proceed with registration
            if (password.equals(confirmPassword)) {
                // Insert admin details into the database
                ps2 = conn.prepareStatement(query2);
                ps2.setString(1, adminId);
                ps2.setString(2, adminName);
                ps2.setString(3, email);
                ps2.setLong(4, phoneNumber);
                ps2.setString(5, password);
                ps2.setString(6,age);
                int i = ps2.executeUpdate();
                // Redirect to the login page after successful registration
                response.sendRedirect("adminlogin.html");
            } else {
                // If passwords don't match, redirect to an error page
                response.sendRedirect("AdminRegisterError2.html");
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
