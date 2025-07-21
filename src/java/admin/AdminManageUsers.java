package admin;

import dao.User1;
import java.util.ArrayList;
import java.util.List;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdminManageUsers")
public class AdminManageUsers extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ManageDAO ManageUsers = new ManageDAO();
        List<User1> users = ManageUsers.getAllUsers();
        request.setAttribute("users", users);
        System.out.println("users: " + users);
        request.getRequestDispatcher("adminManageUsers.jsp").forward(request, response);
    }

   
   }