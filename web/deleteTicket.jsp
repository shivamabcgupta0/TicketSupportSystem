<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="admin.adminDAO" %>

<html>
<head>
    <style>
        body {
            background-image: url("bg6.jpg");
            background-size: cover;
            background-position: center;
            margin: 100px;
            padding: 40px;
        }
    </style>
</head>
<body>

    <%
    // Get the userId and priority parameters from the request
    int UserId = Integer.parseInt(request.getParameter("UserId"));
    int TicketId = Integer.parseInt(request.getParameter("TicketId"));

    // Create an instance of adminDAO
    adminDAO deleteDAO = new adminDAO();

    // Implement logic to update priority
    // Assuming updatePriorityByUserId returns true if successful
    boolean Success = deleteDAO.deleteTicketByUserId(UserId,TicketId);

    if (Success) {
        out.println("Ticket Deleted successfully for userId: " + UserId+" and ticketId: "+TicketId);
    } else {
        out.println(" Ticket Delete fail for userId: " + UserId+" and ticketId: "+TicketId);
    }
%>


<form action="adminDashboard.jsp">
    <button class="button1">Admin Dashboard</button>
</form>

</body>
</html>
