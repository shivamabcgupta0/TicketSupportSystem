<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ticket Support System</title>
    <style>
        body {
            background-image: url("bg6.jpg");
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
            background-color: rgba(0, 0, 0, 0.3);
            margin-right:700px;
        }   

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
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
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 style="color: black;">Tickets</h1>

        <c:if test="${not empty tickets}">
            <table>
                <thead>
                    <tr>
                        <th>Ticket ID</th>
                        <th>User ID</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Priority</th>
                        <!-- Add more columns as needed -->
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="ticket" items="${tickets}">
                        <tr>
                            <td>${ticket.getTicketId()}</td>
                            <td>${ticket.getUserId()}</td>
                            <td>${ticket.getTitle()}</td>
                            <td>${ticket.getDescription()}</td>
                            <td>${ticket.getPriority()}</td>
                            <!-- Add more columns as needed -->
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <c:if test="${empty tickets}">
            <p>No tickets available.</p>
        </c:if>
    </div>
</body>
</html>
