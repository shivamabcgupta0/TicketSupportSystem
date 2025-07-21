<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="admin.adminDAO" %>
<html>
    <style>
          body {
            background-image: url("bg6.jpg");
            background-size: cover;
            background-position: center;
            margin: 100px;
            padding: 40px;
        }
    </style>
</html>

<%
    // Get the userId and priority parameters from the request
    int userId = Integer.parseInt(request.getParameter("userId"));
    int ticketId = Integer.parseInt(request.getParameter("ticketId"));
    String priority = request.getParameter("priority");

    // Create an instance of adminDAO
    adminDAO DAO = new adminDAO();

    // Implement logic to update priority
    // Assuming updatePriorityByUserId returns true if successful
    boolean success = DAO.updatePriority(ticketId,userId, priority);

    if (success) {
        out.println("Priority updated successfully for userId: " + userId+" and ticketId: "+ticketId);
    } else {
        out.println("Priority update fail  for userId: " + userId+" and ticketId: "+ticketId);
    }
%>

<form action="adminDashboard.jsp" >
    <button class="button1">Admin Dashboard</button>
</form>
