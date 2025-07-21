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
    <h1 style="color: black;">Admin Manage Users</h1>

    <c:if test="${not empty users}">
        <table>
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <!-- Add more columns as needed -->
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.getUserId()}</td>
                        <td>${user.getUsername()}</td>
                        <td>${user.getEmail()}</td>
                        <!-- Add more columns as needed -->
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <c:if test="${empty users}">
        <p>No users available.</p>
    </c:if>
    </div>
</body>
</html>
