<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="dao.TicketDAO1" %>
<%@ page import="model1.Ticket" %>
<%@page import="dao.User1"%>


<!DOCTYPE html>
<html>
<head>
    <title>View Tickets</title>
    <style>
        body {
            background-image: url("bg4.jpg");
            background-size: cover;
            background-position: center;
            margin: 100px;
            padding: 40px;
        }
        .container {
            text-align: center;
            padding-top: 5%;
            padding: 50px;
            border: 2px solid white;
            border-radius: 20px;
            background-color: rgba(0, 0, 0, 0.4);
            margin-left:700px;
        }  

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            margin-right: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
            /* Add this line to limit the width and enable text wrapping */
            max-width: 200px; /* Adjust the value as needed */
            word-wrap: break-word;
        }

        th {
            background-color: #f2f2f2;
        }

        p {
            color: #888;
        }

        .back-link {
            margin-top: 20px;
            color: #0066cc;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>View Tickets</h1>

        <c:set var="userId" value="${sessionScope.userId}" />

        <c:if test="${not empty tickets}">
            <table>
                <tr>
                    <th>Ticket ID</th>
                    <th>User ID</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Priority</th>
                </tr>
                <c:forEach var="ticket" items="${tickets}">
                    <tr>
                        <td>${ticket.getTicketId()}</td>
                        <td>${ticket.getUserId()}</td>
                        <td>${ticket.getTitle()}</td>
                        <td>${ticket.getDescription()}</td>
                        <td>${ticket.getPriority()}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>

        <c:if test="${empty tickets}">
            <p>No tickets available.</p>
        </c:if>
        <br>

        <a class="back-link" href="userDashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
