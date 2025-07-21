<%-- 
    Document   : adminDashboard
    Created on : 25 Feb, 2024, 11:20:09 AM
    Author     : Tanishqua
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
</head>
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
            background-color: rgba(0, 0, 0, 0.4);
            margin-right:700px;
        }    
        .container2 {
            text-align: center;
            padding-top: 5%;
             padding: 50px;
            border: 2px solid white;
            border-radius: 20px;
            background-color: rgba(0, 0, 0, 0.4);
            margin-right:700px;
        } 
         .container3 {
            text-align: center;
            padding-top: 5%;
             padding: 50px;
            border: 2px solid white;
            border-radius: 20px;
            background-color: rgba(0, 0, 0, 0.4);
            margin-right:700px;
        } 
         .container4 {
            text-align: center;
            padding-top: 5%;
             padding: 50px;
            border: 2px solid white;
            border-radius: 20px;
            background-color: rgba(0, 0, 0, 0.4);
            margin-right:900px;
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
             border-radius: 1px;
        }

/* Style hover effect */
        ul li a:hover {
             background-color: #e0e0e0; /* Adjust hover background color as needed */
        }
</style>
<body>
<div class="container">
     <h1>Welcome to Your Dashboard, <%= session.getAttribute("adminname") %></h1>

    <!-- Display user information -->
    <p>User ID: <%= session.getAttribute("adminId") %></p>
    <p>Email: <%= session.getAttribute("email") %></p>
    

    <ul>
        <li><a href="AdminManageUsers">View Users</a></li><br>
        
        
       
        <li><a href="adminManageTickets">View Tickets</a></li><br>
        
       
    
    </ul>
    
</div></<br><br>
     <div class="container2">
        <div class="card">
            <h2>Update Ticket Priority </h2>
           
     <form action="updatePriority.jsp" method="post">
        <label for="userId">User ID:</label>
        <input type="text" id="userId" name="userId" required><br>
        <label for="ticketId">Ticket ID:</label>
        <input type="text" id="ticketId" name="ticketId" required><br>
        
        <label for="priority">Priority:</label>
        <select id="priority" name="priority" required>
            <option value="High">High</option>
            <option value="Medium">Medium</option>
            <option value="Low">Low</option>
        </select><br>

        <input type="submit" value="Update Ticket">
    </form>
        </div>
     </div><br><br>
        
     <div class="container3">
        <div class="card">
            <h2>Delete Ticket </h2>
            
     <form action="deleteTicket.jsp" method="post">
         <label for="UserId">User ID:</label>
        <input type="text" id="UserId" name="UserId" required><br>
        <label for="TicketId">Ticket ID:</label>
        <input type="text" id="TicketId" name="TicketId" required><br>

        <input type="submit" value="Delete Ticket">
    </form>
        </div>
     </div>
        
        
    
    
<div class="conatiner4">
    <form action="index.html" method="post">
        <input type="submit" value="Logout">
    </form>
</div>

</body>
</html>
