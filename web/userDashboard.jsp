<%-- 
    Document   : dashboard.jsp
    Created on : 24 Feb, 2024, 11:55:11 PM
    Author     : Tanishqua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ticket Support System</title>
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
            background-color: rgba(0, 0, 0, 0.2);
            margin-left:700px;
        }    
       
        
        input[type="submit"] {
            background-color: black;
            color: white;
            padding: 9px 50px; 
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 10px;
            font-size: 15px;
        }
        ul {
             list-style-type: none;
             padding: 0;
             margin: 0;
        }

/* Style links */
        ul li a {
             margin-left: 110px;
             display: block;
             padding: 5px;
             width: 200px;
             text-decoration: none;
             color: black; /* Adjust color as needed */
             background-color: #f0f0f0; /* Adjust background color as needed */
             border-bottom: 1px solid #ccc; /* Add border between links */
             border-radius: 10px;
        }

/* Style hover effect */
        ul li a:hover {
             background-color: #e0e0e0; /* Adjust hover background color as needed */
        }
    </style>
    
<<body>
    <div class="container">

    <h1 style="color: white;">Welcome to Your Dashboard, <%= session.getAttribute("username") %></h1>

    <!-- Display user information -->
    <p>User ID: <%= session.getAttribute("userId") %></p>
    <p>Email: <%= session.getAttribute("email") %></p>
    <p>Number: <%= session.getAttribute("Phoneno") %></p>
    

    <!-- Add links or buttons for various features -->
    <ul>
        <li><a href="SubmitTicket.jsp">Submit a Ticket</a></li><br>
        <li><a href="ViewTicketServlet">View Tickets</a></li>
        <!-- Add more links as needed -->
    </ul>

    <!-- Add a logout link -->
    <form action="index.html" method="post">
        <input type="submit" value="Logout">
    </form>
    </div>

</body>
</html>
   


