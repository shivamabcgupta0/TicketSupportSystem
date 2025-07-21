import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AdminRegistrationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adminname = request.getParameter("adminname");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        
    }
}
