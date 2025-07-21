<%-- 
    Document   : SubmitTicket
    Created on : 25 Feb, 2024, 11:18:45 AM
    Author     : Tanishqua
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, javax.servlet.http.*, java.io.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Submit Ticket</title>
</head>

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
         label {
            display: inline-block;
            width: 120px;
            font-weight: bold;
            color: white; /* Adjust label color */
        }
        input[type="text"],
        textarea,
        select {
            width: 300px;
            padding: 8px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        textarea {
            height: 180px;
        }
        input[type="submit"] {
            background-color: #4CAF50; /* Green */
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin-top: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;        }
</style>
<body>

    <div class="container">
            <h1 style="color:black;"><b>Submit a Support Ticket</b></h1>

    <form action="TicketSubmitServlet" method="post">
        <label for="ticketTitle">Title:</label>
        <input type="text" id="ticketTitle" name="ticketTitle" required><br><br>

        <label for="ticketDescription">Description:</label>
        <textarea id="ticketDescription" name="ticketDescription" rows="4" required></textarea><br><br>

        <label for="priority">Priority:</label>
        <select id="priority" name="priority" required>
            <option value="High">High</option>
            <option value="Medium">Medium</option>
            <option value="Low">Low</option>
            
        </select><br><br>
    

        <input type="submit" value="Submit Ticket"><br><br>
    </form>
            <form action="fileUpload.html"><button class="button1"> Upload Your File Here</button> </form><br>  
    </div>

</body>
</html>
